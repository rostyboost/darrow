module arrow.Time32Array;

private import arrow.Buffer;
private import arrow.NumericArray;
private import arrow.Time32DataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class Time32Array : NumericArray
{
	/** the main Gtk struct */
	protected GArrowTime32Array* gArrowTime32Array;

	/** Get the main Gtk struct */
	public GArrowTime32Array* getTime32ArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowTime32Array;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowTime32Array;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowTime32Array* gArrowTime32Array, bool ownedRef = false)
	{
		this.gArrowTime32Array = gArrowTime32Array;
		super(cast(GArrowNumericArray*)gArrowTime32Array, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_time32_array_get_type();
	}

	/**
	 *
	 * Params:
	 *     dataType = The #GArrowTime32DataType.
	 *     length = The number of elements.
	 *     data = The binary data in Arrow format of the array.
	 *     nullBitmap = The bitmap that shows null elements. The
	 *         N-th element is null when the N-th bit is 0, not null otherwise.
	 *         If the array has no null elements, the bitmap must be %NULL and
	 *         @n_nulls is 0.
	 *     nNulls = The number of null elements. If -1 is specified, the
	 *         number of nulls are computed from @null_bitmap.
	 * Returns: A newly created #GArrowTime32Array.
	 *
	 * Since: 0.7.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Time32DataType dataType, long length, Buffer data, Buffer nullBitmap, long nNulls)
	{
		auto p = garrow_time32_array_new((dataType is null) ? null : dataType.getTime32DataTypeStruct(), length, (data is null) ? null : data.getBufferStruct(), (nullBitmap is null) ? null : nullBitmap.getBufferStruct(), nNulls);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowTime32Array*) p, true);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target value.
	 * Returns: The i-th value.
	 *
	 * Since: 0.7.0
	 */
	public int getValue(long i)
	{
		return garrow_time32_array_get_value(gArrowTime32Array, i);
	}

	/**
	 * Returns: The raw values.
	 *
	 * Since: 0.7.0
	 */
	public int[] getValues()
	{
		long length;

		auto p = garrow_time32_array_get_values(gArrowTime32Array, &length);

		return p[0 .. length];
	}
}
