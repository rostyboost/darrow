module arrow.FloatDataType;

private import arrow.FloatingPointDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class FloatDataType : FloatingPointDataType
{
	/** the main Gtk struct */
	protected GArrowFloatDataType* gArrowFloatDataType;

	/** Get the main Gtk struct */
	public GArrowFloatDataType* getFloatDataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowFloatDataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowFloatDataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowFloatDataType* gArrowFloatDataType, bool ownedRef = false)
	{
		this.gArrowFloatDataType = gArrowFloatDataType;
		super(cast(GArrowFloatingPointDataType*)gArrowFloatDataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_float_data_type_get_type();
	}

	/**
	 * Returns: The newly created float data type.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_float_data_type_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowFloatDataType*) p, true);
	}
}
