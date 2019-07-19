module arrow.BooleanArrayBuilder;

private import arrow.ArrayBuilder;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class BooleanArrayBuilder : ArrayBuilder
{
	/** the main Gtk struct */
	protected GArrowBooleanArrayBuilder* gArrowBooleanArrayBuilder;

	/** Get the main Gtk struct */
	public GArrowBooleanArrayBuilder* getBooleanArrayBuilderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowBooleanArrayBuilder;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowBooleanArrayBuilder;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowBooleanArrayBuilder* gArrowBooleanArrayBuilder, bool ownedRef = false)
	{
		this.gArrowBooleanArrayBuilder = gArrowBooleanArrayBuilder;
		super(cast(GArrowArrayBuilder*)gArrowBooleanArrayBuilder, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_boolean_array_builder_get_type();
	}

	/**
	 * Returns: A newly created #GArrowBooleanArrayBuilder.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_boolean_array_builder_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowBooleanArrayBuilder*) p, true);
	}

	/**
	 *
	 *
	 * Deprecated: Use garrow_boolean_array_builder_append_value() instead.
	 *
	 * Params:
	 *     value = A boolean value.
	 *
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Throws: GException on failure.
	 */
	public bool append(bool value)
	{
		GError* err = null;

		auto p = garrow_boolean_array_builder_append(gArrowBooleanArrayBuilder, value, &err) != 0;

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

		auto p = garrow_boolean_array_builder_append_null(gArrowBooleanArrayBuilder, &err) != 0;

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

		auto p = garrow_boolean_array_builder_append_nulls(gArrowBooleanArrayBuilder, n, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 *
	 * Params:
	 *     value = A boolean value.
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public bool appendValue(bool value)
	{
		GError* err = null;

		auto p = garrow_boolean_array_builder_append_value(gArrowBooleanArrayBuilder, value, &err) != 0;

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
	 *     values = The array of boolean.
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
	public bool appendValues(bool[] values, bool[] isValids)
	{
		int[] valuesArray = new int[values.length];
		for ( int i = 0; i < values.length; i++ )
		{
			valuesArray[i] = values[i] ? 1 : 0;
		}


		int[] isValidsArray = new int[isValids.length];
		for ( int i = 0; i < isValids.length; i++ )
		{
			isValidsArray[i] = isValids[i] ? 1 : 0;
		}

		GError* err = null;

		auto p = garrow_boolean_array_builder_append_values(gArrowBooleanArrayBuilder, valuesArray.ptr, cast(long)values.length, isValidsArray.ptr, cast(long)isValids.length, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}
}
