module arrow.UInt32DataType;

private import arrow.IntegerDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class UInt32DataType : IntegerDataType
{
	/** the main Gtk struct */
	protected GArrowUInt32DataType* gArrowUInt32DataType;

	/** Get the main Gtk struct */
	public GArrowUInt32DataType* getUInt32DataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowUInt32DataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowUInt32DataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowUInt32DataType* gArrowUInt32DataType, bool ownedRef = false)
	{
		this.gArrowUInt32DataType = gArrowUInt32DataType;
		super(cast(GArrowIntegerDataType*)gArrowUInt32DataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_uint32_data_type_get_type();
	}

	/**
	 * Returns: The newly created 32-bit unsigned integer data type.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_uint32_data_type_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowUInt32DataType*) p, true);
	}
}
