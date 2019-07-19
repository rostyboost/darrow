module parquet.ArrowFileReader;

private import arrow.Column;
private import arrow.Schema;
private import arrow.SeekableInputStream;
private import arrow.Table;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;
private import parquet.c.functions;
public  import parquet.c.types;


/** */
public class ArrowFileReader : ObjectG
{
	/** the main Gtk struct */
	protected GParquetArrowFileReader* gParquetArrowFileReader;

	/** Get the main Gtk struct */
	public GParquetArrowFileReader* getArrowFileReaderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gParquetArrowFileReader;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gParquetArrowFileReader;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GParquetArrowFileReader* gParquetArrowFileReader, bool ownedRef = false)
	{
		this.gParquetArrowFileReader = gParquetArrowFileReader;
		super(cast(GObject*)gParquetArrowFileReader, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gparquet_arrow_file_reader_get_type();
	}

	/**
	 *
	 * Params:
	 *     source = Arrow source to be read.
	 * Returns: A newly created #GParquetArrowFileReader.
	 *
	 * Since: 0.11.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(SeekableInputStream source)
	{
		GError* err = null;

		auto p = gparquet_arrow_file_reader_new_arrow((source is null) ? null : source.getSeekableInputStreamStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new_arrow");
		}

		this(cast(GParquetArrowFileReader*) p, true);
	}

	/**
	 *
	 * Params:
	 *     path = Path to be read.
	 * Returns: A newly created #GParquetArrowFileReader.
	 *
	 * Since: 0.11.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string path)
	{
		GError* err = null;

		auto p = gparquet_arrow_file_reader_new_path(Str.toStringz(path), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new_path");
		}

		this(cast(GParquetArrowFileReader*) p, true);
	}

	/**
	 * Returns: The number of row groups.
	 *
	 * Since: 0.11.0
	 */
	public int getNRowGroups()
	{
		return gparquet_arrow_file_reader_get_n_row_groups(gParquetArrowFileReader);
	}

	/**
	 * Returns: A got #GArrowSchema.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public Schema getSchema()
	{
		GError* err = null;

		auto p = gparquet_arrow_file_reader_get_schema(gParquetArrowFileReader, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Schema)(cast(GArrowSchema*) p, true);
	}

	/**
	 *
	 * Params:
	 *     columnIndex = Index integer of the column to be read.
	 * Returns: A read #GArrowColumn.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public Column readColumn(int columnIndex)
	{
		GError* err = null;

		auto p = gparquet_arrow_file_reader_read_column(gParquetArrowFileReader, columnIndex, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Column)(cast(GArrowColumn*) p, true);
	}

	/**
	 * Returns: A read #GArrowTable.
	 *
	 * Since: 0.11.0
	 *
	 * Throws: GException on failure.
	 */
	public Table readTable()
	{
		GError* err = null;

		auto p = gparquet_arrow_file_reader_read_table(gParquetArrowFileReader, &err);

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
	 *     columnIndexes = The array of column indexes to be selected
	 * Returns: A selected #GArrowSchema.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public Schema selectSchema(int[] columnIndexes)
	{
		GError* err = null;

		auto p = gparquet_arrow_file_reader_select_schema(gParquetArrowFileReader, columnIndexes.ptr, cast(size_t)columnIndexes.length, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Schema)(cast(GArrowSchema*) p, true);
	}

	/** */
	public void setUseThreads(bool useThreads)
	{
		gparquet_arrow_file_reader_set_use_threads(gParquetArrowFileReader, useThreads);
	}
}
