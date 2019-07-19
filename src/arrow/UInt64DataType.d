module arrow.UInt64DataType;

private import arrow.IntegerDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class UInt64DataType : IntegerDataType
{
	/** the main Gtk struct */
	protected GArrowUInt64DataType* gArrowUInt64DataType;

	/** Get the main Gtk struct */
	public GArrowUInt64DataType* getUInt64DataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowUInt64DataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowUInt64DataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowUInt64DataType* gArrowUInt64DataType, bool ownedRef = false)
	{
		this.gArrowUInt64DataType = gArrowUInt64DataType;
		super(cast(GArrowIntegerDataType*)gArrowUInt64DataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_uint64_data_type_get_type();
	}

	/**
	 * Returns: The newly created 64-bit unsigned integer data type.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_uint64_data_type_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowUInt64DataType*) p, true);
	}
}
