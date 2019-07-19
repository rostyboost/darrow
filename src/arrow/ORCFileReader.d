module arrow.ORCFileReader;

private import arrow.RecordBatch;
private import arrow.Schema;
private import arrow.SeekableInputStream;
private import arrow.Table;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class ORCFileReader : ObjectG
{
	/** the main Gtk struct */
	protected GArrowORCFileReader* gArrowORCFileReader;

	/** Get the main Gtk struct */
	public GArrowORCFileReader* getORCFileReaderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowORCFileReader;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowORCFileReader;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowORCFileReader* gArrowORCFileReader, bool ownedRef = false)
	{
		this.gArrowORCFileReader = gArrowORCFileReader;
		super(cast(GObject*)gArrowORCFileReader, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_orc_file_reader_get_type();
	}

	/**
	 *
	 * Params:
	 *     file = The file to be read.
	 * Returns: A newly created #GArrowORCFileReader
	 *     or %NULL on error.
	 *
	 * Since: 0.10.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(SeekableInputStream file)
	{
		GError* err = null;

		auto p = garrow_orc_file_reader_new((file is null) ? null : file.getSeekableInputStreamStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowORCFileReader*) p, true);
	}

	/**
	 *
	 *
	 * Deprecated: Use garrow_orc_file_reader_get_field_indices() instead.
	 *
	 * Returns: The field indexes to be read.
	 *
	 * Since: 0.10.0
	 */
	public int[] getFieldIndexes()
	{
		uint nFieldIndexes;

		auto p = garrow_orc_file_reader_get_field_indexes(gArrowORCFileReader, &nFieldIndexes);

		return p[0 .. nFieldIndexes];
	}

	/**
	 * Returns: The field indices to be read.
	 *
	 * Since: 0.12.0
	 */
	public int[] getFieldIndices()
	{
		uint nFieldIndices;

		auto p = garrow_orc_file_reader_get_field_indices(gArrowORCFileReader, &nFieldIndices);

		return p[0 .. nFieldIndices];
	}

	/**
	 * Returns: The number of rows in the file.
	 *
	 * Since: 0.10.0
	 */
	public long getNRows()
	{
		return garrow_orc_file_reader_get_n_rows(gArrowORCFileReader);
	}

	/**
	 * Returns: The number of stripes in the file.
	 *
	 * Since: 0.10.0
	 */
	public long getNStripes()
	{
		return garrow_orc_file_reader_get_n_stripes(gArrowORCFileReader);
	}

	/**
	 *
	 * Params:
	 *     i = The stripe index to be read.
	 * Returns: A newly read stripe as
	 *     #GArrowRecordBatch or %NULL on error.
	 *
	 * Since: 0.10.0
	 *
	 * Throws: GException on failure.
	 */
	public RecordBatch readStripe(long i)
	{
		GError* err = null;

		auto p = garrow_orc_file_reader_read_stripe(gArrowORCFileReader, i, &err);

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
	 * Returns: A newly read stripes as
	 *     #GArrowTable or %NULL on error.
	 *
	 * Since: 0.10.0
	 *
	 * Throws: GException on failure.
	 */
	public Table readStripes()
	{
		GError* err = null;

		auto p = garrow_orc_file_reader_read_stripes(gArrowORCFileReader, &err);

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
	 * Returns: A newly read type as
	 *     #GArrowSchema or %NULL on error.
	 *
	 * Since: 0.10.0
	 *
	 * Throws: GException on failure.
	 */
	public Schema readType()
	{
		GError* err = null;

		auto p = garrow_orc_file_reader_read_type(gArrowORCFileReader, &err);

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
	 *
	 * Deprecated: Use garrow_orc_file_reader_set_field_indices() instead.
	 *
	 * Params:
	 *     fieldIndexes = The field indexes to be read.
	 *
	 * Since: 0.10.0
	 */
	public void setFieldIndexes(int[] fieldIndexes)
	{
		garrow_orc_file_reader_set_field_indexes(gArrowORCFileReader, fieldIndexes.ptr, cast(uint)fieldIndexes.length);
	}

	/** */
	public void setFieldIndices(int[] fieldIndices)
	{
		garrow_orc_file_reader_set_field_indices(gArrowORCFileReader, fieldIndices.ptr, cast(uint)fieldIndices.length);
	}
}
