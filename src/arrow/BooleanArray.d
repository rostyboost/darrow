module arrow.BooleanArray;

private import arrow.Buffer;
private import arrow.PrimitiveArray;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class BooleanArray : PrimitiveArray
{
	/** the main Gtk struct */
	protected GArrowBooleanArray* gArrowBooleanArray;

	/** Get the main Gtk struct */
	public GArrowBooleanArray* getBooleanArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowBooleanArray;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowBooleanArray;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowBooleanArray* gArrowBooleanArray, bool ownedRef = false)
	{
		this.gArrowBooleanArray = gArrowBooleanArray;
		super(cast(GArrowPrimitiveArray*)gArrowBooleanArray, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_boolean_array_get_type();
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
	 * Returns: A newly created #GArrowBooleanArray.
	 *
	 * Since: 0.4.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(long length, Buffer data, Buffer nullBitmap, long nNulls)
	{
		auto p = garrow_boolean_array_new(length, (data is null) ? null : data.getBufferStruct(), (nullBitmap is null) ? null : nullBitmap.getBufferStruct(), nNulls);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowBooleanArray*) p, true);
	}

	/**
	 *
	 * Params:
	 *     right = A right hand side #GArrowBooleanArray.
	 * Returns: The element-wise AND operated boolean array.
	 *
	 *     It should be freed with g_object_unref() when no longer needed.
	 *
	 * Since: 0.13.0
	 *
	 * Throws: GException on failure.
	 */
	public BooleanArray and(BooleanArray right)
	{
		GError* err = null;

		auto p = garrow_boolean_array_and(gArrowBooleanArray, (right is null) ? null : right.getBooleanArrayStruct(), &err);

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
	 * Returns: The i-th value.
	 */
	public bool getValue(long i)
	{
		return garrow_boolean_array_get_value(gArrowBooleanArray, i) != 0;
	}

	/**
	 * Returns: The raw boolean values.
	 *
	 *     It should be freed with g_free() when no longer needed.
	 */
	public bool[] getValues()
	{
		long length;

		auto p = garrow_boolean_array_get_values(gArrowBooleanArray, &length);

		bool[] r = new bool[length];
		for(size_t i = 0; i < length; i++)
		{
			r[i] = p[i] != 0;
		}
		return r;
	}

	/**
	 * Returns: The element-wise inverted boolean array.
	 *
	 *     It should be freed with g_object_unref() when no longer needed.
	 *
	 * Since: 0.13.0
	 *
	 * Throws: GException on failure.
	 */
	public BooleanArray invert()
	{
		GError* err = null;

		auto p = garrow_boolean_array_invert(gArrowBooleanArray, &err);

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
	 *     right = A right hand side #GArrowBooleanArray.
	 * Returns: The element-wise OR operated boolean array.
	 *
	 *     It should be freed with g_object_unref() when no longer needed.
	 *
	 * Since: 0.13.0
	 *
	 * Throws: GException on failure.
	 */
	public BooleanArray or(BooleanArray right)
	{
		GError* err = null;

		auto p = garrow_boolean_array_or(gArrowBooleanArray, (right is null) ? null : right.getBooleanArrayStruct(), &err);

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
	 *     right = A right hand side #GArrowBooleanArray.
	 * Returns: The element-wise XOR operated boolean array.
	 *
	 *     It should be freed with g_object_unref() when no longer needed.
	 *
	 * Since: 0.13.0
	 *
	 * Throws: GException on failure.
	 */
	public BooleanArray xor(BooleanArray right)
	{
		GError* err = null;

		auto p = garrow_boolean_array_xor(gArrowBooleanArray, (right is null) ? null : right.getBooleanArrayStruct(), &err);

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
}
