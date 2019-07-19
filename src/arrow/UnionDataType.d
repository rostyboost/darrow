module arrow.UnionDataType;

private import arrow.DataType;
private import arrow.Field;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ListG;
private import gobject.ObjectG;


/** */
public class UnionDataType : DataType
{
	/** the main Gtk struct */
	protected GArrowUnionDataType* gArrowUnionDataType;

	/** Get the main Gtk struct */
	public GArrowUnionDataType* getUnionDataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowUnionDataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowUnionDataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowUnionDataType* gArrowUnionDataType, bool ownedRef = false)
	{
		this.gArrowUnionDataType = gArrowUnionDataType;
		super(cast(GArrowDataType*)gArrowUnionDataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_union_data_type_get_type();
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target field.
	 * Returns: The field at the index in the union data type or %NULL on not found.
	 *
	 * Since: 0.12.0
	 */
	public Field getField(int i)
	{
		auto p = garrow_union_data_type_get_field(gArrowUnionDataType, i);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Field)(cast(GArrowField*) p, true);
	}

	/**
	 * Returns: The fields of the union data type.
	 *
	 * Since: 0.12.0
	 */
	public ListG getFields()
	{
		auto p = garrow_union_data_type_get_fields(gArrowUnionDataType);

		if(p is null)
		{
			return null;
		}

		return new ListG(cast(GList*) p, true);
	}

	/**
	 * Returns: The number of fields of the union data type.
	 *
	 * Since: 0.12.0
	 */
	public int getNFields()
	{
		return garrow_union_data_type_get_n_fields(gArrowUnionDataType);
	}

	/**
	 * Returns: The codes for each field.
	 *
	 *     It should be freed with g_free() when no longer needed.
	 *
	 * Since: 0.12.0
	 */
	public ubyte[] getTypeCodes()
	{
		size_t nTypeCodes;

		auto p = garrow_union_data_type_get_type_codes(gArrowUnionDataType, &nTypeCodes);

		return p[0 .. nTypeCodes];
	}
}
