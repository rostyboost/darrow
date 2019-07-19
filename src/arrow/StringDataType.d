module arrow.StringDataType;

private import arrow.DataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class StringDataType : DataType
{
	/** the main Gtk struct */
	protected GArrowStringDataType* gArrowStringDataType;

	/** Get the main Gtk struct */
	public GArrowStringDataType* getStringDataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowStringDataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowStringDataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowStringDataType* gArrowStringDataType, bool ownedRef = false)
	{
		this.gArrowStringDataType = gArrowStringDataType;
		super(cast(GArrowDataType*)gArrowStringDataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_string_data_type_get_type();
	}

	/**
	 * Returns: The newly created UTF-8 encoded string data type.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_string_data_type_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowStringDataType*) p, true);
	}
}
