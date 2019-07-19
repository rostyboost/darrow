module arrow.BinaryArrayBuilder;

private import arrow.ArrayBuilder;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class BinaryArrayBuilder : ArrayBuilder
{
	/** the main Gtk struct */
	protected GArrowBinaryArrayBuilder* gArrowBinaryArrayBuilder;

	/** Get the main Gtk struct */
	public GArrowBinaryArrayBuilder* getBinaryArrayBuilderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowBinaryArrayBuilder;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowBinaryArrayBuilder;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowBinaryArrayBuilder* gArrowBinaryArrayBuilder, bool ownedRef = false)
	{
		this.gArrowBinaryArrayBuilder = gArrowBinaryArrayBuilder;
		super(cast(GArrowArrayBuilder*)gArrowBinaryArrayBuilder, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_binary_array_builder_get_type();
	}

	/**
	 * Returns: A newly created #GArrowBinaryArrayBuilder.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_binary_array_builder_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowBinaryArrayBuilder*) p, true);
	}

	/**
	 *
	 *
	 * Deprecated: Use garrow_binary_array_builder_append_value() instead.
	 *
	 * Params:
	 *     value = A binary value.
	 *
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Throws: GException on failure.
	 */
	public bool append(ubyte[] value)
	{
		GError* err = null;

		auto p = garrow_binary_array_builder_append(gArrowBinaryArrayBuilder, value.ptr, cast(int)value.length, &err) != 0;

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

		auto p = garrow_binary_array_builder_append_null(gArrowBinaryArrayBuilder, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 *
	 * Params:
	 *     value = A binary value.
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public bool appendValue(ubyte[] value)
	{
		GError* err = null;

		auto p = garrow_binary_array_builder_append_value(gArrowBinaryArrayBuilder, value.ptr, cast(int)value.length, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}
}
