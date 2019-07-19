module arrow.BufferOutputStream;

private import arrow.OutputStream;
private import arrow.ResizableBuffer;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * It wraps `arrow::io::BufferOutputStream`.
 */
public class BufferOutputStream : OutputStream
{
	/** the main Gtk struct */
	protected GArrowBufferOutputStream* gArrowBufferOutputStream;

	/** Get the main Gtk struct */
	public GArrowBufferOutputStream* getBufferOutputStreamStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowBufferOutputStream;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowBufferOutputStream;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowBufferOutputStream* gArrowBufferOutputStream, bool ownedRef = false)
	{
		this.gArrowBufferOutputStream = gArrowBufferOutputStream;
		super(cast(GArrowOutputStream*)gArrowBufferOutputStream, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_buffer_output_stream_get_type();
	}

	/**
	 *
	 * Params:
	 *     buffer = The resizable buffer to be output.
	 * Returns: A newly created #GArrowBufferOutputStream.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ResizableBuffer buffer)
	{
		auto p = garrow_buffer_output_stream_new((buffer is null) ? null : buffer.getResizableBufferStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowBufferOutputStream*) p, true);
	}
}
