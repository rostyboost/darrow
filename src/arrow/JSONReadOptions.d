module arrow.JSONReadOptions;

private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class JSONReadOptions : ObjectG
{
	/** the main Gtk struct */
	protected GArrowJSONReadOptions* gArrowJSONReadOptions;

	/** Get the main Gtk struct */
	public GArrowJSONReadOptions* getJSONReadOptionsStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowJSONReadOptions;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowJSONReadOptions;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowJSONReadOptions* gArrowJSONReadOptions, bool ownedRef = false)
	{
		this.gArrowJSONReadOptions = gArrowJSONReadOptions;
		super(cast(GObject*)gArrowJSONReadOptions, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_json_read_options_get_type();
	}

	/**
	 * Returns: A newly created #GArrowJSONReadOptions.
	 *
	 * Since: 0.14.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_json_read_options_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowJSONReadOptions*) p, true);
	}
}
