module arrow.FileIF;

private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ErrorG;
private import glib.GException;


/** */
public interface FileIF{
	/** Get the main Gtk struct */
	public GArrowFile* getFileStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return garrow_file_get_type();
	}

	/**
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Throws: GException on failure.
	 */
	public bool close();

	/**
	 * Returns: The mode of the file.
	 */
	public GArrowFileMode getMode();

	/**
	 * Returns: %TRUE if the @file is already closed, %FALSE otherwise.
	 *
	 * Since: 0.13.0
	 */
	public bool isClosed();

	/**
	 * Returns: The current offset on success, -1 if there was an error.
	 *
	 * Throws: GException on failure.
	 */
	public long tell();
}
