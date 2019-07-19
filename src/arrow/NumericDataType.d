module arrow.NumericDataType;

private import arrow.FixedWidthDataType;
private import arrow.c.functions;
public  import arrow.c.types;


/** */
public class NumericDataType : FixedWidthDataType
{
	/** the main Gtk struct */
	protected GArrowNumericDataType* gArrowNumericDataType;

	/** Get the main Gtk struct */
	public GArrowNumericDataType* getNumericDataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowNumericDataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowNumericDataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowNumericDataType* gArrowNumericDataType, bool ownedRef = false)
	{
		this.gArrowNumericDataType = gArrowNumericDataType;
		super(cast(GArrowFixedWidthDataType*)gArrowNumericDataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_numeric_data_type_get_type();
	}
}
