module arrow.Int32ArrayBuilder;

private import arrow.ArrayBuilder;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class Int32ArrayBuilder : ArrayBuilder
{
	/** the main Gtk struct */
	protected GArrowInt32ArrayBuilder* gArrowInt32ArrayBuilder;

	/** Get the main Gtk struct */
	public GArrowInt32ArrayBuilder* getInt32ArrayBuilderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowInt32ArrayBuilder;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowInt32ArrayBuilder;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowInt32ArrayBuilder* gArrowInt32ArrayBuilder, bool ownedRef = false)
	{
		this.gArrowInt32ArrayBuilder = gArrowInt32ArrayBuilder;
		super(cast(GArrowArrayBuilder*)gArrowInt32ArrayBuilder, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_int32_array_builder_get_type();
	}

	/**
	 * Returns: A newly created #GArrowInt32ArrayBuilder.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_int32_array_builder_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowInt32ArrayBuilder*) p, true);
	}

	/**
	 *
	 *
	 * Deprecated: Use garrow_int32_array_builder_append_value() instead.
	 *
	 * Params:
	 *     value = A int32 value.
	 *
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Throws: GException on failure.
	 */
	public bool append(int value)
	{
		GError* err = null;

		auto p = garrow_int32_array_builder_append(gArrowInt32ArrayBuilder, value, &err) != 0;

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

		auto p = garrow_int32_array_builder_append_null(gArrowInt32ArrayBuilder, &err) != 0;

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

		auto p = garrow_int32_array_builder_append_nulls(gArrowInt32ArrayBuilder, n, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 *
	 * Params:
	 *     value = A int32 value.
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public bool appendValue(int value)
	{
		GError* err = null;

		auto p = garrow_int32_array_builder_append_value(gArrowInt32ArrayBuilder, value, &err) != 0;

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
	 *     values = The array of int32.
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
	public bool appendValues(int[] values, bool[] isValids)
	{
		int[] isValidsArray = new int[isValids.length];
		for ( int i = 0; i < isValids.length; i++ )
		{
			isValidsArray[i] = isValids[i] ? 1 : 0;
		}

		GError* err = null;

		auto p = garrow_int32_array_builder_append_values(gArrowInt32ArrayBuilder, values.ptr, cast(long)values.length, isValidsArray.ptr, cast(long)isValids.length, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}
}
