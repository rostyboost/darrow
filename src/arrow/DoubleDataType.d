module arrow.DoubleDataType;

private import arrow.FloatingPointDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class DoubleDataType : FloatingPointDataType
{
	/** the main Gtk struct */
	protected GArrowDoubleDataType* gArrowDoubleDataType;

	/** Get the main Gtk struct */
	public GArrowDoubleDataType* getDoubleDataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowDoubleDataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowDoubleDataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowDoubleDataType* gArrowDoubleDataType, bool ownedRef = false)
	{
		this.gArrowDoubleDataType = gArrowDoubleDataType;
		super(cast(GArrowFloatingPointDataType*)gArrowDoubleDataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_double_data_type_get_type();
	}

	/**
	 * Returns: The newly created 64-bit floating point data type.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_double_data_type_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowDoubleDataType*) p, true);
	}
}
