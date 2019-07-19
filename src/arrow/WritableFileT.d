module arrow.WritableFileT;

public  import arrow.c.functions;
public  import arrow.c.types;
public  import glib.ErrorG;
public  import glib.GException;


/** */
public template WritableFileT(TStruct)
{
	/** Get the main Gtk struct */
	public GArrowWritableFile* getWritableFileStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GArrowWritableFile*)getStruct();
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
	public bool writeAt(long position, ubyte[] data)
	{
		GError* err = null;

		auto p = garrow_writable_file_write_at(getWritableFileStruct(), position, data.ptr, cast(long)data.length, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}
}
