module arrow.RecordBatchWriter;

private import arrow.RecordBatch;
private import arrow.Table;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/**
 * It wraps `arrow::ipc::RecordBatchWriter`.
 */
public class RecordBatchWriter : ObjectG
{
	/** the main Gtk struct */
	protected GArrowRecordBatchWriter* gArrowRecordBatchWriter;

	/** Get the main Gtk struct */
	public GArrowRecordBatchWriter* getRecordBatchWriterStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowRecordBatchWriter;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowRecordBatchWriter;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowRecordBatchWriter* gArrowRecordBatchWriter, bool ownedRef = false)
	{
		this.gArrowRecordBatchWriter = gArrowRecordBatchWriter;
		super(cast(GObject*)gArrowRecordBatchWriter, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_record_batch_writer_get_type();
	}

	/**
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.4.0
	 *
	 * Throws: GException on failure.
	 */
	public bool close()
	{
		GError* err = null;

		auto p = garrow_record_batch_writer_close(gArrowRecordBatchWriter, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 *
	 * Params:
	 *     recordBatch = The record batch to be written.
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.4.0
	 *
	 * Throws: GException on failure.
	 */
	public bool writeRecordBatch(RecordBatch recordBatch)
	{
		GError* err = null;

		auto p = garrow_record_batch_writer_write_record_batch(gArrowRecordBatchWriter, (recordBatch is null) ? null : recordBatch.getRecordBatchStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 *
	 * Params:
	 *     table = The table to be written.
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.8.0
	 *
	 * Throws: GException on failure.
	 */
	public bool writeTable(Table table)
	{
		GError* err = null;

		auto p = garrow_record_batch_writer_write_table(gArrowRecordBatchWriter, (table is null) ? null : table.getTableStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}
}
