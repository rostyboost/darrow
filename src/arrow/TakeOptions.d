module arrow.TakeOptions;

private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class TakeOptions : ObjectG
{
	/** the main Gtk struct */
	protected GArrowTakeOptions* gArrowTakeOptions;

	/** Get the main Gtk struct */
	public GArrowTakeOptions* getTakeOptionsStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowTakeOptions;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowTakeOptions;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowTakeOptions* gArrowTakeOptions, bool ownedRef = false)
	{
		this.gArrowTakeOptions = gArrowTakeOptions;
		super(cast(GObject*)gArrowTakeOptions, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_take_options_get_type();
	}

	/**
	 * Returns: A newly created #GArrowTakeOptions.
	 *
	 * Since: 0.14.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_take_options_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowTakeOptions*) p, true);
	}
}
