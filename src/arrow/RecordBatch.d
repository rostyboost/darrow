module arrow.RecordBatch;

private import arrow.Array;
private import arrow.Field;
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
public class RecordBatch : ObjectG
{
	/** the main Gtk struct */
	protected GArrowRecordBatch* gArrowRecordBatch;

	/** Get the main Gtk struct */
	public GArrowRecordBatch* getRecordBatchStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowRecordBatch;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowRecordBatch;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowRecordBatch* gArrowRecordBatch, bool ownedRef = false)
	{
		this.gArrowRecordBatch = gArrowRecordBatch;
		super(cast(GObject*)gArrowRecordBatch, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_record_batch_get_type();
	}

	/**
	 *
	 * Params:
	 *     schema = The schema of the record batch.
	 *     nRows = The number of the rows in the record batch.
	 *     columns = The columns in the record batch.
	 * Returns: A newly created #GArrowRecordBatch or %NULL on error.
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Schema schema, uint nRows, ListG columns)
	{
		GError* err = null;

		auto p = garrow_record_batch_new((schema is null) ? null : schema.getSchemaStruct(), nRows, (columns is null) ? null : columns.getListGStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowRecordBatch*) p, true);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the new column.
	 *     field = The field to be added.
	 *     column = The column to be added.
	 * Returns: The newly allocated
	 *     #GArrowRecordBatch that has a new column or %NULL on error.
	 *
	 * Since: 0.9.0
	 *
	 * Throws: GException on failure.
	 */
	public RecordBatch addColumn(uint i, Field field, Array column)
	{
		GError* err = null;

		auto p = garrow_record_batch_add_column(gArrowRecordBatch, i, (field is null) ? null : field.getFieldStruct(), (column is null) ? null : column.getArrayStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(RecordBatch)(cast(GArrowRecordBatch*) p, true);
	}

	/**
	 *
	 * Params:
	 *     otherRecordBatch = A #GArrowRecordBatch to be compared.
	 * Returns: %TRUE if both of them have the same data, %FALSE
	 *     otherwise.
	 *
	 * Since: 0.4.0
	 */
	public bool equal(RecordBatch otherRecordBatch)
	{
		return garrow_record_batch_equal(gArrowRecordBatch, (otherRecordBatch is null) ? null : otherRecordBatch.getRecordBatchStruct()) != 0;
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target column. If it's negative, index is
	 *         counted backward from the end of the columns. `-1` means the last
	 *         column.
	 * Returns: The i-th column in the record batch
	 *     on success, %NULL on out of index.
	 *
	 * Since: 1.0.0
	 */
	public Array getColumnData(int i)
	{
		auto p = garrow_record_batch_get_column_data(gArrowRecordBatch, i);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Array)(cast(GArrowArray*) p, true);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target column. If it's negative, index is
	 *         counted backward from the end of the columns. `-1` means the last
	 *         column.
	 * Returns: The name of the i-th column in the record batch
	 *     on success, %NULL on out of index
	 */
	public string getColumnName(int i)
	{
		return Str.toString(garrow_record_batch_get_column_name(gArrowRecordBatch, i));
	}

	/**
	 * Returns: The number of columns in the record batch.
	 */
	public uint getNColumns()
	{
		return garrow_record_batch_get_n_columns(gArrowRecordBatch);
	}

	/**
	 * Returns: The number of rows in the record batch.
	 */
	public long getNRows()
	{
		return garrow_record_batch_get_n_rows(gArrowRecordBatch);
	}

	/**
	 * Returns: The schema of the record batch.
	 */
	public Schema getSchema()
	{
		auto p = garrow_record_batch_get_schema(gArrowRecordBatch);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Schema)(cast(GArrowSchema*) p, true);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the new column.
	 * Returns: The newly allocated
	 *     #GArrowRecordBatch that doesn't have the column or %NULL on error.
	 *
	 * Since: 0.9.0
	 *
	 * Throws: GException on failure.
	 */
	public RecordBatch removeColumn(uint i)
	{
		GError* err = null;

		auto p = garrow_record_batch_remove_column(gArrowRecordBatch, i, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(RecordBatch)(cast(GArrowRecordBatch*) p, true);
	}

	/**
	 *
	 * Params:
	 *     offset = The offset of sub #GArrowRecordBatch.
	 *     length = The length of sub #GArrowRecordBatch.
	 * Returns: The sub #GArrowRecordBatch. It covers
	 *     only from `offset` to `offset + length` range. The sub
	 *     #GArrowRecordBatch shares values with the base
	 *     #GArrowRecordBatch.
	 */
	public RecordBatch slice(long offset, long length)
	{
		auto p = garrow_record_batch_slice(gArrowRecordBatch, offset, length);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(RecordBatch)(cast(GArrowRecordBatch*) p, true);
	}

	/**
	 * Returns: The formatted record batch content or %NULL on error.
	 *
	 *     The returned string should be freed when with g_free() when no
	 *     longer needed.
	 *
	 * Since: 0.4.0
	 *
	 * Throws: GException on failure.
	 */
	public override string toString()
	{
		GError* err = null;

		auto retStr = garrow_record_batch_to_string(gArrowRecordBatch, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}
}
