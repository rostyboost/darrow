module arrow.c.types;

public import gio.c.types;
public import glib.c.types;
public import gobject.c.types;


/**
 * They are corresponding to `arrow::compute::CompareOperator` values.
 */
public enum GArrowCompareOperator
{
	/**
	 * Equal operator.
	 */
	EQUAL = 0,
	/**
	 * Not equal operator.
	 */
	NOT_EQUAL = 1,
	/**
	 * Greater operator.
	 */
	GREATER = 2,
	/**
	 * Greater equal operator.
	 */
	GREATER_EQUAL = 3,
	/**
	 * Less operator.
	 */
	LESS = 4,
	/**
	 * Less equal operator.
	 */
	LESS_EQUAL = 5,
}
alias GArrowCompareOperator CompareOperator;

/**
 * They are corresponding to `arrow::Compression::type` values.
 */
public enum GArrowCompressionType
{
	/**
	 * Not compressed.
	 */
	UNCOMPRESSED = 0,
	/**
	 * Snappy compression.
	 */
	SNAPPY = 1,
	/**
	 * gzip compression.
	 */
	GZIP = 2,
	/**
	 * Brotli compression.
	 */
	BROTLI = 3,
	/**
	 * Zstandard compression.
	 */
	ZSTD = 4,
	/**
	 * LZ4 compression.
	 */
	LZ4 = 5,
	/**
	 * LZO compression.
	 */
	LZO = 6,
	/**
	 * bzip2 compression.
	 */
	BZ2 = 7,
}
alias GArrowCompressionType CompressionType;

/**
 * They are corresponding to `arrow::compute::CountOptions::mode` values.
 */
public enum GArrowCountMode
{
	/**
	 * Count all non-null values.
	 */
	ALL = 0,
	/**
	 * Count all null values.
	 */
	NULL = 1,
}
alias GArrowCountMode CountMode;

/**
 * The error codes are used by all arrow-glib functions.
 *
 * They are corresponding to `arrow::Status` values.
 */
public enum GArrowError
{
	/**
	 * Out of memory error.
	 */
	OUT_OF_MEMORY = 1,
	/**
	 * Key error.
	 */
	KEY = 2,
	/**
	 * Type error.
	 */
	TYPE = 3,
	/**
	 * Invalid value error.
	 */
	INVALID = 4,
	/**
	 * IO error.
	 */
	IO = 5,
	/**
	 * Capacity error.
	 */
	CAPACITY = 6,
	/**
	 * Index error.
	 */
	INDEX = 7,
	/**
	 * Unknown error.
	 */
	UNKNOWN = 9,
	/**
	 * The feature is not implemented.
	 */
	NOT_IMPLEMENTED = 10,
	/**
	 * Serialization error.
	 */
	SERIALIZATION = 11,
	/**
	 * Python error.
	 */
	PYTHON = 12,
	/**
	 * Object already exists on Plasma.
	 */
	PLASMA_OBJECT_EXISTS = 20,
	/**
	 * Object doesn't exist on Plasma.
	 */
	PLASMA_OBJECT_NONEXISTENT = 21,
	/**
	 * Store full error on Plasma.
	 */
	PLASMA_STORE_FULL = 22,
	/**
	 * Object already sealed on Plasma.
	 */
	PLASMA_OBJECT_ALREADY_SEALED = 23,
	/**
	 * Error generating code for expression evaluation
	 * in Gandiva.
	 */
	CODE_GENERATION = 40,
	/**
	 * Validation errors in expression given for code generation.
	 */
	EXPRESSION_VALIDATION = 41,
	/**
	 * Execution error while evaluating the expression against a record batch.
	 */
	EXECUTION = 42,
}
alias GArrowError Error;

/**
 * They are corresponding to `arrow::io::FileMode::type` values.
 */
public enum GArrowFileMode
{
	/**
	 * For read.
	 */
	READ = 0,
	/**
	 * For write.
	 */
	WRITE = 1,
	/**
	 * For read-write.
	 */
	READWRITE = 2,
}
alias GArrowFileMode FileMode;

/**
 * They are corresponding to `arrow::json::UnexpectedFieldBehavior` values.
 */
