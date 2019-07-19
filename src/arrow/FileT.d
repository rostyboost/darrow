module arrow.FileT;

public  import arrow.c.functions;
public  import arrow.c.types;
public  import glib.ErrorG;
public  import glib.GException;


/** */
public template FileT(TStruct)
{
	/** Get the main Gtk struct */
	public GArrowFile* getFileStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GArrowFile*)getStruct();
	}


	/**
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Throws: GException on failure.
	 */
	public bool close()
	{
		GError* err = null;

		auto p = garrow_file_close(getFileStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 * Returns: The mode of the file.
	 */
	public GArrowFileMode getMode()
	{
		return garrow_file_get_mode(getFileStruct());
	}

	/**
	 * Returns: %TRUE if the @file is already closed, %FALSE otherwise.
	 *
	 * Since: 0.13.0
	 */
	public override bool isClosed()
	{
		return garrow_file_is_closed(getFileStruct()) != 0;
	}

	/**
	 * Returns: The current offset on success, -1 if there was an error.
	 *
	 * Throws: GException on failure.
	 */
	public long tell()
	{
		GError* err = null;

		auto p = garrow_file_tell(getFileStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}
}
