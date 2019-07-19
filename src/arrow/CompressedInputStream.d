module arrow.CompressedInputStream;

private import arrow.Codec;
private import arrow.InputStream;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class CompressedInputStream : InputStream
{
	/** the main Gtk struct */
	protected GArrowCompressedInputStream* gArrowCompressedInputStream;

	/** Get the main Gtk struct */
	public GArrowCompressedInputStream* getCompressedInputStreamStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowCompressedInputStream;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowCompressedInputStream;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowCompressedInputStream* gArrowCompressedInputStream, bool ownedRef = false)
	{
		this.gArrowCompressedInputStream = gArrowCompressedInputStream;
		super(cast(GArrowInputStream*)gArrowCompressedInputStream, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_compressed_input_stream_get_type();
	}

	/**
	 *
	 * Params:
	 *     codec = A #GArrowCodec for compressed data in the @raw.
	 *     raw = A #GArrowInputStream that contains compressed data.
	 * Returns: A newly created #GArrowCompressedInputStream.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Codec codec, InputStream raw)
	{
		GError* err = null;

		auto p = garrow_compressed_input_stream_new((codec is null) ? null : codec.getCodecStruct(), (raw is null) ? null : raw.getArrowInputStreamStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowCompressedInputStream*) p, true);
	}
}
