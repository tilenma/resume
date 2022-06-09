<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Variable</title>
</head>
<body>
<h1>
	List of Environment Variable
</h1>

<P>  The time on the server is ${serverTime}. </P>

<table>
<c:forEach var="key" items="${keyList}" varStatus="status">
<tr>
	<td>${key}=${valueList.get(status.index)}</td>
</tr>
</c:forEach>
</table>
</body>
</html>
