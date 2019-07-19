module arrow.NullDataType;

private import arrow.DataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class NullDataType : DataType
{
	/** the main Gtk struct */
	protected GArrowNullDataType* gArrowNullDataType;

	/** Get the main Gtk struct */
	public GArrowNullDataType* getNullDataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowNullDataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowNullDataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowNullDataType* gArrowNullDataType, bool ownedRef = false)
	{
		this.gArrowNullDataType = gArrowNullDataType;
		super(cast(GArrowDataType*)gArrowNullDataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_null_data_type_get_type();
	}

	/**
	 * Returns: The newly created null data type.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_null_data_type_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowNullDataType*) p, true);
	}
}
