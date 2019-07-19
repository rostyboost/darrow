module arrow.Field;

private import arrow.DataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Field : ObjectG
{
	/** the main Gtk struct */
	protected GArrowField* gArrowField;

	/** Get the main Gtk struct */
	public GArrowField* getFieldStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowField;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowField;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowField* gArrowField, bool ownedRef = false)
	{
		this.gArrowField = gArrowField;
		super(cast(GObject*)gArrowField, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_field_get_type();
	}

	/**
	 *
	 * Params:
	 *     name = The name of the field.
	 *     dataType = The data type of the field.
	 * Returns: A newly created #GArrowField.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string name, DataType dataType)
	{
		auto p = garrow_field_new(Str.toStringz(name), (dataType is null) ? null : dataType.getDataTypeStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowField*) p, true);
	}

	/**
	 *
	 * Params:
	 *     name = The name of the field.
	 *     dataType = The data type of the field.
	 *     nullable = Whether null may be included or not.
	 * Returns: A newly created #GArrowField.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string name, DataType dataType, bool nullable)
	{
		auto p = garrow_field_new_full(Str.toStringz(name), (dataType is null) ? null : dataType.getDataTypeStruct(), nullable);

		if(p is null)
		{
			throw new ConstructionException("null returned by new_full");
		}

		this(cast(GArrowField*) p, true);
	}

	/**
	 *
	 * Params:
	 *     otherField = A #GArrowField to be compared.
	 * Returns: %TRUE if both of them have the same data, %FALSE
	 *     otherwise.
	 */
	public bool equal(Field otherField)
	{
		return garrow_field_equal(gArrowField, (otherField is null) ? null : otherField.getFieldStruct()) != 0;
	}

	/**
	 * Returns: The data type of the field.
	 */
	public DataType getDataType()
	{
		auto p = garrow_field_get_data_type(gArrowField);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(DataType)(cast(GArrowDataType*) p);
	}

	/**
	 * Returns: The name of the field.
	 */
	public string getName()
	{
		return Str.toString(garrow_field_get_name(gArrowField));
	}

	/**
	 * Returns: Whether the filed may include null or not.
	 */
	public bool isNullable()
	{
		return garrow_field_is_nullable(gArrowField) != 0;
	}

	/**
	 * Returns: The string representation of the field.
	 */
	public override string toString()
	{
		auto retStr = garrow_field_to_string(gArrowField);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}
}
