module arrow.JSONReader;

private import arrow.InputStream;
private import arrow.JSONReadOptions;
private import arrow.Table;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class JSONReader : ObjectG
{
	/** the main Gtk struct */
	protected GArrowJSONReader* gArrowJSONReader;

	/** Get the main Gtk struct */
	public GArrowJSONReader* getJSONReaderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowJSONReader;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowJSONReader;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowJSONReader* gArrowJSONReader, bool ownedRef = false)
	{
		this.gArrowJSONReader = gArrowJSONReader;
		super(cast(GObject*)gArrowJSONReader, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_json_reader_get_type();
	}

	/**
	 *
	 * Params:
	 *     input = The input to be read.
	 *     options = A #GArrowJSONReadOptions.
	 * Returns: A newly created #GArrowJSONReader or %NULL on error.
	 *
	 * Since: 0.14.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(InputStream input, JSONReadOptions options)
	{
		GError* err = null;

		auto p = garrow_json_reader_new((input is null) ? null : input.getArrowInputStreamStruct(), (options is null) ? null : options.getJSONReadOptionsStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowJSONReader*) p, true);
	}

	/**
	 * Returns: A read #GArrowTable or %NULL on error.
	 *
	 * Since: 0.14.0
	 *
	 * Throws: GException on failure.
	 */
	public Table read()
	{
		GError* err = null;

		auto p = garrow_json_reader_read(gArrowJSONReader, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Table)(cast(GArrowTable*) p, true);
	}
}
