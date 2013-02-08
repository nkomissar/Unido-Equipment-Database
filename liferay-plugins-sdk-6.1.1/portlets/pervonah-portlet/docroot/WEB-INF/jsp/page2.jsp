<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet" %>

<portlet:actionURL var="doActionURL">
	<portlet:param name="action" value="doAction" />
</portlet:actionURL>

<a href="${doActionURL}">do Something</a>