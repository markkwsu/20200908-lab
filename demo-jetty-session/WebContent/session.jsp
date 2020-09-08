<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session Demo</title>
</head>
<body>
	<c:if test="${not empty sessionScope.hello}">
		<c:out value="${sessionScope.hello}" />
	</c:if>
	<c:if test="${empty sessionScope.hello}">
		No Session
		<c:set var="hello" value="Hello World" scope="session"></c:set>
	</c:if>
	<%
		String hostname = java.net.InetAddress.getLocalHost().getHostName();
		request.getSession().setAttribute("hostname", hostname);
	%>
	<%= hostname %>
</body>
</html>