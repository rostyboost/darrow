module arrow.CastOptions;

private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class CastOptions : ObjectG
{
	/** the main Gtk struct */
	protected GArrowCastOptions* gArrowCastOptions;

	/** Get the main Gtk struct */
	public GArrowCastOptions* getCastOptionsStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowCastOptions;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowCastOptions;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowCastOptions* gArrowCastOptions, bool ownedRef = false)
	{
		this.gArrowCastOptions = gArrowCastOptions;
		super(cast(GObject*)gArrowCastOptions, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_cast_options_get_type();
	}

	/**
	 * Returns: A newly created #GArrowCastOptions.
	 *
	 * Since: 0.7.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_cast_options_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowCastOptions*) p, true);
	}
}
