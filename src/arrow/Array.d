module arrow.Array;

private import arrow.BooleanArray;
private import arrow.Buffer;
private import arrow.CastOptions;
private import arrow.ChunkedArray;
private import arrow.CountOptions;
private import arrow.DataType;
private import arrow.DictionaryArray;
private import arrow.StructArray;
private import arrow.TakeOptions;
private import arrow.UInt64Array;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Array : ObjectG
{
	/** the main Gtk struct */
	protected GArrowArray* gArrowArray;

	/** Get the main Gtk struct */
	public GArrowArray* getArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowArray;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowArray;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowArray* gArrowArray, bool ownedRef = false)
	{
		this.gArrowArray = gArrowArray;
		super(cast(GObject*)gArrowArray, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_array_get_type();
	}

	/**
	 *
	 * Params:
	 *     targetDataType = A #GArrowDataType of cast target data.
	 *     options = A #GArrowCastOptions.
	 * Returns: A newly created casted array on success, %NULL on error.
	 *
	 * Since: 0.7.0
	 *
	 * Throws: GException on failure.
	 */
	public Array cast_(DataType targetDataType, CastOptions options)
	{
		GError* err = null;

		auto p = garrow_array_cast(gArrowArray, (targetDataType is null) ? null : targetDataType.getDataTypeStruct(), (options is null) ? null : options.getCastOptionsStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Array)(cast(GArrowArray*) p, true);
	}

	/**
	 *
	 * Params:
	 *     options = A #GArrowCountOptions.
	 * Returns: The number of target values on success. If an error is occurred,
	 *     the returned value is untrustful value.
	 *
	 * Since: 0.13.0
	 *
	 * Throws: GException on failure.
	 */
	public long count(CountOptions options)
	{
		GError* err = null;

		auto p = garrow_array_count(gArrowArray, (options is null) ? null : options.getCountOptionsStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 * Returns: A #GArrowStructArray of `{input type "values", int64_t "counts"}`
	 *     on success, %NULL on error.
	 *
	 * Since: 0.13.0
	 *
	 * Throws: GException on failure.
	 */
	public StructArray countValues()
	{
		GError* err = null;

		auto p = garrow_array_count_values(gArrowArray, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(StructArray)(cast(GArrowStructArray*) p, true);
	}

	/**
	 * Returns: A newly created #GArrowDictionaryArray for the @array on success,
	 *     %NULL on error.
	 *
	 * Since: 0.8.0
	 *
	 * Throws: GException on failure.
	 */
	public DictionaryArray dictionaryEncode()
	{
		GError* err = null;

		auto p = garrow_array_dictionary_encode(gArrowArray, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(DictionaryArray)(cast(GArrowDictionaryArray*) p, true);
	}

	/**
	 *
	 * Params:
	 *     otherArray = A #GArrowArray to be compared.
	 * Returns: The string representation of
	 *     the difference between two arrays as unified format. If there is
	 *     no difference, the return value is %NULL.
	 *
	 *     It should be freed with g_free() when no longer needed.
	 *
	 * Since: 0.15.0
	 */
	public string diffUnified(Array otherArray)
	{
		auto retStr = garrow_array_diff_unified(gArrowArray, (otherArray is null) ? null : otherArray.getArrayStruct());

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 *
	 * Params:
	 *     otherArray = A #GArrowArray to be compared.
	 * Returns: %TRUE if both of them have the same data, %FALSE
	 *     otherwise.
	 *
	 * Since: 0.4.0
	 */
	public bool equal(Array otherArray)
	{
		return garrow_array_equal(gArrowArray, (otherArray is null) ? null : otherArray.getArrayStruct()) != 0;
	}

	/**
	 *
	 * Params:
	 *     otherArray = A #GArrowArray to be compared.
	 * Returns: %TRUE if both of them have the approx same data, %FALSE
	 *     otherwise.
	 *
	 * Since: 0.4.0
	 */
	public bool equalApprox(Array otherArray)
	{
		return garrow_array_equal_approx(gArrowArray, (otherArray is null) ? null : otherArray.getArrayStruct()) != 0;
	}

	/**
	 *
	 * Params:
	 *     startIndex = The start index of @array to be used.
	 *     otherArray = A #GArrowArray to be compared.
	 *     otherStartIndex = The start index of @other_array to be used.
	 *     endIndex = The end index of @array to be used. The end index of
	 *         @other_array is "@other_start_index + (@end_index -
	 *         @start_index)".
	 * Returns: %TRUE if both of them have the same data in the range,
	 *     %FALSE otherwise.
	 *
	 * Since: 0.4.0
	 */
	public bool equalRange(long startIndex, Array otherArray, long otherStartIndex, long endIndex)
	{
		return garrow_array_equal_range(gArrowArray, startIndex, (otherArray is null) ? null : otherArray.getArrayStruct(), otherStartIndex, endIndex) != 0;
	}

	/**
	 *
	 * Params:
	 *     filter = The values indicates which values should be filtered out.
	 * Returns: The #GArrowArray filterd
	 *     with a boolean selection filter. Nulls in the filter will
	 *     result in nulls in the output.
	 *
	 * Since: 0.15.0
	 *
	 * Throws: GException on failure.
	 */
	public Array filter(BooleanArray filter)
	{
		GError* err = null;

		auto p = garrow_array_filter(gArrowArray, (filter is null) ? null : filter.getBooleanArrayStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Array)(cast(GArrowArray*) p, true);
	}

	/**
	 * Returns: The number of rows in the array.
	 */
	public long getLength()
	{
		return garrow_array_get_length(gArrowArray);
	}

	/**
	 * Returns: The number of NULLs in the array.
	 */
	public long getNNulls()
	{
		return garrow_array_get_n_nulls(gArrowArray);
	}

	/**
	 * Returns: The bitmap that indicates null
	 *     value indices for the array as #GArrowBuffer or %NULL when
	 *     garrow_array_get_n_nulls() returns 0.
	 *
	 * Since: 0.3.0
	 */
	public Buffer getNullBitmap()
	{
		auto p = garrow_array_get_null_bitmap(gArrowArray);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Buffer)(cast(GArrowBuffer*) p, true);
	}

	/**
	 * Returns: The number of values in the array.
	 */
	public long getOffset()
	{
		return garrow_array_get_offset(gArrowArray);
	}

	/**
	 * Returns: The #GArrowDataType for each value of the
	 *     array.
	 *
	 * Since: 0.3.0
	 */
	public DataType getValueDataType()
	{
		auto p = garrow_array_get_value_data_type(gArrowArray);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(DataType)(cast(GArrowDataType*) p, true);
	}

	/**
	 * Returns: The #GArrowType for each value of the array.
	 *
	 * Since: 0.3.0
	 */
	public GArrowType getValueType()
	{
		return garrow_array_get_value_type(gArrowArray);
	}

	/**
	 *
	 * Params:
	 *     right = A right hand side #GArrowArray.
	 * Returns: The #GArrowBooleanArray
	 *     showing whether each element in the left array is contained
	 *     in right array.
	 *
	 * Since: 0.15.0
	 *
	 * Throws: GException on failure.
	 */
	public BooleanArray isIn(Array right)
	{
		GError* err = null;

		auto p = garrow_array_is_in(gArrowArray, (right is null) ? null : right.getArrayStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(BooleanArray)(cast(GArrowBooleanArray*) p, true);
	}

	/**
	 *
	 * Params:
	 *     right = A right hand side #GArrowChunkedArray.
	 * Returns: The #GArrowBooleanArray
	 *     showing whether each element in the left array is contained
	 *     in right chunked array.
	 *
	 * Since: 0.15.0
	 *
	 * Throws: GException on failure.
	 */
	public BooleanArray isInChunkedArray(ChunkedArray right)
	{
		GError* err = null;

		auto p = garrow_array_is_in_chunked_array(gArrowArray, (right is null) ? null : right.getChunkedArrayStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(BooleanArray)(cast(GArrowBooleanArray*) p, true);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target value.
	 * Returns: Whether the @i-th value is null or not.
	 *
	 * Since: 0.3.0
	 */
	public bool isNull(long i)
	{
		return garrow_array_is_null(gArrowArray, i) != 0;
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target value.
	 * Returns: Whether the @i-th value is valid (not null) or not.
	 *
	 * Since: 0.8.0
	 */
	public bool isValid(long i)
	{
		return garrow_array_is_valid(gArrowArray, i) != 0;
	}

	/**
	 *
	 * Params:
	 *     offset = The offset of sub #GArrowArray.
	 *     length = The length of sub #GArrowArray.
	 * Returns: The sub #GArrowArray. It covers only from
	 *     `offset` to `offset + length` range. The sub #GArrowArray shares
	 *     values with the base #GArrowArray.
	 */
	public Array slice(long offset, long length)
	{
		auto p = garrow_array_slice(gArrowArray, offset, length);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Array)(cast(GArrowArray*) p, true);
	}

	/**
	 * Returns: The indices that would sort
	 *     an array on success, %NULL on error.
	 *
	 * Since: 0.15.0
	 *
	 * Throws: GException on failure.
	 */
	public UInt64Array sortToIndices()
	{
		GError* err = null;

		auto p = garrow_array_sort_to_indices(gArrowArray, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(UInt64Array)(cast(GArrowUInt64Array*) p, true);
	}

	/**
	 *
	 * Params:
	 *     indices = The indices of values to take.
	 *     options = A #GArrowTakeOptions.
	 * Returns: The #GArrowArray taken from
	 *     an array of values at indices in input array or %NULL on error.
	 *
	 * Since: 0.14.0
	 *
	 * Throws: GException on failure.
	 */
	public Array take(Array indices, TakeOptions options)
	{
		GError* err = null;

		auto p = garrow_array_take(gArrowArray, (indices is null) ? null : indices.getArrayStruct(), (options is null) ? null : options.getTakeOptionsStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Array)(cast(GArrowArray*) p, true);
	}

	/**
	 * Returns: The formatted array content or %NULL on error.
	 *
	 *     The returned string should be freed when with g_free() when no
	 *     longer needed.
	 *
	 * Since: 0.4.0
	 *
	 * Throws: GException on failure.
	 */
	public override string toString()
	{
		GError* err = null;

		auto retStr = garrow_array_to_string(gArrowArray, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Returns: A newly created unique elements array on success, %NULL on error.
	 *
	 * Since: 0.8.0
	 *
	 * Throws: GException on failure.
	 */
	public Array unique()
	{
		GError* err = null;

		auto p = garrow_array_unique(gArrowArray, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Array)(cast(GArrowArray*) p, true);
	}

	/**
	 *
	 * Params:
	 *     returnType = A #GArrowDataType of the returned view.
	 * Returns: A zero-copy view of this array
	 *     with the given type. This method checks if the `return_type` are
	 *     layout-compatible.
	 *
	 * Since: 0.15.0
	 *
	 * Throws: GException on failure.
	 */
	public Array view(DataType returnType)
	{
		GError* err = null;

		auto p = garrow_array_view(gArrowArray, (returnType is null) ? null : returnType.getDataTypeStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Array)(cast(GArrowArray*) p, true);
	}
}
