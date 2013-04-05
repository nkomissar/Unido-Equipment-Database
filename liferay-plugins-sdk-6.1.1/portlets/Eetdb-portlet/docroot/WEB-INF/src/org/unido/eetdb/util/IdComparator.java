package org.unido.eetdb.util;

import com.liferay.portal.kernel.util.OrderByComparator;
import org.unido.eetdb.common.model.Entity;

public class IdComparator extends OrderByComparator {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static String ORDER_BY_ASC = "User_.firstName ASC";
	public static String ORDER_BY_DESC = "User_.firstName DESC";

	public IdComparator() {
		this(false);
	}

	public IdComparator(boolean asc) {
		_asc = asc;
	}

	public int compare(Object obj1, Object obj2) {

		Entity instance1 = (Entity) obj1;
		Entity instance2 = (Entity) obj2;

		long id1 = instance1.getId();
		long id2 = instance2.getId();
		
		int value = id1 < id2 ? -1 : id1 == id2 ? 0 : 1;

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