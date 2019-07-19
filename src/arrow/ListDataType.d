module arrow.ListDataType;

private import arrow.DataType;
private import arrow.Field;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class ListDataType : DataType
{
	/** the main Gtk struct */
	protected GArrowListDataType* gArrowListDataType;

	/** Get the main Gtk struct */
	public GArrowListDataType* getListDataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowListDataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowListDataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowListDataType* gArrowListDataType, bool ownedRef = false)
	{
		this.gArrowListDataType = gArrowListDataType;
		super(cast(GArrowDataType*)gArrowListDataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_list_data_type_get_type();
	}

	/**
	 *
	 * Params:
	 *     field = The field of elements
	 * Returns: The newly created list data type.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Field field)
	{
		auto p = garrow_list_data_type_new((field is null) ? null : field.getFieldStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowListDataType*) p, true);
	}

	/**
	 * Returns: The field of value.
	 *
	 * Since: 0.13.0
	 */
	public Field getField()
	{
		auto p = garrow_list_data_type_get_field(gArrowListDataType);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Field)(cast(GArrowField*) p, true);
	}

	/**
	 *
	 *
	 * Deprecated: Use garrow_list_data_type_get_field() instead.
	 *
	 * Returns: The field of value.
	 */
	public Field getValueField()
	{
		auto p = garrow_list_data_type_get_value_field(gArrowListDataType);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Field)(cast(GArrowField*) p, true);
	}
}
