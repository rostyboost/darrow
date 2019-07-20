module arrow.DenseUnionArray;

private import arrow.Array;
private import arrow.DenseUnionDataType;
private import arrow.Int32Array;
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
public class DenseUnionArray : UnionArray
{
	/** the main Gtk struct */
	protected GArrowDenseUnionArray* gArrowDenseUnionArray;

	/** Get the main Gtk struct */
	public GArrowDenseUnionArray* getDenseUnionArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowDenseUnionArray;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowDenseUnionArray;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowDenseUnionArray* gArrowDenseUnionArray, bool ownedRef = false)
	{
		this.gArrowDenseUnionArray = gArrowDenseUnionArray;
		super(cast(GArrowUnionArray*)gArrowDenseUnionArray, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_dense_union_array_get_type();
	}

	/**
	 *
	 * Params:
	 *     typeIds = The field type IDs for each value as #GArrowInt8Array.
	 *     valueOffsets = The value offsets for each value as #GArrowInt32Array.
	 *         Each offset is counted for each type.
	 *     fields = The arrays for each field
	 *         as #GList of #GArrowArray.
	 * Returns: A newly created #GArrowDenseUnionArray
	 *     or %NULL on error.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Int8Array typeIds, Int32Array valueOffsets, ListG fields)
	{
		GError* err = null;

		auto p = garrow_dense_union_array_new((typeIds is null) ? null : typeIds.getInt8ArrayStruct(), (valueOffsets is null) ? null : valueOffsets.getInt32ArrayStruct(), (fields is null) ? null : fields.getListGStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowDenseUnionArray*) p, true);
	}

	/**
	 *
	 * Params:
	 *     dataType = The data type for the dense array.
	 *     typeIds = The field type IDs for each value as #GArrowInt8Array.
	 *     valueOffsets = The value offsets for each value as #GArrowInt32Array.
	 *         Each offset is counted for each type.
	 *     fields = The arrays for each field
	 *         as #GList of #GArrowArray.
	 * Returns: A newly created #GArrowSparseUnionArray
	 *     or %NULL on error.
	 *
	 * Since: 0.14.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(DenseUnionDataType dataType, Int8Array typeIds, Int32Array valueOffsets, ListG fields)
	{
		GError* err = null;

		auto p = garrow_dense_union_array_new_data_type((dataType is null) ? null : dataType.getDenseUnionDataTypeStruct(), (typeIds is null) ? null : typeIds.getInt8ArrayStruct(), (valueOffsets is null) ? null : valueOffsets.getInt32ArrayStruct(), (fields is null) ? null : fields.getListGStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new_data_type");
		}

		this(cast(GArrowDenseUnionArray*) p, true);
	}
}
