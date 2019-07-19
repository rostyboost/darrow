module arrow.Time64DataType;

private import arrow.TimeDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class Time64DataType : TimeDataType
{
	/** the main Gtk struct */
	protected GArrowTime64DataType* gArrowTime64DataType;

	/** Get the main Gtk struct */
	public GArrowTime64DataType* getTime64DataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowTime64DataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowTime64DataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowTime64DataType* gArrowTime64DataType, bool ownedRef = false)
	{
		this.gArrowTime64DataType = gArrowTime64DataType;
		super(cast(GArrowTimeDataType*)gArrowTime64DataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_time64_data_type_get_type();
	}

	/**
	 *
	 * Params:
	 *     unit = %GARROW_TIME_UNIT_SECOND or %GARROW_TIME_UNIT_MILLI.
	 * Returns: A newly created the number of seconds or milliseconds since
	 *     midnight in 64-bit signed integer data type.
	 *
	 * Since: 0.7.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(GArrowTimeUnit unit)
	{
		GError* err = null;

		auto p = garrow_time64_data_type_new(unit, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowTime64DataType*) p, true);
	}
}
