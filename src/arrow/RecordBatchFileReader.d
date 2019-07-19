module arrow.RecordBatchFileReader;

private import arrow.RecordBatch;
private import arrow.Schema;
private import arrow.SeekableInputStream;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/**
 * It wraps `arrow::ipc::RecordBatchFileReader`.
 */
public class RecordBatchFileReader : ObjectG
{
	/** the main Gtk struct */
	protected GArrowRecordBatchFileReader* gArrowRecordBatchFileReader;

	/** Get the main Gtk struct */
	public GArrowRecordBatchFileReader* getRecordBatchFileReaderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowRecordBatchFileReader;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowRecordBatchFileReader;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowRecordBatchFileReader* gArrowRecordBatchFileReader, bool ownedRef = false)
	{
		this.gArrowRecordBatchFileReader = gArrowRecordBatchFileReader;
		super(cast(GObject*)gArrowRecordBatchFileReader, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_record_batch_file_reader_get_type();
	}

	/**
	 *
	 * Params:
	 *     file = The file to be read.
	 * Returns: A newly created #GArrowRecordBatchFileReader
	 *     or %NULL on error.
	 *
	 * Since: 0.4.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(SeekableInputStream file)
	{
		GError* err = null;

		auto p = garrow_record_batch_file_reader_new((file is null) ? null : file.getSeekableInputStreamStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowRecordBatchFileReader*) p, true);
	}

	/**
	 * Returns: The number of record batches in the file.
	 *
	 * Since: 0.4.0
	 */
	public uint getNRecordBatches()
	{
		return garrow_record_batch_file_reader_get_n_record_batches(gArrowRecordBatchFileReader);
	}

	/**
	 *
	 *
	 * Deprecated: Use garrow_record_batch_file_reader_read_record_batch() instead.
	 *
	 * Params:
	 *     i = The index of the target record batch.
	 *
	 * Returns: The i-th record batch in the file or %NULL on error.
	 *
	 * Since: 0.4.0
	 *
	 * Throws: GException on failure.
	 */
	public RecordBatch getRecordBatch(uint i)
	{
		GError* err = null;

		auto p = garrow_record_batch_file_reader_get_record_batch(gArrowRecordBatchFileReader, i, &err);

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
	 * Returns: The schema in the file.
	 *
	 * Since: 0.4.0
	 */
	public Schema getSchema()
	{
		auto p = garrow_record_batch_file_reader_get_schema(gArrowRecordBatchFileReader);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Schema)(cast(GArrowSchema*) p, true);
	}

	/**
	 * Returns: The format version in the file.
	 *
	 * Since: 0.4.0
	 */
	public GArrowMetadataVersion getVersion()
	{
		return garrow_record_batch_file_reader_get_version(gArrowRecordBatchFileReader);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target record batch.
	 * Returns: The i-th record batch in the file or %NULL on error.
	 *
	 * Since: 0.5.0
	 *
	 * Throws: GException on failure.
	 */
	public RecordBatch readRecordBatch(uint i)
	{
		GError* err = null;

		auto p = garrow_record_batch_file_reader_read_record_batch(gArrowRecordBatchFileReader, i, &err);

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
