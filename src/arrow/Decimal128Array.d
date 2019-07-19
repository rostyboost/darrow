module arrow.Decimal128Array;

private import arrow.Decimal128;
private import arrow.FixedSizeBinaryArray;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Decimal128Array : FixedSizeBinaryArray
{
	/** the main Gtk struct */
	protected GArrowDecimal128Array* gArrowDecimal128Array;

	/** Get the main Gtk struct */
	public GArrowDecimal128Array* getDecimal128ArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowDecimal128Array;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowDecimal128Array;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowDecimal128Array* gArrowDecimal128Array, bool ownedRef = false)
	{
		this.gArrowDecimal128Array = gArrowDecimal128Array;
		super(cast(GArrowFixedSizeBinaryArray*)gArrowDecimal128Array, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_decimal128_array_get_type();
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target value.
	 * Returns: The formatted i-th value.
	 *
	 *     The returned string should be freed with g_free() when no longer
	 *     needed.
	 *
	 * Since: 0.10.0
	 */
	public string formatValue(long i)
	{
		auto retStr = garrow_decimal128_array_format_value(gArrowDecimal128Array, i);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 *
	 * Params:
	 *     i = The index of the target value.
	 * Returns: The i-th value.
	 *
	 * Since: 0.10.0
	 */
	public Decimal128 getValue(long i)
	{
		auto p = garrow_decimal128_array_get_value(gArrowDecimal128Array, i);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Decimal128)(cast(GArrowDecimal128*) p, true);
	}
}
