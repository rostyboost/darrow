module arrow.StringArrayBuilder;

private import arrow.BinaryArrayBuilder;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class StringArrayBuilder : BinaryArrayBuilder
{
	/** the main Gtk struct */
	protected GArrowStringArrayBuilder* gArrowStringArrayBuilder;

	/** Get the main Gtk struct */
	public GArrowStringArrayBuilder* getStringArrayBuilderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowStringArrayBuilder;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowStringArrayBuilder;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowStringArrayBuilder* gArrowStringArrayBuilder, bool ownedRef = false)
	{
		this.gArrowStringArrayBuilder = gArrowStringArrayBuilder;
		super(cast(GArrowBinaryArrayBuilder*)gArrowStringArrayBuilder, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_string_array_builder_get_type();
	}

	/**
	 * Returns: A newly created #GArrowStringArrayBuilder.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_string_array_builder_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowStringArrayBuilder*) p, true);
	}

	/**
	 *
	 *
	 * Deprecated: Use garrow_string_array_builder_append_value() instead.
	 *
	 * Params:
	 *     value = A string value.
	 *
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Throws: GException on failure.
	 */
	public bool append(string value)
	{
		GError* err = null;

		auto p = garrow_string_array_builder_append(gArrowStringArrayBuilder, Str.toStringz(value), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 *
	 * Params:
	 *     value = A string value.
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 1.0.0
	 *
	 * Throws: GException on failure.
	 */
	public bool appendString(string value)
	{
		GError* err = null;

		auto p = garrow_string_array_builder_append_string(gArrowStringArrayBuilder, Str.toStringz(value), &err) != 0;

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
	 *     values = The array of strings.
	 *     isValids = The array of
	 *         boolean that shows whether the Nth value is valid or not. If the
	 *         Nth @is_valids is %TRUE, the Nth @values is valid value. Otherwise
	 *         the Nth value is null value.
	 *
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 1.0.0
	 *
	 * Throws: GException on failure.
	 */
	public bool appendStrings(string[] values, bool[] isValids)
	{
		int[] isValidsArray = new int[isValids.length];
		for ( int i = 0; i < isValids.length; i++ )
		{
			isValidsArray[i] = isValids[i] ? 1 : 0;
		}

		GError* err = null;

		auto p = garrow_string_array_builder_append_strings(gArrowStringArrayBuilder, Str.toStringzArray(values), cast(long)values.length, isValidsArray.ptr, cast(long)isValids.length, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 *
	 *
	 * Deprecated: Use garrow_string_array_builder_append_string() instead.
	 *
	 * Params:
	 *     value = A string value.
	 *
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public bool appendValue(string value)
	{
		GError* err = null;

		auto p = garrow_string_array_builder_append_value(gArrowStringArrayBuilder, Str.toStringz(value), &err) != 0;

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
	 * Deprecated: Use garrow_string_array_builder_append_strings() instead.
	 *
	 * Params:
	 *     values = The array of strings.
	 *     isValids = The array of
	 *         boolean that shows whether the Nth value is valid or not. If the
	 *         Nth @is_valids is %TRUE, the Nth @values is valid value. Otherwise
	 *         the Nth value is null value.
	 *
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.10.0
	 *
	 * Throws: GException on failure.
	 */
	public bool appendValues(string[] values, bool[] isValids)
	{
		int[] isValidsArray = new int[isValids.length];
		for ( int i = 0; i < isValids.length; i++ )
		{
			isValidsArray[i] = isValids[i] ? 1 : 0;
		}

		GError* err = null;

		auto p = garrow_string_array_builder_append_values(gArrowStringArrayBuilder, Str.toStringzArray(values), cast(long)values.length, isValidsArray.ptr, cast(long)isValids.length, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}
}
