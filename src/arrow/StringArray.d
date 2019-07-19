module arrow.StringArray;

private import arrow.BinaryArray;
private import arrow.Buffer;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class StringArray : BinaryArray
{
	/** the main Gtk struct */
	protected GArrowStringArray* gArrowStringArray;

	/** Get the main Gtk struct */
	public GArrowStringArray* getStringArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowStringArray;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowStringArray;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowStringArray* gArrowStringArray, bool ownedRef = false)
	{
		this.gArrowStringArray = gArrowStringArray;
		super(cast(GArrowBinaryArray*)gArrowStringArray, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_string_array_get_type();
	}

	/**
	 *
	 * Params:
	 *     length = The number of elements.
	 *     valueOffsets = The value offsets of @data in Arrow format.
	 *     data = The binary data in Arrow format of the array.
	 *     nullBitmap = The bitmap that shows null elements. The
	 *         N-th element is null when the N-th bit is 0, not null otherwise.
	 *         If the array has no null elements, the bitmap must be %NULL and
	 *         @n_nulls is 0.
	 *     nNulls = The number of null elements. If -1 is specified, the
	 *         number of nulls are computed from @null_bitmap.
	 * Returns: A newly created #GArrowStringArray.
	 *
	 * Since: 0.4.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(long length, Buffer valueOffsets, Buffer data, Buffer nullBitmap, long nNulls)
	{
		auto p = garrow_string_array_new(length, (valueOffsets is null) ? null : valueOffsets.getBufferStruct(), (data is null) ? null : data.getBufferStruct(), (nullBitmap is null) ? null : nullBitmap.getBufferStruct(), nNulls);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowStringArray*) p, true);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target value.
	 * Returns: The i-th UTF-8 encoded string.
	 */
	public string getString(long i)
	{
		auto retStr = garrow_string_array_get_string(gArrowStringArray, i);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}
}
