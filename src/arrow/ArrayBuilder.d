module arrow.ArrayBuilder;

private import arrow.Array;
private import arrow.DataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class ArrayBuilder : ObjectG
{
	/** the main Gtk struct */
	protected GArrowArrayBuilder* gArrowArrayBuilder;

	/** Get the main Gtk struct */
	public GArrowArrayBuilder* getArrayBuilderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowArrayBuilder;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowArrayBuilder;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowArrayBuilder* gArrowArrayBuilder, bool ownedRef = false)
	{
		this.gArrowArrayBuilder = gArrowArrayBuilder;
		super(cast(GObject*)gArrowArrayBuilder, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_array_builder_get_type();
	}

	/**
	 * Returns: The built #GArrowArray on success,
	 *     %NULL on error.
	 *
	 * Throws: GException on failure.
	 */
	public Array finish()
	{
		GError* err = null;

		auto p = garrow_array_builder_finish(gArrowArrayBuilder, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Array)(cast(GArrowArray*) p, true);
	}

	/**
	 * Returns: The #GArrowDataType of the value of
	 *     the array builder.
	 *
	 * Since: 0.9.0
	 */
	public DataType getValueDataType()
	{
		auto p = garrow_array_builder_get_value_data_type(gArrowArrayBuilder);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(DataType)(cast(GArrowDataType*) p, true);
	}

	/**
	 * Returns: The #GArrowType of the value of the array builder.
	 *
	 * Since: 0.9.0
	 */
	public GArrowType getValueType()
	{
		return garrow_array_builder_get_value_type(gArrowArrayBuilder);
	}

	/**
	 * Release ownership of `arrow::ArrayBuilder` in `builder`.
	 *
	 * Since: 0.8.0
	 */
	public void releaseOwnership()
	{
		garrow_array_builder_release_ownership(gArrowArrayBuilder);
	}
}
