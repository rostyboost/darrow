module arrow.FixedWidthDataType;

private import arrow.DataType;
private import arrow.c.functions;
public  import arrow.c.types;


/** */
public class FixedWidthDataType : DataType
{
	/** the main Gtk struct */
	protected GArrowFixedWidthDataType* gArrowFixedWidthDataType;

	/** Get the main Gtk struct */
	public GArrowFixedWidthDataType* getFixedWidthDataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowFixedWidthDataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowFixedWidthDataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowFixedWidthDataType* gArrowFixedWidthDataType, bool ownedRef = false)
	{
		this.gArrowFixedWidthDataType = gArrowFixedWidthDataType;
		super(cast(GArrowDataType*)gArrowFixedWidthDataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_fixed_width_data_type_get_type();
	}

	/**
	 * Returns: The number of bits for one data.
	 */
	public int getBitWidth()
	{
		return garrow_fixed_width_data_type_get_bit_width(gArrowFixedWidthDataType);
	}
}