public enum GArrowJSONReadUnexpectedFieldBehavior
{
	/**
	 * Ignore other fields.
	 */
	IGNORE = 0,
	/**
	 * Return error.
	 */
	ERROR = 1,
	/**
	 * Infer a type.
	 */
	INFER_TYPE = 2,
}
alias GArrowJSONReadUnexpectedFieldBehavior JSONReadUnexpectedFieldBehavior;

/**
 * They are corresponding to `arrow::ipc::MetadataVersion::type`
 * values.
 */
public enum GArrowMetadataVersion
{
	/**
	 * Version 1.
	 */
	V1 = 0,
	/**
	 * Version 2.
	 */
	V2 = 1,
	/**
	 * Version 3.
	 */
	V3 = 2,
}
alias GArrowMetadataVersion MetadataVersion;

/**
 * They are corresponding to `arrow::TimeUnit::type` values.
 */
public enum GArrowTimeUnit
{
	/**
	 * Second.
	 */
	SECOND = 0,
	/**
	 * Millisecond.
	 */
	MILLI = 1,
	/**
	 * Microsecond.
	 */
	MICRO = 2,
	/**
	 * Nanosecond.
	 */
	NANO = 3,
}
alias GArrowTimeUnit TimeUnit;

/**
 * They are corresponding to `arrow::Type::type` values.
 */
public enum GArrowType
{
	/**
	 * A degenerate NULL type represented as 0 bytes/bits.
	 */
	NA = 0,
	/**
	 * A boolean value represented as 1 bit.
	 */
	BOOLEAN = 1,
	/**
	 * Little-endian 8bit unsigned integer.
	 */
	UINT8 = 2,
	/**
	 * Little-endian 8bit signed integer.
	 */
	INT8 = 3,
	/**
	 * Little-endian 16bit unsigned integer.
	 */
	UINT16 = 4,
	/**
	 * Little-endian 16bit signed integer.
	 */
	INT16 = 5,
	/**
	 * Little-endian 32bit unsigned integer.
	 */
	UINT32 = 6,
	/**
	 * Little-endian 32bit signed integer.
	 */
	INT32 = 7,
	/**
	 * Little-endian 64bit unsigned integer.
	 */
	UINT64 = 8,
	/**
	 * Little-endian 64bit signed integer.
	 */
	INT64 = 9,
	/**
	 * 2-byte floating point value.
	 */
	HALF_FLOAT = 10,
	/**
	 * 4-byte floating point value.
	 */
	FLOAT = 11,
	/**
	 * 8-byte floating point value.
	 */
	DOUBLE = 12,
	/**
	 * UTF-8 variable-length string.
	 */
	STRING = 13,
	/**
	 * Variable-length bytes (no guarantee of UTF-8-ness).
	 */
	BINARY = 14,
	/**
	 * Fixed-size binary. Each value occupies
	 * the same number of bytes.
	 */
	FIXED_SIZE_BINARY = 15,
	/**
	 * int32 days since the UNIX epoch.
	 */
	DATE32 = 16,
	/**
	 * int64 milliseconds since the UNIX epoch.
	 */
	DATE64 = 17,
	/**
	 * Exact timestamp encoded with int64 since UNIX epoch.
	 * Default unit millisecond.
	 */
	TIMESTAMP = 18,
	/**
	 * Exact time encoded with int32, supporting seconds or milliseconds
	 */
	TIME32 = 19,
	/**
	 * Exact time encoded with int64, supporting micro- or nanoseconds
	 */
	TIME64 = 20,
	/**
	 * YEAR_MONTH or DAY_TIME interval in SQL style.
	 */
	INTERVAL = 21,
	/**
	 * Precision- and scale-based decimal
	 * type. Storage type depends on the parameters.
	 */
	DECIMAL = 22,
	/**
	 * A list of some logical data type.
	 */
	LIST = 23,
	/**
	 * Struct of logical types.
	 */
	STRUCT = 24,
	/**
	 * Unions of logical types.
	 */
	UNION = 25,
	/**
	 * Dictionary aka Category type.
	 */
	DICTIONARY = 26,
}
alias GArrowType Type;

struct GArrowArray
{
	GObject parentInstance;
}

struct GArrowArrayBuilder
{
	GObject parentInstance;
}

struct GArrowArrayBuilderClass
{
	GObjectClass parentClass;
}

struct GArrowArrayClass
{
	GObjectClass parentClass;
}

