module arrow.CSVReadOptions;

private import arrow.DataType;
private import arrow.Schema;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.HashTable;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class CSVReadOptions : ObjectG
{
	/** the main Gtk struct */
	protected GArrowCSVReadOptions* gArrowCSVReadOptions;

	/** Get the main Gtk struct */
	public GArrowCSVReadOptions* getCSVReadOptionsStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowCSVReadOptions;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowCSVReadOptions;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowCSVReadOptions* gArrowCSVReadOptions, bool ownedRef = false)
	{
		this.gArrowCSVReadOptions = gArrowCSVReadOptions;
		super(cast(GObject*)gArrowCSVReadOptions, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_csv_read_options_get_type();
	}

	/**
	 * Returns: A newly created #GArrowCSVReadOptions.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = garrow_csv_read_options_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowCSVReadOptions*) p, true);
	}

	/**
	 * Add value type of a column.
	 *
	 * Params:
	 *     name = The name of the target column.
	 *     dataType = The #GArrowDataType for the column.
	 *
	 * Since: 0.12.0
	 */
	public void addColumnType(string name, DataType dataType)
	{
		garrow_csv_read_options_add_column_type(gArrowCSVReadOptions, Str.toStringz(name), (dataType is null) ? null : dataType.getDataTypeStruct());
	}

	/**
	 * Add value types for columns in the schema.
	 *
	 * Params:
	 *     schema = The #GArrowSchema that specifies columns and their types.
	 *
	 * Since: 0.12.0
	 */
	public void addSchema(Schema schema)
	{
		garrow_csv_read_options_add_schema(gArrowCSVReadOptions, (schema is null) ? null : schema.getSchemaStruct());
	}

	/**
	 * Returns: The column name and value type mapping of the options.
	 *
	 * Since: 0.12.0
	 */
	public HashTable getColumnTypes()
	{
		auto p = garrow_csv_read_options_get_column_types(gArrowCSVReadOptions);

		if(p is null)
		{
			return null;
		}

		return new HashTable(cast(GHashTable*) p, true);
	}
}
