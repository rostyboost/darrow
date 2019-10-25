module arrow.Decimal128;

private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Decimal128 : ObjectG
{
	/** the main Gtk struct */
	protected GArrowDecimal128* gArrowDecimal128;

	/** Get the main Gtk struct */
	public GArrowDecimal128* getDecimal128Struct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowDecimal128;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowDecimal128;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowDecimal128* gArrowDecimal128, bool ownedRef = false)
	{
		this.gArrowDecimal128 = gArrowDecimal128;
		super(cast(GObject*)gArrowDecimal128, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_decimal128_get_type();
	}

	/**
	 *
	 * Params:
	 *     data = The data of the decimal.
	 * Returns: A newly created #GArrowDecimal128.
	 *
	 * Since: 0.10.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(long data)
	{
		auto p = garrow_decimal128_new_integer(data);

		if(p is null)
		{
			throw new ConstructionException("null returned by new_integer");
		}

		this(cast(GArrowDecimal128*) p, true);
	}

	/**
	 *
	 * Params:
	 *     data = The data of the decimal.
	 * Returns: A newly created #GArrowDecimal128.
	 *
	 * Since: 0.10.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string data)
	{
		auto p = garrow_decimal128_new_string(Str.toStringz(data));

		if(p is null)
		{
			throw new ConstructionException("null returned by new_string");
		}

		this(cast(GArrowDecimal128*) p, true);
	}

	/**
	 * Computes the absolute value of the @decimal destructively.
	 *
	 * Since: 0.10.0
	 */
	public void abs()
	{
		garrow_decimal128_abs(gArrowDecimal128);
	}

	/**
	 *
	 * Params:
	 *     right = A #GArrowDecimal128.
	 *     remainder = A return location for the remainder
	 *         value of these decimals. The returned #GArrowDecimal128 be
	 *         unreferred with g_object_unref() when no longer needed.
	 * Returns: The divided value of
	 *     these decimals or %NULL on error.
	 *
	 * Since: 0.11.0
	 *
	 * Throws: GException on failure.
	 */
	public Decimal128 divide(Decimal128 right, out Decimal128 remainder)
	{
		GArrowDecimal128* outremainder = null;
		GError* err = null;

		auto p = garrow_decimal128_divide(gArrowDecimal128, (right is null) ? null : right.getDecimal128Struct(), &outremainder, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		remainder = ObjectG.getDObject!(Decimal128)(outremainder);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Decimal128)(cast(GArrowDecimal128*) p, true);
	}

	/**
	 *
	 * Params:
	 *     otherDecimal = A #GArrowDecimal128 to be compared.
	 * Returns: %TRUE if the decimal is equal to the other decimal, %FALSE
	 *     otherwise.
	 *
	 * Since: 0.12.0
	 */
	public bool equal(Decimal128 otherDecimal)
	{
		return garrow_decimal128_equal(gArrowDecimal128, (otherDecimal is null) ? null : otherDecimal.getDecimal128Struct()) != 0;
	}

	/**
	 *
	 * Params:
	 *     otherDecimal = A #GArrowDecimal128 to be compared.
	 * Returns: %TRUE if the decimal is greater than the other decimal,
	 *     %FALSE otherwise.
	 *
	 * Since: 0.12.0
	 */
	public bool greaterThan(Decimal128 otherDecimal)
	{
		return garrow_decimal128_greater_than(gArrowDecimal128, (otherDecimal is null) ? null : otherDecimal.getDecimal128Struct()) != 0;
	}

	/**
	 *
	 * Params:
	 *     otherDecimal = A #GArrowDecimal128 to be compared.
	 * Returns: %TRUE if the decimal is greater than the other decimal
	 *     or equal to the other decimal, %FALSE otherwise.
	 *
	 * Since: 0.12.0
	 */
	public bool greaterThanOrEqual(Decimal128 otherDecimal)
	{
		return garrow_decimal128_greater_than_or_equal(gArrowDecimal128, (otherDecimal is null) ? null : otherDecimal.getDecimal128Struct()) != 0;
	}

	/**
	 *
	 * Params:
	 *     otherDecimal = A #GArrowDecimal128 to be compared.
	 * Returns: %TRUE if the decimal is less than the other decimal,
	 *     %FALSE otherwise.
	 *
	 * Since: 0.12.0
	 */
	public bool lessThan(Decimal128 otherDecimal)
	{
		return garrow_decimal128_less_than(gArrowDecimal128, (otherDecimal is null) ? null : otherDecimal.getDecimal128Struct()) != 0;
	}

	/**
	 *
	 * Params:
	 *     otherDecimal = A #GArrowDecimal128 to be compared.
	 * Returns: %TRUE if the decimal is less than the other decimal
	 *     or equal to the other decimal, %FALSE otherwise.
	 *
	 * Since: 0.12.0
	 */
	public bool lessThanOrEqual(Decimal128 otherDecimal)
	{
		return garrow_decimal128_less_than_or_equal(gArrowDecimal128, (otherDecimal is null) ? null : otherDecimal.getDecimal128Struct()) != 0;
	}

	/**
	 *
	 * Params:
	 *     right = A #GArrowDecimal128.
	 * Returns: The subtracted value of these decimals.
	 *
	 * Since: 0.11.0
	 */
	public Decimal128 minus(Decimal128 right)
	{
		auto p = garrow_decimal128_minus(gArrowDecimal128, (right is null) ? null : right.getDecimal128Struct());

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Decimal128)(cast(GArrowDecimal128*) p, true);
	}

	/**
	 *
	 * Params:
	 *     right = A #GArrowDecimal128.
	 * Returns: The multiplied value of these decimals.
	 *
	 * Since: 0.11.0
	 */
	public Decimal128 multiply(Decimal128 right)
	{
		auto p = garrow_decimal128_multiply(gArrowDecimal128, (right is null) ? null : right.getDecimal128Struct());

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Decimal128)(cast(GArrowDecimal128*) p, true);
	}

	/**
	 * Negate the current value of the @decimal destructively.
	 *
	 * Since: 0.10.0
	 */
	public void negate()
	{
		garrow_decimal128_negate(gArrowDecimal128);
	}

	/**
	 *
	 * Params:
	 *     otherDecimal = A #GArrowDecimal128 to be compared.
	 * Returns: %TRUE if the decimal isn't equal to the other decimal,
	 *     %FALSE otherwise.
	 *
	 * Since: 0.12.0
	 */
	public bool notEqual(Decimal128 otherDecimal)
	{
		return garrow_decimal128_not_equal(gArrowDecimal128, (otherDecimal is null) ? null : otherDecimal.getDecimal128Struct()) != 0;
	}

	/**
	 *
	 * Params:
	 *     right = A #GArrowDecimal128.
	 * Returns: The added value of these decimals.
	 *
	 * Since: 0.11.0
	 */
	public Decimal128 plus(Decimal128 right)
	{
		auto p = garrow_decimal128_plus(gArrowDecimal128, (right is null) ? null : right.getDecimal128Struct());

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Decimal128)(cast(GArrowDecimal128*) p, true);
	}

	/**
	 *
	 * Params:
	 *     originalScale = A scale to be converted from.
	 *     newScale = A scale to be converted to.
	 * Returns: The rescaled decimal or %NULL on error.
	 *
	 * Since: 0.15.0
	 *
	 * Throws: GException on failure.
	 */
	public Decimal128 rescale(int originalScale, int newScale)
	{
		GError* err = null;

		auto p = garrow_decimal128_rescale(gArrowDecimal128, originalScale, newScale, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Decimal128)(cast(GArrowDecimal128*) p, true);
	}

	/**
	 * Returns: The 64-bit integer representation of the decimal.
	 *
	 * Since: 0.10.0
	 */
	public long toInteger()
	{
		return garrow_decimal128_to_integer(gArrowDecimal128);
	}

	/**
	 * Returns: The string representation of the decimal.
	 *
	 *     It should be freed with g_free() when no longer needed.
	 *
	 * Since: 0.10.0
	 */
	public override string toString()
	{
		auto retStr = garrow_decimal128_to_string(gArrowDecimal128);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 *
	 * Params:
	 *     scale = The scale of the decimal.
	 * Returns: The string representation of the decimal.
	 *
	 *     It should be freed with g_free() when no longer needed.
	 *
	 * Since: 0.10.0
	 */
	public string toStringScale(int scale)
	{
		auto retStr = garrow_decimal128_to_string_scale(gArrowDecimal128, scale);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}
}
