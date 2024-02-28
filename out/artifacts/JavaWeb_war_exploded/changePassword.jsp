<%--@elvariable id="success" type="后端"--%>
<%--@elvariable id="none" type="后端"--%>
<%--@elvariable id="terror" type="后端"--%>
<%--
  Created by IntelliJ IDEA.
  User: 李光士
  Date: 2021/11/11
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="icon" href="bitbug_favicon.ico">
    <link rel="stylesheet" type="text/css" href="输入框.css">
    <style>
        body{
            background-image: url("雪景.jpg");
            background-repeat: no-repeat;
            background-size: 100% 160%;
        }
        #div{
            width: 300px;
            height: 350px;
            padding: 50px;
            margin-top: 12px;
            margin-left: 800px;
            border: 0 solid gray;
            box-shadow: 0 0 10px gray;
        }
        input{
            width: 200px;
            margin-bottom: 15px;
        }
        .button{
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
        .button:focus{
            background-color: deepskyblue;
        }
    </style>
</head>
<body>
<div id="div">
    <div>
        <h1>修改密码</h1>
        <form method="post" action="updateDataServlet">
            <input type="number" placeholder="用户名" name="userName">
            <input type="password" placeholder="原密码" name="oldPassword">
            <input type="password" placeholder="新密码" name="newPassword">
            <input type="password" placeholder="确认密码" name="surePassword">
            <input type="hidden" name="usernumber" value="<%=request.getSession().getAttribute("number")%>">
            <input type="hidden" name="password" value="<%=request.getSession().getAttribute("Password")%>">
            <button class="button">确认修改</button><button class="button" onclick="back(1,this)">返回</button>
        </form>
    </div>
    <div style="display: none;background-color: rgba(10,10,10,0.2);z-index: 2;margin-top:-315px;margin-left: -19px;position: absolute;width: 330px;height: 350px;" id="divSure">
        <div style="background-color: white;height: 207px;width: 306px;margin-top: 60px;margin-left: 10px">
            <p style="color: #00ccff;margin-left: 43px;padding: 0;line-height: 160px;height: 4px">${terror}${none}${success}</p>
            <%if (request.getAttribute("none")!=null||request.getAttribute("terror")!=null){%>
            <button style="text-align: center;margin-top: 150px;margin-left: 227px;color:white;background-color: #00ccff;width: 60px;height: 33px" onclick="back(0,this)">确定</button>
            <%}else if (request.getAttribute("success")!=null){%>
            <form>
                <input type="hidden" name="usernumber" value="<%=request.getAttribute("user")%>">
                <input type="hidden" name="password" value="<%=request.getAttribute("password")%>">
                <button style="text-align: center;margin-top: 110px;margin-left: 175px;color:white;background-color: #00ccff;width: 60px;height: 33px" onclick="back(1,this)">确定</button>
            </form>
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
           button.type="submit";
           button.formAction="loginServlet";
           button.formMethod="post";
       }
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