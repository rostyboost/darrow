module arrow.StructDataType;

private import arrow.DataType;
private import arrow.Field;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ListG;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class StructDataType : DataType
{
	/** the main Gtk struct */
	protected GArrowStructDataType* gArrowStructDataType;

	/** Get the main Gtk struct */
	public GArrowStructDataType* getStructDataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowStructDataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowStructDataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowStructDataType* gArrowStructDataType, bool ownedRef = false)
	{
		this.gArrowStructDataType = gArrowStructDataType;
		super(cast(GArrowDataType*)gArrowStructDataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_struct_data_type_get_type();
	}

	/**
	 *
	 * Params:
	 *     fields = The fields of the struct.
	 * Returns: The newly created struct data type.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ListG fields)
	{
		auto p = garrow_struct_data_type_new((fields is null) ? null : fields.getListGStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowStructDataType*) p, true);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target field.
	 * Returns: The field at the index in the struct data type or %NULL on not found.
	 *
	 * Since: 0.12.0
	 */
	public Field getField(int i)
	{
		auto p = garrow_struct_data_type_get_field(gArrowStructDataType, i);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Field)(cast(GArrowField*) p, true);
	}

	/**
	 *
	 * Params:
	 *     name = The name of the target field.
	 * Returns: The field that has the name in the struct data type or %NULL on not found.
	 *
	 * Since: 0.12.0
	 */
	public Field getFieldByName(string name)
	{
		auto p = garrow_struct_data_type_get_field_by_name(gArrowStructDataType, Str.toStringz(name));

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Field)(cast(GArrowField*) p, true);
	}

	/**
	 *
	 * Params:
	 *     name = The name of the target field.
	 * Returns: The index of the target index in the struct data type
	 *     or `-1` on not found.
	 *
	 * Since: 0.12.0
	 */
	public int getFieldIndex(string name)
	{
		return garrow_struct_data_type_get_field_index(gArrowStructDataType, Str.toStringz(name));
	}

	/**
	 * Returns: The fields of the struct data type.
	 *
	 * Since: 0.12.0
	 */
	public ListG getFields()
	{
		auto p = garrow_struct_data_type_get_fields(gArrowStructDataType);

		if(p is null)
		{
			return null;
		}

		return new ListG(cast(GList*) p, true);
	}

	/**
	 * Returns: The number of fields of the struct data type.
	 *
	 * Since: 0.12.0
	 */
	public int getNFields()
	{
		return garrow_struct_data_type_get_n_fields(gArrowStructDataType);
	}
}
