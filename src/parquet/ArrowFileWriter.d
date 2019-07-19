module parquet.ArrowFileWriter;

private import arrow.OutputStream;
private import arrow.Schema;
private import arrow.Table;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;
private import parquet.c.functions;
public  import parquet.c.types;


/** */
public class ArrowFileWriter : ObjectG
{
	/** the main Gtk struct */
	protected GParquetArrowFileWriter* gParquetArrowFileWriter;

	/** Get the main Gtk struct */
	public GParquetArrowFileWriter* getArrowFileWriterStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gParquetArrowFileWriter;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gParquetArrowFileWriter;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GParquetArrowFileWriter* gParquetArrowFileWriter, bool ownedRef = false)
	{
		this.gParquetArrowFileWriter = gParquetArrowFileWriter;
		super(cast(GObject*)gParquetArrowFileWriter, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gparquet_arrow_file_writer_get_type();
	}

	/**
	 *
	 * Params:
	 *     schema = Arrow schema for written data.
	 *     sink = Arrow output stream to be written.
	 * Returns: A newly created #GParquetArrowFileWriter.
	 *
	 * Since: 0.11.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Schema schema, OutputStream sink)
	{
		GError* err = null;

		auto p = gparquet_arrow_file_writer_new_arrow((schema is null) ? null : schema.getSchemaStruct(), (sink is null) ? null : sink.getOutputStreamStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new_arrow");
		}

		this(cast(GParquetArrowFileWriter*) p, true);
	}

	/**
	 *
	 * Params:
	 *     schema = Arrow schema for written data.
	 *     path = Path to be read.
	 * Returns: A newly created #GParquetArrowFileWriter.
	 *
	 * Since: 0.11.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Schema schema, string path)
	{
		GError* err = null;

		auto p = gparquet_arrow_file_writer_new_path((schema is null) ? null : schema.getSchemaStruct(), Str.toStringz(path), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new_path");
		}

		this(cast(GParquetArrowFileWriter*) p, true);
	}

	/**
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.11.0
	 *
	 * Throws: GException on failure.
	 */
	public bool close()
	{
		GError* err = null;

		auto p = gparquet_arrow_file_writer_close(gParquetArrowFileWriter, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 *
	 * Params:
	 *     table = A table to be written.
	 *     chunkSize = The max number of rows in a row group.
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.11.0
	 *
	 * Throws: GException on failure.
	 */
	public bool writeTable(Table table, ulong chunkSize)
	{
		GError* err = null;

		auto p = gparquet_arrow_file_writer_write_table(gParquetArrowFileWriter, (table is null) ? null : table.getTableStruct(), chunkSize, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}
}
