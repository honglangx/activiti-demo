<%--
  Created by IntelliJ IDEA.
  User: wangbin
  Date: 13-10-29
  Time: 下午5:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>view</title>
</head>
<body>

<div>
    <img src="${path}/simple/viewPic.do?executionId=${executionId}" style="position:absolute;left:0px;top:0px;">
</div>

</body>
</html>