
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet" %>

<portlet:renderURL var="showPage2URL">
	<portlet:param name="action" value="showPage2" />
</portlet:renderURL>

<a href="${showPage2URL}">Show me page 2</a>