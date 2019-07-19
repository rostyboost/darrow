module arrow.Column;

private import arrow.Array;
private import arrow.ChunkedArray;
private import arrow.DataType;
private import arrow.Field;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Column : ObjectG
{
	/** the main Gtk struct */
	protected GArrowColumn* gArrowColumn;

	/** Get the main Gtk struct */
	public GArrowColumn* getColumnStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowColumn;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowColumn;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowColumn* gArrowColumn, bool ownedRef = false)
	{
		this.gArrowColumn = gArrowColumn;
		super(cast(GObject*)gArrowColumn, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_column_get_type();
	}

	/**
	 *
	 * Params:
	 *     field = The metadata of the column.
	 *     array = The data of the column.
	 * Returns: A newly created #GArrowColumn.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Field field, Array array)
	{
		auto p = garrow_column_new_array((field is null) ? null : field.getFieldStruct(), (array is null) ? null : array.getArrayStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new_array");
		}

		this(cast(GArrowColumn*) p, true);
	}

	/**
	 *
	 * Params:
	 *     field = The metadata of the column.
	 *     chunkedArray = The data of the column.
	 * Returns: A newly created #GArrowColumn.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Field field, ChunkedArray chunkedArray)
	{
		auto p = garrow_column_new_chunked_array((field is null) ? null : field.getFieldStruct(), (chunkedArray is null) ? null : chunkedArray.getChunkedArrayStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new_chunked_array");
		}

		this(cast(GArrowColumn*) p, true);
	}

	/**
	 *
	 * Params:
	 *     otherColumn = A #GArrowColumn to be compared.
	 * Returns: %TRUE if both of them have the same data, %FALSE
	 *     otherwise.
	 *
	 * Since: 0.4.0
	 */
	public bool equal(Column otherColumn)
	{
		return garrow_column_equal(gArrowColumn, (otherColumn is null) ? null : otherColumn.getColumnStruct()) != 0;
	}

	/**
	 * Returns: The data of the column.
	 */
	public ChunkedArray getData()
	{
		auto p = garrow_column_get_data(gArrowColumn);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ChunkedArray)(cast(GArrowChunkedArray*) p, true);
	}

	/**
	 * Returns: The data type of the column.
	 */
	public DataType getDataType()
	{
		auto p = garrow_column_get_data_type(gArrowColumn);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(DataType)(cast(GArrowDataType*) p, true);
	}

	/**
	 * Returns: The metadata of the column.
	 */
	public Field getField()
	{
		auto p = garrow_column_get_field(gArrowColumn);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Field)(cast(GArrowField*) p, true);
	}

	/**
	 * Returns: The number of data of the column.
	 */
	public ulong getLength()
	{
		return garrow_column_get_length(gArrowColumn);
	}

	/**
	 * Returns: The number of nulls of the column.
	 */
	public ulong getNNulls()
	{
		return garrow_column_get_n_nulls(gArrowColumn);
	}

	/**
	 * Returns: The name of the column.
	 */
	public string getName()
	{
		return Str.toString(garrow_column_get_name(gArrowColumn));
	}

	/**
	 *
	 * Params:
	 *     offset = The offset of sub #GArrowColumn.
	 *     length = The length of sub #GArrowColumn.
	 * Returns: The sub #GArrowColumn. It covers only from
	 *     `offset` to `offset + length` range. The sub #GArrowColumn shares
	 *     values with the base #GArrowColumn.
	 */
	public Column slice(ulong offset, ulong length)
	{
		auto p = garrow_column_slice(gArrowColumn, offset, length);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Column)(cast(GArrowColumn*) p, true);
	}

	/**
	 * Returns: The formatted column content or %NULL on error.
	 *
	 *     The returned string should be freed when with g_free() when no
	 *     longer needed.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public override string toString()
	{
		GError* err = null;

		auto retStr = garrow_column_to_string(gArrowColumn, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}
}
