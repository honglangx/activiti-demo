<%@ page import="org.activiti.engine.impl.pvm.process.ActivityImpl" %>
<%--
  Created by IntelliJ IDEA.
  User: wangbin
  Date: 13-10-30
  Time: 上午9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>form</title>
</head>
<body>
    <fieldset>
        <c:if test="${task.name == '申请'}" var="taskName">
        <legend>${task.getName()}</legend>
        <form action="${path}/simple/submit.do" method="post">
           <input type="hidden" name="taskId" value="${taskId}">
           <c:forEach var="fp" items="${fpList}">
                ${fp.getName()}
                <c:if test="${fp.isRequired()}">
                    <font color=red>*</font>
                </c:if>
                <c:set value="${fp.getType()}" var="ft"></c:set>
                <c:if test="${ft.getName()=='enum'}">
                     <select id="${fp.getId()}" name="${fp.getId()}">
                              <c:forEach var="map" items="${ft.getInformation('values')}">
                                  <option value="${map.key}">${map.value}</option>"
                              </c:forEach>
                     </select><br>
                </c:if>
                <c:if test="${ft.getName()!='enum'}">
                    <input type='text' name="${fp.getId()}" /><br>
                </c:if>
           </c:forEach>
        </c:if>


        <c:if test="${task.name != '申请'}" var="taskName">
            <legend>${task.getName()}</legend>
            <form action="${path}/simple/submit.do" method="post">
            <input type="hidden" name="taskId" value="${taskId}">
            请假天数: ${map.get("day")}<input type="hidden" name="day" value="${map.get("day")}"> <br>
                     <c:if test="${map.get('type') == '0'}">
                       事假
                     </c:if>
                <input type="hidden" name="type" value="${map.get("type")}" /><br>
            请假原因：${map.get("reason")}
            <input type="hidden" name="reason" value="${map.get("reason")}" /><br>
        </c:if>
            <input type="submit"  name="result"  value="同意"/><br>
            <input type="submit"  name="result"  value="驳回"/>
            <select name="backActivityId">
                   <c:forEach var="activiti" items="${activityList}">
                       <option value="${activiti.getId()}">${activiti.getProperty("name")}</option>
                   </c:forEach>
            </select>
            </br>
            <input type="text" name="toSign" value="">
            <input type="submit" name="result" value="转签">
        </form>
    </fieldset>


</body>
</html>