module arrow.DataType;

private import arrow.c.functions;
public  import arrow.c.types;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class DataType : ObjectG
{
	/** the main Gtk struct */
	protected GArrowDataType* gArrowDataType;

	/** Get the main Gtk struct */
	public GArrowDataType* getDataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowDataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowDataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowDataType* gArrowDataType, bool ownedRef = false)
	{
		this.gArrowDataType = gArrowDataType;
		super(cast(GObject*)gArrowDataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_data_type_get_type();
	}

	/**
	 *
	 * Params:
	 *     otherDataType = A #GArrowDataType to be compared.
	 * Returns: %TRUE if both of them have the same data, %FALSE
	 *     otherwise.
	 */
	public bool equal(DataType otherDataType)
	{
		return garrow_data_type_equal(gArrowDataType, (otherDataType is null) ? null : otherDataType.getDataTypeStruct()) != 0;
	}

	/**
	 * Returns: The #GArrowType of the data type.
	 */
	public GArrowType getId()
	{
		return garrow_data_type_get_id(gArrowDataType);
	}

	/**
	 * Returns: The string representation of the data type.
	 *     The caller must free it by g_free() when the caller doesn't need it anymore.
	 */
	public override string toString()
	{
		auto retStr = garrow_data_type_to_string(gArrowDataType);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}
}
