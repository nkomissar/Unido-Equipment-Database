package org.unido.eetdb.util;

import com.liferay.portal.kernel.util.OrderByComparator;
import org.unido.eetdb.common.model.Entity;

public class NameComparator extends OrderByComparator {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static String ORDER_BY_ASC = "User_.firstName ASC";
	public static String ORDER_BY_DESC = "User_.firstName DESC";

	public NameComparator() {
		this(false);
	}

	public NameComparator(boolean asc) {
		_asc = asc;
	}

	public int compare(Object obj1, Object obj2) {

		Entity instance1 = (Entity) obj1;
		Entity instance2 = (Entity) obj2;

		int value = instance1.getName().toLowerCase()
				.compareTo(instance2.getName().toLowerCase());

		if (_asc) {
			return value;
		} else {
			return -value;
		}

	}

	public String getOrderBy() {

		if (_asc) {
			return ORDER_BY_ASC;
		} else {
			return ORDER_BY_DESC;
		}
	}

	private boolean _asc;
}