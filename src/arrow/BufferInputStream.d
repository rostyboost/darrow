module arrow.BufferInputStream;

private import arrow.Buffer;
private import arrow.SeekableInputStream;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class BufferInputStream : SeekableInputStream
{
	/** the main Gtk struct */
	protected GArrowBufferInputStream* gArrowBufferInputStream;

	/** Get the main Gtk struct */
	public GArrowBufferInputStream* getBufferInputStreamStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowBufferInputStream;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowBufferInputStream;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowBufferInputStream* gArrowBufferInputStream, bool ownedRef = false)
	{
		this.gArrowBufferInputStream = gArrowBufferInputStream;
		super(cast(GArrowSeekableInputStream*)gArrowBufferInputStream, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_buffer_input_stream_get_type();
	}

	/**
	 *
	 * Params:
	 *     buffer = The buffer to be read.
	 * Returns: A newly created #GArrowBufferInputStream.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Buffer buffer)
	{
		auto p = garrow_buffer_input_stream_new((buffer is null) ? null : buffer.getBufferStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowBufferInputStream*) p, true);
	}

	/**
	 * Returns: The data of the stream as #GArrowBuffer.
	 */
	public Buffer getBuffer()
	{
		auto p = garrow_buffer_input_stream_get_buffer(gArrowBufferInputStream);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Buffer)(cast(GArrowBuffer*) p, true);
	}
}
