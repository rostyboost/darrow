module arrow.ChunkedArray;

private import arrow.Array;
private import arrow.DataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.ListG;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class ChunkedArray : ObjectG
{
	/** the main Gtk struct */
	protected GArrowChunkedArray* gArrowChunkedArray;

	/** Get the main Gtk struct */
	public GArrowChunkedArray* getChunkedArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowChunkedArray;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowChunkedArray;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowChunkedArray* gArrowChunkedArray, bool ownedRef = false)
	{
		this.gArrowChunkedArray = gArrowChunkedArray;
		super(cast(GObject*)gArrowChunkedArray, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_chunked_array_get_type();
	}

	/**
	 *
	 * Params:
	 *     chunks = The array chunks.
	 * Returns: A newly created #GArrowChunkedArray.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ListG chunks)
	{
		auto p = garrow_chunked_array_new((chunks is null) ? null : chunks.getListGStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowChunkedArray*) p, true);
	}

	/**
	 *
	 * Params:
	 *     otherChunkedArray = A #GArrowChunkedArray to be compared.
	 * Returns: %TRUE if both of them have the same data, %FALSE
	 *     otherwise.
	 *
	 * Since: 0.4.0
	 */
	public bool equal(ChunkedArray otherChunkedArray)
	{
		return garrow_chunked_array_equal(gArrowChunkedArray, (otherChunkedArray is null) ? null : otherChunkedArray.getChunkedArrayStruct()) != 0;
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target chunk.
	 * Returns: The i-th chunk of the chunked array.
	 */
	public Array getChunk(uint i)
	{
		auto p = garrow_chunked_array_get_chunk(gArrowChunkedArray, i);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Array)(cast(GArrowArray*) p, true);
	}

	/**
	 * Returns: The chunks in the chunked array.
	 */
	public ListG getChunks()
	{
		auto p = garrow_chunked_array_get_chunks(gArrowChunkedArray);

		if(p is null)
		{
			return null;
		}

		return new ListG(cast(GList*) p, true);
	}

	/**
	 *
	 *
	 * Deprecated: Use garrow_chunked_array_get_n_rows() instead.
	 *
	 * Returns: The total number of rows in the chunked array.
	 */
	public ulong getLength()
	{
		return garrow_chunked_array_get_length(gArrowChunkedArray);
	}

	/**
	 * Returns: The total number of chunks in the chunked array.
	 */
	public uint getNChunks()
	{
		return garrow_chunked_array_get_n_chunks(gArrowChunkedArray);
	}

	/**
	 * Returns: The total number of NULL in the chunked array.
	 */
	public ulong getNNulls()
	{
		return garrow_chunked_array_get_n_nulls(gArrowChunkedArray);
	}

	/**
	 * Returns: The total number of rows in the chunked array.
	 *
	 * Since: 1.0.0
	 */
	public ulong getNRows()
	{
		return garrow_chunked_array_get_n_rows(gArrowChunkedArray);
	}

	/**
	 * Returns: The #GArrowDataType of the value of
	 *     the chunked array.
	 *
	 * Since: 0.9.0
	 */
	public DataType getValueDataType()
	{
		auto p = garrow_chunked_array_get_value_data_type(gArrowChunkedArray);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(DataType)(cast(GArrowDataType*) p, true);
	}

	/**
	 * Returns: The #GArrowType of the value of the chunked array.
	 *
	 * Since: 0.9.0
	 */
	public GArrowType getValueType()
	{
		return garrow_chunked_array_get_value_type(gArrowChunkedArray);
	}

	/**
	 *
	 * Params:
	 *     offset = The offset of sub #GArrowChunkedArray.
	 *     length = The length of sub #GArrowChunkedArray.
	 * Returns: The sub #GArrowChunkedArray. It covers only from
	 *     `offset` to `offset + length` range. The sub #GArrowChunkedArray shares
	 *     values with the base #GArrowChunkedArray.
	 */
	public ChunkedArray slice(ulong offset, ulong length)
	{
		auto p = garrow_chunked_array_slice(gArrowChunkedArray, offset, length);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ChunkedArray)(cast(GArrowChunkedArray*) p, true);
	}

	/**
	 * Returns: The formatted chunked array content or %NULL on error.
	 *
	 *     The returned string should be freed when with g_free() when no
	 *     longer needed.
	 *
	 * Since: 0.11.0
	 *
	 * Throws: GException on failure.
	 */
	public override string toString()
	{
		GError* err = null;

		auto retStr = garrow_chunked_array_to_string(gArrowChunkedArray, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}
}
