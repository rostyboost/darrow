module arrow.OutputStream;

private import arrow.FileIF;
private import arrow.FileT;
private import arrow.Tensor;
private import arrow.WritableIF;
private import arrow.WritableT;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class OutputStream : ObjectG, FileIF, WritableIF
{
	/** the main Gtk struct */
	protected GArrowOutputStream* gArrowOutputStream;

	/** Get the main Gtk struct */
	public GArrowOutputStream* getOutputStreamStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowOutputStream;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowOutputStream;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowOutputStream* gArrowOutputStream, bool ownedRef = false)
	{
		this.gArrowOutputStream = gArrowOutputStream;
		super(cast(GObject*)gArrowOutputStream, ownedRef);
	}

	// add the File capabilities
	mixin FileT!(GArrowOutputStream);

	// add the Writable capabilities
	mixin WritableT!(GArrowOutputStream);


	/** */
	public static GType getType()
	{
		return garrow_output_stream_get_type();
	}

	/**
	 *
	 * Params:
	 *     alignment = The byte multiple for the metadata prefix, usually 8
	 *         or 64, to ensure the body starts on a multiple of that alignment.
	 * Returns: %TRUE on success, %FALSE on error.
	 *
	 * Since: 0.11.0
	 *
	 * Throws: GException on failure.
	 */
	public bool align_(int alignment)
	{
		GError* err = null;

		auto p = garrow_output_stream_align(gArrowOutputStream, alignment, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 *
	 * Params:
	 *     tensor = A #GArrowTensor to be written.
	 * Returns: The number of written bytes on success, -1 on error.
	 *
	 * Since: 0.4.0
	 *
	 * Throws: GException on failure.
	 */
	public long writeTensor(Tensor tensor)
	{
		GError* err = null;

		auto p = garrow_output_stream_write_tensor(gArrowOutputStream, (tensor is null) ? null : tensor.getTensorStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}
}
