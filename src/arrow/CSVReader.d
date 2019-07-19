module arrow.CSVReader;

private import arrow.CSVReadOptions;
private import arrow.InputStream;
private import arrow.Table;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class CSVReader : ObjectG
{
	/** the main Gtk struct */
	protected GArrowCSVReader* gArrowCSVReader;

	/** Get the main Gtk struct */
	public GArrowCSVReader* getCSVReaderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowCSVReader;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowCSVReader;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowCSVReader* gArrowCSVReader, bool ownedRef = false)
	{
		this.gArrowCSVReader = gArrowCSVReader;
		super(cast(GObject*)gArrowCSVReader, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_csv_reader_get_type();
	}

	/**
	 *
	 * Params:
	 *     input = The input to be read.
	 *     options = A #GArrowCSVReadOptions.
	 * Returns: A newly created #GArrowCSVReader or %NULL on error.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(InputStream input, CSVReadOptions options)
	{
		GError* err = null;

		auto p = garrow_csv_reader_new((input is null) ? null : input.getArrowInputStreamStruct(), (options is null) ? null : options.getCSVReadOptionsStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowCSVReader*) p, true);
	}

	/**
	 * Returns: A read #GArrowTable or %NULL on error.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public Table read()
	{
		GError* err = null;

		auto p = garrow_csv_reader_read(gArrowCSVReader, &err);

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
