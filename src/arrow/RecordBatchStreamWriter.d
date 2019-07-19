module arrow.RecordBatchStreamWriter;

private import arrow.OutputStream;
private import arrow.RecordBatchWriter;
private import arrow.Schema;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/**
 * It wraps `arrow::ipc::RecordBatchStreamWriter`.
 */
public class RecordBatchStreamWriter : RecordBatchWriter
{
	/** the main Gtk struct */
	protected GArrowRecordBatchStreamWriter* gArrowRecordBatchStreamWriter;

	/** Get the main Gtk struct */
	public GArrowRecordBatchStreamWriter* getRecordBatchStreamWriterStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowRecordBatchStreamWriter;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowRecordBatchStreamWriter;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowRecordBatchStreamWriter* gArrowRecordBatchStreamWriter, bool ownedRef = false)
	{
		this.gArrowRecordBatchStreamWriter = gArrowRecordBatchStreamWriter;
		super(cast(GArrowRecordBatchWriter*)gArrowRecordBatchStreamWriter, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_record_batch_stream_writer_get_type();
	}

	/**
	 *
	 * Params:
	 *     sink = The output of the writer.
	 *     schema = The schema of the writer.
	 * Returns: A newly created #GArrowRecordBatchStreamWriter
	 *     or %NULL on error.
	 *
	 * Since: 0.4.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(OutputStream sink, Schema schema)
	{
		GError* err = null;

		auto p = garrow_record_batch_stream_writer_new((sink is null) ? null : sink.getOutputStreamStruct(), (schema is null) ? null : schema.getSchemaStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowRecordBatchStreamWriter*) p, true);
	}
}
