module arrow.NullArray;

private import arrow.Array;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class NullArray : Array
{
	/** the main Gtk struct */
	protected GArrowNullArray* gArrowNullArray;

	/** Get the main Gtk struct */
	public GArrowNullArray* getNullArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowNullArray;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowNullArray;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowNullArray* gArrowNullArray, bool ownedRef = false)
	{
		this.gArrowNullArray = gArrowNullArray;
		super(cast(GArrowArray*)gArrowNullArray, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_null_array_get_type();
	}

	/**
	 *
	 * Params:
	 *     length = An array length.
	 * Returns: A newly created #GArrowNullArray.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(long length)
	{
		auto p = garrow_null_array_new(length);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowNullArray*) p, true);
	}
}
