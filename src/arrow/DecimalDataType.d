module arrow.DecimalDataType;

private import arrow.FixedSizeBinaryDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class DecimalDataType : FixedSizeBinaryDataType
{
	/** the main Gtk struct */
	protected GArrowDecimalDataType* gArrowDecimalDataType;

	/** Get the main Gtk struct */
	public GArrowDecimalDataType* getDecimalDataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowDecimalDataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowDecimalDataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowDecimalDataType* gArrowDecimalDataType, bool ownedRef = false)
	{
		this.gArrowDecimalDataType = gArrowDecimalDataType;
		super(cast(GArrowFixedSizeBinaryDataType*)gArrowDecimalDataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_decimal_data_type_get_type();
	}

	/**
	 *
	 *
	 * Deprecated: Use garrow_decimal128_data_type_new() instead.
	 *
	 * Params:
	 *     precision = The precision of decimal data.
	 *     scale = The scale of decimal data.
	 *
	 * Returns: The newly created decimal data type.
	 *
	 * Since: 0.10.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(int precision, int scale)
	{
		auto p = garrow_decimal_data_type_new(precision, scale);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowDecimalDataType*) p, true);
	}

	/**
	 * Returns: The precision of the decimal data type.
	 *
	 * Since: 0.10.0
	 */
	public int getPrecision()
	{
		return garrow_decimal_data_type_get_precision(gArrowDecimalDataType);
	}

	/**
	 * Returns: The scale of the decimal data type.
	 *
	 * Since: 0.10.0
	 */
	public int getScale()
	{
		return garrow_decimal_data_type_get_scale(gArrowDecimalDataType);
	}
}
