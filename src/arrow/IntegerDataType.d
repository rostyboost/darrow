module arrow.IntegerDataType;

private import arrow.NumericDataType;
private import arrow.c.functions;
public  import arrow.c.types;


/** */
public class IntegerDataType : NumericDataType
{
	/** the main Gtk struct */
	protected GArrowIntegerDataType* gArrowIntegerDataType;

	/** Get the main Gtk struct */
	public GArrowIntegerDataType* getIntegerDataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowIntegerDataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowIntegerDataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowIntegerDataType* gArrowIntegerDataType, bool ownedRef = false)
	{
		this.gArrowIntegerDataType = gArrowIntegerDataType;
		super(cast(GArrowNumericDataType*)gArrowIntegerDataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_integer_data_type_get_type();
	}
}
