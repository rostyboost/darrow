module dparquet;

private{
import arrow.Array;
import arrow.c.types;
import arrow.c.functions;
import arrow.ChunkedArray;
import arrow.DoubleArray;
import arrow.Field : ArrowField = Field;
import arrow.FloatArray;
import arrow.FloatArrayBuilder;
import arrow.FloatDataType;
import arrow.Int32Array;
import arrow.Int32ArrayBuilder;
import arrow.Int64Array;
import arrow.Int64ArrayBuilder;
import arrow.Int32DataType;
import arrow.Int64DataType;
import arrow.ListArrayBuilder;
import arrow.ListDataType;
import arrow.StringArray;
import arrow.StringArrayBuilder;
import arrow.StringDataType;
import arrow.Schema : ArrowSchema = Schema;
import arrow.ListArray;
import glib.c.functions;
import glib.ListG;
import gobject.c.functions;
import gobject.ObjectG;
import parquet.ArrowFileReader : ArrowFileReader;

import std.algorithm : canFind;
import std.bitmanip;
import std.traits : isArray, isScalarType, isSomeString, fullyQualifiedName;
import std.range.primitives : ElementType;
import std.system;
import std.typecons : Nullable;

}


public class Field(T) : ArrowField {
    this(string name, bool nullable)
    {
        static if(isArray!T && !isSomeString!T)
        {
            alias ET = ElementType!T;
            auto ldt = new ListDataType(new ArrowField("element", new CastTypeDataType!ET(), false));
            super(name, ldt, nullable);
        }
        else
            super(name, new CastTypeDataType!T(), nullable);
    }

}

template CastTypeArray(T)
{
    static if(is(T == long)) alias CastTypeArray = Int64Array;
    static if(is(T == int)) alias CastTypeArray = Int32Array;
    static if(is(T == float)) alias CastTypeArray = FloatArray;
    static if(is(T == double)) alias CastTypeArray = DoubleArray;
    static if(is(T == string)) alias CastTypeArray = StringArray;
    static if(is(T == char[])) alias CastTypeArray = StringArray;
}

template CastTypeGArray(T)
{
    static if(is(T == long)) alias CastTypeGArray = GArrowInt64Array;
    static if(is(T == int)) alias CastTypeGArray = GArrowInt32Array;
    static if(is(T == float)) alias CastTypeGArray = GArrowFloatArray;
    static if(is(T == double)) alias CastTypeGArray = GArrowDoubleArray;
    static if(is(T == string)) alias CastTypeGArray = GArrowBinaryArray;
    static if(is(T == char[])) alias CastTypeGArray = GArrowBinaryArray;
}

template CastTypeArrayBuilder(T)
{
    static if(is(T == long)) alias CastTypeArrayBuilder = Int64ArrayBuilder;
    static if(is(T == int)) alias CastTypeArrayBuilder = Int32ArrayBuilder;
    static if(is(T == float)) alias CastTypeArrayBuilder = FloatArrayBuilder;
    static if(is(T == string)) alias CastTypeArrayBuilder = StringArrayBuilder;
    static if(isArray!T && !isSomeString!T) alias CastTypeArrayBuilder = ListArrayBuilder;
}

template CastTypeGArrowArrayBuilder(T)
{
    mixin("alias CastTypeGArrowArrayBuilder = GArrow" ~ CastTypeArrayBuilder!T.stringof ~ ";");
}

template CastTypeDataType(T)
{
    static if(is(T == long)) alias CastTypeDataType = Int64DataType;
    static if(is(T == int)) alias CastTypeDataType = Int32DataType;
    static if(is(T == float)) alias CastTypeDataType = FloatDataType;
    static if(is(T == string)) alias CastTypeDataType = StringDataType;
    static if(isArray!T && !isSomeString!T) alias CastTypeDataType = ListDataType;
}


public class ParquetFile {
    ArrowFileReader _fr;
    ArrowSchema _sc;
    uint _num_cols;
    string[] col_names;
    private uint[string] _name2index;

    this(string path)
    {
        _fr = new ArrowFileReader(path);
        _sc = _fr.getSchema();
        _num_cols = _sc.nFields();
        auto fields = _sc.getFields().toArray!ArrowField;
        foreach(uint i, f; fields)
        {
            auto name = f.getName();
            col_names ~= name;
            _name2index[name] = i;
        }
    }

