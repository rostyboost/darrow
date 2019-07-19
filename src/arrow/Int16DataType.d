module arrow.Int16DataType;

private import arrow.IntegerDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class Int16DataType : IntegerDataType
{
	/** the main Gtk struct */
	protected GArrowInt16DataType* gArrowInt16DataType;

	/** Get the main Gtk struct */
	public GArrowInt16DataType* getInt16DataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowInt16DataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowInt16DataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowInt16DataType* gArrowInt16DataType, bool ownedRef = false)
	{
		this.gArrowInt16DataType = gArrowInt16DataType;
		super(cast(GArrowIntegerDataType*)gArrowInt16DataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_int16_data_type_get_type();
	}

	/**
	 * Returns: The newly created 16-bit integer data type.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_int16_data_type_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowInt16DataType*) p, true);
	}
}
