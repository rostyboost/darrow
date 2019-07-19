module arrow.CompressedOutputStream;

private import arrow.Codec;
private import arrow.OutputStream;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class CompressedOutputStream : OutputStream
{
	/** the main Gtk struct */
	protected GArrowCompressedOutputStream* gArrowCompressedOutputStream;

	/** Get the main Gtk struct */
	public GArrowCompressedOutputStream* getCompressedOutputStreamStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowCompressedOutputStream;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowCompressedOutputStream;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowCompressedOutputStream* gArrowCompressedOutputStream, bool ownedRef = false)
	{
		this.gArrowCompressedOutputStream = gArrowCompressedOutputStream;
		super(cast(GArrowOutputStream*)gArrowCompressedOutputStream, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_compressed_output_stream_get_type();
	}

	/**
	 *
	 * Params:
	 *     codec = A #GArrowCodec for compressed data in the @raw.
	 *     raw = A #GArrowOutputStream that is a sink for compressed data.
	 * Returns: A newly created #GArrowCompressedOutputStream.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Codec codec, OutputStream raw)
	{
		GError* err = null;

		auto p = garrow_compressed_output_stream_new((codec is null) ? null : codec.getCodecStruct(), (raw is null) ? null : raw.getOutputStreamStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowCompressedOutputStream*) p, true);
	}
}
