module arrow.Decimal128ArrayBuilder;

private import arrow.ArrayBuilder;
private import arrow.Decimal128;
private import arrow.Decimal128DataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class Decimal128ArrayBuilder : ArrayBuilder
{
	/** the main Gtk struct */
	protected GArrowDecimal128ArrayBuilder* gArrowDecimal128ArrayBuilder;

	/** Get the main Gtk struct */
	public GArrowDecimal128ArrayBuilder* getDecimal128ArrayBuilderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowDecimal128ArrayBuilder;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowDecimal128ArrayBuilder;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowDecimal128ArrayBuilder* gArrowDecimal128ArrayBuilder, bool ownedRef = false)
	{
		this.gArrowDecimal128ArrayBuilder = gArrowDecimal128ArrayBuilder;
		super(cast(GArrowArrayBuilder*)gArrowDecimal128ArrayBuilder, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_decimal128_array_builder_get_type();
	}

	/**
	 *
	 * Params:
	 *     dataType = #GArrowDecimal128DataType for the decimal.
	 * Returns: A newly created #GArrowDecimal128ArrayBuilder.
	 *
	 * Since: 0.10.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Decimal128DataType dataType)
	{
		auto p = garrow_decimal128_array_builder_new((dataType is null) ? null : dataType.getDecimal128DataTypeStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowDecimal128ArrayBuilder*) p, true);
	}

	/**
	 *
	 *
	 * Deprecated: Use garrow_decimal128_array_builder_append_value() instead.
	 *
	 * Params:
	 *     value = A decimal value.
	 *
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.10.0
	 *
	 * Throws: GException on failure.
	 */
	public bool append(Decimal128 value)
	{
		GError* err = null;

		auto p = garrow_decimal128_array_builder_append(gArrowDecimal128ArrayBuilder, (value is null) ? null : value.getDecimal128Struct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 *     It appends a new NULL element.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public bool appendNull()
	{
		GError* err = null;

		auto p = garrow_decimal128_array_builder_append_null(gArrowDecimal128ArrayBuilder, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 *
	 * Params:
	 *     value = A decimal value.
	 * Returns: %TRUE on success, %FALSE if there was an error.
	 *
	 * Since: 0.12.0
	 *
	 * Throws: GException on failure.
	 */
	public bool appendValue(Decimal128 value)
	{
		GError* err = null;

		auto p = garrow_decimal128_array_builder_append_value(gArrowDecimal128ArrayBuilder, (value is null) ? null : value.getDecimal128Struct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}
}
