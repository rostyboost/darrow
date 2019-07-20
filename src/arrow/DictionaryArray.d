module arrow.DictionaryArray;

private import arrow.Array;
private import arrow.DataType;
private import arrow.DictionaryDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class DictionaryArray : Array
{
	/** the main Gtk struct */
	protected GArrowDictionaryArray* gArrowDictionaryArray;

	/** Get the main Gtk struct */
	public GArrowDictionaryArray* getDictionaryArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowDictionaryArray;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowDictionaryArray;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowDictionaryArray* gArrowDictionaryArray, bool ownedRef = false)
	{
		this.gArrowDictionaryArray = gArrowDictionaryArray;
		super(cast(GArrowArray*)gArrowDictionaryArray, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_dictionary_array_get_type();
	}

	/**
	 *
	 * Params:
	 *     dataType = The data type of the dictionary array.
	 *     indices = The indices of values in dictionary.
	 *     dictionary = The dictionary of the dictionary array.
	 * Returns: A newly created #GArrowDictionaryArray
	 *     or %NULL on error.
	 *
	 * Since: 0.8.0
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(DataType dataType, Array indices, Array dictionary)
	{
		GError* err = null;

		auto p = garrow_dictionary_array_new((dataType is null) ? null : dataType.getDataTypeStruct(), (indices is null) ? null : indices.getArrayStruct(), (dictionary is null) ? null : dictionary.getArrayStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowDictionaryArray*) p, true);
	}

	/**
	 * Returns: The dictionary of this array.
	 *
	 * Since: 0.8.0
	 */
	public Array getDictionary()
	{
		auto p = garrow_dictionary_array_get_dictionary(gArrowDictionaryArray);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Array)(cast(GArrowArray*) p, true);
	}

	/**
	 * Returns: The dictionary data type of this array.
	 *
	 * Since: 0.8.0
	 */
	public DictionaryDataType getDictionaryDataType()
	{
		auto p = garrow_dictionary_array_get_dictionary_data_type(gArrowDictionaryArray);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(DictionaryDataType)(cast(GArrowDictionaryDataType*) p, true);
	}

	/**
	 * Returns: The indices of values in dictionary.
	 *
	 * Since: 0.8.0
	 */
	public Array getIndices()
	{
		auto p = garrow_dictionary_array_get_indices(gArrowDictionaryArray);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Array)(cast(GArrowArray*) p, true);
	}
}
