package org.unido.eetdb.util;

import com.liferay.portal.kernel.util.OrderByComparator;

public class CustomComparatorUtil {
	
	public static OrderByComparator getEntityOrderByComparator(String orderByCol,
			String orderByType) {

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
}
