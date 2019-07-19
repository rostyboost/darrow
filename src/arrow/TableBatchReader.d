module arrow.TableBatchReader;

private import arrow.RecordBatchReader;
private import arrow.Table;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class TableBatchReader : RecordBatchReader
{
	/** the main Gtk struct */
	protected GArrowTableBatchReader* gArrowTableBatchReader;

	/** Get the main Gtk struct */
	public GArrowTableBatchReader* getTableBatchReaderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowTableBatchReader;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowTableBatchReader;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowTableBatchReader* gArrowTableBatchReader, bool ownedRef = false)
	{
		this.gArrowTableBatchReader = gArrowTableBatchReader;
		super(cast(GArrowRecordBatchReader*)gArrowTableBatchReader, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_table_batch_reader_get_type();
	}

	/**
	 *
	 * Params:
	 *     table = The table to be read.
	 * Returns: A newly created #GArrowTableBatchReader.
	 *
	 * Since: 0.8.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Table table)
	{
		auto p = garrow_table_batch_reader_new((table is null) ? null : table.getTableStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowTableBatchReader*) p, true);
	}
}
