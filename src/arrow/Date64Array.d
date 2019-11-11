module arrow.Date64Array;

private import arrow.Buffer;
private import arrow.NumericArray;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class Date64Array : NumericArray
{
	/** the main Gtk struct */
	protected GArrowDate64Array* gArrowDate64Array;

	/** Get the main Gtk struct */
	public GArrowDate64Array* getDate64ArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowDate64Array;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowDate64Array;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowDate64Array* gArrowDate64Array, bool ownedRef = false)
	{
		this.gArrowDate64Array = gArrowDate64Array;
		super(cast(GArrowNumericArray*)gArrowDate64Array, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_date64_array_get_type();
	}

	/**
	 *
	 * Params:
	 *     length = The number of elements.
	 *     data = The binary data in Arrow format of the array.
	 *     nullBitmap = The bitmap that shows null elements. The
	 *         N-th element is null when the N-th bit is 0, not null otherwise.
	 *         If the array has no null elements, the bitmap must be %NULL and
	 *         @n_nulls is 0.
	 *     nNulls = The number of null elements. If -1 is specified, the
	 *         number of nulls are computed from @null_bitmap.
	 * Returns: A newly created #GArrowDate64Array.
	 *
	 * Since: 0.7.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(long length, Buffer data, Buffer nullBitmap, long nNulls)
	{
		auto p = garrow_date64_array_new(length, (data is null) ? null : data.getBufferStruct(), (nullBitmap is null) ? null : nullBitmap.getBufferStruct(), nNulls);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowDate64Array*) p, true);
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
		return garrow_date64_array_get_value(gArrowDate64Array, i);
	}

	/**
	 * Returns: The raw values.
	 *
	 * Since: 0.7.0
	 */
	public long[] getValues()
	{
		long length;

		auto p = garrow_date64_array_get_values(gArrowDate64Array, &length);

		return p[0 .. length];
	}
}
