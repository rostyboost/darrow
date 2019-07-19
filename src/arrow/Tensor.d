module arrow.Tensor;

private import arrow.Buffer;
private import arrow.DataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Tensor : ObjectG
{
	/** the main Gtk struct */
	protected GArrowTensor* gArrowTensor;

	/** Get the main Gtk struct */
	public GArrowTensor* getTensorStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowTensor;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowTensor;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowTensor* gArrowTensor, bool ownedRef = false)
	{
		this.gArrowTensor = gArrowTensor;
		super(cast(GObject*)gArrowTensor, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_tensor_get_type();
	}

	/**
	 *
	 * Params:
	 *     dataType = A #GArrowDataType that indicates each element type
	 *         in the tensor.
	 *     data = A #GArrowBuffer that contains tensor data.
	 *     shape = A list of dimension sizes.
	 *     strides = A list of the number of
	 *         bytes in each dimension.
	 *     dimentionNames = A list of
	 *         dimension names.
	 * Returns: The newly created #GArrowTensor.
	 *
	 * Since: 0.3.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(DataType dataType, Buffer data, long[] shape, long[] strides, string[] dimentionNames)
	{
		auto p = garrow_tensor_new((dataType is null) ? null : dataType.getDataTypeStruct(), (data is null) ? null : data.getBufferStruct(), shape.ptr, cast(size_t)shape.length, strides.ptr, cast(size_t)strides.length, Str.toStringzArray(dimentionNames), cast(size_t)dimentionNames.length);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowTensor*) p, true);
	}

	/**
	 *
	 * Params:
	 *     otherTensor = A #GArrowTensor to be compared.
	 * Returns: %TRUE if both of them have the same data, %FALSE
	 *     otherwise.
	 *
	 * Since: 0.4.0
	 */
	public bool equal(Tensor otherTensor)
	{
		return garrow_tensor_equal(gArrowTensor, (otherTensor is null) ? null : otherTensor.getTensorStruct()) != 0;
	}

	/**
	 * Returns: The data of the tensor.
	 *
	 * Since: 0.3.0
	 */
	public Buffer getBuffer()
	{
		auto p = garrow_tensor_get_buffer(gArrowTensor);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Buffer)(cast(GArrowBuffer*) p, true);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target dimension.
	 * Returns: The i-th dimension name of the tensor.
	 *
	 * Since: 0.3.0
	 */
	public string getDimensionName(int i)
	{
		return Str.toString(garrow_tensor_get_dimension_name(gArrowTensor, i));
	}

	/**
	 * Returns: The number of dimensions of the tensor.
	 *
	 * Since: 0.3.0
	 */
	public int getNDimensions()
	{
		return garrow_tensor_get_n_dimensions(gArrowTensor);
	}

	/**
	 * Returns: The shape of the tensor.
	 *
	 *     It should be freed with g_free() when no longer needed.
	 *
	 * Since: 0.3.0
	 */
	public long[] getShape()
	{
		int nDimensions;

		auto p = garrow_tensor_get_shape(gArrowTensor, &nDimensions);

		return p[0 .. nDimensions];
	}

	/**
	 * Returns: The number of value cells in the tensor.
	 *
	 * Since: 0.3.0
	 */
	public long getSize()
	{
		return garrow_tensor_get_size(gArrowTensor);
	}

	/**
	 * Returns: The strides of the tensor.
	 *
	 *     It should be freed with g_free() when no longer needed.
	 *
	 * Since: 0.3.0
	 */
	public long[] getStrides()
	{
		int nStrides;

		auto p = garrow_tensor_get_strides(gArrowTensor, &nStrides);

		return p[0 .. nStrides];
	}

	/**
	 * Returns: The data type of each value in the tensor.
	 *
	 * Since: 0.3.0
	 */
	public DataType getValueDataType()
	{
		auto p = garrow_tensor_get_value_data_type(gArrowTensor);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(DataType)(cast(GArrowDataType*) p, true);
	}

	/**
	 * Returns: The type of each value in the tensor.
	 *
	 * Since: 0.3.0
	 */
	public GArrowType getValueType()
	{
		return garrow_tensor_get_value_type(gArrowTensor);
	}

	/**
	 * Returns: %TRUE if the tensor is column major a.k.a. Fortran order,
	 *     %FALSE otherwise.
	 *
	 * Since: 0.3.0
	 */
	public bool isColumnMajor()
	{
		return garrow_tensor_is_column_major(gArrowTensor) != 0;
	}

	/**
	 * Returns: %TRUE if the tensor is contiguous, %FALSE otherwise.
	 *
	 * Since: 0.3.0
	 */
	public bool isContiguous()
	{
		return garrow_tensor_is_contiguous(gArrowTensor) != 0;
	}

	/**
	 * Returns: %TRUE if the tensor is mutable, %FALSE otherwise.
	 *
	 * Since: 0.3.0
	 */
	public bool isMutable()
	{
		return garrow_tensor_is_mutable(gArrowTensor) != 0;
	}

	/**
	 * Returns: %TRUE if the tensor is row major a.k.a. C order,
	 *     %FALSE otherwise.
	 *
	 * Since: 0.3.0
	 */
	public bool isRowMajor()
	{
		return garrow_tensor_is_row_major(gArrowTensor) != 0;
	}
}
