<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<table>
	<tr>
		<td>Id</td>
		<td>Name</td>
		<td>Action</td>
	</tr>
	<c:forEach var="topic" items="${listOfTopics}">
		<tr>
			<td><c:out value="${topic.id}" /></td>
			<!-- Automatically calls topic.getId() -->
			<td><c:out value="${topic.name}" /></td>
			<!-- Automatically calls topic.getName() -->
			<td><a
				href="<portlet:actionURL>
							<portlet:param name="action" value="doSomethingWithSomeObject" />
							<portlet:param name="someObjectId" value="${topic.id}" />
					  </portlet:actionURL>"><strong>Do something</strong></a>
		</tr>
	</c:forEach>
</table>
