<%@ page import="后端.showCStudent" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="后端.User" %><%--
  Created by IntelliJ IDEA.
  User: 李光士
  Date: 2021/11/19
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="输入框.css">
</head>
<body>
<table border="1" style=" border-collapse: collapse;width: 80%;margin: auto">
    <tr style="color: #00ccff;height: 30px;line-height: 30px">
        <th>学期</th>
        <th>课序号</th>
        <th>科目名称</th>
        <th>学生姓名</th>
        <th>学生班级</th>
        <th>学生专业</th>
    </tr>
    <tbody style="text-align: center;height: 30px;line-height: 30px">
    <%
        showCStudent showCStudent=new showCStudent();
        ArrayList<User> arrayList=showCStudent.show((String) request.getSession().getAttribute("username"));
        for (User user : arrayList) {%>
    <tr style="height: 30px">
        <td><%=user.getTerm()%>
        </td>
        <td><%=user.getCourseNumber()%>
        </td>
        <td><%=user.getCourseName()%>
        </td>
        <td><%=user.getStudent()%>
        </td>
        <td><%=user.getClasses()%>
        </td>
        <td><%=user.getMajor()%>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>
</body>
</html>
