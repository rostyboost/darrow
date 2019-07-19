module arrow.Schema;

private import arrow.Field;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.ListG;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Schema : ObjectG
{
	/** the main Gtk struct */
	protected GArrowSchema* gArrowSchema;

	/** Get the main Gtk struct */
	public GArrowSchema* getSchemaStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowSchema;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowSchema;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowSchema* gArrowSchema, bool ownedRef = false)
	{
		this.gArrowSchema = gArrowSchema;
		super(cast(GObject*)gArrowSchema, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_schema_get_type();
	}

	/**
	 *
	 * Params:
	 *     fields = The fields of the schema.
	 * Returns: A newly created #GArrowSchema.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ListG fields)
	{
		auto p = garrow_schema_new((fields is null) ? null : fields.getListGStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowSchema*) p, true);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the new field.
	 *     field = The field to be added.
	 * Returns: The newly allocated
	 *     #GArrowSchema that has a new field or %NULL on error.
	 *
	 * Since: 0.10.0
	 *
	 * Throws: GException on failure.
	 */
	public Schema addField(uint i, Field field)
	{
		GError* err = null;

		auto p = garrow_schema_add_field(gArrowSchema, i, (field is null) ? null : field.getFieldStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Schema)(cast(GArrowSchema*) p, true);
	}

	/**
	 *
	 * Params:
	 *     otherSchema = A #GArrowSchema to be compared.
	 * Returns: %TRUE if both of them have the same data, %FALSE
	 *     otherwise.
	 *
	 * Since: 0.4.0
	 */
	public bool equal(Schema otherSchema)
	{
		return garrow_schema_equal(gArrowSchema, (otherSchema is null) ? null : otherSchema.getSchemaStruct()) != 0;
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target field.
	 * Returns: The i-th field of the schema.
	 */
	public Field getField(uint i)
	{
		auto p = garrow_schema_get_field(gArrowSchema, i);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Field)(cast(GArrowField*) p, true);
	}

	/**
	 *
	 * Params:
	 *     name = The name of the field to be found.
	 * Returns: The found field or %NULL.
	 */
	public Field getFieldByName(string name)
	{
		auto p = garrow_schema_get_field_by_name(gArrowSchema, Str.toStringz(name));

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Field)(cast(GArrowField*) p, true);
	}

	/**
	 * Returns: The fields of the schema.
	 */
	public ListG getFields()
	{
		auto p = garrow_schema_get_fields(gArrowSchema);

		if(p is null)
		{
			return null;
		}

		return new ListG(cast(GList*) p, true);
	}

	/**
	 * Returns: The number of fields of the schema.
	 */
	public uint nFields()
	{
		return garrow_schema_n_fields(gArrowSchema);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the field to be removed.
	 * Returns: The newly allocated
	 *     #GArrowSchema that doesn't have the field or %NULL on error.
	 *
	 * Since: 0.10.0
	 *
	 * Throws: GException on failure.
	 */
	public Schema removeField(uint i)
	{
		GError* err = null;

		auto p = garrow_schema_remove_field(gArrowSchema, i, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Schema)(cast(GArrowSchema*) p, true);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the field to be replaced.
	 *     field = The newly added #GArrowField.
	 * Returns: The newly allocated
	 *     #GArrowSchema that has @field as the @i-th field or %NULL on error.
	 *
	 * Since: 0.10.0
	 *
	 * Throws: GException on failure.
	 */
	public Schema replaceField(uint i, Field field)
	{
		GError* err = null;

		auto p = garrow_schema_replace_field(gArrowSchema, i, (field is null) ? null : field.getFieldStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Schema)(cast(GArrowSchema*) p, true);
	}

	/**
	 * Returns: The string representation of the schema.
	 */
	public override string toString()
	{
		auto retStr = garrow_schema_to_string(gArrowSchema);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}
}
