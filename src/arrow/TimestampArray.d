module arrow.TimestampArray;

private import arrow.Buffer;
private import arrow.NumericArray;
private import arrow.TimestampDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class TimestampArray : NumericArray
{
	/** the main Gtk struct */
	protected GArrowTimestampArray* gArrowTimestampArray;

	/** Get the main Gtk struct */
	public GArrowTimestampArray* getTimestampArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowTimestampArray;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowTimestampArray;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowTimestampArray* gArrowTimestampArray, bool ownedRef = false)
	{
		this.gArrowTimestampArray = gArrowTimestampArray;
		super(cast(GArrowNumericArray*)gArrowTimestampArray, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_timestamp_array_get_type();
	}

	/**
	 *
	 * Params:
	 *     dataType = The #GArrowTimestampDataType.
	 *     length = The number of elements.
	 *     data = The binary data in Arrow format of the array.
	 *     nullBitmap = The bitmap that shows null elements. The
	 *         N-th element is null when the N-th bit is 0, not null otherwise.
	 *         If the array has no null elements, the bitmap must be %NULL and
	 *         @n_nulls is 0.
	 *     nNulls = The number of null elements. If -1 is specified, the
	 *         number of nulls are computed from @null_bitmap.
	 * Returns: A newly created #GArrowTimestampArray.
	 *
	 * Since: 0.7.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(TimestampDataType dataType, long length, Buffer data, Buffer nullBitmap, long nNulls)
	{
		auto p = garrow_timestamp_array_new((dataType is null) ? null : dataType.getTimestampDataTypeStruct(), length, (data is null) ? null : data.getBufferStruct(), (nullBitmap is null) ? null : nullBitmap.getBufferStruct(), nNulls);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowTimestampArray*) p, true);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target value.
	 * Returns: The @i-th value.
	 *
	 * Since: 0.7.0
	 */
	public long getValue(long i)
	{
		return garrow_timestamp_array_get_value(gArrowTimestampArray, i);
	}

	/**
	 * Returns: The raw values.
	 *
	 * Since: 0.7.0
	 */
	public long[] getValues()
	{
		long length;

		auto p = garrow_timestamp_array_get_values(gArrowTimestampArray, &length);

		return p[0 .. length];
	}
}