struct GArrowBinaryArray
{
	GArrowArray parentInstance;
}

struct GArrowBinaryArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowBinaryArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowBinaryArrayClass
{
	GArrowArrayClass parentClass;
}

struct GArrowBinaryDataType
{
	GArrowDataType parentInstance;
}

struct GArrowBinaryDataTypeClass
{
	GArrowDataTypeClass parentClass;
}

struct GArrowBooleanArray
{
	GArrowPrimitiveArray parentInstance;
}

struct GArrowBooleanArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowBooleanArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowBooleanArrayClass
{
	GArrowPrimitiveArrayClass parentClass;
}

struct GArrowBooleanDataType
{
	GArrowFixedWidthDataType parentInstance;
}

struct GArrowBooleanDataTypeClass
{
	GArrowFixedWidthDataTypeClass parentClass;
}

struct GArrowBuffer
{
	GObject parentInstance;
}

struct GArrowBufferClass
{
	GObjectClass parentClass;
}

struct GArrowBufferInputStream
{
	GArrowSeekableInputStream parentInstance;
}

struct GArrowBufferInputStreamClass
{
	GArrowSeekableInputStreamClass parentClass;
}

struct GArrowBufferOutputStream
{
	GArrowOutputStream parentInstance;
}

struct GArrowBufferOutputStreamClass
{
	GArrowOutputStreamClass parentClass;
}

struct GArrowCSVReadOptions
{
	GObject parentInstance;
}

struct GArrowCSVReadOptionsClass
{
	GObjectClass parentClass;
}

struct GArrowCSVReader
{
	GObject parentInstance;
}

struct GArrowCSVReaderClass
{
	GObjectClass parentClass;
}

struct GArrowCastOptions
{
	GObject parentInstance;
}

struct GArrowCastOptionsClass
{
	GObjectClass parentClass;
}

struct GArrowChunkedArray
{
	GObject parentInstance;
}

struct GArrowChunkedArrayClass
{
	GObjectClass parentClass;
}

struct GArrowCodec
{
	GObject parentInstance;
}

struct GArrowCodecClass
{
	GObjectClass parentClass;
}

struct GArrowColumn
{
	GObject parentInstance;
}

struct GArrowColumnClass
{
	GObjectClass parentClass;
}

struct GArrowCompareOptions
{
	GObject parentInstance;
}

struct GArrowCompareOptionsClass
{
	GObjectClass parentClass;
}

struct GArrowCompressedInputStream
{
	GArrowInputStream parentInstance;
}

struct GArrowCompressedInputStreamClass
{
	GArrowInputStreamClass parentClass;
}

struct GArrowCompressedOutputStream
{
	GArrowOutputStream parentInstance;
}

struct GArrowCompressedOutputStreamClass
{
	GArrowOutputStreamClass parentClass;
}

struct GArrowCountOptions
{
	GObject parentInstance;
}

struct GArrowCountOptionsClass
{
	GObjectClass parentClass;
}

struct GArrowDataType
{
	GObject parentInstance;
}

struct GArrowDataTypeClass
{
	GObjectClass parentClass;
}

struct GArrowDate32Array
{
	GArrowNumericArray parentInstance;
}

struct GArrowDate32ArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowDate32ArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowDate32ArrayClass
{
	GArrowNumericArrayClass parentClass;
}

struct GArrowDate32DataType
{
	GArrowDataType parentInstance;
}

struct GArrowDate32DataTypeClass
{
	GArrowDataTypeClass parentClass;
}

struct GArrowDate64Array
{
	GArrowNumericArray parentInstance;
}

struct GArrowDate64ArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowDate64ArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowDate64ArrayClass
{
	GArrowNumericArrayClass parentClass;
}

struct GArrowDate64DataType
{
	GArrowDataType parentInstance;
}

struct GArrowDate64DataTypeClass
{
	GArrowDataTypeClass parentClass;
}

struct GArrowDecimal128
{
	GObject parentInstance;
}

struct GArrowDecimal128Array
{
	GArrowFixedSizeBinaryArray parentInstance;
}

struct GArrowDecimal128ArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowDecimal128ArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowDecimal128ArrayClass
{
	GArrowFixedSizeBinaryArrayClass parentClass;
}

