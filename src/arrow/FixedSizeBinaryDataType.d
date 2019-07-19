module arrow.FixedSizeBinaryDataType;

private import arrow.FixedWidthDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class FixedSizeBinaryDataType : FixedWidthDataType
{
	/** the main Gtk struct */
	protected GArrowFixedSizeBinaryDataType* gArrowFixedSizeBinaryDataType;

	/** Get the main Gtk struct */
	public GArrowFixedSizeBinaryDataType* getFixedSizeBinaryDataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowFixedSizeBinaryDataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowFixedSizeBinaryDataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowFixedSizeBinaryDataType* gArrowFixedSizeBinaryDataType, bool ownedRef = false)
	{
		this.gArrowFixedSizeBinaryDataType = gArrowFixedSizeBinaryDataType;
		super(cast(GArrowFixedWidthDataType*)gArrowFixedSizeBinaryDataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_fixed_size_binary_data_type_get_type();
	}

	/** */
	public this(int byteWidth)
	{
		auto p = garrow_fixed_size_binary_data_type_new(byteWidth);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowFixedSizeBinaryDataType*) p, true);
	}

	/**
	 * Returns: The number of bytes for one data.
	 *
	 * Since: 0.12.0
	 */
	public int getByteWidth()
	{
		return garrow_fixed_size_binary_data_type_get_byte_width(gArrowFixedSizeBinaryDataType);
	}
}
