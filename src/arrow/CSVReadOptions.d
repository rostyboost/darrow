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

	/** */
	public void addColumnName(string columnName)
	{
		garrow_csv_read_options_add_column_name(gArrowCSVReadOptions, Str.toStringz(columnName));
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

	/** */
	public void addFalseValue(string falseValue)
	{
		garrow_csv_read_options_add_false_value(gArrowCSVReadOptions, Str.toStringz(falseValue));
	}

	/** */
	public void addNullValue(string nullValue)
	{
		garrow_csv_read_options_add_null_value(gArrowCSVReadOptions, Str.toStringz(nullValue));
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

	/** */
	public void addTrueValue(string trueValue)
	{
		garrow_csv_read_options_add_true_value(gArrowCSVReadOptions, Str.toStringz(trueValue));
	}

	/**
	 * Returns: The column names. It's a %NULL-terminated string array.
	 *     If the number of values is zero, this returns %NULL.
	 *     It must be freed with g_strfreev() when no longer needed.
	 *
	 * Since: 1.0.0
	 */
	public string[] getColumnNames()
	{
		auto retStr = garrow_csv_read_options_get_column_names(gArrowCSVReadOptions);

		scope(exit) Str.freeStringArray(retStr);
		return Str.toStringArray(retStr);
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

	/**
	 * Returns: The values to be processed as false. It's a %NULL-terminated string array.
	 *     If the number of values is zero, this returns %NULL.
	 *     It must be freed with g_strfreev() when no longer needed.
	 *
	 * Since: 0.14.0
	 */
	public string[] getFalseValues()
	{
		auto retStr = garrow_csv_read_options_get_false_values(gArrowCSVReadOptions);

		scope(exit) Str.freeStringArray(retStr);
		return Str.toStringArray(retStr);
	}

	/**
	 * Returns: The values to be processed as null. It's a %NULL-terminated string array.
	 *     If the number of values is zero, this returns %NULL.
	 *     It must be freed with g_strfreev() when no longer needed.
	 *
	 * Since: 0.14.0
	 */
	public string[] getNullValues()
	{
		auto retStr = garrow_csv_read_options_get_null_values(gArrowCSVReadOptions);

		scope(exit) Str.freeStringArray(retStr);
		return Str.toStringArray(retStr);
	}

	/**
	 * Returns: The values to be processed as true. It's a %NULL-terminated string array.
	 *     If the number of values is zero, this returns %NULL.
	 *     It must be freed with g_strfreev() when no longer needed.
	 *
	 * Since: 0.14.0
	 */
	public string[] getTrueValues()
	{
		auto retStr = garrow_csv_read_options_get_true_values(gArrowCSVReadOptions);

		scope(exit) Str.freeStringArray(retStr);
		return Str.toStringArray(retStr);
	}

	/** */
	public void setColumnNames(string[] columnNames)
	{
		garrow_csv_read_options_set_column_names(gArrowCSVReadOptions, Str.toStringzArray(columnNames), cast(size_t)columnNames.length);
	}

	/** */
	public void setFalseValues(string[] falseValues)
	{
		garrow_csv_read_options_set_false_values(gArrowCSVReadOptions, Str.toStringzArray(falseValues), cast(size_t)falseValues.length);
	}

	/** */
	public void setNullValues(string[] nullValues)
	{
		garrow_csv_read_options_set_null_values(gArrowCSVReadOptions, Str.toStringzArray(nullValues), cast(size_t)nullValues.length);
	}

	/** */
	public void setTrueValues(string[] trueValues)
	{
		garrow_csv_read_options_set_true_values(gArrowCSVReadOptions, Str.toStringzArray(trueValues), cast(size_t)trueValues.length);
	}
}
