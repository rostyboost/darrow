module arrow.Int32DataType;

private import arrow.IntegerDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class Int32DataType : IntegerDataType
{
	/** the main Gtk struct */
	protected GArrowInt32DataType* gArrowInt32DataType;

	/** Get the main Gtk struct */
	public GArrowInt32DataType* getInt32DataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowInt32DataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowInt32DataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowInt32DataType* gArrowInt32DataType, bool ownedRef = false)
	{
		this.gArrowInt32DataType = gArrowInt32DataType;
		super(cast(GArrowIntegerDataType*)gArrowInt32DataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_int32_data_type_get_type();
	}

	/**
	 * Returns: The newly created 32-bit integer data type.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_int32_data_type_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowInt32DataType*) p, true);
	}
}
