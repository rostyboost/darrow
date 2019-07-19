module arrow.FixedSizeBinaryArray;

private import arrow.PrimitiveArray;
private import arrow.c.functions;
public  import arrow.c.types;


/** */
public class FixedSizeBinaryArray : PrimitiveArray
{
	/** the main Gtk struct */
	protected GArrowFixedSizeBinaryArray* gArrowFixedSizeBinaryArray;

	/** Get the main Gtk struct */
	public GArrowFixedSizeBinaryArray* getFixedSizeBinaryArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowFixedSizeBinaryArray;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowFixedSizeBinaryArray;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowFixedSizeBinaryArray* gArrowFixedSizeBinaryArray, bool ownedRef = false)
	{
		this.gArrowFixedSizeBinaryArray = gArrowFixedSizeBinaryArray;
		super(cast(GArrowPrimitiveArray*)gArrowFixedSizeBinaryArray, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_fixed_size_binary_array_get_type();
	}
}