struct GArrowDecimal128Class
{
	GObjectClass parentClass;
}

struct GArrowDecimal128DataType
{
	GArrowDecimalDataType parentInstance;
}

struct GArrowDecimal128DataTypeClass
{
	GArrowDecimalDataTypeClass parentClass;
}

struct GArrowDecimalDataType
{
	GArrowFixedSizeBinaryDataType parentInstance;
}

struct GArrowDecimalDataTypeClass
{
	GArrowFixedSizeBinaryDataTypeClass parentClass;
}

struct GArrowDenseUnionArray
{
	GArrowUnionArray parentInstance;
}

struct GArrowDenseUnionArrayClass
{
	GArrowUnionArrayClass parentClass;
}

struct GArrowDenseUnionDataType
{
	GArrowUnionDataType parentInstance;
}

struct GArrowDenseUnionDataTypeClass
{
	GArrowUnionDataTypeClass parentClass;
}

struct GArrowDictionaryArray
{
	GArrowArray parentInstance;
}

struct GArrowDictionaryArrayClass
{
	GArrowArrayClass parentClass;
}

struct GArrowDictionaryDataType
{
	GArrowFixedWidthDataType parentInstance;
}

struct GArrowDictionaryDataTypeClass
{
	GArrowFixedWidthDataTypeClass parentClass;
}

struct GArrowDoubleArray
{
	GArrowNumericArray parentInstance;
}

struct GArrowDoubleArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowDoubleArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowDoubleArrayClass
{
	GArrowNumericArrayClass parentClass;
}

struct GArrowDoubleDataType
{
	GArrowFloatingPointDataType parentInstance;
}

struct GArrowDoubleDataTypeClass
{
	GArrowFloatingPointDataTypeClass parentClass;
}

struct GArrowFeatherFileReader
{
	GObject parentInstance;
}

struct GArrowFeatherFileReaderClass
{
	GObjectClass parentClass;
}

struct GArrowFeatherFileWriter
{
	GObject parentInstance;
}

struct GArrowFeatherFileWriterClass
{
	GObjectClass parentClass;
}

struct GArrowField
{
	GObject parentInstance;
}

struct GArrowFieldClass
{
	GObjectClass parentClass;
}

struct GArrowFile;

struct GArrowFileInterface;

struct GArrowFileOutputStream
{
	GArrowOutputStream parentInstance;
}

struct GArrowFileOutputStreamClass
{
	GArrowOutputStreamClass parentClass;
}

struct GArrowFixedSizeBinaryArray
{
	GArrowPrimitiveArray parentInstance;
}

struct GArrowFixedSizeBinaryArrayClass
{
	GArrowPrimitiveArrayClass parentClass;
}

struct GArrowFixedSizeBinaryDataType
{
	GArrowDataType parentInstance;
}

struct GArrowFixedSizeBinaryDataTypeClass
{
	GArrowFixedWidthDataTypeClass parentClass;
}

struct GArrowFixedWidthDataType
{
	GArrowDataType parentInstance;
}

struct GArrowFixedWidthDataTypeClass
{
	GArrowDataTypeClass parentClass;
}

struct GArrowFloatArray
{
	GArrowNumericArray parentInstance;
}

struct GArrowFloatArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowFloatArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowFloatArrayClass
{
	GArrowNumericArrayClass parentClass;
}

struct GArrowFloatDataType
{
	GArrowFloatingPointDataType parentInstance;
}

struct GArrowFloatDataTypeClass
{
	GArrowFloatingPointDataTypeClass parentClass;
}

struct GArrowFloatingPointDataType
{
	GArrowNumericDataType parentInstance;
}

struct GArrowFloatingPointDataTypeClass
{
	GArrowNumericDataTypeClass parentClass;
}

struct GArrowGIOInputStream
{
	GArrowSeekableInputStream parentInstance;
}

struct GArrowGIOInputStreamClass
{
	GArrowSeekableInputStreamClass parentClass;
}

struct GArrowGIOOutputStream
{
	GArrowOutputStream parentInstance;
}

struct GArrowGIOOutputStreamClass
{
	GArrowOutputStreamClass parentClass;
}

struct GArrowInputStream
{
	GInputStream parentInstance;
}

struct GArrowInputStreamClass
{
	GInputStreamClass parentClass;
}

