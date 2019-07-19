module arrow.Time64Array;

private import arrow.Buffer;
private import arrow.NumericArray;
private import arrow.Time64DataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class Time64Array : NumericArray
{
	/** the main Gtk struct */
	protected GArrowTime64Array* gArrowTime64Array;

	/** Get the main Gtk struct */
	public GArrowTime64Array* getTime64ArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowTime64Array;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowTime64Array;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowTime64Array* gArrowTime64Array, bool ownedRef = false)
	{
		this.gArrowTime64Array = gArrowTime64Array;
		super(cast(GArrowNumericArray*)gArrowTime64Array, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_time64_array_get_type();
	}

	/**
	 *
	 * Params:
	 *     dataType = The #GArrowTime64DataType.
	 *     length = The number of elements.
	 *     data = The binary data in Arrow format of the array.
	 *     nullBitmap = The bitmap that shows null elements. The
	 *         N-th element is null when the N-th bit is 0, not null otherwise.
	 *         If the array has no null elements, the bitmap must be %NULL and
	 *         @n_nulls is 0.
	 *     nNulls = The number of null elements. If -1 is specified, the
	 *         number of nulls are computed from @null_bitmap.
	 * Returns: A newly created #GArrowTime64Array.
	 *
	 * Since: 0.7.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Time64DataType dataType, long length, Buffer data, Buffer nullBitmap, long nNulls)
	{
		auto p = garrow_time64_array_new((dataType is null) ? null : dataType.getTime64DataTypeStruct(), length, (data is null) ? null : data.getBufferStruct(), (nullBitmap is null) ? null : nullBitmap.getBufferStruct(), nNulls);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowTime64Array*) p, true);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target value.
	 * Returns: The i-th value.
	 *
	 * Since: 0.7.0
	 */
	public long getValue(long i)
	{
		return garrow_time64_array_get_value(gArrowTime64Array, i);
	}

	/**
	 * Returns: The raw values.
	 *
	 * Since: 0.7.0
	 */
	public long[] getValues()
	{
		long length;

		auto p = garrow_time64_array_get_values(gArrowTime64Array, &length);

		return p[0 .. length];
	}
}
