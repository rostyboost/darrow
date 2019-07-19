module arrow.CountOptions;

private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class CountOptions : ObjectG
{
	/** the main Gtk struct */
	protected GArrowCountOptions* gArrowCountOptions;

	/** Get the main Gtk struct */
	public GArrowCountOptions* getCountOptionsStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowCountOptions;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowCountOptions;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowCountOptions* gArrowCountOptions, bool ownedRef = false)
	{
		this.gArrowCountOptions = gArrowCountOptions;
		super(cast(GObject*)gArrowCountOptions, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_count_options_get_type();
	}

	/**
	 * Returns: A newly created #GArrowCountOptions.
	 *
	 * Since: 0.13.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_count_options_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowCountOptions*) p, true);
	}
}
