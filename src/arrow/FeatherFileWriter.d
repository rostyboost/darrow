module arrow.FeatherFileWriter;

private import arrow.Array;
private import arrow.OutputStream;
private import arrow.Table;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class FeatherFileWriter : ObjectG
{
	/** the main Gtk struct */
	protected GArrowFeatherFileWriter* gArrowFeatherFileWriter;

	/** Get the main Gtk struct */
	public GArrowFeatherFileWriter* getFeatherFileWriterStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowFeatherFileWriter;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowFeatherFileWriter;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowFeatherFileWriter* gArrowFeatherFileWriter, bool ownedRef = false)
	{
		this.gArrowFeatherFileWriter = gArrowFeatherFileWriter;
		super(cast(GObject*)gArrowFeatherFileWriter, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_feather_file_writer_get_type();
	}

	/**
	 *
	 * Params:
	 *     sink = The output of the writer.
	 * Returns: A newly created #GArrowFeatherFileWriter
	 *     or %NULL on error.
	 *
	 * Since: 0.4.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(OutputStream sink)
	{
		GError* err = null;

		auto p = garrow_feather_file_writer_new((sink is null) ? null : sink.getOutputStreamStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowFeatherFileWriter*) p, true);
	}

	/**
	 *
	 * Params:
	 *     name = The name of the array to be appended.
	 *     array = The array to be appended.
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.4.0
	 *
	 * Throws: GException on failure.
	 */
	public bool append(string name, Array array)
	{
		GError* err = null;

		auto p = garrow_feather_file_writer_append(gArrowFeatherFileWriter, Str.toStringz(name), (array is null) ? null : array.getArrayStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.4.0
	 *
	 * Throws: GException on failure.
	 */
	public bool close()
	{
		GError* err = null;

		auto p = garrow_feather_file_writer_close(gArrowFeatherFileWriter, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/** */
	public void setDescription(string description)
	{
		garrow_feather_file_writer_set_description(gArrowFeatherFileWriter, Str.toStringz(description));
	}

	/** */
	public void setNRows(long nRows)
	{
		garrow_feather_file_writer_set_n_rows(gArrowFeatherFileWriter, nRows);
	}

	/** */
	public bool write(Table table)
	{
		GError* err = null;

		auto p = garrow_feather_file_writer_write(gArrowFeatherFileWriter, (table is null) ? null : table.getTableStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}
}
