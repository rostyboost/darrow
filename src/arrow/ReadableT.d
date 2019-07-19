module arrow.ReadableT;

public  import arrow.Buffer;
public  import arrow.c.functions;
public  import arrow.c.types;
public  import glib.ErrorG;
public  import glib.GException;
public  import gobject.ObjectG;


/** */
public template ReadableT(TStruct)
{
	/** Get the main Gtk struct */
	public GArrowReadable* getReadableStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GArrowReadable*)getStruct();
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
	public Buffer read(long nBytes)
	{
		GError* err = null;

		auto p = garrow_readable_read(getReadableStruct(), nBytes, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Buffer)(cast(GArrowBuffer*) p, true);
	}
}
