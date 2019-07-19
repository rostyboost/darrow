module arrow.Date32DataType;

private import arrow.DataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class Date32DataType : DataType
{
	/** the main Gtk struct */
	protected GArrowDate32DataType* gArrowDate32DataType;

	/** Get the main Gtk struct */
	public GArrowDate32DataType* getDate32DataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowDate32DataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowDate32DataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowDate32DataType* gArrowDate32DataType, bool ownedRef = false)
	{
		this.gArrowDate32DataType = gArrowDate32DataType;
		super(cast(GArrowDataType*)gArrowDate32DataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_date32_data_type_get_type();
	}

	/**
	 * Returns: A newly created the number of milliseconds
	 *     since UNIX epoch in 32-bit signed integer data type.
	 *
	 * Since: 0.7.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_date32_data_type_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowDate32DataType*) p, true);
	}
}