struct GArrowInt16Array
{
	GArrowNumericArray parentInstance;
}

struct GArrowInt16ArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowInt16ArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowInt16ArrayClass
{
	GArrowNumericArrayClass parentClass;
}

struct GArrowInt16DataType
{
	GArrowIntegerDataType parentInstance;
}

struct GArrowInt16DataTypeClass
{
	GArrowIntegerDataTypeClass parentClass;
}

struct GArrowInt32Array
{
	GArrowNumericArray parentInstance;
}

struct GArrowInt32ArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowInt32ArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowInt32ArrayClass
{
	GArrowNumericArrayClass parentClass;
}

struct GArrowInt32DataType
{
	GArrowIntegerDataType parentInstance;
}

struct GArrowInt32DataTypeClass
{
	GArrowIntegerDataTypeClass parentClass;
}

struct GArrowInt64Array
{
	GArrowNumericArray parentInstance;
}

struct GArrowInt64ArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowInt64ArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowInt64ArrayClass
{
	GArrowNumericArrayClass parentClass;
}

struct GArrowInt64DataType
{
	GArrowIntegerDataType parentInstance;
}

struct GArrowInt64DataTypeClass
{
	GArrowIntegerDataTypeClass parentClass;
}

struct GArrowInt8Array
{
	GArrowNumericArray parentInstance;
}

struct GArrowInt8ArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowInt8ArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowInt8ArrayClass
{
	GArrowNumericArrayClass parentClass;
}

struct GArrowInt8DataType
{
	GArrowIntegerDataType parentInstance;
}

struct GArrowInt8DataTypeClass
{
	GArrowIntegerDataTypeClass parentClass;
}

struct GArrowIntArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowIntArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowIntegerDataType
{
	GArrowNumericDataType parentInstance;
}

struct GArrowIntegerDataTypeClass
{
	GArrowNumericDataTypeClass parentClass;
}

struct GArrowJSONReadOptions
{
	GObject parentInstance;
}

struct GArrowJSONReadOptionsClass
{
	GObjectClass parentClass;
}

struct GArrowJSONReader
{
	GObject parentInstance;
}

struct GArrowJSONReaderClass
{
	GObjectClass parentClass;
}

struct GArrowListArray
{
	GArrowArray parentInstance;
}

struct GArrowListArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowListArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowListArrayClass
{
	GArrowArrayClass parentClass;
}

struct GArrowListDataType
{
	GArrowDataType parentInstance;
}

struct GArrowListDataTypeClass
{
	GArrowDataTypeClass parentClass;
}

struct GArrowMemoryMappedInputStream
{
	GArrowSeekableInputStream parentInstance;
}

struct GArrowMemoryMappedInputStreamClass
{
	GArrowSeekableInputStreamClass parentClass;
}

struct GArrowMutableBuffer
{
	GArrowBuffer parentInstance;
}

struct GArrowMutableBufferClass
{
	GArrowBufferClass parentClass;
}

struct GArrowNullArray
{
	GArrowArray parentInstance;
}

struct GArrowNullArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowNullArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowNullArrayClass
{
	GArrowArrayClass parentClass;
}

struct GArrowNullDataType
{
	GArrowDataType parentInstance;
}

struct GArrowNullDataTypeClass
{
	GArrowDataTypeClass parentClass;
}

struct GArrowNumericArray
{
	GArrowPrimitiveArray parentInstance;
}

struct GArrowNumericArrayClass
{
	GArrowPrimitiveArrayClass parentClass;
}

struct GArrowNumericDataType
{
	GArrowFixedWidthDataType parentInstance;
}

struct GArrowNumericDataTypeClass
{
	GArrowFixedWidthDataTypeClass parentClass;
}

struct GArrowORCFileReader
{
	GObject parentInstance;
}

struct GArrowORCFileReaderClass
{
	GObjectClass parentClass;
}

struct GArrowOutputStream
{
	GObject parentInstance;
}

struct GArrowOutputStreamClass
{
	GObjectClass parentClass;
}

struct GArrowPrimitiveArray
{
	GArrowArray parentInstance;
}

struct GArrowPrimitiveArrayClass
{
	GArrowArrayClass parentClass;
}

struct GArrowReadable;

