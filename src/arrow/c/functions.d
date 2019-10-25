module arrow.c.functions;

import std.stdio;
import arrow.c.types;
version (Windows)
	static immutable LIBRARY_ARROW = ["glib-100.dll;g.dll;g.dll"];
else version (OSX)
	static immutable LIBRARY_ARROW = ["glib.100.dylib"];
else
	static immutable LIBRARY_ARROW = ["libarrow-glib.so.100"];

__gshared extern(C)
{

	// arrow.Array

	GType garrow_array_get_type();
	GArrowArray* garrow_array_cast(GArrowArray* array, GArrowDataType* targetDataType, GArrowCastOptions* options, GError** err);
	long garrow_array_count(GArrowArray* array, GArrowCountOptions* options, GError** err);
	GArrowStructArray* garrow_array_count_values(GArrowArray* array, GError** err);
	GArrowDictionaryArray* garrow_array_dictionary_encode(GArrowArray* array, GError** err);
	char* garrow_array_diff_unified(GArrowArray* array, GArrowArray* otherArray);
	int garrow_array_equal(GArrowArray* array, GArrowArray* otherArray);
	int garrow_array_equal_approx(GArrowArray* array, GArrowArray* otherArray);
	int garrow_array_equal_range(GArrowArray* array, long startIndex, GArrowArray* otherArray, long otherStartIndex, long endIndex);
	GArrowArray* garrow_array_filter(GArrowArray* array, GArrowBooleanArray* filter, GError** err);
	long garrow_array_get_length(GArrowArray* array);
	long garrow_array_get_n_nulls(GArrowArray* array);
	GArrowBuffer* garrow_array_get_null_bitmap(GArrowArray* array);
	long garrow_array_get_offset(GArrowArray* array);
	GArrowDataType* garrow_array_get_value_data_type(GArrowArray* array);
	GArrowType garrow_array_get_value_type(GArrowArray* array);
	GArrowBooleanArray* garrow_array_is_in(GArrowArray* left, GArrowArray* right, GError** err);
	GArrowBooleanArray* garrow_array_is_in_chunked_array(GArrowArray* left, GArrowChunkedArray* right, GError** err);
	int garrow_array_is_null(GArrowArray* array, long i);
	int garrow_array_is_valid(GArrowArray* array, long i);
	GArrowArray* garrow_array_slice(GArrowArray* array, long offset, long length);
	GArrowUInt64Array* garrow_array_sort_to_indices(GArrowArray* array, GError** err);
	GArrowArray* garrow_array_take(GArrowArray* array, GArrowArray* indices, GArrowTakeOptions* options, GError** err);
	char* garrow_array_to_string(GArrowArray* array, GError** err);
	GArrowArray* garrow_array_unique(GArrowArray* array, GError** err);
	GArrowArray* garrow_array_view(GArrowArray* array, GArrowDataType* returnType, GError** err);

	// arrow.ArrayBuilder

	GType garrow_array_builder_get_type();
	GArrowArray* garrow_array_builder_finish(GArrowArrayBuilder* builder, GError** err);
	GArrowDataType* garrow_array_builder_get_value_data_type(GArrowArrayBuilder* builder);
	GArrowType garrow_array_builder_get_value_type(GArrowArrayBuilder* builder);
	void garrow_array_builder_release_ownership(GArrowArrayBuilder* builder);

	// arrow.BinaryArray

	GType garrow_binary_array_get_type();
	GArrowBinaryArray* garrow_binary_array_new(long length, GArrowBuffer* valueOffsets, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls);
	GArrowBuffer* garrow_binary_array_get_buffer(GArrowBinaryArray* array);
	GArrowBuffer* garrow_binary_array_get_offsets_buffer(GArrowBinaryArray* array);
	GBytes* garrow_binary_array_get_value(GArrowBinaryArray* array, long i);

	// arrow.BinaryArrayBuilder

	GType garrow_binary_array_builder_get_type();
	GArrowBinaryArrayBuilder* garrow_binary_array_builder_new();
	int garrow_binary_array_builder_append(GArrowBinaryArrayBuilder* builder, ubyte* value, int length, GError** err);
	int garrow_binary_array_builder_append_null(GArrowBinaryArrayBuilder* builder, GError** err);
	int garrow_binary_array_builder_append_nulls(GArrowBinaryArrayBuilder* builder, long n, GError** err);
	int garrow_binary_array_builder_append_value(GArrowBinaryArrayBuilder* builder, ubyte* value, int length, GError** err);
	int garrow_binary_array_builder_append_value_bytes(GArrowBinaryArrayBuilder* builder, GBytes* value, GError** err);
	int garrow_binary_array_builder_append_values(GArrowBinaryArrayBuilder* builder, GBytes** values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.BinaryDataType

	GType garrow_binary_data_type_get_type();
	GArrowBinaryDataType* garrow_binary_data_type_new();

	// arrow.BooleanArray

	GType garrow_boolean_array_get_type();
	GArrowBooleanArray* garrow_boolean_array_new(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls);
	GArrowBooleanArray* garrow_boolean_array_and(GArrowBooleanArray* left, GArrowBooleanArray* right, GError** err);
	int garrow_boolean_array_get_value(GArrowBooleanArray* array, long i);
	int* garrow_boolean_array_get_values(GArrowBooleanArray* array, long* length);
	GArrowBooleanArray* garrow_boolean_array_invert(GArrowBooleanArray* array, GError** err);
	GArrowBooleanArray* garrow_boolean_array_or(GArrowBooleanArray* left, GArrowBooleanArray* right, GError** err);
	GArrowBooleanArray* garrow_boolean_array_xor(GArrowBooleanArray* left, GArrowBooleanArray* right, GError** err);

	// arrow.BooleanArrayBuilder

	GType garrow_boolean_array_builder_get_type();
	GArrowBooleanArrayBuilder* garrow_boolean_array_builder_new();
	int garrow_boolean_array_builder_append(GArrowBooleanArrayBuilder* builder, int value, GError** err);
	int garrow_boolean_array_builder_append_null(GArrowBooleanArrayBuilder* builder, GError** err);
	int garrow_boolean_array_builder_append_nulls(GArrowBooleanArrayBuilder* builder, long n, GError** err);
	int garrow_boolean_array_builder_append_value(GArrowBooleanArrayBuilder* builder, int value, GError** err);
	int garrow_boolean_array_builder_append_values(GArrowBooleanArrayBuilder* builder, int* values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.BooleanDataType

	GType garrow_boolean_data_type_get_type();
	GArrowBooleanDataType* garrow_boolean_data_type_new();

	// arrow.Buffer

	GType garrow_buffer_get_type();
	GArrowBuffer* garrow_buffer_new(ubyte* data, long size);
	GArrowBuffer* garrow_buffer_new_bytes(GBytes* data);
	GArrowBuffer* garrow_buffer_copy(GArrowBuffer* buffer, long start, long size, GError** err);
	int garrow_buffer_equal(GArrowBuffer* buffer, GArrowBuffer* otherBuffer);
	int garrow_buffer_equal_n_bytes(GArrowBuffer* buffer, GArrowBuffer* otherBuffer, long nBytes);
	long garrow_buffer_get_capacity(GArrowBuffer* buffer);
	GBytes* garrow_buffer_get_data(GArrowBuffer* buffer);
	GBytes* garrow_buffer_get_mutable_data(GArrowBuffer* buffer);
	GArrowBuffer* garrow_buffer_get_parent(GArrowBuffer* buffer);
	long garrow_buffer_get_size(GArrowBuffer* buffer);
	int garrow_buffer_is_mutable(GArrowBuffer* buffer);
	GArrowBuffer* garrow_buffer_slice(GArrowBuffer* buffer, long offset, long size);

	// arrow.BufferInputStream

	GType garrow_buffer_input_stream_get_type();
	GArrowBufferInputStream* garrow_buffer_input_stream_new(GArrowBuffer* buffer);
	GArrowBuffer* garrow_buffer_input_stream_get_buffer(GArrowBufferInputStream* inputStream);

	// arrow.BufferOutputStream

	GType garrow_buffer_output_stream_get_type();
	GArrowBufferOutputStream* garrow_buffer_output_stream_new(GArrowResizableBuffer* buffer);

	// arrow.CSVReadOptions

	GType garrow_csv_read_options_get_type();
	GArrowCSVReadOptions* garrow_csv_read_options_new();
	void garrow_csv_read_options_add_column_name(GArrowCSVReadOptions* options, const(char)* columnName);
	void garrow_csv_read_options_add_column_type(GArrowCSVReadOptions* options, const(char)* name, GArrowDataType* dataType);
	void garrow_csv_read_options_add_false_value(GArrowCSVReadOptions* options, const(char)* falseValue);
	void garrow_csv_read_options_add_null_value(GArrowCSVReadOptions* options, const(char)* nullValue);
	void garrow_csv_read_options_add_schema(GArrowCSVReadOptions* options, GArrowSchema* schema);
	void garrow_csv_read_options_add_true_value(GArrowCSVReadOptions* options, const(char)* trueValue);
	char** garrow_csv_read_options_get_column_names(GArrowCSVReadOptions* options);
	GHashTable* garrow_csv_read_options_get_column_types(GArrowCSVReadOptions* options);
	char** garrow_csv_read_options_get_false_values(GArrowCSVReadOptions* options);
	char** garrow_csv_read_options_get_null_values(GArrowCSVReadOptions* options);
	char** garrow_csv_read_options_get_true_values(GArrowCSVReadOptions* options);
	void garrow_csv_read_options_set_column_names(GArrowCSVReadOptions* options, char** columnNames, size_t nColumnNames);
	void garrow_csv_read_options_set_false_values(GArrowCSVReadOptions* options, char** falseValues, size_t nFalseValues);
	void garrow_csv_read_options_set_null_values(GArrowCSVReadOptions* options, char** nullValues, size_t nNullValues);
	void garrow_csv_read_options_set_true_values(GArrowCSVReadOptions* options, char** trueValues, size_t nTrueValues);

	// arrow.CSVReader

	GType garrow_csv_reader_get_type();
	GArrowCSVReader* garrow_csv_reader_new(GArrowInputStream* input, GArrowCSVReadOptions* options, GError** err);
	GArrowTable* garrow_csv_reader_read(GArrowCSVReader* reader, GError** err);

	// arrow.CastOptions

	GType garrow_cast_options_get_type();
	GArrowCastOptions* garrow_cast_options_new();

	// arrow.ChunkedArray

	GType garrow_chunked_array_get_type();
	GArrowChunkedArray* garrow_chunked_array_new(GList* chunks);
	int garrow_chunked_array_equal(GArrowChunkedArray* chunkedArray, GArrowChunkedArray* otherChunkedArray);
	GArrowArray* garrow_chunked_array_get_chunk(GArrowChunkedArray* chunkedArray, uint i);
	GList* garrow_chunked_array_get_chunks(GArrowChunkedArray* chunkedArray);
	ulong garrow_chunked_array_get_length(GArrowChunkedArray* chunkedArray);
	uint garrow_chunked_array_get_n_chunks(GArrowChunkedArray* chunkedArray);
	ulong garrow_chunked_array_get_n_nulls(GArrowChunkedArray* chunkedArray);
	ulong garrow_chunked_array_get_n_rows(GArrowChunkedArray* chunkedArray);
	GArrowDataType* garrow_chunked_array_get_value_data_type(GArrowChunkedArray* chunkedArray);
	GArrowType garrow_chunked_array_get_value_type(GArrowChunkedArray* chunkedArray);
	GArrowChunkedArray* garrow_chunked_array_slice(GArrowChunkedArray* chunkedArray, ulong offset, ulong length);
	char* garrow_chunked_array_to_string(GArrowChunkedArray* chunkedArray, GError** err);

	// arrow.Codec

	GType garrow_codec_get_type();
	GArrowCodec* garrow_codec_new(GArrowCompressionType type, GError** err);
	const(char)* garrow_codec_get_name(GArrowCodec* codec);

	// arrow.CompareOptions

	GType garrow_compare_options_get_type();
	GArrowCompareOptions* garrow_compare_options_new();

	// arrow.CompressedInputStream

	GType garrow_compressed_input_stream_get_type();
	GArrowCompressedInputStream* garrow_compressed_input_stream_new(GArrowCodec* codec, GArrowInputStream* raw, GError** err);

	// arrow.CompressedOutputStream

	GType garrow_compressed_output_stream_get_type();
	GArrowCompressedOutputStream* garrow_compressed_output_stream_new(GArrowCodec* codec, GArrowOutputStream* raw, GError** err);

	// arrow.CountOptions

	GType garrow_count_options_get_type();
	GArrowCountOptions* garrow_count_options_new();

	// arrow.DataType

	GType garrow_data_type_get_type();
	int garrow_data_type_equal(GArrowDataType* dataType, GArrowDataType* otherDataType);
	GArrowType garrow_data_type_get_id(GArrowDataType* dataType);
	char* garrow_data_type_to_string(GArrowDataType* dataType);

	// arrow.Date32Array

	GType garrow_date32_array_get_type();
	GArrowDate32Array* garrow_date32_array_new(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls);
	int garrow_date32_array_get_value(GArrowDate32Array* array, long i);
	int* garrow_date32_array_get_values(GArrowDate32Array* array, long* length);

	// arrow.Date32ArrayBuilder

	GType garrow_date32_array_builder_get_type();
	GArrowDate32ArrayBuilder* garrow_date32_array_builder_new();
	int garrow_date32_array_builder_append(GArrowDate32ArrayBuilder* builder, int value, GError** err);
	int garrow_date32_array_builder_append_null(GArrowDate32ArrayBuilder* builder, GError** err);
	int garrow_date32_array_builder_append_nulls(GArrowDate32ArrayBuilder* builder, long n, GError** err);
	int garrow_date32_array_builder_append_value(GArrowDate32ArrayBuilder* builder, int value, GError** err);
	int garrow_date32_array_builder_append_values(GArrowDate32ArrayBuilder* builder, int* values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.Date32DataType

	GType garrow_date32_data_type_get_type();
	GArrowDate32DataType* garrow_date32_data_type_new();

	// arrow.Date64Array

	GType garrow_date64_array_get_type();
	GArrowDate64Array* garrow_date64_array_new(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls);
	long garrow_date64_array_get_value(GArrowDate64Array* array, long i);
	long* garrow_date64_array_get_values(GArrowDate64Array* array, long* length);

	// arrow.Date64ArrayBuilder

	GType garrow_date64_array_builder_get_type();
	GArrowDate64ArrayBuilder* garrow_date64_array_builder_new();
	int garrow_date64_array_builder_append(GArrowDate64ArrayBuilder* builder, long value, GError** err);
	int garrow_date64_array_builder_append_null(GArrowDate64ArrayBuilder* builder, GError** err);
	int garrow_date64_array_builder_append_nulls(GArrowDate64ArrayBuilder* builder, long n, GError** err);
	int garrow_date64_array_builder_append_value(GArrowDate64ArrayBuilder* builder, long value, GError** err);
	int garrow_date64_array_builder_append_values(GArrowDate64ArrayBuilder* builder, long* values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.Date64DataType

	GType garrow_date64_data_type_get_type();
	GArrowDate64DataType* garrow_date64_data_type_new();

	// arrow.Decimal128

	GType garrow_decimal128_get_type();
	GArrowDecimal128* garrow_decimal128_new_integer(long data);
	GArrowDecimal128* garrow_decimal128_new_string(const(char)* data);
	void garrow_decimal128_abs(GArrowDecimal128* decimal);
	GArrowDecimal128* garrow_decimal128_divide(GArrowDecimal128* left, GArrowDecimal128* right, GArrowDecimal128** remainder, GError** err);
	int garrow_decimal128_equal(GArrowDecimal128* decimal, GArrowDecimal128* otherDecimal);
	int garrow_decimal128_greater_than(GArrowDecimal128* decimal, GArrowDecimal128* otherDecimal);
	int garrow_decimal128_greater_than_or_equal(GArrowDecimal128* decimal, GArrowDecimal128* otherDecimal);
	int garrow_decimal128_less_than(GArrowDecimal128* decimal, GArrowDecimal128* otherDecimal);
	int garrow_decimal128_less_than_or_equal(GArrowDecimal128* decimal, GArrowDecimal128* otherDecimal);
	GArrowDecimal128* garrow_decimal128_minus(GArrowDecimal128* left, GArrowDecimal128* right);
	GArrowDecimal128* garrow_decimal128_multiply(GArrowDecimal128* left, GArrowDecimal128* right);
	void garrow_decimal128_negate(GArrowDecimal128* decimal);
	int garrow_decimal128_not_equal(GArrowDecimal128* decimal, GArrowDecimal128* otherDecimal);
	GArrowDecimal128* garrow_decimal128_plus(GArrowDecimal128* left, GArrowDecimal128* right);
	GArrowDecimal128* garrow_decimal128_rescale(GArrowDecimal128* decimal, int originalScale, int newScale, GError** err);
	long garrow_decimal128_to_integer(GArrowDecimal128* decimal);
	char* garrow_decimal128_to_string(GArrowDecimal128* decimal);
	char* garrow_decimal128_to_string_scale(GArrowDecimal128* decimal, int scale);

	// arrow.Decimal128Array

	GType garrow_decimal128_array_get_type();
	char* garrow_decimal128_array_format_value(GArrowDecimal128Array* array, long i);
	GArrowDecimal128* garrow_decimal128_array_get_value(GArrowDecimal128Array* array, long i);

	// arrow.Decimal128ArrayBuilder

	GType garrow_decimal128_array_builder_get_type();
	GArrowDecimal128ArrayBuilder* garrow_decimal128_array_builder_new(GArrowDecimal128DataType* dataType);
	int garrow_decimal128_array_builder_append(GArrowDecimal128ArrayBuilder* builder, GArrowDecimal128* value, GError** err);
	int garrow_decimal128_array_builder_append_null(GArrowDecimal128ArrayBuilder* builder, GError** err);
	int garrow_decimal128_array_builder_append_value(GArrowDecimal128ArrayBuilder* builder, GArrowDecimal128* value, GError** err);

	// arrow.Decimal128DataType

	GType garrow_decimal128_data_type_get_type();
	GArrowDecimal128DataType* garrow_decimal128_data_type_new(int precision, int scale);

	// arrow.DecimalDataType

	GType garrow_decimal_data_type_get_type();
	GArrowDecimalDataType* garrow_decimal_data_type_new(int precision, int scale);
	int garrow_decimal_data_type_get_precision(GArrowDecimalDataType* decimalDataType);
	int garrow_decimal_data_type_get_scale(GArrowDecimalDataType* decimalDataType);

	// arrow.DenseUnionArray

	GType garrow_dense_union_array_get_type();
	GArrowDenseUnionArray* garrow_dense_union_array_new(GArrowInt8Array* typeIds, GArrowInt32Array* valueOffsets, GList* fields, GError** err);
	GArrowDenseUnionArray* garrow_dense_union_array_new_data_type(GArrowDenseUnionDataType* dataType, GArrowInt8Array* typeIds, GArrowInt32Array* valueOffsets, GList* fields, GError** err);

	// arrow.DenseUnionDataType

	GType garrow_dense_union_data_type_get_type();
	GArrowDenseUnionDataType* garrow_dense_union_data_type_new(GList* fields, ubyte* typeCodes, size_t nTypeCodes);

	// arrow.DictionaryArray

	GType garrow_dictionary_array_get_type();
	GArrowDictionaryArray* garrow_dictionary_array_new(GArrowDataType* dataType, GArrowArray* indices, GArrowArray* dictionary, GError** err);
	GArrowArray* garrow_dictionary_array_get_dictionary(GArrowDictionaryArray* array);
	GArrowDictionaryDataType* garrow_dictionary_array_get_dictionary_data_type(GArrowDictionaryArray* array);
	GArrowArray* garrow_dictionary_array_get_indices(GArrowDictionaryArray* array);

	// arrow.DictionaryDataType

	GType garrow_dictionary_data_type_get_type();
	GArrowDictionaryDataType* garrow_dictionary_data_type_new(GArrowDataType* indexDataType, GArrowDataType* valueDataType, int ordered);
	GArrowDataType* garrow_dictionary_data_type_get_index_data_type(GArrowDictionaryDataType* dictionaryDataType);
	GArrowDataType* garrow_dictionary_data_type_get_value_data_type(GArrowDictionaryDataType* dictionaryDataType);
	int garrow_dictionary_data_type_is_ordered(GArrowDictionaryDataType* dictionaryDataType);

	// arrow.DoubleArray

	GType garrow_double_array_get_type();
	GArrowDoubleArray* garrow_double_array_new(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls);
	GArrowBooleanArray* garrow_double_array_compare(GArrowDoubleArray* array, double value, GArrowCompareOptions* options, GError** err);
	double garrow_double_array_get_value(GArrowDoubleArray* array, long i);
	double* garrow_double_array_get_values(GArrowDoubleArray* array, long* length);
	double garrow_double_array_sum(GArrowDoubleArray* array, GError** err);

	// arrow.DoubleArrayBuilder

	GType garrow_double_array_builder_get_type();
	GArrowDoubleArrayBuilder* garrow_double_array_builder_new();
	int garrow_double_array_builder_append(GArrowDoubleArrayBuilder* builder, double value, GError** err);
	int garrow_double_array_builder_append_null(GArrowDoubleArrayBuilder* builder, GError** err);
	int garrow_double_array_builder_append_nulls(GArrowDoubleArrayBuilder* builder, long n, GError** err);
	int garrow_double_array_builder_append_value(GArrowDoubleArrayBuilder* builder, double value, GError** err);
	int garrow_double_array_builder_append_values(GArrowDoubleArrayBuilder* builder, double* values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.DoubleDataType

	GType garrow_double_data_type_get_type();
	GArrowDoubleDataType* garrow_double_data_type_new();

	// arrow.FeatherFileReader

	GType garrow_feather_file_reader_get_type();
	GArrowFeatherFileReader* garrow_feather_file_reader_new(GArrowSeekableInputStream* file, GError** err);
	GArrowChunkedArray* garrow_feather_file_reader_get_column_data(GArrowFeatherFileReader* reader, int i, GError** err);
	char* garrow_feather_file_reader_get_column_name(GArrowFeatherFileReader* reader, int i);
	char* garrow_feather_file_reader_get_description(GArrowFeatherFileReader* reader);
	long garrow_feather_file_reader_get_n_columns(GArrowFeatherFileReader* reader);
	long garrow_feather_file_reader_get_n_rows(GArrowFeatherFileReader* reader);
	int garrow_feather_file_reader_get_version(GArrowFeatherFileReader* reader);
	int garrow_feather_file_reader_has_description(GArrowFeatherFileReader* reader);
	GArrowTable* garrow_feather_file_reader_read(GArrowFeatherFileReader* reader, GError** err);
	GArrowTable* garrow_feather_file_reader_read_indices(GArrowFeatherFileReader* reader, int* indices, uint nIndices, GError** err);
	GArrowTable* garrow_feather_file_reader_read_names(GArrowFeatherFileReader* reader, char** names, uint nNames, GError** err);

	// arrow.FeatherFileWriter

	GType garrow_feather_file_writer_get_type();
	GArrowFeatherFileWriter* garrow_feather_file_writer_new(GArrowOutputStream* sink, GError** err);
	int garrow_feather_file_writer_append(GArrowFeatherFileWriter* writer, const(char)* name, GArrowArray* array, GError** err);
	int garrow_feather_file_writer_close(GArrowFeatherFileWriter* writer, GError** err);
	void garrow_feather_file_writer_set_description(GArrowFeatherFileWriter* writer, const(char)* description);
	void garrow_feather_file_writer_set_n_rows(GArrowFeatherFileWriter* writer, long nRows);
	int garrow_feather_file_writer_write(GArrowFeatherFileWriter* writer, GArrowTable* table, GError** err);

	// arrow.Field

	GType garrow_field_get_type();
	GArrowField* garrow_field_new(const(char)* name, GArrowDataType* dataType);
	GArrowField* garrow_field_new_full(const(char)* name, GArrowDataType* dataType, int nullable);
	int garrow_field_equal(GArrowField* field, GArrowField* otherField);
	GArrowDataType* garrow_field_get_data_type(GArrowField* field);
	const(char)* garrow_field_get_name(GArrowField* field);
	int garrow_field_is_nullable(GArrowField* field);
	char* garrow_field_to_string(GArrowField* field);

	// arrow.File

	GType garrow_file_get_type();
	int garrow_file_close(GArrowFile* file, GError** err);
	GArrowFileMode garrow_file_get_mode(GArrowFile* file);
	int garrow_file_is_closed(GArrowFile* file);
	long garrow_file_tell(GArrowFile* file, GError** err);

	// arrow.FileOutputStream

	GType garrow_file_output_stream_get_type();
	GArrowFileOutputStream* garrow_file_output_stream_new(const(char)* path, int append, GError** err);

	// arrow.FixedSizeBinaryArray

	GType garrow_fixed_size_binary_array_get_type();

	// arrow.FixedSizeBinaryDataType

	GType garrow_fixed_size_binary_data_type_get_type();
	GArrowFixedSizeBinaryDataType* garrow_fixed_size_binary_data_type_new(int byteWidth);
	int garrow_fixed_size_binary_data_type_get_byte_width(GArrowFixedSizeBinaryDataType* dataType);

	// arrow.FixedWidthDataType

	GType garrow_fixed_width_data_type_get_type();
	int garrow_fixed_width_data_type_get_bit_width(GArrowFixedWidthDataType* dataType);

	// arrow.FloatArray

	GType garrow_float_array_get_type();
	GArrowFloatArray* garrow_float_array_new(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls);
	GArrowBooleanArray* garrow_float_array_compare(GArrowFloatArray* array, float value, GArrowCompareOptions* options, GError** err);
	float garrow_float_array_get_value(GArrowFloatArray* array, long i);
	float* garrow_float_array_get_values(GArrowFloatArray* array, long* length);
	double garrow_float_array_sum(GArrowFloatArray* array, GError** err);

	// arrow.FloatArrayBuilder

	GType garrow_float_array_builder_get_type();
	GArrowFloatArrayBuilder* garrow_float_array_builder_new();
	int garrow_float_array_builder_append(GArrowFloatArrayBuilder* builder, float value, GError** err);
	int garrow_float_array_builder_append_null(GArrowFloatArrayBuilder* builder, GError** err);
	int garrow_float_array_builder_append_nulls(GArrowFloatArrayBuilder* builder, long n, GError** err);
	int garrow_float_array_builder_append_value(GArrowFloatArrayBuilder* builder, float value, GError** err);
	int garrow_float_array_builder_append_values(GArrowFloatArrayBuilder* builder, float* values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.FloatDataType

	GType garrow_float_data_type_get_type();
	GArrowFloatDataType* garrow_float_data_type_new();

	// arrow.FloatingPointDataType

	GType garrow_floating_point_data_type_get_type();

	// arrow.GIOInputStream

	GType garrow_gio_input_stream_get_type();
	GArrowGIOInputStream* garrow_gio_input_stream_new(GInputStream* gioInputStream);
	GInputStream* garrow_gio_input_stream_get_raw(GArrowGIOInputStream* inputStream);

	// arrow.GIOOutputStream

	GType garrow_gio_output_stream_get_type();
	GArrowGIOOutputStream* garrow_gio_output_stream_new(GOutputStream* gioOutputStream);
	GOutputStream* garrow_gio_output_stream_get_raw(GArrowGIOOutputStream* outputStream);

	// arrow.InputStream

	GType garrow_input_stream_get_type();
	int garrow_input_stream_advance(GArrowInputStream* inputStream, long nBytes, GError** err);
	int garrow_input_stream_align(GArrowInputStream* inputStream, int alignment, GError** err);
	GArrowTensor* garrow_input_stream_read_tensor(GArrowInputStream* inputStream, GError** err);

	// arrow.Int16Array

	GType garrow_int16_array_get_type();
	GArrowInt16Array* garrow_int16_array_new(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls);
	GArrowBooleanArray* garrow_int16_array_compare(GArrowInt16Array* array, short value, GArrowCompareOptions* options, GError** err);
	short garrow_int16_array_get_value(GArrowInt16Array* array, long i);
	short* garrow_int16_array_get_values(GArrowInt16Array* array, long* length);
	long garrow_int16_array_sum(GArrowInt16Array* array, GError** err);

	// arrow.Int16ArrayBuilder

	GType garrow_int16_array_builder_get_type();
	GArrowInt16ArrayBuilder* garrow_int16_array_builder_new();
	int garrow_int16_array_builder_append(GArrowInt16ArrayBuilder* builder, short value, GError** err);
	int garrow_int16_array_builder_append_null(GArrowInt16ArrayBuilder* builder, GError** err);
	int garrow_int16_array_builder_append_nulls(GArrowInt16ArrayBuilder* builder, long n, GError** err);
	int garrow_int16_array_builder_append_value(GArrowInt16ArrayBuilder* builder, short value, GError** err);
	int garrow_int16_array_builder_append_values(GArrowInt16ArrayBuilder* builder, short* values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.Int16DataType

	GType garrow_int16_data_type_get_type();
	GArrowInt16DataType* garrow_int16_data_type_new();

	// arrow.Int32Array

	GType garrow_int32_array_get_type();
	GArrowInt32Array* garrow_int32_array_new(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls);
	GArrowBooleanArray* garrow_int32_array_compare(GArrowInt32Array* array, int value, GArrowCompareOptions* options, GError** err);
	int garrow_int32_array_get_value(GArrowInt32Array* array, long i);
	int* garrow_int32_array_get_values(GArrowInt32Array* array, long* length);
	long garrow_int32_array_sum(GArrowInt32Array* array, GError** err);

	// arrow.Int32ArrayBuilder

	GType garrow_int32_array_builder_get_type();
	GArrowInt32ArrayBuilder* garrow_int32_array_builder_new();
	int garrow_int32_array_builder_append(GArrowInt32ArrayBuilder* builder, int value, GError** err);
	int garrow_int32_array_builder_append_null(GArrowInt32ArrayBuilder* builder, GError** err);
	int garrow_int32_array_builder_append_nulls(GArrowInt32ArrayBuilder* builder, long n, GError** err);
	int garrow_int32_array_builder_append_value(GArrowInt32ArrayBuilder* builder, int value, GError** err);
	int garrow_int32_array_builder_append_values(GArrowInt32ArrayBuilder* builder, int* values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.Int32DataType

	GType garrow_int32_data_type_get_type();
	GArrowInt32DataType* garrow_int32_data_type_new();

	// arrow.Int64Array

	GType garrow_int64_array_get_type();
	GArrowInt64Array* garrow_int64_array_new(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls);
	GArrowBooleanArray* garrow_int64_array_compare(GArrowInt64Array* array, long value, GArrowCompareOptions* options, GError** err);
	long garrow_int64_array_get_value(GArrowInt64Array* array, long i);
	long* garrow_int64_array_get_values(GArrowInt64Array* array, long* length);
	long garrow_int64_array_sum(GArrowInt64Array* array, GError** err);

	// arrow.Int64ArrayBuilder

	GType garrow_int64_array_builder_get_type();
	GArrowInt64ArrayBuilder* garrow_int64_array_builder_new();
	int garrow_int64_array_builder_append(GArrowInt64ArrayBuilder* builder, long value, GError** err);
	int garrow_int64_array_builder_append_null(GArrowInt64ArrayBuilder* builder, GError** err);
	int garrow_int64_array_builder_append_nulls(GArrowInt64ArrayBuilder* builder, long n, GError** err);
	int garrow_int64_array_builder_append_value(GArrowInt64ArrayBuilder* builder, long value, GError** err);
	int garrow_int64_array_builder_append_values(GArrowInt64ArrayBuilder* builder, long* values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.Int64DataType

	GType garrow_int64_data_type_get_type();
	GArrowInt64DataType* garrow_int64_data_type_new();

	// arrow.Int8Array

	GType garrow_int8_array_get_type();
	GArrowInt8Array* garrow_int8_array_new(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls);
	GArrowBooleanArray* garrow_int8_array_compare(GArrowInt8Array* array, byte value, GArrowCompareOptions* options, GError** err);
	byte garrow_int8_array_get_value(GArrowInt8Array* array, long i);
	byte* garrow_int8_array_get_values(GArrowInt8Array* array, long* length);
	long garrow_int8_array_sum(GArrowInt8Array* array, GError** err);

	// arrow.Int8ArrayBuilder

	GType garrow_int8_array_builder_get_type();
	GArrowInt8ArrayBuilder* garrow_int8_array_builder_new();
	int garrow_int8_array_builder_append(GArrowInt8ArrayBuilder* builder, byte value, GError** err);
	int garrow_int8_array_builder_append_null(GArrowInt8ArrayBuilder* builder, GError** err);
	int garrow_int8_array_builder_append_nulls(GArrowInt8ArrayBuilder* builder, long n, GError** err);
	int garrow_int8_array_builder_append_value(GArrowInt8ArrayBuilder* builder, byte value, GError** err);
	int garrow_int8_array_builder_append_values(GArrowInt8ArrayBuilder* builder, byte* values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.Int8DataType

	GType garrow_int8_data_type_get_type();
	GArrowInt8DataType* garrow_int8_data_type_new();

	// arrow.IntArrayBuilder

	GType garrow_int_array_builder_get_type();
	GArrowIntArrayBuilder* garrow_int_array_builder_new();
	int garrow_int_array_builder_append(GArrowIntArrayBuilder* builder, long value, GError** err);
	int garrow_int_array_builder_append_null(GArrowIntArrayBuilder* builder, GError** err);
	int garrow_int_array_builder_append_nulls(GArrowIntArrayBuilder* builder, long n, GError** err);
	int garrow_int_array_builder_append_value(GArrowIntArrayBuilder* builder, long value, GError** err);
	int garrow_int_array_builder_append_values(GArrowIntArrayBuilder* builder, long* values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.IntegerDataType

	GType garrow_integer_data_type_get_type();
	int garrow_integer_data_type_is_signed(GArrowIntegerDataType* dataType);

	// arrow.JSONReadOptions

	GType garrow_json_read_options_get_type();
	GArrowJSONReadOptions* garrow_json_read_options_new();

	// arrow.JSONReader

	GType garrow_json_reader_get_type();
	GArrowJSONReader* garrow_json_reader_new(GArrowInputStream* input, GArrowJSONReadOptions* options, GError** err);
	GArrowTable* garrow_json_reader_read(GArrowJSONReader* reader, GError** err);

	// arrow.LargeBinaryArray

	GType garrow_large_binary_array_get_type();
	GArrowLargeBinaryArray* garrow_large_binary_array_new(long length, GArrowBuffer* valueOffsets, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls);
	GArrowBuffer* garrow_large_binary_array_get_buffer(GArrowLargeBinaryArray* array);
	GArrowBuffer* garrow_large_binary_array_get_offsets_buffer(GArrowLargeBinaryArray* array);
	GBytes* garrow_large_binary_array_get_value(GArrowLargeBinaryArray* array, long i);

	// arrow.LargeBinaryArrayBuilder

	GType garrow_large_binary_array_builder_get_type();
	GArrowLargeBinaryArrayBuilder* garrow_large_binary_array_builder_new();
	int garrow_large_binary_array_builder_append_null(GArrowLargeBinaryArrayBuilder* builder, GError** err);
	int garrow_large_binary_array_builder_append_nulls(GArrowLargeBinaryArrayBuilder* builder, long n, GError** err);
	int garrow_large_binary_array_builder_append_value(GArrowLargeBinaryArrayBuilder* builder, ubyte* value, long length, GError** err);
	int garrow_large_binary_array_builder_append_value_bytes(GArrowLargeBinaryArrayBuilder* builder, GBytes* value, GError** err);
	int garrow_large_binary_array_builder_append_values(GArrowLargeBinaryArrayBuilder* builder, GBytes** values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.LargeBinaryDataType

	GType garrow_large_binary_data_type_get_type();
	GArrowLargeBinaryDataType* garrow_large_binary_data_type_new();

	// arrow.LargeStringArray

	GType garrow_large_string_array_get_type();
	GArrowLargeStringArray* garrow_large_string_array_new(long length, GArrowBuffer* valueOffsets, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls);
	char* garrow_large_string_array_get_string(GArrowLargeStringArray* array, long i);

	// arrow.LargeStringArrayBuilder

	GType garrow_large_string_array_builder_get_type();
	GArrowLargeStringArrayBuilder* garrow_large_string_array_builder_new();
	int garrow_large_string_array_builder_append_string(GArrowLargeStringArrayBuilder* builder, const(char)* value, GError** err);
	int garrow_large_string_array_builder_append_strings(GArrowLargeStringArrayBuilder* builder, char** values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.LargeStringDataType

	GType garrow_large_string_data_type_get_type();
	GArrowLargeStringDataType* garrow_large_string_data_type_new();

	// arrow.ListArray

	GType garrow_list_array_get_type();
	GArrowListArray* garrow_list_array_new(GArrowDataType* dataType, long length, GArrowBuffer* valueOffsets, GArrowArray* values, GArrowBuffer* nullBitmap, long nNulls);
	GArrowArray* garrow_list_array_get_value(GArrowListArray* array, long i);
	GArrowDataType* garrow_list_array_get_value_type(GArrowListArray* array);

	// arrow.ListArrayBuilder

	GType garrow_list_array_builder_get_type();
	GArrowListArrayBuilder* garrow_list_array_builder_new(GArrowListDataType* dataType, GError** err);
	int garrow_list_array_builder_append(GArrowListArrayBuilder* builder, GError** err);
	int garrow_list_array_builder_append_null(GArrowListArrayBuilder* builder, GError** err);
	int garrow_list_array_builder_append_value(GArrowListArrayBuilder* builder, GError** err);
	GArrowArrayBuilder* garrow_list_array_builder_get_value_builder(GArrowListArrayBuilder* builder);

	// arrow.ListDataType

	GType garrow_list_data_type_get_type();
	GArrowListDataType* garrow_list_data_type_new(GArrowField* field);
	GArrowField* garrow_list_data_type_get_field(GArrowListDataType* listDataType);
	GArrowField* garrow_list_data_type_get_value_field(GArrowListDataType* listDataType);

	// arrow.MemoryMappedInputStream

	GType garrow_memory_mapped_input_stream_get_type();
	GArrowMemoryMappedInputStream* garrow_memory_mapped_input_stream_new(const(char)* path, GError** err);

	// arrow.MutableBuffer

	GType garrow_mutable_buffer_get_type();
	GArrowMutableBuffer* garrow_mutable_buffer_new(ubyte* data, long size);
	GArrowMutableBuffer* garrow_mutable_buffer_new_bytes(GBytes* data);
	int garrow_mutable_buffer_set_data(GArrowMutableBuffer* buffer, long offset, ubyte* data, long size, GError** err);
	GArrowMutableBuffer* garrow_mutable_buffer_slice(GArrowMutableBuffer* buffer, long offset, long size);

	// arrow.NullArray

	GType garrow_null_array_get_type();
	GArrowNullArray* garrow_null_array_new(long length);

	// arrow.NullArrayBuilder

	GType garrow_null_array_builder_get_type();
	GArrowNullArrayBuilder* garrow_null_array_builder_new();
	int garrow_null_array_builder_append_null(GArrowNullArrayBuilder* builder, GError** err);
	int garrow_null_array_builder_append_nulls(GArrowNullArrayBuilder* builder, long n, GError** err);

	// arrow.NullDataType

	GType garrow_null_data_type_get_type();
	GArrowNullDataType* garrow_null_data_type_new();

	// arrow.NumericArray

	GType garrow_numeric_array_get_type();
	double garrow_numeric_array_mean(GArrowNumericArray* array, GError** err);

	// arrow.NumericDataType

	GType garrow_numeric_data_type_get_type();

	// arrow.ORCFileReader

	GType garrow_orc_file_reader_get_type();
	GArrowORCFileReader* garrow_orc_file_reader_new(GArrowSeekableInputStream* file, GError** err);
	int* garrow_orc_file_reader_get_field_indexes(GArrowORCFileReader* reader, uint* nFieldIndexes);
	int* garrow_orc_file_reader_get_field_indices(GArrowORCFileReader* reader, uint* nFieldIndices);
	long garrow_orc_file_reader_get_n_rows(GArrowORCFileReader* reader);
	long garrow_orc_file_reader_get_n_stripes(GArrowORCFileReader* reader);
	GArrowRecordBatch* garrow_orc_file_reader_read_stripe(GArrowORCFileReader* reader, long i, GError** err);
	GArrowTable* garrow_orc_file_reader_read_stripes(GArrowORCFileReader* reader, GError** err);
	GArrowSchema* garrow_orc_file_reader_read_type(GArrowORCFileReader* reader, GError** err);
	void garrow_orc_file_reader_set_field_indexes(GArrowORCFileReader* reader, int* fieldIndexes, uint nFieldIndexes);
	void garrow_orc_file_reader_set_field_indices(GArrowORCFileReader* reader, int* fieldIndices, uint nFieldIndices);

	// arrow.OutputStream

	GType garrow_output_stream_get_type();
	int garrow_output_stream_align(GArrowOutputStream* stream, int alignment, GError** err);
	long garrow_output_stream_write_tensor(GArrowOutputStream* stream, GArrowTensor* tensor, GError** err);

	// arrow.PrimitiveArray

	GType garrow_primitive_array_get_type();
	GArrowBuffer* garrow_primitive_array_get_buffer(GArrowPrimitiveArray* array);

	// arrow.Readable

	GType garrow_readable_get_type();
	GArrowBuffer* garrow_readable_read(GArrowReadable* readable, long nBytes, GError** err);

	// arrow.RecordBatch

	GType garrow_record_batch_get_type();
	GArrowRecordBatch* garrow_record_batch_new(GArrowSchema* schema, uint nRows, GList* columns, GError** err);
	GArrowRecordBatch* garrow_record_batch_add_column(GArrowRecordBatch* recordBatch, uint i, GArrowField* field, GArrowArray* column, GError** err);
	int garrow_record_batch_equal(GArrowRecordBatch* recordBatch, GArrowRecordBatch* otherRecordBatch);
	GArrowArray* garrow_record_batch_get_column_data(GArrowRecordBatch* recordBatch, int i);
	const(char)* garrow_record_batch_get_column_name(GArrowRecordBatch* recordBatch, int i);
	uint garrow_record_batch_get_n_columns(GArrowRecordBatch* recordBatch);
	long garrow_record_batch_get_n_rows(GArrowRecordBatch* recordBatch);
	GArrowSchema* garrow_record_batch_get_schema(GArrowRecordBatch* recordBatch);
	GArrowRecordBatch* garrow_record_batch_remove_column(GArrowRecordBatch* recordBatch, uint i, GError** err);
	GArrowRecordBatch* garrow_record_batch_slice(GArrowRecordBatch* recordBatch, long offset, long length);
	char* garrow_record_batch_to_string(GArrowRecordBatch* recordBatch, GError** err);

	// arrow.RecordBatchBuilder

	GType garrow_record_batch_builder_get_type();
	GArrowRecordBatchBuilder* garrow_record_batch_builder_new(GArrowSchema* schema, GError** err);
	GArrowRecordBatch* garrow_record_batch_builder_flush(GArrowRecordBatchBuilder* builder, GError** err);
	GArrowArrayBuilder* garrow_record_batch_builder_get_column_builder(GArrowRecordBatchBuilder* builder, int i);
	GArrowArrayBuilder* garrow_record_batch_builder_get_field(GArrowRecordBatchBuilder* builder, int i);
	long garrow_record_batch_builder_get_initial_capacity(GArrowRecordBatchBuilder* builder);
	int garrow_record_batch_builder_get_n_columns(GArrowRecordBatchBuilder* builder);
	int garrow_record_batch_builder_get_n_fields(GArrowRecordBatchBuilder* builder);
	GArrowSchema* garrow_record_batch_builder_get_schema(GArrowRecordBatchBuilder* builder);
	void garrow_record_batch_builder_set_initial_capacity(GArrowRecordBatchBuilder* builder, long capacity);

	// arrow.RecordBatchFileReader

	GType garrow_record_batch_file_reader_get_type();
	GArrowRecordBatchFileReader* garrow_record_batch_file_reader_new(GArrowSeekableInputStream* file, GError** err);
	uint garrow_record_batch_file_reader_get_n_record_batches(GArrowRecordBatchFileReader* reader);
	GArrowRecordBatch* garrow_record_batch_file_reader_get_record_batch(GArrowRecordBatchFileReader* reader, uint i, GError** err);
	GArrowSchema* garrow_record_batch_file_reader_get_schema(GArrowRecordBatchFileReader* reader);
	GArrowMetadataVersion garrow_record_batch_file_reader_get_version(GArrowRecordBatchFileReader* reader);
	GArrowRecordBatch* garrow_record_batch_file_reader_read_record_batch(GArrowRecordBatchFileReader* reader, uint i, GError** err);

	// arrow.RecordBatchFileWriter

	GType garrow_record_batch_file_writer_get_type();
	GArrowRecordBatchFileWriter* garrow_record_batch_file_writer_new(GArrowOutputStream* sink, GArrowSchema* schema, GError** err);

	// arrow.RecordBatchReader

	GType garrow_record_batch_reader_get_type();
	GArrowRecordBatch* garrow_record_batch_reader_get_next_record_batch(GArrowRecordBatchReader* reader, GError** err);
	GArrowSchema* garrow_record_batch_reader_get_schema(GArrowRecordBatchReader* reader);
	GArrowRecordBatch* garrow_record_batch_reader_read_next(GArrowRecordBatchReader* reader, GError** err);
	GArrowRecordBatch* garrow_record_batch_reader_read_next_record_batch(GArrowRecordBatchReader* reader, GError** err);

	// arrow.RecordBatchStreamReader

	GType garrow_record_batch_stream_reader_get_type();
	GArrowRecordBatchStreamReader* garrow_record_batch_stream_reader_new(GArrowInputStream* stream, GError** err);

	// arrow.RecordBatchStreamWriter

	GType garrow_record_batch_stream_writer_get_type();
	GArrowRecordBatchStreamWriter* garrow_record_batch_stream_writer_new(GArrowOutputStream* sink, GArrowSchema* schema, GError** err);

	// arrow.RecordBatchWriter

	GType garrow_record_batch_writer_get_type();
	int garrow_record_batch_writer_close(GArrowRecordBatchWriter* writer, GError** err);
	int garrow_record_batch_writer_write_record_batch(GArrowRecordBatchWriter* writer, GArrowRecordBatch* recordBatch, GError** err);
	int garrow_record_batch_writer_write_table(GArrowRecordBatchWriter* writer, GArrowTable* table, GError** err);

	// arrow.ResizableBuffer

	GType garrow_resizable_buffer_get_type();
	GArrowResizableBuffer* garrow_resizable_buffer_new(long initialSize, GError** err);
	int garrow_resizable_buffer_reserve(GArrowResizableBuffer* buffer, long newCapacity, GError** err);
	int garrow_resizable_buffer_resize(GArrowResizableBuffer* buffer, long newSize, GError** err);

	// arrow.Schema

	GType garrow_schema_get_type();
	GArrowSchema* garrow_schema_new(GList* fields);
	GArrowSchema* garrow_schema_add_field(GArrowSchema* schema, uint i, GArrowField* field, GError** err);
	int garrow_schema_equal(GArrowSchema* schema, GArrowSchema* otherSchema);
	GArrowField* garrow_schema_get_field(GArrowSchema* schema, uint i);
	GArrowField* garrow_schema_get_field_by_name(GArrowSchema* schema, const(char)* name);
	int garrow_schema_get_field_index(GArrowSchema* schema, const(char)* name);
	GList* garrow_schema_get_fields(GArrowSchema* schema);
	uint garrow_schema_n_fields(GArrowSchema* schema);
	GArrowSchema* garrow_schema_remove_field(GArrowSchema* schema, uint i, GError** err);
	GArrowSchema* garrow_schema_replace_field(GArrowSchema* schema, uint i, GArrowField* field, GError** err);
	char* garrow_schema_to_string(GArrowSchema* schema);

	// arrow.SeekableInputStream

	GType garrow_seekable_input_stream_get_type();
	ulong garrow_seekable_input_stream_get_size(GArrowSeekableInputStream* inputStream, GError** err);
	int garrow_seekable_input_stream_get_support_zero_copy(GArrowSeekableInputStream* inputStream);
	GBytes* garrow_seekable_input_stream_peek(GArrowSeekableInputStream* inputStream, long nBytes, GError** err);
	GArrowBuffer* garrow_seekable_input_stream_read_at(GArrowSeekableInputStream* inputStream, long position, long nBytes, GError** err);

	// arrow.SparseUnionArray

	GType garrow_sparse_union_array_get_type();
	GArrowSparseUnionArray* garrow_sparse_union_array_new(GArrowInt8Array* typeIds, GList* fields, GError** err);
	GArrowSparseUnionArray* garrow_sparse_union_array_new_data_type(GArrowSparseUnionDataType* dataType, GArrowInt8Array* typeIds, GList* fields, GError** err);

	// arrow.SparseUnionDataType

	GType garrow_sparse_union_data_type_get_type();
	GArrowSparseUnionDataType* garrow_sparse_union_data_type_new(GList* fields, ubyte* typeCodes, size_t nTypeCodes);

	// arrow.StringArray

	GType garrow_string_array_get_type();
	GArrowStringArray* garrow_string_array_new(long length, GArrowBuffer* valueOffsets, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls);
	char* garrow_string_array_get_string(GArrowStringArray* array, long i);

	// arrow.StringArrayBuilder

	GType garrow_string_array_builder_get_type();
	GArrowStringArrayBuilder* garrow_string_array_builder_new();
	int garrow_string_array_builder_append(GArrowStringArrayBuilder* builder, const(char)* value, GError** err);
	int garrow_string_array_builder_append_string(GArrowStringArrayBuilder* builder, const(char)* value, GError** err);
	int garrow_string_array_builder_append_strings(GArrowStringArrayBuilder* builder, char** values, long valuesLength, int* isValids, long isValidsLength, GError** err);
	int garrow_string_array_builder_append_value(GArrowStringArrayBuilder* builder, const(char)* value, GError** err);
	int garrow_string_array_builder_append_values(GArrowStringArrayBuilder* builder, char** values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.StringDataType

	GType garrow_string_data_type_get_type();
	GArrowStringDataType* garrow_string_data_type_new();

	// arrow.StructArray

	GType garrow_struct_array_get_type();
	GArrowStructArray* garrow_struct_array_new(GArrowDataType* dataType, long length, GList* fields, GArrowBuffer* nullBitmap, long nNulls);
	GList* garrow_struct_array_flatten(GArrowStructArray* array, GError** err);
	GArrowArray* garrow_struct_array_get_field(GArrowStructArray* array, int i);
	GList* garrow_struct_array_get_fields(GArrowStructArray* array);

	// arrow.StructArrayBuilder

	GType garrow_struct_array_builder_get_type();
	GArrowStructArrayBuilder* garrow_struct_array_builder_new(GArrowStructDataType* dataType, GError** err);
	int garrow_struct_array_builder_append(GArrowStructArrayBuilder* builder, GError** err);
	int garrow_struct_array_builder_append_null(GArrowStructArrayBuilder* builder, GError** err);
	int garrow_struct_array_builder_append_value(GArrowStructArrayBuilder* builder, GError** err);
	GArrowArrayBuilder* garrow_struct_array_builder_get_field_builder(GArrowStructArrayBuilder* builder, int i);
	GList* garrow_struct_array_builder_get_field_builders(GArrowStructArrayBuilder* builder);

	// arrow.StructDataType

	GType garrow_struct_data_type_get_type();
	GArrowStructDataType* garrow_struct_data_type_new(GList* fields);
	GArrowField* garrow_struct_data_type_get_field(GArrowStructDataType* structDataType, int i);
	GArrowField* garrow_struct_data_type_get_field_by_name(GArrowStructDataType* structDataType, const(char)* name);
	int garrow_struct_data_type_get_field_index(GArrowStructDataType* structDataType, const(char)* name);
	GList* garrow_struct_data_type_get_fields(GArrowStructDataType* structDataType);
	int garrow_struct_data_type_get_n_fields(GArrowStructDataType* structDataType);

	// arrow.Table

	GType garrow_table_get_type();
	GArrowTable* garrow_table_new_arrays(GArrowSchema* schema, GArrowArray** arrays, size_t nArrays, GError** err);
	GArrowTable* garrow_table_new_chunked_arrays(GArrowSchema* schema, GArrowChunkedArray** chunkedArrays, size_t nChunkedArrays, GError** err);
	GArrowTable* garrow_table_new_record_batches(GArrowSchema* schema, GArrowRecordBatch** recordBatches, size_t nRecordBatches, GError** err);
	GArrowTable* garrow_table_new_values(GArrowSchema* schema, GList* values, GError** err);
	GArrowTable* garrow_table_add_column(GArrowTable* table, uint i, GArrowField* field, GArrowChunkedArray* chunkedArray, GError** err);
	GArrowTable* garrow_table_concatenate(GArrowTable* table, GList* otherTables, GError** err);
	int garrow_table_equal(GArrowTable* table, GArrowTable* otherTable);
	GArrowChunkedArray* garrow_table_get_column_data(GArrowTable* table, int i);
	uint garrow_table_get_n_columns(GArrowTable* table);
	ulong garrow_table_get_n_rows(GArrowTable* table);
	GArrowSchema* garrow_table_get_schema(GArrowTable* table);
	GArrowTable* garrow_table_remove_column(GArrowTable* table, uint i, GError** err);
	GArrowTable* garrow_table_replace_column(GArrowTable* table, uint i, GArrowField* field, GArrowChunkedArray* chunkedArray, GError** err);
	GArrowTable* garrow_table_slice(GArrowTable* table, long offset, long length);
	char* garrow_table_to_string(GArrowTable* table, GError** err);

	// arrow.TableBatchReader

	GType garrow_table_batch_reader_get_type();
	GArrowTableBatchReader* garrow_table_batch_reader_new(GArrowTable* table);

	// arrow.TakeOptions

	GType garrow_take_options_get_type();
	GArrowTakeOptions* garrow_take_options_new();

	// arrow.Tensor

	GType garrow_tensor_get_type();
	GArrowTensor* garrow_tensor_new(GArrowDataType* dataType, GArrowBuffer* data, long* shape, size_t nDimensions, long* strides, size_t nStrides, char** dimentionNames, size_t nDimentionNames);
	int garrow_tensor_equal(GArrowTensor* tensor, GArrowTensor* otherTensor);
	GArrowBuffer* garrow_tensor_get_buffer(GArrowTensor* tensor);
	const(char)* garrow_tensor_get_dimension_name(GArrowTensor* tensor, int i);
	int garrow_tensor_get_n_dimensions(GArrowTensor* tensor);
	long* garrow_tensor_get_shape(GArrowTensor* tensor, int* nDimensions);
	long garrow_tensor_get_size(GArrowTensor* tensor);
	long* garrow_tensor_get_strides(GArrowTensor* tensor, int* nStrides);
	GArrowDataType* garrow_tensor_get_value_data_type(GArrowTensor* tensor);
	GArrowType garrow_tensor_get_value_type(GArrowTensor* tensor);
	int garrow_tensor_is_column_major(GArrowTensor* tensor);
	int garrow_tensor_is_contiguous(GArrowTensor* tensor);
	int garrow_tensor_is_mutable(GArrowTensor* tensor);
	int garrow_tensor_is_row_major(GArrowTensor* tensor);

	// arrow.Time32Array

	GType garrow_time32_array_get_type();
	GArrowTime32Array* garrow_time32_array_new(GArrowTime32DataType* dataType, long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls);
	int garrow_time32_array_get_value(GArrowTime32Array* array, long i);
	int* garrow_time32_array_get_values(GArrowTime32Array* array, long* length);

	// arrow.Time32ArrayBuilder

	GType garrow_time32_array_builder_get_type();
	GArrowTime32ArrayBuilder* garrow_time32_array_builder_new(GArrowTime32DataType* dataType);
	int garrow_time32_array_builder_append(GArrowTime32ArrayBuilder* builder, int value, GError** err);
	int garrow_time32_array_builder_append_null(GArrowTime32ArrayBuilder* builder, GError** err);
	int garrow_time32_array_builder_append_nulls(GArrowTime32ArrayBuilder* builder, long n, GError** err);
	int garrow_time32_array_builder_append_value(GArrowTime32ArrayBuilder* builder, int value, GError** err);
	int garrow_time32_array_builder_append_values(GArrowTime32ArrayBuilder* builder, int* values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.Time32DataType

	GType garrow_time32_data_type_get_type();
	GArrowTime32DataType* garrow_time32_data_type_new(GArrowTimeUnit unit, GError** err);

	// arrow.Time64Array

	GType garrow_time64_array_get_type();
	GArrowTime64Array* garrow_time64_array_new(GArrowTime64DataType* dataType, long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls);
	long garrow_time64_array_get_value(GArrowTime64Array* array, long i);
	long* garrow_time64_array_get_values(GArrowTime64Array* array, long* length);

	// arrow.Time64ArrayBuilder

	GType garrow_time64_array_builder_get_type();
	GArrowTime64ArrayBuilder* garrow_time64_array_builder_new(GArrowTime64DataType* dataType);
	int garrow_time64_array_builder_append(GArrowTime64ArrayBuilder* builder, long value, GError** err);
	int garrow_time64_array_builder_append_null(GArrowTime64ArrayBuilder* builder, GError** err);
	int garrow_time64_array_builder_append_nulls(GArrowTime64ArrayBuilder* builder, long n, GError** err);
	int garrow_time64_array_builder_append_value(GArrowTime64ArrayBuilder* builder, long value, GError** err);
	int garrow_time64_array_builder_append_values(GArrowTime64ArrayBuilder* builder, long* values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.Time64DataType

	GType garrow_time64_data_type_get_type();
	GArrowTime64DataType* garrow_time64_data_type_new(GArrowTimeUnit unit, GError** err);

	// arrow.TimeDataType

	GType garrow_time_data_type_get_type();
	GArrowTimeUnit garrow_time_data_type_get_unit(GArrowTimeDataType* timeDataType);

	// arrow.TimestampArray

	GType garrow_timestamp_array_get_type();
	GArrowTimestampArray* garrow_timestamp_array_new(GArrowTimestampDataType* dataType, long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls);
	long garrow_timestamp_array_get_value(GArrowTimestampArray* array, long i);
	long* garrow_timestamp_array_get_values(GArrowTimestampArray* array, long* length);

	// arrow.TimestampArrayBuilder

	GType garrow_timestamp_array_builder_get_type();
	GArrowTimestampArrayBuilder* garrow_timestamp_array_builder_new(GArrowTimestampDataType* dataType);
	int garrow_timestamp_array_builder_append(GArrowTimestampArrayBuilder* builder, long value, GError** err);
	int garrow_timestamp_array_builder_append_null(GArrowTimestampArrayBuilder* builder, GError** err);
	int garrow_timestamp_array_builder_append_nulls(GArrowTimestampArrayBuilder* builder, long n, GError** err);
	int garrow_timestamp_array_builder_append_value(GArrowTimestampArrayBuilder* builder, long value, GError** err);
	int garrow_timestamp_array_builder_append_values(GArrowTimestampArrayBuilder* builder, long* values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.TimestampDataType

	GType garrow_timestamp_data_type_get_type();
	GArrowTimestampDataType* garrow_timestamp_data_type_new(GArrowTimeUnit unit);
	GArrowTimeUnit garrow_timestamp_data_type_get_unit(GArrowTimestampDataType* timestampDataType);

	// arrow.UInt16Array

	GType garrow_uint16_array_get_type();
	GArrowUInt16Array* garrow_uint16_array_new(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls);
	GArrowBooleanArray* garrow_uint16_array_compare(GArrowUInt16Array* array, ushort value, GArrowCompareOptions* options, GError** err);
	ushort garrow_uint16_array_get_value(GArrowUInt16Array* array, long i);
	ushort* garrow_uint16_array_get_values(GArrowUInt16Array* array, long* length);
	ulong garrow_uint16_array_sum(GArrowUInt16Array* array, GError** err);

	// arrow.UInt16ArrayBuilder

	GType garrow_uint16_array_builder_get_type();
	GArrowUInt16ArrayBuilder* garrow_uint16_array_builder_new();
	int garrow_uint16_array_builder_append(GArrowUInt16ArrayBuilder* builder, ushort value, GError** err);
	int garrow_uint16_array_builder_append_null(GArrowUInt16ArrayBuilder* builder, GError** err);
	int garrow_uint16_array_builder_append_nulls(GArrowUInt16ArrayBuilder* builder, long n, GError** err);
	int garrow_uint16_array_builder_append_value(GArrowUInt16ArrayBuilder* builder, ushort value, GError** err);
	int garrow_uint16_array_builder_append_values(GArrowUInt16ArrayBuilder* builder, ushort* values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.UInt16DataType

	GType garrow_uint16_data_type_get_type();
	GArrowUInt16DataType* garrow_uint16_data_type_new();

	// arrow.UInt32Array

	GType garrow_uint32_array_get_type();
	GArrowUInt32Array* garrow_uint32_array_new(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls);
	GArrowBooleanArray* garrow_uint32_array_compare(GArrowUInt32Array* array, uint value, GArrowCompareOptions* options, GError** err);
	uint garrow_uint32_array_get_value(GArrowUInt32Array* array, long i);
	uint* garrow_uint32_array_get_values(GArrowUInt32Array* array, long* length);
	ulong garrow_uint32_array_sum(GArrowUInt32Array* array, GError** err);

	// arrow.UInt32ArrayBuilder

	GType garrow_uint32_array_builder_get_type();
	GArrowUInt32ArrayBuilder* garrow_uint32_array_builder_new();
	int garrow_uint32_array_builder_append(GArrowUInt32ArrayBuilder* builder, uint value, GError** err);
	int garrow_uint32_array_builder_append_null(GArrowUInt32ArrayBuilder* builder, GError** err);
	int garrow_uint32_array_builder_append_nulls(GArrowUInt32ArrayBuilder* builder, long n, GError** err);
	int garrow_uint32_array_builder_append_value(GArrowUInt32ArrayBuilder* builder, uint value, GError** err);
	int garrow_uint32_array_builder_append_values(GArrowUInt32ArrayBuilder* builder, uint* values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.UInt32DataType

	GType garrow_uint32_data_type_get_type();
	GArrowUInt32DataType* garrow_uint32_data_type_new();

	// arrow.UInt64Array

	GType garrow_uint64_array_get_type();
	GArrowUInt64Array* garrow_uint64_array_new(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls);
	GArrowBooleanArray* garrow_uint64_array_compare(GArrowUInt64Array* array, ulong value, GArrowCompareOptions* options, GError** err);
	ulong garrow_uint64_array_get_value(GArrowUInt64Array* array, long i);
	ulong* garrow_uint64_array_get_values(GArrowUInt64Array* array, long* length);
	ulong garrow_uint64_array_sum(GArrowUInt64Array* array, GError** err);

	// arrow.UInt64ArrayBuilder

	GType garrow_uint64_array_builder_get_type();
	GArrowUInt64ArrayBuilder* garrow_uint64_array_builder_new();
	int garrow_uint64_array_builder_append(GArrowUInt64ArrayBuilder* builder, ulong value, GError** err);
	int garrow_uint64_array_builder_append_null(GArrowUInt64ArrayBuilder* builder, GError** err);
	int garrow_uint64_array_builder_append_nulls(GArrowUInt64ArrayBuilder* builder, long n, GError** err);
	int garrow_uint64_array_builder_append_value(GArrowUInt64ArrayBuilder* builder, ulong value, GError** err);
	int garrow_uint64_array_builder_append_values(GArrowUInt64ArrayBuilder* builder, ulong* values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.UInt64DataType

	GType garrow_uint64_data_type_get_type();
	GArrowUInt64DataType* garrow_uint64_data_type_new();

	// arrow.UInt8Array

	GType garrow_uint8_array_get_type();
	GArrowUInt8Array* garrow_uint8_array_new(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls);
	GArrowBooleanArray* garrow_uint8_array_compare(GArrowUInt8Array* array, ubyte value, GArrowCompareOptions* options, GError** err);
	ubyte garrow_uint8_array_get_value(GArrowUInt8Array* array, long i);
	ubyte* garrow_uint8_array_get_values(GArrowUInt8Array* array, long* length);
	ulong garrow_uint8_array_sum(GArrowUInt8Array* array, GError** err);

	// arrow.UInt8ArrayBuilder

	GType garrow_uint8_array_builder_get_type();
	GArrowUInt8ArrayBuilder* garrow_uint8_array_builder_new();
	int garrow_uint8_array_builder_append(GArrowUInt8ArrayBuilder* builder, ubyte value, GError** err);
	int garrow_uint8_array_builder_append_null(GArrowUInt8ArrayBuilder* builder, GError** err);
	int garrow_uint8_array_builder_append_nulls(GArrowUInt8ArrayBuilder* builder, long n, GError** err);
	int garrow_uint8_array_builder_append_value(GArrowUInt8ArrayBuilder* builder, ubyte value, GError** err);
	int garrow_uint8_array_builder_append_values(GArrowUInt8ArrayBuilder* builder, ubyte* values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.UInt8DataType

	GType garrow_uint8_data_type_get_type();
	GArrowUInt8DataType* garrow_uint8_data_type_new();

	// arrow.UIntArrayBuilder

	GType garrow_uint_array_builder_get_type();
	GArrowUIntArrayBuilder* garrow_uint_array_builder_new();
	int garrow_uint_array_builder_append(GArrowUIntArrayBuilder* builder, ulong value, GError** err);
	int garrow_uint_array_builder_append_null(GArrowUIntArrayBuilder* builder, GError** err);
	int garrow_uint_array_builder_append_nulls(GArrowUIntArrayBuilder* builder, long n, GError** err);
	int garrow_uint_array_builder_append_value(GArrowUIntArrayBuilder* builder, ulong value, GError** err);
	int garrow_uint_array_builder_append_values(GArrowUIntArrayBuilder* builder, ulong* values, long valuesLength, int* isValids, long isValidsLength, GError** err);

	// arrow.UnionArray

	GType garrow_union_array_get_type();
	GArrowArray* garrow_union_array_get_field(GArrowUnionArray* array, int i);

	// arrow.UnionDataType

	GType garrow_union_data_type_get_type();
	GArrowField* garrow_union_data_type_get_field(GArrowUnionDataType* unionDataType, int i);
	GList* garrow_union_data_type_get_fields(GArrowUnionDataType* unionDataType);
	int garrow_union_data_type_get_n_fields(GArrowUnionDataType* unionDataType);
	ubyte* garrow_union_data_type_get_type_codes(GArrowUnionDataType* unionDataType, size_t* nTypeCodes);

	// arrow.Writable

	GType garrow_writable_get_type();
	int garrow_writable_flush(GArrowWritable* writable, GError** err);
	int garrow_writable_write(GArrowWritable* writable, ubyte* data, long nBytes, GError** err);

	// arrow.WritableFile

	GType garrow_writable_file_get_type();
	int garrow_writable_file_write_at(GArrowWritableFile* writableFile, long position, ubyte* data, long nBytes, GError** err);
}