    auto col_values(T, bool nullable = false)(string name)
    {
        if(!col_names.canFind(name))
            throw new Exception("Unknown column name:" ~ name);
        auto ca = _fr.readColumnData(_name2index[name]);
        return ColumnValues.get_values!(T, nullable)(ca);
    }
}


private struct ColumnValues {
    static auto get_values(T, bool nullable)(ChunkedArray ca)
    {
        auto n_chunks = garrow_chunked_array_get_n_chunks(ca);

        static if(nullable)
            alias RT = Nullable!T;
        else
            alias RT = T;
        RT[] res;
        
        static if (isScalarType!T || isSomeString!T)
        {
            alias CT = CastTypeGArray!T;
            foreach(ci; 0..n_chunks)
            {
                auto chunk = garrow_chunked_array_get_chunk(ca, ci);
                auto chunk_len = garrow_array_get_length(chunk);
                auto offset = res.length;
                res.length += chunk_len;
                res[offset..offset+chunk_len] = getArrayBasicValues!(T, CT, nullable)(cast(CT*)chunk); // double copy?	
                g_object_unref(chunk);
            }
        }
        else static if(isArray!T)
        {
            foreach(ci; 0..n_chunks)
            {
                auto chunk = garrow_chunked_array_get_chunk(ca, ci);
                auto chunk_len = garrow_array_get_length(chunk);
                auto offset = res.length;
                res.length += chunk_len;
                foreach(j; 0..chunk_len)
                    res[offset + j] = getArrayValue!(ElementType!T)(cast(GArrowListArray*)chunk, j);
                g_object_unref(chunk);
            }
        }
        else
        {
            static assert(0, "Unsupported column type.");
        }
        g_object_unref(ca);
        return res;
    }
}

/*
Extract an array value out of a GArrowListArray and build
a D array out of it. Works for basic array types as well
as nested arrays through recursion.
*/
private T[] getArrayValue(T)(GArrowListArray* arr, long i)
{
    static if(!isSomeString!T && isArray!T)
    {
        // recurse
        alias ET = ElementType!T;
	    auto g_arr = cast(GArrowListArray*)garrow_list_array_get_value(arr, i);
        
        auto len = garrow_array_get_length(cast(GArrowArray*)g_arr);
        auto res = new T[len];
        foreach(k; 0..len)
            res[k] = getArrayValue!ET(g_arr, k);
        g_object_unref(g_arr);
        return res;
    }
    else
    {
        alias CT = CastTypeGArray!T;
	    auto g_arr = cast(CT*)garrow_list_array_get_value(arr, i);
        auto res = getArrayBasicValues!(T, CT, false)(g_arr);
        g_object_unref(g_arr);
        return res;
    }
}

private auto getArrayBasicValues(T, U, bool nullable)(U* arr)
{
    static if(nullable)
        alias RT = Nullable!T;
    else
        alias RT = T;

    static if(!nullable)
    {
        static if(isSomeString!T)
        {
            auto len = garrow_array_get_length(cast(GArrowArray*)arr);
            auto res = new T[len];
            foreach(k; 0..len)
            {
                auto gBytes = cast(GBytes*)garrow_binary_array_get_value(arr, k);
                size_t str_len;
                auto p = g_bytes_get_data(gBytes, &str_len);
                res[k] = cast(T)p[0 .. str_len].dup; //copy
                g_bytes_unref(gBytes);
            }
            return res;
            //return getArrayBasicStringValuesFast!(T, U)(arr);
        }
        else
        {
            long length;
            static if(is(T == long))
                auto p = garrow_int64_array_get_values(arr, &length);
            static if(is(T == int))
                auto p = garrow_int32_array_get_values(arr, &length);
            static if(is(T == float))
                auto p = garrow_float_array_get_values(arr, &length);
            static if(is(T == double))
                auto p = garrow_double_array_get_values(arr, &length);
            return p[0..length].dup; // copy
        }
    }
    else
    {
        import std.stdio; import std.conv: to;
        auto len = garrow_array_get_length(cast(GArrowArray*)arr);
        auto res = new RT[len];

        long offset = garrow_array_get_offset(cast(GArrowArray*)arr);
        auto null_buff = garrow_array_get_null_bitmap(cast(GArrowArray*)arr);
        auto bytes_null_buff = garrow_buffer_get_data(null_buff);
        size_t size_null_b;
        auto p_null = g_bytes_get_data(bytes_null_buff, &size_null_b);
        auto bytes_null_data = cast(byte[])p_null[offset .. offset + size_null_b];

        foreach(k; 0..len)
        {
            RT v;
            auto not_null = ((bytes_null_data[k >> 3] >> (k & 0x07)) & 1).to!bool;
            if(not_null)
            {
                static if(is(T == long))
                    v = garrow_int64_array_get_value(arr, k);
                static if(is(T == int))
                    v = garrow_int32_array_get_value(arr, k);
                static if(is(T == float))
                    v = garrow_float_array_get_value(arr, k);
                static if(is(T == double))
                    v = garrow_double_array_get_value(arr, k);
                static if(isSomeString!T)
                {
                    auto gBytes = cast(GBytes*)garrow_binary_array_get_value(arr, k);
                    size_t str_len;
                    auto p = g_bytes_get_data(gBytes, &str_len);
                    v = cast(T)p[0 .. str_len].dup; //copy
                    g_bytes_unref(gBytes);
                }
            }
            res[k] = v;
        }
        g_bytes_unref(cast(GBytes*)p_null);
        g_bytes_unref(bytes_null_buff);
        g_object_unref(null_buff);

        return res;
    }
}