struct GArrowReadableInterface;

struct GArrowRecordBatch
{
	GObject parentInstance;
}

struct GArrowRecordBatchBuilder
{
	GObject parentInstance;
}

struct GArrowRecordBatchBuilderClass
{
	GObjectClass parentClass;
}

struct GArrowRecordBatchClass
{
	GObjectClass parentClass;
}

struct GArrowRecordBatchFileReader
{
	GObject parentInstance;
}

struct GArrowRecordBatchFileReaderClass
{
	GObjectClass parentClass;
}

struct GArrowRecordBatchFileWriter
{
	GArrowRecordBatchStreamWriter parentInstance;
}

struct GArrowRecordBatchFileWriterClass
{
	GArrowRecordBatchStreamWriterClass parentClass;
}

struct GArrowRecordBatchReader
{
	GObject parentInstance;
}

struct GArrowRecordBatchReaderClass
{
	GObjectClass parentClass;
}

struct GArrowRecordBatchStreamReader
{
	GArrowRecordBatchReader parentInstance;
}

struct GArrowRecordBatchStreamReaderClass
{
	GArrowRecordBatchReaderClass parentClass;
}

struct GArrowRecordBatchStreamWriter
{
	GArrowRecordBatchWriter parentInstance;
}

struct GArrowRecordBatchStreamWriterClass
{
	GArrowRecordBatchWriterClass parentClass;
}

struct GArrowRecordBatchWriter
{
	GObject parentInstance;
}

struct GArrowRecordBatchWriterClass
{
	GObjectClass parentClass;
}

struct GArrowResizableBuffer
{
	GArrowMutableBuffer parentInstance;
}

struct GArrowResizableBufferClass
{
	GArrowMutableBufferClass parentClass;
}

struct GArrowSchema
{
	GObject parentInstance;
}

struct GArrowSchemaClass
{
	GObjectClass parentClass;
}

struct GArrowSeekableInputStream
{
	GArrowInputStream parentInstance;
}

struct GArrowSeekableInputStreamClass
{
	GArrowInputStreamClass parentClass;
}

struct GArrowSparseUnionArray
{
	GArrowUnionArray parentInstance;
}

struct GArrowSparseUnionArrayClass
{
	GArrowUnionArrayClass parentClass;
}

struct GArrowSparseUnionDataType
{
	GArrowUnionDataType parentInstance;
}

struct GArrowSparseUnionDataTypeClass
{
	GArrowUnionDataTypeClass parentClass;
}

struct GArrowStringArray
{
	GArrowBinaryArray parentInstance;
}

struct GArrowStringArrayBuilder
{
	GArrowBinaryArrayBuilder parentInstance;
}

struct GArrowStringArrayBuilderClass
{
	GArrowBinaryArrayBuilderClass parentClass;
}

struct GArrowStringArrayClass
{
	GArrowBinaryArrayClass parentClass;
}

struct GArrowStringDataType
{
	GArrowDataType parentInstance;
}

struct GArrowStringDataTypeClass
{
	GArrowDataTypeClass parentClass;
}

struct GArrowStructArray
{
	GArrowArray parentInstance;
}

struct GArrowStructArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowStructArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowStructArrayClass
{
	GArrowArrayClass parentClass;
}

struct GArrowStructDataType
{
	GArrowDataType parentInstance;
}

struct GArrowStructDataTypeClass
{
	GArrowDataTypeClass parentClass;
}

struct GArrowTable
{
	GObject parentInstance;
}

struct GArrowTableBatchReader
{
	GArrowRecordBatchReader parentInstance;
}

struct GArrowTableBatchReaderClass
{
	GArrowRecordBatchReaderClass parentClass;
}

struct GArrowTableClass
{
	GObjectClass parentClass;
}

struct GArrowTakeOptions
{
	GObject parentInstance;
}

struct GArrowTakeOptionsClass
{
	GObjectClass parentClass;
}

struct GArrowTensor
{
	GObject parentInstance;
}

struct GArrowTensorClass
{
	GObjectClass parentClass;
}

struct GArrowTime32Array
{
	GArrowNumericArray parentInstance;
}

struct GArrowTime32ArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowTime32ArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowTime32ArrayClass
{
	GArrowNumericArrayClass parentClass;
}

