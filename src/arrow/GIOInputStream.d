module arrow.GIOInputStream;

private import arrow.SeekableInputStream;
private import arrow.c.functions;
public  import arrow.c.types;
private import gio.InputStream;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * It's an input stream for `GInputStream`.
 */
public class GIOInputStream : SeekableInputStream
{
	/** the main Gtk struct */
	protected GArrowGIOInputStream* gArrowGIOInputStream;

	/** Get the main Gtk struct */
	public GArrowGIOInputStream* getGIOInputStreamStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowGIOInputStream;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowGIOInputStream;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowGIOInputStream* gArrowGIOInputStream, bool ownedRef = false)
	{
		this.gArrowGIOInputStream = gArrowGIOInputStream;
		super(cast(GArrowSeekableInputStream*)gArrowGIOInputStream, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_gio_input_stream_get_type();
	}

	/**
	 *
	 * Params:
	 *     gioInputStream = The stream to be read.
	 * Returns: A newly created #GArrowGIOInputStream.
	 *
	 * Since: 0.5.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(InputStream gioInputStream)
	{
		auto p = garrow_gio_input_stream_new((gioInputStream is null) ? null : gioInputStream.getInputStreamStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowGIOInputStream*) p, true);
	}

	/**
	 *
	 *
	 * Deprecated: Use GArrowGIOInputStream::raw property instead.
	 *
	 * Returns: The wrapped #GInputStream.
	 *
	 * Since: 0.5.0
	 */
	public InputStream getRaw()
	{
		auto p = garrow_gio_input_stream_get_raw(gArrowGIOInputStream);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(InputStream)(cast(GInputStream*) p);
	}
}
