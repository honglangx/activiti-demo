<%--
  Created by IntelliJ IDEA.
  User: wangbin
  Date: 13-10-24
  Time: 下午5:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>登录</title>
</head>
<body>

    <div>
       <form action="${path}/simple/checkLogin.do" method="post">
       用户名:<input type="text" id="userName" name="userName" value="">
       密码: <input type="text" id="passWord" name="passWord" value="">
       <input  type="submit">
       </form>
    </div>

</body>
</html>