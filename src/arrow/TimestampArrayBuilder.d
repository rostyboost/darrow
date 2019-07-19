module arrow.TimestampArrayBuilder;

private import arrow.ArrayBuilder;
private import arrow.TimestampDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class TimestampArrayBuilder : ArrayBuilder
{
	/** the main Gtk struct */
	protected GArrowTimestampArrayBuilder* gArrowTimestampArrayBuilder;

	/** Get the main Gtk struct */
	public GArrowTimestampArrayBuilder* getTimestampArrayBuilderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowTimestampArrayBuilder;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowTimestampArrayBuilder;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowTimestampArrayBuilder* gArrowTimestampArrayBuilder, bool ownedRef = false)
	{
		this.gArrowTimestampArrayBuilder = gArrowTimestampArrayBuilder;
		super(cast(GArrowArrayBuilder*)gArrowTimestampArrayBuilder, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_timestamp_array_builder_get_type();
	}

	/**
	 *
	 * Params:
	 *     dataType = A #GArrowTimestampDataType.
	 * Returns: A newly created #GArrowTimestampArrayBuilder.
	 *
	 * Since: 0.7.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(TimestampDataType dataType)
	{
		auto p = garrow_timestamp_array_builder_new((dataType is null) ? null : dataType.getTimestampDataTypeStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowTimestampArrayBuilder*) p, true);
	}

	/**
	 *
	 *
	 * Deprecated: Use garrow_timestamp_array_builder_append_value() instead.
	 *
	 * Params:
	 *     value = The number of milliseconds since UNIX epoch in signed 64bit integer.
	 *
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.7.0
	 *
	 * Throws: GException on failure.
	 */
	public bool append(long value)
	{
		GError* err = null;

		auto p = garrow_timestamp_array_builder_append(gArrowTimestampArrayBuilder, value, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.7.0
	 *
	 * Throws: GException on failure.
	 */
	public bool appendNull()
	{
		GError* err = null;

		auto p = garrow_timestamp_array_builder_append_null(gArrowTimestampArrayBuilder, &err) != 0;

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

		auto p = garrow_timestamp_array_builder_append_nulls(gArrowTimestampArrayBuilder, n, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 *
	 * Params:
	 *     value = The number of milliseconds since UNIX epoch in signed 64bit integer.
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public bool appendValue(long value)
	{
		GError* err = null;

		auto p = garrow_timestamp_array_builder_append_value(gArrowTimestampArrayBuilder, value, &err) != 0;

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
	 *     values = The array of
	 *         the number of milliseconds since UNIX epoch in signed 64bit integer.
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
	public bool appendValues(long[] values, bool[] isValids)
	{
		int[] isValidsArray = new int[isValids.length];
		for ( int i = 0; i < isValids.length; i++ )
		{
			isValidsArray[i] = isValids[i] ? 1 : 0;
		}

		GError* err = null;

		auto p = garrow_timestamp_array_builder_append_values(gArrowTimestampArrayBuilder, values.ptr, cast(long)values.length, isValidsArray.ptr, cast(long)isValids.length, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}
}
