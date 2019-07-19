module parquet.c.types;

public import arrow.c.types;
public import gobject.c.types;


struct GParquetArrowFileReader
{
	GObject parentInstance;
}

struct GParquetArrowFileReaderClass
{
	GObjectClass parentClass;
}

struct GParquetArrowFileWriter
{
	GObject parentInstance;
}

struct GParquetArrowFileWriterClass
{
	GObjectClass parentClass;
}
