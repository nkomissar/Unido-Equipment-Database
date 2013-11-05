package org.unido.eetdb.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.List;

import org.unido.eetdb.common.model.EntityProperty;
import org.unido.eetdb.common.model.EntitySearchResult;

import com.liferay.portal.kernel.util.OrderByComparator;

public class CustomComparatorUtil {

	public static OrderByComparator getEntityOrderByComparator(
			String orderByCol, String orderByType) {

		boolean orderByAsc = false;

		if (orderByType.equals("asc")) {
			orderByAsc = true;
		}

		OrderByComparator orderByComparator = null;

		if (orderByCol.equalsIgnoreCase("id")) {
			orderByComparator = new IdComparator(orderByAsc);
		} else if (orderByCol.equalsIgnoreCase("name")) {
			orderByComparator = new NameComparator(orderByAsc);
		}

		return orderByComparator;
	}

	public static <T extends Comparable<? super T>> List<T> asSortedList(
			Collection<T> c) {

		List<T> list = new ArrayList<T>(c);
		java.util.Collections.sort(list);

		return list;
	}

	public static List<EntityProperty> sortPropertyByCode(Collection<EntityProperty> c) {

		List<EntityProperty> list = new ArrayList<EntityProperty>(c);
		
		java.util.Collections.sort(list, 
				new Comparator<EntityProperty>() 
				{
					public int compare(EntityProperty p1, EntityProperty p2) 
					{
						String code1 = p1.getTemplateProperty().getCode();
						String code2 = p2.getTemplateProperty().getCode();
						
						if (code1 == null)
						{
							code1 = "";
						}
						
						if (code2 == null)
						{
							code2 = "";
						}
						
						return code1
								.compareTo(code2);
					}
				});

		return list;
	}
	
	public static List<EntitySearchResult> sortEntitySearchResultsById(Collection<EntitySearchResult> c) {

		List<EntitySearchResult> list = new ArrayList<EntitySearchResult>(c);
		
		java.util.Collections.sort(list, 
				new Comparator<EntitySearchResult>() 
				{
					public int compare(EntitySearchResult p1, EntitySearchResult p2) 
					{
						return p1.getEntityId()
								.compareTo(p2.getEntityId());
					}
				});

		return list;
	}
}