private T[] getArrayBasicStringValuesFast(T, U)(U* arr) if(isSomeString!T) 
{
    auto len = garrow_array_get_length(cast(GArrowArray*)arr);
    auto res = new T[len];

    long offset = garrow_array_get_offset(cast(GArrowArray*)arr);

    auto buff = garrow_binary_array_get_buffer(arr);
    auto bytes_buff = garrow_buffer_get_data(buff);
    size_t size1;
    auto p1 = g_bytes_get_data(bytes_buff, &size1);
    auto bytes_data = cast(ubyte[])p1[0 .. size1];

    auto offset_buff = garrow_binary_array_get_offsets_buffer(arr);
    auto bytes_offset_buff = garrow_buffer_get_data(offset_buff);
    size_t size2;
    auto p2 = g_bytes_get_data(bytes_offset_buff, &size2);
    auto bytes_offsets = cast(ubyte[])p2[0 .. size2];

    foreach(j; 0..len)
    {
        auto ind = j + offset;
        auto pos = peek!(int, Endian.littleEndian)
            (bytes_offsets[4 * ind .. 4 * ind + 4]);
        auto len_str = peek!(int, Endian.littleEndian)
            (bytes_offsets[4 * (ind + 1) .. 4 * (ind + 1) + 4]) - pos;
        res[j] = cast(T)bytes_data[pos.. pos + len_str].dup;
    }
    // TODO: fix leak
    g_bytes_unref(cast(GBytes*)p1);
    g_bytes_unref(bytes_buff);
    g_object_unref(buff);
    g_bytes_unref(cast(GBytes*)p2);
    g_bytes_unref(bytes_offset_buff);
    g_object_unref(offset_buff);

    return res;
}

class ColumnBuilder(T) {
    Field!T _field;
    CastTypeArrayBuilder!T _ab;
    ulong _cnt;

    this(Field!T field)
    {
        _cnt = 0;
        _field = field;
        static if(isArray!T && !isSomeString!T)
        {
            alias ET = ElementType!T;
            auto ldt = new ListDataType(new ArrowField("element", new CastTypeDataType!ET(), false));
            _ab = new CastTypeArrayBuilder!T(ldt);
        }
        else
            _ab = new CastTypeArrayBuilder!T();
    }

    void append(T)(T val)
    {
        static if(isArray!T && !isSomeString!T)
        {
            alias ET = ElementType!T;
            _ab.append();
            auto vb = ObjectG.getDObject!(CastTypeArrayBuilder!ET)(
                cast(CastTypeGArrowArrayBuilder!ET*)_ab.getValueBuilder.getArrayBuilderStruct);
            foreach(e; val)
                vb.append(e);
        }
        else
        {
            _ab.append(val);
        }
        _cnt++;
    }

    Column get_column()
    {
        return new Column(_field, _ab.finish());
    }
}

ListG listWrapper(T)(T[] elements)
{
    auto res = new ListG(null);
    foreach(e; elements)
    {
        static if(is(T == ArrowField))
            res = res.append(cast(void*)e.getFieldStruct());
        static if(is(T == Column))
            res = res.append(cast(void*)e.getColumnStruct());
    }
    return res;
}
