module arrow.UInt16ArrayBuilder;

private import arrow.ArrayBuilder;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class UInt16ArrayBuilder : ArrayBuilder
{
	/** the main Gtk struct */
	protected GArrowUInt16ArrayBuilder* gArrowUInt16ArrayBuilder;

	/** Get the main Gtk struct */
	public GArrowUInt16ArrayBuilder* getUInt16ArrayBuilderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowUInt16ArrayBuilder;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowUInt16ArrayBuilder;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowUInt16ArrayBuilder* gArrowUInt16ArrayBuilder, bool ownedRef = false)
	{
		this.gArrowUInt16ArrayBuilder = gArrowUInt16ArrayBuilder;
		super(cast(GArrowArrayBuilder*)gArrowUInt16ArrayBuilder, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_uint16_array_builder_get_type();
	}

	/**
	 * Returns: A newly created #GArrowUInt16ArrayBuilder.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_uint16_array_builder_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowUInt16ArrayBuilder*) p, true);
	}

	/**
	 *
	 *
	 * Deprecated: Use garrow_uint16_array_builder_append_value() instead.
	 *
	 * Params:
	 *     value = An uint16 value.
	 *
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Throws: GException on failure.
	 */
	public bool append(ushort value)
	{
		GError* err = null;

		auto p = garrow_uint16_array_builder_append(gArrowUInt16ArrayBuilder, value, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Throws: GException on failure.
	 */
	public bool appendNull()
	{
		GError* err = null;

		auto p = garrow_uint16_array_builder_append_null(gArrowUInt16ArrayBuilder, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 * Append multiple nulls at once. It's more efficient than multiple
	 * `append_null()` calls.
	 *
	 * Params:
	 *     n = The number of null values to be appended.
	 *
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.8.0
	 *
	 * Throws: GException on failure.
	 */
	public bool appendNulls(long n)
	{
		GError* err = null;

		auto p = garrow_uint16_array_builder_append_nulls(gArrowUInt16ArrayBuilder, n, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 *
	 * Params:
	 *     value = An uint16 value.
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public bool appendValue(ushort value)
	{
		GError* err = null;

		auto p = garrow_uint16_array_builder_append_value(gArrowUInt16ArrayBuilder, value, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 * Append multiple values at once. It's more efficient than multiple
	 * `append()` and `append_null()` calls.
	 *
	 * Params:
	 *     values = The array of uint16.
	 *     isValids = The array of
	 *         boolean that shows whether the Nth value is valid or not. If the
	 *         Nth `is_valids` is %TRUE, the Nth `values` is valid value. Otherwise
	 *         the Nth value is null value.
	 *
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.8.0
	 *
	 * Throws: GException on failure.
	 */
	public bool appendValues(ushort[] values, bool[] isValids)
	{
		int[] isValidsArray = new int[isValids.length];
		for ( int i = 0; i < isValids.length; i++ )
		{
			isValidsArray[i] = isValids[i] ? 1 : 0;
		}

		GError* err = null;

		auto p = garrow_uint16_array_builder_append_values(gArrowUInt16ArrayBuilder, values.ptr, cast(long)values.length, isValidsArray.ptr, cast(long)isValids.length, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}
}
