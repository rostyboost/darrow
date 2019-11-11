module arrow.FeatherFileReader;

private import arrow.ChunkedArray;
private import arrow.SeekableInputStream;
private import arrow.Table;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class FeatherFileReader : ObjectG
{
	/** the main Gtk struct */
	protected GArrowFeatherFileReader* gArrowFeatherFileReader;

	/** Get the main Gtk struct */
	public GArrowFeatherFileReader* getFeatherFileReaderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowFeatherFileReader;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowFeatherFileReader;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowFeatherFileReader* gArrowFeatherFileReader, bool ownedRef = false)
	{
		this.gArrowFeatherFileReader = gArrowFeatherFileReader;
		super(cast(GObject*)gArrowFeatherFileReader, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_feather_file_reader_get_type();
	}

	/**
	 *
	 * Params:
	 *     file = The file to be read.
	 * Returns: A newly created #GArrowFeatherFileReader
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

		auto p = garrow_feather_file_reader_new((file is null) ? null : file.getSeekableInputStreamStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowFeatherFileReader*) p, true);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target column. If it's negative, index is
	 *         counted backward from the end of the columns. `-1` means the last
	 *         column.
	 * Returns: The i-th column's data in the file or %NULL on error.
	 *
	 * Since: 1.0.0
	 *
	 * Throws: GException on failure.
	 */
	public ChunkedArray getColumnData(int i)
	{
		GError* err = null;

		auto p = garrow_feather_file_reader_get_column_data(gArrowFeatherFileReader, i, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ChunkedArray)(cast(GArrowChunkedArray*) p, true);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target column. If it's negative, index is
	 *         counted backward from the end of the columns. `-1` means the last
	 *         column.
	 * Returns: The i-th column name in the file.
	 *
	 *     It should be freed with g_free() when no longer needed.
	 *
	 * Since: 0.4.0
	 */
	public string getColumnName(int i)
	{
		auto retStr = garrow_feather_file_reader_get_column_name(gArrowFeatherFileReader, i);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Returns: The description of the file if it exists,
	 *     %NULL otherwise. You can confirm whether description exists or not by
	 *     garrow_feather_file_reader_has_description().
	 *
	 *     It should be freed with g_free() when no longer needed.
	 *
	 * Since: 0.4.0
	 */
	public string getDescription()
	{
		auto retStr = garrow_feather_file_reader_get_description(gArrowFeatherFileReader);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Returns: The number of columns in the file.
	 *
	 * Since: 0.4.0
	 */
	public long getNColumns()
	{
		return garrow_feather_file_reader_get_n_columns(gArrowFeatherFileReader);
	}

	/**
	 * Returns: The number of rows in the file.
	 *
	 * Since: 0.4.0
	 */
	public long getNRows()
	{
		return garrow_feather_file_reader_get_n_rows(gArrowFeatherFileReader);
	}

	/**
	 * Returns: The format version of the file.
	 *
	 * Since: 0.4.0
	 */
	public int getVersion()
	{
		return garrow_feather_file_reader_get_version(gArrowFeatherFileReader);
	}

	/**
	 * Returns: Whether the file has description or not.
	 *
	 * Since: 0.4.0
	 */
	public bool hasDescription()
	{
		return garrow_feather_file_reader_has_description(gArrowFeatherFileReader) != 0;
	}

	/**
	 * Returns: The table in the file that has all columns.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public Table read()
	{
		GError* err = null;

		auto p = garrow_feather_file_reader_read(gArrowFeatherFileReader, &err);

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
	 *     indices = The indices of column to be read.
	 * Returns: The table in the file that has only the
	 *     specified columns.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public Table readIndices(int[] indices)
	{
		GError* err = null;

		auto p = garrow_feather_file_reader_read_indices(gArrowFeatherFileReader, indices.ptr, cast(uint)indices.length, &err);

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
	 *     names = The names of column to be read.
	 * Returns: The table in the file that has only the
	 *     specified columns.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public Table readNames(string[] names)
	{
		GError* err = null;

		auto p = garrow_feather_file_reader_read_names(gArrowFeatherFileReader, Str.toStringzArray(names), cast(uint)names.length, &err);

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
}
