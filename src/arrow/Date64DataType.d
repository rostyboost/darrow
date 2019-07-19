module arrow.Date64DataType;

private import arrow.DataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class Date64DataType : DataType
{
	/** the main Gtk struct */
	protected GArrowDate64DataType* gArrowDate64DataType;

	/** Get the main Gtk struct */
	public GArrowDate64DataType* getDate64DataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowDate64DataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowDate64DataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowDate64DataType* gArrowDate64DataType, bool ownedRef = false)
	{
		this.gArrowDate64DataType = gArrowDate64DataType;
		super(cast(GArrowDataType*)gArrowDate64DataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_date64_data_type_get_type();
	}

	/**
	 * Returns: A newly created the number of milliseconds
	 *     since UNIX epoch in 64-bit signed integer data type.
	 *
	 * Since: 0.7.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_date64_data_type_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowDate64DataType*) p, true);
	}
}