struct GArrowTime32DataType
{
	GArrowTimeDataType parentInstance;
}

struct GArrowTime32DataTypeClass
{
	GArrowTimeDataTypeClass parentClass;
}

struct GArrowTime64Array
{
	GArrowNumericArray parentInstance;
}

struct GArrowTime64ArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowTime64ArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowTime64ArrayClass
{
	GArrowNumericArrayClass parentClass;
}

struct GArrowTime64DataType
{
	GArrowTimeDataType parentInstance;
}

struct GArrowTime64DataTypeClass
{
	GArrowTimeDataTypeClass parentClass;
}

struct GArrowTimeDataType
{
	GArrowDataType parentInstance;
}

struct GArrowTimeDataTypeClass
{
	GArrowDataTypeClass parentClass;
}

struct GArrowTimestampArray
{
	GArrowNumericArray parentInstance;
}

struct GArrowTimestampArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowTimestampArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowTimestampArrayClass
{
	GArrowNumericArrayClass parentClass;
}

struct GArrowTimestampDataType
{
	GArrowDataType parentInstance;
}

struct GArrowTimestampDataTypeClass
{
	GArrowDataTypeClass parentClass;
}

struct GArrowUInt16Array
{
	GArrowNumericArray parentInstance;
}

struct GArrowUInt16ArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowUInt16ArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowUInt16ArrayClass
{
	GArrowNumericArrayClass parentClass;
}

struct GArrowUInt16DataType
{
	GArrowIntegerDataType parentInstance;
}

struct GArrowUInt16DataTypeClass
{
	GArrowIntegerDataTypeClass parentClass;
}

struct GArrowUInt32Array
{
	GArrowNumericArray parentInstance;
}

struct GArrowUInt32ArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowUInt32ArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowUInt32ArrayClass
{
	GArrowNumericArrayClass parentClass;
}

struct GArrowUInt32DataType
{
	GArrowIntegerDataType parentInstance;
}

struct GArrowUInt32DataTypeClass
{
	GArrowIntegerDataTypeClass parentClass;
}

struct GArrowUInt64Array
{
	GArrowNumericArray parentInstance;
}

struct GArrowUInt64ArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowUInt64ArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowUInt64ArrayClass
{
	GArrowNumericArrayClass parentClass;
}

struct GArrowUInt64DataType
{
	GArrowIntegerDataType parentInstance;
}

struct GArrowUInt64DataTypeClass
{
	GArrowIntegerDataTypeClass parentClass;
}

struct GArrowUInt8Array
{
	GArrowNumericArray parentInstance;
}

struct GArrowUInt8ArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowUInt8ArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowUInt8ArrayClass
{
	GArrowNumericArrayClass parentClass;
}

struct GArrowUInt8DataType
{
	GArrowIntegerDataType parentInstance;
}

struct GArrowUInt8DataTypeClass
{
	GArrowIntegerDataTypeClass parentClass;
}

struct GArrowUIntArrayBuilder
{
	GArrowArrayBuilder parentInstance;
}

struct GArrowUIntArrayBuilderClass
{
	GArrowArrayBuilderClass parentClass;
}

struct GArrowUnionArray
{
	GArrowArray parentInstance;
}

struct GArrowUnionArrayClass
{
	GArrowArrayClass parentClass;
}

struct GArrowUnionDataType
{
	GArrowDataType parentInstance;
}

struct GArrowUnionDataTypeClass
{
	GArrowDataTypeClass parentClass;
}

struct GArrowWritable;

struct GArrowWritableFile;

struct GArrowWritableFileInterface;

struct GArrowWritableInterface;

/**
 * The major version.
 */
enum VERSION_MAJOR = 0;
alias GARROW_VERSION_MAJOR = VERSION_MAJOR;

/**
 * The micro version.
 */
enum VERSION_MICRO = 0;
alias GARROW_VERSION_MICRO = VERSION_MICRO;

/**
 * The minor version.
 */
enum VERSION_MINOR = 14;
alias GARROW_VERSION_MINOR = VERSION_MINOR;

/**
 * The version tag. Normally, it's an empty string. It's "SNAPSHOT"
 * for snapshot version.
 */
enum VERSION_TAG = "";
alias GARROW_VERSION_TAG = VERSION_TAG;
