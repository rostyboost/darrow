module arrow.RecordBatchStreamReader;

private import arrow.InputStream;
private import arrow.RecordBatchReader;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/**
 * It wraps `arrow::ipc::RecordBatchStreamReader`.
 */
public class RecordBatchStreamReader : RecordBatchReader
{
	/** the main Gtk struct */
	protected GArrowRecordBatchStreamReader* gArrowRecordBatchStreamReader;

	/** Get the main Gtk struct */
	public GArrowRecordBatchStreamReader* getRecordBatchStreamReaderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowRecordBatchStreamReader;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowRecordBatchStreamReader;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowRecordBatchStreamReader* gArrowRecordBatchStreamReader, bool ownedRef = false)
	{
		this.gArrowRecordBatchStreamReader = gArrowRecordBatchStreamReader;
		super(cast(GArrowRecordBatchReader*)gArrowRecordBatchStreamReader, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_record_batch_stream_reader_get_type();
	}

	/**
	 *
	 * Params:
	 *     stream = The stream to be read.
	 * Returns: A newly created #GArrowRecordBatchStreamReader
	 *     or %NULL on error.
	 *
	 * Since: 0.4.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(InputStream stream)
	{
		GError* err = null;

		auto p = garrow_record_batch_stream_reader_new((stream is null) ? null : stream.getArrowInputStreamStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowRecordBatchStreamReader*) p, true);
	}
}
