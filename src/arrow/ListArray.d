module arrow.ListArray;

private import arrow.Array;
private import arrow.Buffer;
private import arrow.DataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class ListArray : Array
{
	/** the main Gtk struct */
	protected GArrowListArray* gArrowListArray;

	/** Get the main Gtk struct */
	public GArrowListArray* getListArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowListArray;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowListArray;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowListArray* gArrowListArray, bool ownedRef = false)
	{
		this.gArrowListArray = gArrowListArray;
		super(cast(GArrowArray*)gArrowListArray, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_list_array_get_type();
	}

	/**
	 *
	 * Params:
	 *     dataType = The data type of the list.
	 *     length = The number of elements.
	 *     valueOffsets = The offsets of @values in Arrow format.
	 *     values = The values as #GArrowArray.
	 *     nullBitmap = The bitmap that shows null elements. The
	 *         N-th element is null when the N-th bit is 0, not null otherwise.
	 *         If the array has no null elements, the bitmap must be %NULL and
	 *         @n_nulls is 0.
	 *     nNulls = The number of null elements. If -1 is specified, the
	 *         number of nulls are computed from @null_bitmap.
	 * Returns: A newly created #GArrowListArray.
	 *
	 * Since: 0.4.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(DataType dataType, long length, Buffer valueOffsets, Array values, Buffer nullBitmap, long nNulls)
	{
		auto p = garrow_list_array_new((dataType is null) ? null : dataType.getDataTypeStruct(), length, (valueOffsets is null) ? null : valueOffsets.getBufferStruct(), (values is null) ? null : values.getArrayStruct(), (nullBitmap is null) ? null : nullBitmap.getBufferStruct(), nNulls);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowListArray*) p, true);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target value.
	 * Returns: The i-th list.
	 */
	public Array getValue(long i)
	{
		auto p = garrow_list_array_get_value(gArrowListArray, i);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Array)(cast(GArrowArray*) p, true);
	}

	/**
	 * Returns: The data type of value in each list.
	 */
	alias getValueType = Array.getValueType; public DataType getValueType()
	{
		auto p = garrow_list_array_get_value_type(gArrowListArray);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(DataType)(cast(GArrowDataType*) p, true);
	}
}
