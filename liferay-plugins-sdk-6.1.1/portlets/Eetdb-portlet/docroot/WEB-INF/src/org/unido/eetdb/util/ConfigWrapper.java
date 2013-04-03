package org.unido.eetdb.util;

import javax.portlet.PortletPreferences;
import javax.portlet.PortletRequest;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portlet.PortletPreferencesFactoryUtil;

public class ConfigWrapper 
{

	public static String getServUrl(PortletRequest request) {
		
		PortletPreferences preferences = request.getPreferences();
		String portletResource = ParamUtil.getString(request, "portletResource");
		
		if (Validator.isNotNull(portletResource)) {
			try 
			{
				
				preferences = PortletPreferencesFactoryUtil.getPortletSetup(
						request, portletResource);
				
			} 
			catch (PortalException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			catch (SystemException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return preferences.getValue("eetDbServicesUrl", null);
	}
	
	public static boolean useFiddlerProxy(PortletRequest request) {
		
		PortletPreferences preferences = request.getPreferences();
		String portletResource = ParamUtil.getString(request, "portletResource");
		
		if (Validator.isNotNull(portletResource)) {
			try 
			{
				
				preferences = PortletPreferencesFactoryUtil.getPortletSetup(
						request, portletResource);
				
			} 
			catch (PortalException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			catch (SystemException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return 
			Boolean.parseBoolean(
					preferences.getValue("useFiddlerProxy", null)
					);
	}

}
