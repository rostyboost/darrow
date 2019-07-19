module arrow.NumericArray;

private import arrow.PrimitiveArray;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ErrorG;
private import glib.GException;


/** */
public class NumericArray : PrimitiveArray
{
	/** the main Gtk struct */
	protected GArrowNumericArray* gArrowNumericArray;

	/** Get the main Gtk struct */
	public GArrowNumericArray* getNumericArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowNumericArray;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowNumericArray;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowNumericArray* gArrowNumericArray, bool ownedRef = false)
	{
		this.gArrowNumericArray = gArrowNumericArray;
		super(cast(GArrowPrimitiveArray*)gArrowNumericArray, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_numeric_array_get_type();
	}

	/**
	 * Returns: The value of the computed mean.
	 *
	 * Since: 0.13.0
	 *
	 * Throws: GException on failure.
	 */
	public double mean()
	{
		GError* err = null;

		auto p = garrow_numeric_array_mean(gArrowNumericArray, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}
}
