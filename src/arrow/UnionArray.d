module arrow.UnionArray;

private import arrow.Array;
private import arrow.c.functions;
public  import arrow.c.types;
private import gobject.ObjectG;


/** */
public class UnionArray : Array
{
	/** the main Gtk struct */
	protected GArrowUnionArray* gArrowUnionArray;

	/** Get the main Gtk struct */
	public GArrowUnionArray* getUnionArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowUnionArray;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowUnionArray;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowUnionArray* gArrowUnionArray, bool ownedRef = false)
	{
		this.gArrowUnionArray = gArrowUnionArray;
		super(cast(GArrowArray*)gArrowUnionArray, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_union_array_get_type();
	}

	/**
	 *
	 * Params:
	 *     i = The index of the field in the union.
	 * Returns: The i-th field values as a
	 *     #GArrowArray or %NULL on out of range.
	 */
	public Array getField(int i)
	{
		auto p = garrow_union_array_get_field(gArrowUnionArray, i);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Array)(cast(GArrowArray*) p, true);
	}
}
