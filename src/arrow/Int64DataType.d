module arrow.Int64DataType;

private import arrow.IntegerDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class Int64DataType : IntegerDataType
{
	/** the main Gtk struct */
	protected GArrowInt64DataType* gArrowInt64DataType;

	/** Get the main Gtk struct */
	public GArrowInt64DataType* getInt64DataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowInt64DataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowInt64DataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowInt64DataType* gArrowInt64DataType, bool ownedRef = false)
	{
		this.gArrowInt64DataType = gArrowInt64DataType;
		super(cast(GArrowIntegerDataType*)gArrowInt64DataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_int64_data_type_get_type();
	}

	/**
	 * Returns: The newly created 64-bit integer data type.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_int64_data_type_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowInt64DataType*) p, true);
	}
}
