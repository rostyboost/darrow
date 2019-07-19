module arrow.TimestampDataType;

private import arrow.DataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class TimestampDataType : DataType
{
	/** the main Gtk struct */
	protected GArrowTimestampDataType* gArrowTimestampDataType;

	/** Get the main Gtk struct */
	public GArrowTimestampDataType* getTimestampDataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowTimestampDataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowTimestampDataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowTimestampDataType* gArrowTimestampDataType, bool ownedRef = false)
	{
		this.gArrowTimestampDataType = gArrowTimestampDataType;
		super(cast(GArrowDataType*)gArrowTimestampDataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_timestamp_data_type_get_type();
	}

	/**
	 *
	 * Params:
	 *     unit = The unit of the timestamp data.
	 * Returns: A newly created the number of
	 *     seconds/milliseconds/microseconds/nanoseconds since UNIX epoch in
	 *     64-bit signed integer data type.
	 *
	 * Since: 0.7.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(GArrowTimeUnit unit)
	{
		auto p = garrow_timestamp_data_type_new(unit);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowTimestampDataType*) p, true);
	}

	/**
	 * Returns: The unit of the timestamp data type.
	 *
	 * Since: 0.8.0
	 */
	public GArrowTimeUnit getUnit()
	{
		return garrow_timestamp_data_type_get_unit(gArrowTimestampDataType);
	}
}
