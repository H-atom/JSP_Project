<%--@elvariable id="terror" type="后端"--%>
<%--@elvariable id="none" type="后端"--%>
<%--@elvariable id="success" type="后端"--%>
<%--@elvariable id="defeat" type="后端"--%>
<%--
  Created by IntelliJ IDEA.
  User: 李光士
  Date: 2021/11/14
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>找回密码</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="icon" href="bitbug_favicon.ico">
    <link rel="stylesheet" type="text/css" href="输入框.css">
    <style>
        body{
            background-image: url("星空背景.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }
        #div{
            background-image: url("background.gif");
            background-color: rgba(198,220,224,0.5);
            width: 300px;
            height: 350px;
            padding: 50px;
            margin: 10px auto;
            border: 0 solid gray;
            box-shadow: 0 0 10px gray;
        }
        input{
            width: 200px;
            margin-bottom: 15px;
        }
        button{
            background-color: deepskyblue;
            width: 90px;
            height: 36px;
            margin-left: 10px;
            color: white;
            border-radius:20px;
            border-style:none;
            font-size:14px;
            color:rgba(249,248,248,1.00);
        }
    </style>
</head>
<body>
<div id="div">
    <div>
        <h1 style="color: #00ccff">找回密码</h1>
        <form style="padding: 0;margin: 0" method="post" action="forgetServlet">
            <input type="number" placeholder="工号/学号" name="number">
            <input type="number" placeholder="电话号码" name="phone">
            <input type="email" placeholder="电子邮箱" name="email">
            <input type="password" placeholder="新密码" name="newPassword">
            <input type="password" placeholder="确认密码" name="surePassword">
            <button>确认修改</button><button onclick="backs(this)">返回</button>
        </form>

    </div>
    <div style="display: none;background-color: rgba(10,10,10,0.2);z-index: 2;margin-top:-315px;margin-left: -19px;position: absolute;width: 330px;height: 350px;" id="divSure">
        <div style="background-color: white;height: 207px;width: 306px;margin-top: 60px;margin-left: 10px">
            <p style="color: #00ccff;margin-left: 43px;padding: 0;line-height: 160px;height: 4px">${terror}${none}${success}${defeat}</p>
            <%if (request.getAttribute("none")!=null||request.getAttribute("terror")!=null||request.getAttribute("defeat")!=null){%>
            <button style="text-align: center;margin-top: 150px;margin-left: 227px;color:white;background-color: #00ccff;width: 60px;height: 33px" onclick="back(0,this)">确定</button>
            <%}else if (request.getAttribute("success")!=null){%>
                <button style="text-align: center;margin-top: 110px;margin-left: 175px;color:white;background-color: #00ccff;width: 60px;height: 33px" onclick="back(1,this)">确定</button>
            <%}%>
        </div>
    </div>
</div>
<script>

    function back(number,button) {
        var div=document.getElementById("divSure");
        if (number===0){
            div.style.display="none";
        }else {
          backs(button);
        }
    }
    function backs(button) {
        button.formAction="web.jsp";
    }

    <%
        if (request.getAttribute("none")!=null||request.getAttribute("terror")!=null||request.getAttribute("success")!=null){%>
    window.onload=function () {
        var div=document.getElementById("divSure");
        div.style.display="block";
    }
    <%}%>
</script>

</body>
</html>