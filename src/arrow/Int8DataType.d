module arrow.Int8DataType;

private import arrow.IntegerDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class Int8DataType : IntegerDataType
{
	/** the main Gtk struct */
	protected GArrowInt8DataType* gArrowInt8DataType;

	/** Get the main Gtk struct */
	public GArrowInt8DataType* getInt8DataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowInt8DataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowInt8DataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowInt8DataType* gArrowInt8DataType, bool ownedRef = false)
	{
		this.gArrowInt8DataType = gArrowInt8DataType;
		super(cast(GArrowIntegerDataType*)gArrowInt8DataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_int8_data_type_get_type();
	}

	/**
	 * Returns: The newly created 8-bit integer data type.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_int8_data_type_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowInt8DataType*) p, true);
	}
}
