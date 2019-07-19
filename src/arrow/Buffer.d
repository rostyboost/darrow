module arrow.Buffer;

private import arrow.c.functions;
public  import arrow.c.types;
private import glib.Bytes;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class Buffer : ObjectG
{
	/** the main Gtk struct */
	protected GArrowBuffer* gArrowBuffer;

	/** Get the main Gtk struct */
	public GArrowBuffer* getBufferStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowBuffer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowBuffer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowBuffer* gArrowBuffer, bool ownedRef = false)
	{
		this.gArrowBuffer = gArrowBuffer;
		super(cast(GObject*)gArrowBuffer, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_buffer_get_type();
	}

	/**
	 *
	 * Params:
	 *     data = Data for the buffer.
	 *         They aren't owned by the new buffer.
	 *         You must not free the data while the new buffer is alive.
	 * Returns: A newly created #GArrowBuffer.
	 *
	 * Since: 0.3.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ubyte[] data)
	{
		auto p = garrow_buffer_new(data.ptr, cast(long)data.length);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowBuffer*) p, true);
	}

	/**
	 *
	 * Params:
	 *     data = Data for the buffer.
	 * Returns: A newly created #GArrowBuffer.
	 *
	 * Since: 0.9.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Bytes data)
	{
		auto p = garrow_buffer_new_bytes((data is null) ? null : data.getBytesStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new_bytes");
		}

		this(cast(GArrowBuffer*) p, true);
	}

	/**
	 *
	 * Params:
	 *     start = An offset of data to be copied in byte.
	 *     size = The number of bytes to be copied from the start.
	 * Returns: A newly copied #GArrowBuffer on success, %NULL on error.
	 *
	 * Since: 0.3.0
	 *
	 * Throws: GException on failure.
	 */
	public Buffer copy(long start, long size)
	{
		GError* err = null;

		auto p = garrow_buffer_copy(gArrowBuffer, start, size, &err);

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

	/**
	 *
	 * Params:
	 *     otherBuffer = A #GArrowBuffer to be compared.
	 * Returns: %TRUE if both of them have the same data, %FALSE
	 *     otherwise.
	 *
	 * Since: 0.4.0
	 */
	public bool equal(Buffer otherBuffer)
	{
		return garrow_buffer_equal(gArrowBuffer, (otherBuffer is null) ? null : otherBuffer.getBufferStruct()) != 0;
	}

	/**
	 *
	 * Params:
	 *     otherBuffer = A #GArrowBuffer to be compared.
	 *     nBytes = The number of first bytes to be compared.
	 * Returns: %TRUE if both of them have the same data in the first
	 *     `n_bytes`, %FALSE otherwise.
	 *
	 * Since: 0.4.0
	 */
	public bool equalNBytes(Buffer otherBuffer, long nBytes)
	{
		return garrow_buffer_equal_n_bytes(gArrowBuffer, (otherBuffer is null) ? null : otherBuffer.getBufferStruct(), nBytes) != 0;
	}

	/**
	 * Returns: The number of bytes that where allocated for the buffer in
	 *     total.
	 *
	 * Since: 0.3.0
	 */
	public long getCapacity()
	{
		return garrow_buffer_get_capacity(gArrowBuffer);
	}

	/**
	 * Returns: The data of the buffer. The data is owned by
	 *     the buffer. You should not free or modify the data.
	 *
	 * Since: 0.3.0
	 */
	public Bytes getData()
	{
		auto p = garrow_buffer_get_data(gArrowBuffer);

		if(p is null)
		{
			return null;
		}

		return new Bytes(cast(GBytes*) p, true);
	}

	/**
	 * Returns: The data of the buffer. If the
	 *     buffer is imutable, it returns %NULL. The data is owned by the
	 *     buffer. You should not free the data.
	 *
	 * Since: 0.3.0
	 */
	public Bytes getMutableData()
	{
		auto p = garrow_buffer_get_mutable_data(gArrowBuffer);

		if(p is null)
		{
			return null;
		}

		return new Bytes(cast(GBytes*) p, true);
	}

	/**
	 * Returns: The parent #GArrowBuffer or %NULL.
	 *
	 * Since: 0.3.0
	 */
	public Buffer getParent()
	{
		auto p = garrow_buffer_get_parent(gArrowBuffer);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Buffer)(cast(GArrowBuffer*) p, true);
	}

	/**
	 * Returns: The number of bytes that might have valid data.
	 *
	 * Since: 0.3.0
	 */
	public long getSize()
	{
		return garrow_buffer_get_size(gArrowBuffer);
	}

	/**
	 * Returns: %TRUE if the buffer is mutable, %FALSE otherwise.
	 *
	 * Since: 0.3.0
	 */
	public bool isMutable()
	{
		return garrow_buffer_is_mutable(gArrowBuffer) != 0;
	}

	/**
	 *
	 * Params:
	 *     offset = An offset in the buffer data in byte.
	 *     size = The number of bytes of the sliced data.
	 * Returns: A newly created #GArrowBuffer that shares
	 *     data of the base #GArrowBuffer. The created #GArrowBuffer has data
	 *     start with offset from the base buffer data and are the specified
	 *     bytes size.
	 *
	 * Since: 0.3.0
	 */
	public Buffer slice(long offset, long size)
	{
		auto p = garrow_buffer_slice(gArrowBuffer, offset, size);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Buffer)(cast(GArrowBuffer*) p, true);
	}
}
