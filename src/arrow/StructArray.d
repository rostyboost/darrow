module arrow.StructArray;

private import arrow.Array;
private import arrow.Buffer;
private import arrow.DataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.ListG;
private import gobject.ObjectG;


/** */
public class StructArray : Array
{
	/** the main Gtk struct */
	protected GArrowStructArray* gArrowStructArray;

	/** Get the main Gtk struct */
	public GArrowStructArray* getStructArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowStructArray;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowStructArray;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowStructArray* gArrowStructArray, bool ownedRef = false)
	{
		this.gArrowStructArray = gArrowStructArray;
		super(cast(GArrowArray*)gArrowStructArray, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_struct_array_get_type();
	}

	/**
	 *
	 * Params:
	 *     dataType = The data type of the struct.
	 *     length = The number of elements.
	 *     fields = The arrays for each field
	 *         as #GList of #GArrowArray.
	 *     nullBitmap = The bitmap that shows null elements. The
	 *         N-th element is null when the N-th bit is 0, not null otherwise.
	 *         If the array has no null elements, the bitmap must be %NULL and
	 *         @n_nulls is 0.
	 *     nNulls = The number of null elements. If -1 is specified, the
	 *         number of nulls are computed from @null_bitmap.
	 * Returns: A newly created #GArrowStructArray.
	 *
	 * Since: 0.4.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(DataType dataType, long length, ListG fields, Buffer nullBitmap, long nNulls)
	{
		auto p = garrow_struct_array_new((dataType is null) ? null : dataType.getDataTypeStruct(), length, (fields is null) ? null : fields.getListGStruct(), (nullBitmap is null) ? null : nullBitmap.getBufferStruct(), nNulls);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowStructArray*) p, true);
	}

	/**
	 * Returns: The fields in the struct.
	 *
	 * Since: 0.10.0
	 *
	 * Throws: GException on failure.
	 */
	public ListG flatten()
	{
		GError* err = null;

		auto p = garrow_struct_array_flatten(gArrowStructArray, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return new ListG(cast(GList*) p, true);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the field in the struct.
	 * Returns: The i-th field.
	 */
	public Array getField(int i)
	{
		auto p = garrow_struct_array_get_field(gArrowStructArray, i);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Array)(cast(GArrowArray*) p, true);
	}

	/**
	 *
	 *
	 * Deprecated: Use garrow_struct_array_flatten() instead.
	 *
	 * Returns: The fields in the struct.
	 */
	public ListG getFields()
	{
		auto p = garrow_struct_array_get_fields(gArrowStructArray);

		if(p is null)
		{
			return null;
		}

		return new ListG(cast(GList*) p, true);
	}
}
