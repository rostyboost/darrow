module arrow.CompareOptions;

private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class CompareOptions : ObjectG
{
	/** the main Gtk struct */
	protected GArrowCompareOptions* gArrowCompareOptions;

	/** Get the main Gtk struct */
	public GArrowCompareOptions* getCompareOptionsStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowCompareOptions;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowCompareOptions;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowCompareOptions* gArrowCompareOptions, bool ownedRef = false)
	{
		this.gArrowCompareOptions = gArrowCompareOptions;
		super(cast(GObject*)gArrowCompareOptions, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_compare_options_get_type();
	}

	/**
	 * Returns: A newly created #GArrowCompareOptions.
	 *
	 * Since: 0.14.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_compare_options_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowCompareOptions*) p, true);
	}
}
