module arrow.ReadableIF;

private import arrow.Buffer;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public interface ReadableIF{
	/** Get the main Gtk struct */
	public GArrowReadable* getReadableStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return garrow_readable_get_type();
	}

	/**
	 *
	 * Params:
	 *     nBytes = The number of bytes to be read.
	 * Returns: #GArrowBuffer that has read
	 *     data on success, %NULL if there was an error.
	 *
	 * Throws: GException on failure.
	 */
	public Buffer read(long nBytes);
}
