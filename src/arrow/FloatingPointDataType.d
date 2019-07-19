module arrow.FloatingPointDataType;

private import arrow.NumericDataType;
private import arrow.c.functions;
public  import arrow.c.types;


/** */
public class FloatingPointDataType : NumericDataType
{
	/** the main Gtk struct */
	protected GArrowFloatingPointDataType* gArrowFloatingPointDataType;

	/** Get the main Gtk struct */
	public GArrowFloatingPointDataType* getFloatingPointDataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowFloatingPointDataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowFloatingPointDataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowFloatingPointDataType* gArrowFloatingPointDataType, bool ownedRef = false)
	{
		this.gArrowFloatingPointDataType = gArrowFloatingPointDataType;
		super(cast(GArrowNumericDataType*)gArrowFloatingPointDataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_floating_point_data_type_get_type();
	}
}
