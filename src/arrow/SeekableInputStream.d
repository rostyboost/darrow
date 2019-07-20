module arrow.SeekableInputStream;

private import arrow.Buffer;
private import arrow.InputStream;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.Bytes;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class SeekableInputStream : InputStream
{
	/** the main Gtk struct */
	protected GArrowSeekableInputStream* gArrowSeekableInputStream;

	/** Get the main Gtk struct */
	public GArrowSeekableInputStream* getSeekableInputStreamStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowSeekableInputStream;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowSeekableInputStream;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowSeekableInputStream* gArrowSeekableInputStream, bool ownedRef = false)
	{
		this.gArrowSeekableInputStream = gArrowSeekableInputStream;
		super(cast(GArrowInputStream*)gArrowSeekableInputStream, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_seekable_input_stream_get_type();
	}

	/**
	 * Returns: The size of the file.
	 *
	 * Throws: GException on failure.
	 */
	public ulong getSize()
	{
		GError* err = null;

		auto p = garrow_seekable_input_stream_get_size(gArrowSeekableInputStream, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 * Returns: Whether zero copy read is supported or not.
	 */
	public bool getSupportZeroCopy()
	{
		return garrow_seekable_input_stream_get_support_zero_copy(gArrowSeekableInputStream) != 0;
	}

	/**
	 *
	 * Params:
	 *     nBytes = The number of bytes to be peeked.
	 * Returns: The data of the buffer, up to the
	 *     indicated number. The data becomes invalid after any operation on
	 *     the stream. If the stream is unbuffered, the data is empty.
	 *
	 *     It should be freed with g_bytes_unref() when no longer needed.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public Bytes peek(long nBytes)
	{
		GError* err = null;

		auto p = garrow_seekable_input_stream_peek(gArrowSeekableInputStream, nBytes, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return new Bytes(cast(GBytes*) p, true);
	}

	/**
	 *
	 * Params:
	 *     position = The read start position.
	 *     nBytes = The number of bytes to be read.
	 * Returns: #GArrowBuffer that has read
	 *     data on success, %NULL if there was an error.
	 *
	 * Throws: GException on failure.
	 */
	public Buffer readAt(long position, long nBytes)
	{
		GError* err = null;

		auto p = garrow_seekable_input_stream_read_at(gArrowSeekableInputStream, position, nBytes, &err);

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
