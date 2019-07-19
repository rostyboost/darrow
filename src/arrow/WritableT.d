module arrow.WritableT;

public  import arrow.c.functions;
public  import arrow.c.types;
public  import glib.ErrorG;
public  import glib.GException;


/** */
public template WritableT(TStruct)
{
	/** Get the main Gtk struct */
	public GArrowWritable* getWritableStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GArrowWritable*)getStruct();
	}


	/**
	 * It ensures writing all data on memory to storage.
	 *
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Throws: GException on failure.
	 */
	public bool flush()
	{
		GError* err = null;

		auto p = garrow_writable_flush(getWritableStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 *
	 * Params:
	 *     data = The data to be written.
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Throws: GException on failure.
	 */
	public bool write(ubyte[] data)
	{
		GError* err = null;

		auto p = garrow_writable_write(getWritableStruct(), data.ptr, cast(long)data.length, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}
}
