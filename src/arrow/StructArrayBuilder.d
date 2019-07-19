module arrow.StructArrayBuilder;

private import arrow.ArrayBuilder;
private import arrow.StructDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.ListG;
private import gobject.ObjectG;


/** */
public class StructArrayBuilder : ArrayBuilder
{
	/** the main Gtk struct */
	protected GArrowStructArrayBuilder* gArrowStructArrayBuilder;

	/** Get the main Gtk struct */
	public GArrowStructArrayBuilder* getStructArrayBuilderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowStructArrayBuilder;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowStructArrayBuilder;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowStructArrayBuilder* gArrowStructArrayBuilder, bool ownedRef = false)
	{
		this.gArrowStructArrayBuilder = gArrowStructArrayBuilder;
		super(cast(GArrowArrayBuilder*)gArrowStructArrayBuilder, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_struct_array_builder_get_type();
	}

	/**
	 *
	 * Params:
	 *     dataType = #GArrowStructDataType for the struct.
	 * Returns: A newly created #GArrowStructArrayBuilder.
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(StructDataType dataType)
	{
		GError* err = null;

		auto p = garrow_struct_array_builder_new((dataType is null) ? null : dataType.getStructDataTypeStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowStructArrayBuilder*) p, true);
	}

	/**
	 *
	 *
	 * Deprecated: Use garrow_struct_array_builder_append_value() instead.
	 *
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 *     It appends a new struct element. To append a new struct element,
	 *     you need to call this function then append struct element field
	 *     values to all `field_builder`s. `field_value`s are the
	 *     #GArrowArrayBuilder specified to constructor. You can get
	 *     `field_builder` by garrow_struct_array_builder_get_field_builder()
	 *     or garrow_struct_array_builder_get_field_builders().
	 *
	 *     |[<!-- language="C" -->
	 *     // TODO
	 *     ]|
	 *
	 * Throws: GException on failure.
	 */
	public bool append()
	{
		GError* err = null;

		auto p = garrow_struct_array_builder_append(gArrowStructArrayBuilder, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 *     It appends a new NULL element.
	 *
	 * Throws: GException on failure.
	 */
	public bool appendNull()
	{
		GError* err = null;

		auto p = garrow_struct_array_builder_append_null(gArrowStructArrayBuilder, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 *     It appends a new struct element. To append a new struct element,
	 *     you need to call this function then append struct element field
	 *     values to all `field_builder`s. `field_value`s are the
	 *     #GArrowArrayBuilder specified to constructor. You can get
	 *     `field_builder` by garrow_struct_array_builder_get_field_builder()
	 *     or garrow_struct_array_builder_get_field_builders().
	 *
	 *     |[<!-- language="C" -->
	 *     // TODO
	 *     ]|
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public bool appendValue()
	{
		GError* err = null;

		auto p = garrow_struct_array_builder_append_value(gArrowStructArrayBuilder, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 *
	 * Params:
	 *     i = The index of the field in the struct.
	 * Returns: The #GArrowArrayBuilder for the i-th field.
	 */
	public ArrayBuilder getFieldBuilder(int i)
	{
		auto p = garrow_struct_array_builder_get_field_builder(gArrowStructArrayBuilder, i);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ArrayBuilder)(cast(GArrowArrayBuilder*) p);
	}

	/**
	 * Returns: The #GArrowArrayBuilder for all fields.
	 */
	public ListG getFieldBuilders()
	{
		auto p = garrow_struct_array_builder_get_field_builders(gArrowStructArrayBuilder);

		if(p is null)
		{
			return null;
		}

		return new ListG(cast(GList*) p);
	}
}
