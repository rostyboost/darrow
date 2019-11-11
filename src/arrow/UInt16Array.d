module arrow.UInt16Array;

private import arrow.BooleanArray;
private import arrow.Buffer;
private import arrow.CompareOptions;
private import arrow.NumericArray;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class UInt16Array : NumericArray
{
	/** the main Gtk struct */
	protected GArrowUInt16Array* gArrowUInt16Array;

	/** Get the main Gtk struct */
	public GArrowUInt16Array* getUInt16ArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowUInt16Array;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowUInt16Array;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowUInt16Array* gArrowUInt16Array, bool ownedRef = false)
	{
		this.gArrowUInt16Array = gArrowUInt16Array;
		super(cast(GArrowNumericArray*)gArrowUInt16Array, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_uint16_array_get_type();
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
	 * Returns: A newly created #GArrowUInt16Array.
	 *
	 * Since: 0.4.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(long length, Buffer data, Buffer nullBitmap, long nNulls)
	{
		auto p = garrow_uint16_array_new(length, (data is null) ? null : data.getBufferStruct(), (nullBitmap is null) ? null : nullBitmap.getBufferStruct(), nNulls);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowUInt16Array*) p, true);
	}

	/**
	 *
	 * Params:
	 *     value = The value to compare.
	 *     options = A #GArrowCompareOptions.
	 * Returns: The #GArrowBooleanArray as
	 *     the result compared a numeric array with a scalar on success,
	 *     %NULL on error.
	 *
	 * Since: 0.14.0
	 *
	 * Throws: GException on failure.
	 */
	public BooleanArray compare(ushort value, CompareOptions options)
	{
		GError* err = null;

		auto p = garrow_uint16_array_compare(gArrowUInt16Array, value, (options is null) ? null : options.getCompareOptionsStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(BooleanArray)(cast(GArrowBooleanArray*) p, true);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target value.
	 * Returns: The @i-th value.
	 */
	public ushort getValue(long i)
	{
		return garrow_uint16_array_get_value(gArrowUInt16Array, i);
	}

	/**
	 * Returns: The raw values.
	 */
	public ushort[] getValues()
	{
		long length;

		auto p = garrow_uint16_array_get_values(gArrowUInt16Array, &length);

		return p[0 .. length];
	}

	/**
	 * Returns: The value of the computed sum on success,
	 *     If an error is occurred, the returned value is untrustful value.
	 *
	 * Since: 0.13.0
	 *
	 * Throws: GException on failure.
	 */
	public ulong sum()
	{
		GError* err = null;

		auto p = garrow_uint16_array_sum(gArrowUInt16Array, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}
}
