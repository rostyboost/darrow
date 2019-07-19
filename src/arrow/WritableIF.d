module arrow.WritableIF;

private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ErrorG;
private import glib.GException;


/** */
public interface WritableIF{
	/** Get the main Gtk struct */
	public GArrowWritable* getWritableStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return garrow_writable_get_type();
	}

	/**
	 * It ensures writing all data on memory to storage.
	 *
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Throws: GException on failure.
	 */
	public bool flush();

	/**
	 *
	 * Params:
	 *     data = The data to be written.
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Throws: GException on failure.
	 */
	public bool write(ubyte[] data);
}
