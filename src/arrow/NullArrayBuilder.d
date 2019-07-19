module arrow.NullArrayBuilder;

private import arrow.ArrayBuilder;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class NullArrayBuilder : ArrayBuilder
{
	/** the main Gtk struct */
	protected GArrowNullArrayBuilder* gArrowNullArrayBuilder;

	/** Get the main Gtk struct */
	public GArrowNullArrayBuilder* getNullArrayBuilderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowNullArrayBuilder;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowNullArrayBuilder;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowNullArrayBuilder* gArrowNullArrayBuilder, bool ownedRef = false)
	{
		this.gArrowNullArrayBuilder = gArrowNullArrayBuilder;
		super(cast(GArrowArrayBuilder*)gArrowNullArrayBuilder, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_null_array_builder_get_type();
	}

	/**
	 * Returns: A newly created #GArrowNullArrayBuilder.
	 *
	 * Since: 0.13.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_null_array_builder_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowNullArrayBuilder*) p, true);
	}

	/**
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.13.0
	 *
	 * Throws: GException on failure.
	 */
	public bool appendNull()
	{
		GError* err = null;

		auto p = garrow_null_array_builder_append_null(gArrowNullArrayBuilder, &err) != 0;

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
	 * Since: 0.13.0
	 *
	 * Throws: GException on failure.
	 */
	public bool appendNulls(long n)
	{
		GError* err = null;

		auto p = garrow_null_array_builder_append_nulls(gArrowNullArrayBuilder, n, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}
}
