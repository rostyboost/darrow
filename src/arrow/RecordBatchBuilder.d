module arrow.RecordBatchBuilder;

private import arrow.ArrayBuilder;
private import arrow.RecordBatch;
private import arrow.Schema;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class RecordBatchBuilder : ObjectG
{
	/** the main Gtk struct */
	protected GArrowRecordBatchBuilder* gArrowRecordBatchBuilder;

	/** Get the main Gtk struct */
	public GArrowRecordBatchBuilder* getRecordBatchBuilderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowRecordBatchBuilder;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowRecordBatchBuilder;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowRecordBatchBuilder* gArrowRecordBatchBuilder, bool ownedRef = false)
	{
		this.gArrowRecordBatchBuilder = gArrowRecordBatchBuilder;
		super(cast(GObject*)gArrowRecordBatchBuilder, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_record_batch_builder_get_type();
	}

	/**
	 *
	 * Params:
	 *     schema = A #GArrowSchema.
	 * Returns: A newly created #GArrowRecordBatchBuilder on success,
	 *     %NULL on error.
	 *
	 * Since: 0.8.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Schema schema)
	{
		GError* err = null;

		auto p = garrow_record_batch_builder_new((schema is null) ? null : schema.getSchemaStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowRecordBatchBuilder*) p, true);
	}

	/**
	 * Returns: The built #GArrowRecordBatch on success,
	 *     %NULL on error.
	 *
	 * Since: 0.8.0
	 *
	 * Throws: GException on failure.
	 */
	public RecordBatch flush()
	{
		GError* err = null;

		auto p = garrow_record_batch_builder_flush(gArrowRecordBatchBuilder, &err);

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
	 * Params:
	 *     i = The column index. If it's negative, index is counted backward
	 *         from the end of the columns. `-1` means the last column.
	 * Returns: The #GArrowArrayBuilder for
	 *     the `i`-th column on success, %NULL on out of index.
	 *
	 * Since: 0.13.0
	 */
	public ArrayBuilder getColumnBuilder(int i)
	{
		auto p = garrow_record_batch_builder_get_column_builder(gArrowRecordBatchBuilder, i);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ArrayBuilder)(cast(GArrowArrayBuilder*) p);
	}

	/**
	 *
	 *
	 * Deprecated: Use garrow_record_batch_builder_get_column_builder() instead.
	 *
	 * Params:
	 *     i = The field index. If it's negative, index is counted backward
	 *         from the end of the fields. `-1` means the last field.
	 *
	 * Returns: The #GArrowArrayBuilder for
	 *     the `i`-th field on success, %NULL on out of index.
	 *
	 * Since: 0.8.0
	 */
	public ArrayBuilder getField(int i)
	{
		auto p = garrow_record_batch_builder_get_field(gArrowRecordBatchBuilder, i);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ArrayBuilder)(cast(GArrowArrayBuilder*) p);
	}

	/**
	 * Returns: The initial capacity for array builders.
	 *
	 * Since: 0.8.0
	 */
	public long getInitialCapacity()
	{
		return garrow_record_batch_builder_get_initial_capacity(gArrowRecordBatchBuilder);
	}

	/**
	 * Returns: The number of columns.
	 *
	 * Since: 0.13.0
	 */
	public int getNColumns()
	{
		return garrow_record_batch_builder_get_n_columns(gArrowRecordBatchBuilder);
	}

	/**
	 *
	 *
	 * Deprecated: Use garrow_record_batch_builder_get_n_columns() instead.
	 *
	 * Returns: The number of fields.
	 *
	 * Since: 0.8.0
	 */
	public int getNFields()
	{
		return garrow_record_batch_builder_get_n_fields(gArrowRecordBatchBuilder);
	}

	/**
	 * Returns: The #GArrowSchema of the record batch builder.
	 *
	 * Since: 0.8.0
	 */
	public Schema getSchema()
	{
		auto p = garrow_record_batch_builder_get_schema(gArrowRecordBatchBuilder);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Schema)(cast(GArrowSchema*) p, true);
	}

	/** */
	public void setInitialCapacity(long capacity)
	{
		garrow_record_batch_builder_set_initial_capacity(gArrowRecordBatchBuilder, capacity);
	}
}
