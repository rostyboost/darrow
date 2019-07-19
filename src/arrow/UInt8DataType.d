module arrow.UInt8DataType;

private import arrow.IntegerDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class UInt8DataType : IntegerDataType
{
	/** the main Gtk struct */
	protected GArrowUInt8DataType* gArrowUInt8DataType;

	/** Get the main Gtk struct */
	public GArrowUInt8DataType* getUInt8DataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowUInt8DataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowUInt8DataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowUInt8DataType* gArrowUInt8DataType, bool ownedRef = false)
	{
		this.gArrowUInt8DataType = gArrowUInt8DataType;
		super(cast(GArrowIntegerDataType*)gArrowUInt8DataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_uint8_data_type_get_type();
	}

	/**
	 * Returns: The newly created 8-bit unsigned integer data type.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_uint8_data_type_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowUInt8DataType*) p, true);
	}
}
