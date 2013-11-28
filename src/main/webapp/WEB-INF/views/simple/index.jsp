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
    <title>个人任务平台</title>
</head>
<body>

     <div>
         <form action="${path}/simple/deploy.do" method="post" enctype="multipart/form-data">
             <input type="file" name="file"/>
             <input type="submit" value="提交流程定义" />
         </form>
         </br>
         &nbsp;[用户: ${user.getId()}]<a href="${path}/simple/login.do">登陆</a>
     </div>


    <!-- 流程列表-->
    <div>
        <table border="1" width="100%" cellpadding="0" cellspacing="0" >
            <h3>我可以开始的流程</h3>
            <thead>
            <tr>
                <td>流程ID</td>
                <td>流程名称</td>
                <td>流程版本</td>
                <td>操作</td>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="pd" items="${pdList}"  >
                <tr>
                    <td>${pd.getId()}</td>
                    <td>${pd.getName()}</td>

                    <td>${pd.getVersion()}</td>
                    <td>
                        <a href="${path}/simple/remove.do?processDefId=${pd.getDeploymentId()}">删除</a>
                        &nbsp;|&nbsp;
                        <a href="${path}/simple/start.do?processDefId=${pd.getId()}&userId=${user.getId()}">开始</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

     <!--可认领任务列表 -->
     <c:if test="${groupTasks.size()>0}">
     <div>
         <table border="1" width="100%" cellpadding="0" cellspacing="0">
             <h3>可认领任务</h3>
             <thead>
             <tr>
                 <td>任务ID</td>
                 <td>任务名称</td>
                 <td>&nbsp;</td>
             </tr>
             </thead>
             <tbody>

             <c:forEach var="task" items="${groupTasks}"  >
                 <tr>
                     <td>${task.getId()}</td>
                     <td>${task.getName()}</td>
                     <td><a href="${path}/simple/claim/${task.getId()}?userId=${user.getId()}">认领</a></td>
                 </tr>
             </c:forEach>
             </tbody>
         </table>
     </div>
     </c:if>

    <!-- 代办任务列表-->
    <c:if test="${userTasks.size()>0}">
        <div>
             <table border="1" width="100%" cellpadding="0" cellspacing="0">
                 <h3>待办任务</h3>
                 <thead>
                 <tr>
                     <td>任务ID</td>
                     <td>任务名称</td>
                     <td>操作</td>
                 </tr>
                 </thead>
                 <tbody>

                 <c:forEach var="task" items="${userTasks}"  >
                     <tr>
                         <td>${task.getId()}</td>
                         <td>${task.getName()}</td>
                         <td><a href="${path}/simple/form.do?taskId=${task.getId()}">执行</a></td>
                     </tr>
                 </c:forEach>
                 </tbody>
             </table>
        </div>
    </c:if>

     <div>
         <table border="1" width="100%" cellpadding="0" cellspacing="0">
             <h3>任务流转状况</h3>
             <thead>
             <tr>
                 <td>流程实例ID</td>
                 <td>当前任务ID</td>
                 <td>当前任务</td>
                 <td>任务执行人</td>
                 <td>查看</td>
             </tr>
             </thead>
             <tbody>
             <c:forEach var="task" items="${taskList}"  >
                 <tr>
                     <td>${task.getProcessInstanceId()}</td>
                     <td>${task.getId()}</td>
                     <td>${task.getName()}</td>
                     <td><c:out value="${task.getAssignee()}" default="未认领"/></td>
                     <td><a href="${path}/simple/view.do?executionId=${task.getExecutionId()}">流程图</a></td>
                 </tr>
             </c:forEach>
             </tbody>
         </table>
     </div>

     <div>
         <table border="1" width="100%">
             <h3>历史流程</h3>
             <thead>
             <tr>
                 <td>id</td>
                 <td>发起人</td>
                 <td>开始时间</td>
                 <td>结束时间</td>
             </tr>
             </thead>
             <tbody>
             <c:forEach var="hpi" items="${hpiList}">
                 <tr>
                     <td>${hpi.getId()}</td>
                     <td>${hpi.getStartUserId()}</td>
                     <td>${hpi.getStartTime()}</td>
                     <td>${hpi.getEndTime()}</td>
                 </tr>
             </c:forEach>
             </tbody>
         </table>
     </div>
</body>
</html>