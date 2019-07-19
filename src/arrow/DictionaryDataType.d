module arrow.DictionaryDataType;

private import arrow.Array;
private import arrow.DataType;
private import arrow.FixedWidthDataType;
private import arrow.c.functions;
public  import arrow.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class DictionaryDataType : FixedWidthDataType
{
	/** the main Gtk struct */
	protected GArrowDictionaryDataType* gArrowDictionaryDataType;

	/** Get the main Gtk struct */
	public GArrowDictionaryDataType* getDictionaryDataTypeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gArrowDictionaryDataType;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gArrowDictionaryDataType;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArrowDictionaryDataType* gArrowDictionaryDataType, bool ownedRef = false)
	{
		this.gArrowDictionaryDataType = gArrowDictionaryDataType;
		super(cast(GArrowFixedWidthDataType*)gArrowDictionaryDataType, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return garrow_dictionary_data_type_get_type();
	}

	/**
	 *
	 * Params:
	 *     indexDataType = The data type of index.
	 *     dictionary = The dictionary.
	 *     ordered = Whether dictionary contents are ordered or not.
	 * Returns: The newly created dictionary data type.
	 *
	 * Since: 0.8.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(DataType indexDataType, Array dictionary, bool ordered)
	{
		auto p = garrow_dictionary_data_type_new((indexDataType is null) ? null : indexDataType.getDataTypeStruct(), (dictionary is null) ? null : dictionary.getArrayStruct(), ordered);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GArrowDictionaryDataType*) p, true);
	}

	/**
	 * Returns: The dictionary as #GArrowArray.
	 *
	 * Since: 0.8.0
	 */
	public Array getDictionary()
	{
		auto p = garrow_dictionary_data_type_get_dictionary(gArrowDictionaryDataType);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Array)(cast(GArrowArray*) p, true);
	}

	/**
	 * Returns: The #GArrowDataType of index.
	 *
	 * Since: 0.8.0
	 */
	public DataType getIndexDataType()
	{
		auto p = garrow_dictionary_data_type_get_index_data_type(gArrowDictionaryDataType);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(DataType)(cast(GArrowDataType*) p, true);
	}

	/**
	 * Returns: Whether dictionary contents are ordered or not.
	 *
	 * Since: 0.8.0
	 */
	public bool isOrdered()
	{
		return garrow_dictionary_data_type_is_ordered(gArrowDictionaryDataType) != 0;
	}
}
