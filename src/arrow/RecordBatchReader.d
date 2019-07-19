module arrow.RecordBatchReader;

private import arrow.RecordBatch;
private import arrow.Schema;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class RecordBatchReader : ObjectG
{
	/** the main Gtk struct */
	protected GArrowRecordBatchReader* gArrowRecordBatchReader;

	/** Get the main Gtk struct */
	public GArrowRecordBatchReader* getRecordBatchReaderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowRecordBatchReader;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowRecordBatchReader;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowRecordBatchReader* gArrowRecordBatchReader, bool ownedRef = false)
	{
		this.gArrowRecordBatchReader = gArrowRecordBatchReader;
		super(cast(GObject*)gArrowRecordBatchReader, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_record_batch_reader_get_type();
	}

	/**
	 *
	 *
	 * Deprecated: Use garrow_record_batch_reader_read_next() instead.
	 *
	 * Returns: The next record batch in the stream or %NULL on end of stream.
	 *
	 * Since: 0.4.0
	 *
	 * Throws: GException on failure.
	 */
	public RecordBatch getNextRecordBatch()
	{
		GError* err = null;

		auto p = garrow_record_batch_reader_get_next_record_batch(gArrowRecordBatchReader, &err);

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
	 * Returns: The schema in the stream.
	 *
	 * Since: 0.4.0
	 */
	public Schema getSchema()
	{
		auto p = garrow_record_batch_reader_get_schema(gArrowRecordBatchReader);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Schema)(cast(GArrowSchema*) p, true);
	}

	/**
	 * Returns: The next record batch in the stream or %NULL on end of stream.
	 *
	 * Since: 0.8.0
	 *
	 * Throws: GException on failure.
	 */
	public RecordBatch readNext()
	{
		GError* err = null;

		auto p = garrow_record_batch_reader_read_next(gArrowRecordBatchReader, &err);

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
	 *
	 * Deprecated: Use garrow_record_batch_reader_read_next() instead.
	 *
	 * Returns: The next record batch in the stream or %NULL on end of stream.
	 *
	 * Since: 0.5.0
	 *
	 * Throws: GException on failure.
	 */
	public RecordBatch readNextRecordBatch()
	{
		GError* err = null;

		auto p = garrow_record_batch_reader_read_next_record_batch(gArrowRecordBatchReader, &err);

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
}
