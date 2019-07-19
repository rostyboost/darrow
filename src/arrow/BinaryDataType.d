module arrow.BinaryDataType;

private import arrow.DataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class BinaryDataType : DataType
{
	/** the main Gtk struct */
	protected GArrowBinaryDataType* gArrowBinaryDataType;

	/** Get the main Gtk struct */
	public GArrowBinaryDataType* getBinaryDataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowBinaryDataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowBinaryDataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowBinaryDataType* gArrowBinaryDataType, bool ownedRef = false)
	{
		this.gArrowBinaryDataType = gArrowBinaryDataType;
		super(cast(GArrowDataType*)gArrowBinaryDataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_binary_data_type_get_type();
	}

	/**
	 * Returns: The newly created binary data type.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_binary_data_type_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowBinaryDataType*) p, true);
	}
}
