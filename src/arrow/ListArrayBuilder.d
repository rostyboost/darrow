module arrow.ListArrayBuilder;

private import arrow.ArrayBuilder;
private import arrow.ListDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class ListArrayBuilder : ArrayBuilder
{
	/** the main Gtk struct */
	protected GArrowListArrayBuilder* gArrowListArrayBuilder;

	/** Get the main Gtk struct */
	public GArrowListArrayBuilder* getListArrayBuilderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowListArrayBuilder;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowListArrayBuilder;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowListArrayBuilder* gArrowListArrayBuilder, bool ownedRef = false)
	{
		this.gArrowListArrayBuilder = gArrowListArrayBuilder;
		super(cast(GArrowArrayBuilder*)gArrowListArrayBuilder, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_list_array_builder_get_type();
	}

	/**
	 *
	 * Params:
	 *     dataType = A #GArrowListDataType for value.
	 * Returns: A newly created #GArrowListArrayBuilder.
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ListDataType dataType)
	{
		GError* err = null;

		auto p = garrow_list_array_builder_new((dataType is null) ? null : dataType.getListDataTypeStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowListArrayBuilder*) p, true);
	}

	/**
	 *
	 *
	 * Deprecated: Use garrow_list_array_builder_append_value() instead.
	 *
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 *     It appends a new list element. To append a new list element, you
	 *     need to call this function then append list element values to
	 *     `value_builder`. `value_builder` is the #GArrowArrayBuilder
	 *     specified to constructor. You can get `value_builder` by
	 *     garrow_list_array_builder_get_value_builder().
	 *
	 *     |[<!-- language="C" -->
	 *     GArrowInt8ArrayBuilder *value_builder;
	 *     GArrowListArrayBuilder *builder;
	 *
	 *     value_builder = garrow_int8_array_builder_new();
	 *     builder = garrow_list_array_builder_new(value_builder, NULL);
	 *
	 *     // Start 0th list element: [1, 0, -1]
	 *     garrow_list_array_builder_append(builder, NULL);
	 *     garrow_int8_array_builder_append(value_builder, 1);
	 *     garrow_int8_array_builder_append(value_builder, 0);
	 *     garrow_int8_array_builder_append(value_builder, -1);
	 *
	 *     // Start 1st list element: [-29, 29]
	 *     garrow_list_array_builder_append(builder, NULL);
	 *     garrow_int8_array_builder_append(value_builder, -29);
	 *     garrow_int8_array_builder_append(value_builder, 29);
	 *
	 *     {
	 *     // [[1, 0, -1], [-29, 29]]
	 *     GArrowArray *array = garrow_array_builder_finish(builder);
	 *     // Now, builder is needless.
	 *     g_object_unref(builder);
	 *     g_object_unref(value_builder);
	 *
	 *     // Use array...
	 *     g_object_unref(array);
	 *     }
	 *     ]|
	 *
	 * Throws: GException on failure.
	 */
	public bool append()
	{
		GError* err = null;

		auto p = garrow_list_array_builder_append(gArrowListArrayBuilder, &err) != 0;

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

		auto p = garrow_list_array_builder_append_null(gArrowListArrayBuilder, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 *     It appends a new list element. To append a new list element, you
	 *     need to call this function then append list element values to
	 *     `value_builder`. `value_builder` is the #GArrowArrayBuilder
	 *     specified to constructor. You can get `value_builder` by
	 *     garrow_list_array_builder_get_value_builder().
	 *
	 *     |[<!-- language="C" -->
	 *     GArrowInt8ArrayBuilder *value_builder;
	 *     GArrowListArrayBuilder *builder;
	 *
	 *     value_builder = garrow_int8_array_builder_new();
	 *     builder = garrow_list_array_builder_new(value_builder, NULL);
	 *
	 *     // Start 0th list element: [1, 0, -1]
	 *     garrow_list_array_builder_append(builder, NULL);
	 *     garrow_int8_array_builder_append(value_builder, 1);
	 *     garrow_int8_array_builder_append(value_builder, 0);
	 *     garrow_int8_array_builder_append(value_builder, -1);
	 *
	 *     // Start 1st list element: [-29, 29]
	 *     garrow_list_array_builder_append(builder, NULL);
	 *     garrow_int8_array_builder_append(value_builder, -29);
	 *     garrow_int8_array_builder_append(value_builder, 29);
	 *
	 *     {
	 *     // [[1, 0, -1], [-29, 29]]
	 *     GArrowArray *array = garrow_array_builder_finish(builder);
	 *     // Now, builder is needless.
	 *     g_object_unref(builder);
	 *     g_object_unref(value_builder);
	 *
	 *     // Use array...
	 *     g_object_unref(array);
	 *     }
	 *     ]|
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public bool appendValue()
	{
		GError* err = null;

		auto p = garrow_list_array_builder_append_value(gArrowListArrayBuilder, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 * Returns: The #GArrowArrayBuilder for values.
	 */
	public ArrayBuilder getValueBuilder()
	{
		auto p = garrow_list_array_builder_get_value_builder(gArrowListArrayBuilder);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ArrayBuilder)(cast(GArrowArrayBuilder*) p);
	}
}
