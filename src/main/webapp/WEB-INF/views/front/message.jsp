<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./taglib.jsp"%>
<html>
<head>
<meta name="decorator" content="front_default"/>
<title>消息提醒</title>
</head>
<body>
<c:if test="${not empty message}">
	${message}
</c:if>
</body>
</html>