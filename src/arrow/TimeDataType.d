module arrow.TimeDataType;

private import arrow.DataType;
private import arrow.c.functions;
public  import arrow.c.types;


/** */
public class TimeDataType : DataType
{
	/** the main Gtk struct */
	protected GArrowTimeDataType* gArrowTimeDataType;

	/** Get the main Gtk struct */
	public GArrowTimeDataType* getTimeDataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowTimeDataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowTimeDataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowTimeDataType* gArrowTimeDataType, bool ownedRef = false)
	{
		this.gArrowTimeDataType = gArrowTimeDataType;
		super(cast(GArrowDataType*)gArrowTimeDataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_time_data_type_get_type();
	}

	/**
	 * Returns: The unit of the time data type.
	 *
	 * Since: 0.7.0
	 */
	public GArrowTimeUnit getUnit()
	{
		return garrow_time_data_type_get_unit(gArrowTimeDataType);
	}
}
