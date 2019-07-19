module arrow.FileOutputStream;

private import arrow.OutputStream;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;


/**
 * It wraps `arrow::io::FileOutputStream`.
 */
public class FileOutputStream : OutputStream
{
	/** the main Gtk struct */
	protected GArrowFileOutputStream* gArrowFileOutputStream;

	/** Get the main Gtk struct */
	public GArrowFileOutputStream* getFileOutputStreamStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowFileOutputStream;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowFileOutputStream;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowFileOutputStream* gArrowFileOutputStream, bool ownedRef = false)
	{
		this.gArrowFileOutputStream = gArrowFileOutputStream;
		super(cast(GArrowOutputStream*)gArrowFileOutputStream, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_file_output_stream_get_type();
	}

	/**
	 *
	 * Params:
	 *     path = The path of the file output stream.
	 *     append = Whether the path is opened as append mode or recreate mode.
	 * Returns: A newly opened #GArrowFileOutputStream or
	 *     %NULL on error.
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string path, bool append)
	{
		GError* err = null;

		auto p = garrow_file_output_stream_new(Str.toStringz(path), append, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowFileOutputStream*) p, true);
	}
}
