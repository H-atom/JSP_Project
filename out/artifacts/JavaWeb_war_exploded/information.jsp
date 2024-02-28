<%--@elvariable id="success" type="后端"--%>
<%--
  Created by IntelliJ IDEA.
  User: 李光士
  Date: 2021/11/14
  Time: 18:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人信息完善</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="icon" href="bitbug_favicon.ico">
    <link rel="stylesheet" type="text/css" href="输入框.css">
    <style>
        body{
            background-image: url("背景2.jpg");
            background-repeat: no-repeat;
            background-size: 100% 130%;
        }
        #div{
            background-image: url("背景1.jpg");
            background-size:100% 100%;
            width: 300px;
            height: 350px;
            padding: 50px;
            margin: 100px auto;
            border: 0 solid gray;
            box-shadow: 0 0 10px gray;
        }
        input{
            width: 200px;
            margin-bottom: 7px;
        }
        button{
            background-color: deepskyblue;
            width: 90px;
            height: 36px;
            margin-right: 10px;
            color: white;
            border-radius:20px;
            border-style:none;
            font-size:14px;
            color:rgba(249,248,248,1.00);
        }
        button:focus{
            background-color: deepskyblue;
        }
        li{
            margin-left: 0;
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
<div id="div">
    <div>
        <h1 style="margin-bottom: 0">个人信息完善</h1>
        <form method="post" action="informationServlet">
            <ul style="list-style: none;display: inline-block;font-size:large;padding: 0">
                <input type="hidden" name="usernumber" value="<%=request.getSession().getAttribute("number")%>">
                <input type="hidden" name="password" value="<%=request.getSession().getAttribute("Password")%>">
                <li>&nbsp;&nbsp;&nbsp;&nbsp;姓名:<%=request.getSession().getAttribute("username")%></li>
                <li>&nbsp;&nbsp;&nbsp;&nbsp;身份:
                    <%
                        if ("student".equals(request.getSession().getAttribute("sex"))){%>学生
                    <%}else{%>老师<%}%>
                </li>
                <%
                    if ("student".equals(request.getSession().getAttribute("sex"))){%>
                <li>&nbsp;&nbsp;&nbsp;&nbsp;学号:<%=request.getSession().getAttribute("number")%></li>
                <li>&nbsp;&nbsp;&nbsp;&nbsp;班级: <%=request.getSession().getAttribute("classes")%></li>
                <li>&nbsp;&nbsp;&nbsp;&nbsp;专业: <%=request.getSession().getAttribute("major")%></li>
                <%}else{%>
                <li>&nbsp;&nbsp;&nbsp;&nbsp;工号:<%=request.getSession().getAttribute("number")%></li>
                <li>&nbsp;&nbsp;&nbsp;&nbsp;科目: <%=request.getSession().getAttribute("courseType")%></li>
                <%}%>
                <li> &nbsp;&nbsp;&nbsp;&nbsp;邮箱:<input type="email" placeholder="电子邮箱" name="email"></li>
                <li>&nbsp;&nbsp;&nbsp;&nbsp;电话:<input type="number" placeholder="号码" name="phone"><br></li>
                <li> <button style="margin-left: 30px">确认</button><button onclick="back(this)" style="margin-left: 40px">返回</button></li>
            </ul>
        </form>
    </div>
    <div style="display: none;background-color: rgba(10,10,10,0.2);z-index: 2;margin-top:-315px;margin-left: -19px;position: absolute;width: 330px;height: 350px;" id="divSure">
        <div style="background-color: white;height: 207px;width: 306px;margin-top: 60px;margin-left: 10px">
            <p style="color: #00ccff;margin-left: 43px;padding: 0;line-height: 160px;height: 4px">${success}</p>
            <form>
                <input type="hidden" name="usernumber" value="<%=request.getSession().getAttribute("number")%>">
                <input type="hidden" name="password" value="<%=request.getSession().getAttribute("Password")%>">
                <button style="text-align: center;margin-top: 110px;margin-left: 175px;color:white;background-color: #00ccff;width: 60px;height: 33px" onclick="back(this)">确定</button>
            </form>
        </div>
    </div>
</div>

<script>
    <%
     if (request.getAttribute("success")!=null){%>
   function show() {
        var div=document.getElementById("divSure");
        div.style.display="block";
    }
    <%}%>
    function back(button) {
        button.formMethod="post";
        button.type="submit";
        button.formAction="loginServlet";
    }
    window.onload=function () {
        show();
    }
</script>
</body>
</html>
