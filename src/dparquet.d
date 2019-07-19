module dparquet;

private{
import arrow.Field : ArrowField = Field;
import arrow.ChunkedArray;
import arrow.Column;
import arrow.Int32Array;
import arrow.Int64Array;
import arrow.FloatArray;
import arrow.DoubleArray;
import arrow.StringArray;
import arrow.Int64ArrayBuilder;
import arrow.Int32ArrayBuilder;
import arrow.FloatArrayBuilder;
import arrow.StringArrayBuilder;
import arrow.ListArrayBuilder;
import arrow.Int32DataType;
import arrow.Int64DataType;
import arrow.StringDataType;
import arrow.FloatDataType;
import arrow.ListDataType;
import arrow.Schema : ArrowSchema = Schema;
import arrow.ListArray;
import glib.ListG;
import gobject.ObjectG;
import parquet.ArrowFileReader : ArrowFileReader;

import std.algorithm : canFind;
import std.traits : isArray, isSomeString, fullyQualifiedName;
import std.range.primitives : ElementType;
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

    T[] col_values(T)(string name)
    {
        if(!col_names.canFind(name))
            throw new Exception("Unknown column name:" ~ name);
        auto col = _fr.readColumn(_name2index[name]);
        return ColumnValues(col).get_values!T();
    }
}


private struct ColumnValues {

    Column _col;
    ChunkedArray _ca;

    this(Column col)
    {
        _col = col;
        _ca = col.getData();
    }

    T[] get_values(T)()
    {
        T[] res;
        
        static if (!isArray!T && !isSomeString!T)
        {
            alias CT = CastTypeArray!T;
            foreach(ci; 0.._ca.getNChunks())
                res ~= (cast(CT)_ca.getChunk(ci)).getValues();
        }
        static if(isSomeString!T)
        {
            foreach(ci; 0.._ca.getNChunks())
            {
                auto chunk = cast(StringArray)_ca.getChunk(ci);
                foreach(j; 0..chunk.getLength())
                    res ~= cast(T)chunk.getString(j);
            }
        }
        static if(isArray!T && !isSomeString!T)
        {
            alias ET = ElementType!T;
            static if (isArray!ET && !isSomeString!ET)
            {
                alias EET = ElementType!ET;
                alias CT = CastTypeArray!EET;
                foreach(ci; 0.._ca.getNChunks())
                {
                    auto chunk = cast(ListArray)_ca.getChunk(ci);
                    foreach(j; 0..chunk.getLength())
                    {
                        T v;
                        auto subarray = (cast(ListArray)chunk.getValue(j));
                        foreach(k; 0..subarray.getLength())
                            v~= (cast(CT)subarray.getValue(k)).getValues();
                        res ~= v;
                    }
                }

            }
            else
            {
                alias CT = CastTypeArray!ET;
                foreach(ci; 0.._ca.getNChunks())
                {
                    auto chunk = cast(ListArray)_ca.getChunk(ci);
                    foreach(j; 0..chunk.getLength())
                    {
                        T v;
                        auto arrStr = cast(CT)chunk.getValue(j);
                        foreach(k; 0..arrStr.getLength())
                            v ~= cast(ET)arrStr.getString(k);
                        res ~= v;
                    }
                }
            }
        }
        return res;
    }
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
