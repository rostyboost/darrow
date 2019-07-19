module arrow.MutableBuffer;

private import arrow.Buffer;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.Bytes;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class MutableBuffer : Buffer
{
	/** the main Gtk struct */
	protected GArrowMutableBuffer* gArrowMutableBuffer;

	/** Get the main Gtk struct */
	public GArrowMutableBuffer* getMutableBufferStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowMutableBuffer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowMutableBuffer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowMutableBuffer* gArrowMutableBuffer, bool ownedRef = false)
	{
		this.gArrowMutableBuffer = gArrowMutableBuffer;
		super(cast(GArrowBuffer*)gArrowMutableBuffer, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_mutable_buffer_get_type();
	}

	/**
	 *
	 * Params:
	 *     data = Data for the buffer.
	 *         They aren't owned by the new buffer.
	 *         You must not free the data while the new buffer is alive.
	 * Returns: A newly created #GArrowMutableBuffer.
	 *
	 * Since: 0.3.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ubyte[] data)
	{
		auto p = garrow_mutable_buffer_new(data.ptr, cast(long)data.length);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowMutableBuffer*) p, true);
	}

	/**
	 *
	 * Params:
	 *     data = Data for the buffer.
	 * Returns: A newly created #GArrowMutableBuffer.
	 *
	 * Since: 0.9.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Bytes data)
	{
		auto p = garrow_mutable_buffer_new_bytes((data is null) ? null : data.getBytesStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new_bytes");
		}

		this(cast(GArrowMutableBuffer*) p, true);
	}

	/**
	 *
	 * Params:
	 *     offset = A write offset in the buffer data in byte.
	 *     data = The data to be written.
	 * Returns: %TRUE on success, %FALSE otherwise.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public bool setData(long offset, ubyte[] data)
	{
		GError* err = null;

		auto p = garrow_mutable_buffer_set_data(gArrowMutableBuffer, offset, data.ptr, cast(long)data.length, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 *
	 * Params:
	 *     offset = An offset in the buffer data in byte.
	 *     size = The number of bytes of the sliced data.
	 * Returns: A newly created #GArrowMutableBuffer that
	 *     shares data of the base #GArrowMutableBuffer. The created
	 *     #GArrowMutableBuffer has data start with offset from the base
	 *     buffer data and are the specified bytes size.
	 *
	 * Since: 0.3.0
	 */
	public override MutableBuffer slice(long offset, long size)
	{
		auto p = garrow_mutable_buffer_slice(gArrowMutableBuffer, offset, size);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MutableBuffer)(cast(GArrowMutableBuffer*) p, true);
	}
}
