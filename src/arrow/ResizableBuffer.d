module arrow.ResizableBuffer;

private import arrow.MutableBuffer;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class ResizableBuffer : MutableBuffer
{
	/** the main Gtk struct */
	protected GArrowResizableBuffer* gArrowResizableBuffer;

	/** Get the main Gtk struct */
	public GArrowResizableBuffer* getResizableBufferStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowResizableBuffer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowResizableBuffer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowResizableBuffer* gArrowResizableBuffer, bool ownedRef = false)
	{
		this.gArrowResizableBuffer = gArrowResizableBuffer;
		super(cast(GArrowMutableBuffer*)gArrowResizableBuffer, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_resizable_buffer_get_type();
	}

	/**
	 *
	 * Params:
	 *     initialSize = The initial buffer size in bytes.
	 * Returns: A newly created #GArrowResizableBuffer.
	 *
	 * Since: 0.10.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(long initialSize)
	{
		GError* err = null;

		auto p = garrow_resizable_buffer_new(initialSize, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowResizableBuffer*) p, true);
	}

	/**
	 *
	 * Params:
	 *     newCapacity = The new buffer capacity in bytes.
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.3.0
	 *
	 * Throws: GException on failure.
	 */
	public bool reserve(long newCapacity)
	{
		GError* err = null;

		auto p = garrow_resizable_buffer_reserve(gArrowResizableBuffer, newCapacity, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 *
	 * Params:
	 *     newSize = The new buffer size in bytes.
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.3.0
	 *
	 * Throws: GException on failure.
	 */
	public bool resize(long newSize)
	{
		GError* err = null;

		auto p = garrow_resizable_buffer_resize(gArrowResizableBuffer, newSize, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}
}
