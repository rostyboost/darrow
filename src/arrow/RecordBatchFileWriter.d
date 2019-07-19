module arrow.RecordBatchFileWriter;

private import arrow.OutputStream;
private import arrow.RecordBatchStreamWriter;
private import arrow.Schema;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/**
 * It wraps `arrow::ipc::RecordBatchFileWriter`.
 */
public class RecordBatchFileWriter : RecordBatchStreamWriter
{
	/** the main Gtk struct */
	protected GArrowRecordBatchFileWriter* gArrowRecordBatchFileWriter;

	/** Get the main Gtk struct */
	public GArrowRecordBatchFileWriter* getRecordBatchFileWriterStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowRecordBatchFileWriter;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowRecordBatchFileWriter;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowRecordBatchFileWriter* gArrowRecordBatchFileWriter, bool ownedRef = false)
	{
		this.gArrowRecordBatchFileWriter = gArrowRecordBatchFileWriter;
		super(cast(GArrowRecordBatchStreamWriter*)gArrowRecordBatchFileWriter, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_record_batch_file_writer_get_type();
	}

	/**
	 *
	 * Params:
	 *     sink = The output of the writer.
	 *     schema = The schema of the writer.
	 * Returns: A newly created #GArrowRecordBatchFileWriter
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

		auto p = garrow_record_batch_file_writer_new((sink is null) ? null : sink.getOutputStreamStruct(), (schema is null) ? null : schema.getSchemaStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowRecordBatchFileWriter*) p, true);
	}
}
