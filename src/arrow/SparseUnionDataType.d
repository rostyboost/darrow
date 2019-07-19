module arrow.SparseUnionDataType;

private import arrow.Field;
private import arrow.UnionDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ListG;
private import gobject.ObjectG;


/** */
public class SparseUnionDataType : UnionDataType
{
	/** the main Gtk struct */
	protected GArrowSparseUnionDataType* gArrowSparseUnionDataType;

	/** Get the main Gtk struct */
	public GArrowSparseUnionDataType* getSparseUnionDataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowSparseUnionDataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowSparseUnionDataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowSparseUnionDataType* gArrowSparseUnionDataType, bool ownedRef = false)
	{
		this.gArrowSparseUnionDataType = gArrowSparseUnionDataType;
		super(cast(GArrowUnionDataType*)gArrowSparseUnionDataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_sparse_union_data_type_get_type();
	}

	/**
	 *
	 * Params:
	 *     fields = The fields of the union.
	 *     typeCodes = The codes to specify each field.
	 * Returns: The newly created sparse union data type.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ListG fields, ubyte[] typeCodes)
	{
		auto p = garrow_sparse_union_data_type_new((fields is null) ? null : fields.getListGStruct(), typeCodes.ptr, cast(size_t)typeCodes.length);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowSparseUnionDataType*) p, true);
	}
}
