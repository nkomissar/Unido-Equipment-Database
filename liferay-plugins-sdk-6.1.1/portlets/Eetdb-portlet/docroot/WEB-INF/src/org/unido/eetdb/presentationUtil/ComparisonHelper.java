package org.unido.eetdb.presentationUtil;

import java.util.ArrayList;
import java.util.List;

import javax.portlet.PortletRequest;
import javax.portlet.PortletSession;

import org.unido.eetdb.common.model.Entity;

public class ComparisonHelper {

	public static final String COMPARISON_KEY = "comparison";
	
	public static void addToComparison(Entity entity, PortletRequest request)
	{
		PortletSession session = request.getPortletSession();
		
		Object value = session.getAttribute(COMPARISON_KEY);

		List<Entity> beingCompared;

		if (value == null)
		{
			beingCompared = new ArrayList<Entity>();
			session.setAttribute(COMPARISON_KEY, beingCompared);
		}
		else
		{
			beingCompared = toEntityList(value);
		}
		
		if(beingCompared.contains(entity))
		{
			return;
		}
		
		beingCompared.add(entity);
		
	}
	
	public static void removeFromComparison(long entityId, PortletRequest request)
	{
		PortletSession session = request.getPortletSession();
		
		Object value = session.getAttribute(COMPARISON_KEY);

		List<Entity> beingCompared;

		if (value == null)
		{
			return;
		}
		else
		{
			beingCompared = toEntityList(value);
		}
		
		for(Entity entity: beingCompared)
		{
			if (entity.getId() == entityId)
			{
				beingCompared.remove(entity);
				return;
			}
		}
		
	}
	
	public static boolean isInComparison(Entity entity, PortletRequest request)
	{
		PortletSession session = request.getPortletSession();
		
		Object value = session.getAttribute(COMPARISON_KEY);

		List<Entity> beingCompared;

		if (value == null)
		{
			return false;
		}
		else
		{
			beingCompared = toEntityList(value);
		}
		
		return beingCompared.contains(entity);
	}
	
	public static List<Entity> getComparison( PortletRequest request)
	{
		PortletSession session = request.getPortletSession();
		
		Object value = session.getAttribute(COMPARISON_KEY);

		if (value == null)
		{
			return new ArrayList<Entity>();
		}
		else
		{
			return toEntityList(value);
		}
		
		
	}
	
	private static List<Entity> toEntityList(Object value)
	{
		//how to fix warning ?
		return (List<Entity>)value;
	}
	
}
