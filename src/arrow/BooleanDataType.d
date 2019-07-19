module arrow.BooleanDataType;

private import arrow.FixedWidthDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class BooleanDataType : FixedWidthDataType
{
	/** the main Gtk struct */
	protected GArrowBooleanDataType* gArrowBooleanDataType;

	/** Get the main Gtk struct */
	public GArrowBooleanDataType* getBooleanDataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowBooleanDataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowBooleanDataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowBooleanDataType* gArrowBooleanDataType, bool ownedRef = false)
	{
		this.gArrowBooleanDataType = gArrowBooleanDataType;
		super(cast(GArrowFixedWidthDataType*)gArrowBooleanDataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_boolean_data_type_get_type();
	}

	/**
	 * Returns: The newly created boolean data type.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_boolean_data_type_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowBooleanDataType*) p, true);
	}
}
