module arrow.MemoryMappedInputStream;

private import arrow.SeekableInputStream;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;


/**
 * It wraps `arrow::io::MemoryMappedFile`.
 */
public class MemoryMappedInputStream : SeekableInputStream
{
	/** the main Gtk struct */
	protected GArrowMemoryMappedInputStream* gArrowMemoryMappedInputStream;

	/** Get the main Gtk struct */
	public GArrowMemoryMappedInputStream* getMemoryMappedInputStreamStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowMemoryMappedInputStream;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowMemoryMappedInputStream;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowMemoryMappedInputStream* gArrowMemoryMappedInputStream, bool ownedRef = false)
	{
		this.gArrowMemoryMappedInputStream = gArrowMemoryMappedInputStream;
		super(cast(GArrowSeekableInputStream*)gArrowMemoryMappedInputStream, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_memory_mapped_input_stream_get_type();
	}

	/**
	 *
	 * Params:
	 *     path = The path of the file to be mapped on memory.
	 * Returns: A newly created #GArrowMemoryMappedInputStream
	 *     or %NULL on error.
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string path)
	{
		GError* err = null;

		auto p = garrow_memory_mapped_input_stream_new(Str.toStringz(path), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowMemoryMappedInputStream*) p, true);
	}
}
