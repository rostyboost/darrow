module parquet.c.functions;

import std.stdio;
import parquet.c.types;
version (Windows)
	static immutable LIBRARY_PARQUET = ["glib-13.dll", "glib-13.dll"];
else version (OSX)
	static immutable LIBRARY_PARQUET = ["glib.13.dylib", "glib.13.dylib"];
else
	static immutable LIBRARY_PARQUET = ["libarrow-glib.so.13", "libparquet-glib.so.13"];

__gshared extern(C)
{

	// parquet.ArrowFileReader

	GType gparquet_arrow_file_reader_get_type();
	GParquetArrowFileReader* gparquet_arrow_file_reader_new_arrow(GArrowSeekableInputStream* source, GError** err);
	GParquetArrowFileReader* gparquet_arrow_file_reader_new_path(const(char)* path, GError** err);
	int gparquet_arrow_file_reader_get_n_row_groups(GParquetArrowFileReader* reader);
	GArrowSchema* gparquet_arrow_file_reader_get_schema(GParquetArrowFileReader* reader, GError** err);
	GArrowColumn* gparquet_arrow_file_reader_read_column(GParquetArrowFileReader* reader, int columnIndex, GError** err);
	GArrowTable* gparquet_arrow_file_reader_read_table(GParquetArrowFileReader* reader, GError** err);
	GArrowSchema* gparquet_arrow_file_reader_select_schema(GParquetArrowFileReader* reader, int* columnIndexes, size_t nColumnIndexes, GError** err);
	void gparquet_arrow_file_reader_set_use_threads(GParquetArrowFileReader* reader, int useThreads);

	// parquet.ArrowFileWriter

	GType gparquet_arrow_file_writer_get_type();
	GParquetArrowFileWriter* gparquet_arrow_file_writer_new_arrow(GArrowSchema* schema, GArrowOutputStream* sink, GError** err);
	GParquetArrowFileWriter* gparquet_arrow_file_writer_new_path(GArrowSchema* schema, const(char)* path, GError** err);
	int gparquet_arrow_file_writer_close(GParquetArrowFileWriter* writer, GError** err);
	int gparquet_arrow_file_writer_write_table(GParquetArrowFileWriter* writer, GArrowTable* table, ulong chunkSize, GError** err);
}