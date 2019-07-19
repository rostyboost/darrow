module arrow.WritableFileIF;

private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ErrorG;
private import glib.GException;


/** */
public interface WritableFileIF{
	/** Get the main Gtk struct */
	public GArrowWritableFile* getWritableFileStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return garrow_writable_file_get_type();
	}

	/**
	 *
	 * Params:
	 *     position = The write start position.
	 *     data = The data to be written.
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Throws: GException on failure.
	 */
	public bool writeAt(long position, ubyte[] data);
}
