module arrow.Table;

private import arrow.Array;
private import arrow.Column;
private import arrow.RecordBatch;
private import arrow.Schema;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.ListG;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Table : ObjectG
{
	/** the main Gtk struct */
	protected GArrowTable* gArrowTable;

	/** Get the main Gtk struct */
	public GArrowTable* getTableStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowTable;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowTable;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowTable* gArrowTable, bool ownedRef = false)
	{
		this.gArrowTable = gArrowTable;
		super(cast(GObject*)gArrowTable, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_table_get_type();
	}

	/**
	 *
	 *
	 * Deprecated: Use garrow_table_new_values() instead.
	 *
	 * Params:
	 *     schema = The schema of the table.
	 *     columns = The columns of the table.
	 *
	 * Returns: A newly created #GArrowTable.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	/*public this(Schema schema, ListG columns)
	{
		auto p = garrow_table_new((schema is null) ? null : schema.getSchemaStruct(), (columns is null) ? null : columns.getListGStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowTable*) p, true);
	}*/

	/**
	 *
	 * Params:
	 *     schema = The schema of the table.
	 *     arrays = The arrays of the table.
	 * Returns: A newly created #GArrowTable or %NULL on error.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Schema schema, Array[] arrays)
	{
		GArrowArray*[] arraysArray = new GArrowArray*[arrays.length];
		for ( int i = 0; i < arrays.length; i++ )
		{
			arraysArray[i] = arrays[i].getArrayStruct();
		}

		GError* err = null;

		auto p = garrow_table_new_arrays((schema is null) ? null : schema.getSchemaStruct(), arraysArray.ptr, cast(size_t)arrays.length, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new_arrays");
		}

		this(cast(GArrowTable*) p, true);
	}

	/**
	 *
	 * Params:
	 *     schema = The schema of the table.
	 *     columns = The columns of the table.
	 * Returns: A newly created #GArrowTable or %NULL on error.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Schema schema, Column[] columns)
	{
		GArrowColumn*[] columnsArray = new GArrowColumn*[columns.length];
		for ( int i = 0; i < columns.length; i++ )
		{
			columnsArray[i] = columns[i].getColumnStruct();
		}

		GError* err = null;

		auto p = garrow_table_new_columns((schema is null) ? null : schema.getSchemaStruct(), columnsArray.ptr, cast(size_t)columns.length, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new_columns");
		}

		this(cast(GArrowTable*) p, true);
	}

	/**
	 *
	 * Params:
	 *     schema = The schema of the table.
	 *     recordBatches = The record batches
	 *         that have data for the table.
	 * Returns: A newly created #GArrowTable or %NULL on error.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Schema schema, RecordBatch[] recordBatches)
	{
		GArrowRecordBatch*[] recordBatchesArray = new GArrowRecordBatch*[recordBatches.length];
		for ( int i = 0; i < recordBatches.length; i++ )
		{
			recordBatchesArray[i] = recordBatches[i].getRecordBatchStruct();
		}

		GError* err = null;

		auto p = garrow_table_new_record_batches((schema is null) ? null : schema.getSchemaStruct(), recordBatchesArray.ptr, cast(size_t)recordBatches.length, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new_record_batches");
		}

		this(cast(GArrowTable*) p, true);
	}

	/**
	 *
	 * Params:
	 *     schema = The schema of the table.
	 *     values = The values of the table. All values must be instance of the
	 *         same class. Available classes are #GArrowColumn, #GArrowArray and
	 *         #GArrowRecordBatch.
	 * Returns: A newly created #GArrowTable or %NULL on error.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Schema schema, ListG values)
	{
		GError* err = null;

		auto p = garrow_table_new_values((schema is null) ? null : schema.getSchemaStruct(), (values is null) ? null : values.getListGStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new_values");
		}

		this(cast(GArrowTable*) p, true);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the new column.
	 *     column = The column to be added.
	 * Returns: The newly allocated
	 *     #GArrowTable that has a new column or %NULL on error.
	 *
	 * Since: 0.3.0
	 *
	 * Throws: GException on failure.
	 */
	public Table addColumn(uint i, Column column)
	{
		GError* err = null;

		auto p = garrow_table_add_column(gArrowTable, i, (column is null) ? null : column.getColumnStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Table)(cast(GArrowTable*) p, true);
	}

	/**
	 *
	 * Params:
	 *     otherTables = The tables to be concatenated.
	 * Returns: The table concatenated vertically.
	 *
	 * Since: 0.14.0
	 *
	 * Throws: GException on failure.
	 */
	public Table concatenate(ListG otherTables)
	{
		GError* err = null;

		auto p = garrow_table_concatenate(gArrowTable, (otherTables is null) ? null : otherTables.getListGStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Table)(cast(GArrowTable*) p, true);
	}

	/**
	 *
	 * Params:
	 *     otherTable = A #GArrowTable to be compared.
	 * Returns: %TRUE if both of them have the same data, %FALSE
	 *     otherwise.
	 *
	 * Since: 0.4.0
	 */
	public bool equal(Table otherTable)
	{
		return garrow_table_equal(gArrowTable, (otherTable is null) ? null : otherTable.getTableStruct()) != 0;
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target column.
	 * Returns: The i-th column in the table.
	 */
	public Column getColumn(uint i)
	{
		auto p = garrow_table_get_column(gArrowTable, i);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Column)(cast(GArrowColumn*) p, true);
	}

	/**
	 * Returns: The number of columns in the table.
	 */
	public uint getNColumns()
	{
		return garrow_table_get_n_columns(gArrowTable);
	}

	/**
	 * Returns: The number of rows in the table.
	 */
	public ulong getNRows()
	{
		return garrow_table_get_n_rows(gArrowTable);
	}

	/**
	 * Returns: The schema of the table.
	 */
	public Schema getSchema()
	{
		auto p = garrow_table_get_schema(gArrowTable);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Schema)(cast(GArrowSchema*) p, true);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the column to be removed.
	 * Returns: The newly allocated
	 *     #GArrowTable that doesn't have the column or %NULL on error.
	 *
	 * Since: 0.3.0
	 *
	 * Throws: GException on failure.
	 */
	public Table removeColumn(uint i)
	{
		GError* err = null;

		auto p = garrow_table_remove_column(gArrowTable, i, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Table)(cast(GArrowTable*) p, true);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the column to be replaced.
	 *     column = The newly added #GArrowColumn.
	 * Returns: The newly allocated
	 *     #GArrowTable that has @column as the @i-th column or %NULL on
	 *     error.
	 *
	 * Since: 0.10.0
	 *
	 * Throws: GException on failure.
	 */
	public Table replaceColumn(uint i, Column column)
	{
		GError* err = null;

		auto p = garrow_table_replace_column(gArrowTable, i, (column is null) ? null : column.getColumnStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Table)(cast(GArrowTable*) p, true);
	}

	/**
	 *
	 * Params:
	 *     offset = The offset of sub #GArrowTable. If the offset is negative,
	 *         the offset is counted from the last.
	 *     length = The length of sub #GArrowTable.
	 * Returns: The sub #GArrowTable. It covers
	 *     only from `offset` to `offset + length` range. The sub
	 *     #GArrowTable shares values with the base
	 *     #GArrowTable.
	 *
	 * Since: 0.14.0
	 */
	public Table slice(long offset, long length)
	{
		auto p = garrow_table_slice(gArrowTable, offset, length);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Table)(cast(GArrowTable*) p, true);
	}

	/**
	 * Returns: The formatted table content or %NULL on error.
	 *
	 *     The returned string should be freed when with g_free() when no
	 *     longer needed.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public override string toString()
	{
		GError* err = null;

		auto retStr = garrow_table_to_string(gArrowTable, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}
}
