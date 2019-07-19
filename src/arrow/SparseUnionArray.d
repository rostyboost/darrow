module arrow.SparseUnionArray;

private import arrow.Array;
private import arrow.Int8Array;
private import arrow.UnionArray;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.ListG;
private import gobject.ObjectG;


/** */
public class SparseUnionArray : UnionArray
{
	/** the main Gtk struct */
	protected GArrowSparseUnionArray* gArrowSparseUnionArray;

	/** Get the main Gtk struct */
	public GArrowSparseUnionArray* getSparseUnionArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowSparseUnionArray;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowSparseUnionArray;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowSparseUnionArray* gArrowSparseUnionArray, bool ownedRef = false)
	{
		this.gArrowSparseUnionArray = gArrowSparseUnionArray;
		super(cast(GArrowUnionArray*)gArrowSparseUnionArray, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_sparse_union_array_get_type();
	}

	/**
	 *
	 * Params:
	 *     typeIds = The field type IDs for each value as #GArrowInt8Array.
	 *     fields = The arrays for each field
	 *         as #GList of #GArrowArray.
	 * Returns: A newly created #GArrowSparseUnionArray
	 *     or %NULL on error.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Int8Array typeIds, ListG fields)
	{
		GError* err = null;

		auto p = garrow_sparse_union_array_new((typeIds is null) ? null : typeIds.getInt8ArrayStruct(), (fields is null) ? null : fields.getListGStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowSparseUnionArray*) p, true);
	}
}
