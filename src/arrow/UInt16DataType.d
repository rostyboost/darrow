module arrow.UInt16DataType;

private import arrow.IntegerDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class UInt16DataType : IntegerDataType
{
	/** the main Gtk struct */
	protected GArrowUInt16DataType* gArrowUInt16DataType;

	/** Get the main Gtk struct */
	public GArrowUInt16DataType* getUInt16DataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowUInt16DataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowUInt16DataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowUInt16DataType* gArrowUInt16DataType, bool ownedRef = false)
	{
		this.gArrowUInt16DataType = gArrowUInt16DataType;
		super(cast(GArrowIntegerDataType*)gArrowUInt16DataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_uint16_data_type_get_type();
	}

	/**
	 * Returns: The newly created 16-bit unsigned integer data type.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_uint16_data_type_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowUInt16DataType*) p, true);
	}
}
