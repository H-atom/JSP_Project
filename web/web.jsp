<%--@elvariable id="password" type="后端"--%>
<%--@elvariable id="terror" type="后端"--%>
<%--
  Created by IntelliJ IDEA.
  User: 李光士
  Date: 2021/10/27
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>登陆界面</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <link rel="icon" href="bitbug_favicon.ico">
  <link rel="stylesheet" type="text/css" href="输入框.css">
  <style>
    body{background-image:url("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F03859b4592fd75ea8012193a3eb8907.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1635341077&t=4178609986f2e32f04817d5aa6ac8cdc");
      background-repeat:no-repeat ;
      background-attachment: fixed;
      background-size: 100% 100%;}
    p{
      color: crimson;
      font-family: "华文宋体",serif;
      margin-top: 50px;
    }
    #mima{
      color: deepskyblue;
    }
    #td{
      width: 73%;
    }
    #trButt{
      height: 40px;
    }
    #tr{
      height: 40px;
    }
    #span{
      color: darkgrey;
    }
    #spanZc{
      color: darkgrey;
      font-size: small;
    }
    #butt{
      font-family: 方正姚体,serif;
      width:250px;
      height:35px;
      border-radius:20px;
      border-style:none;
      background:#ec6941;
      font-size:14px;
      color:rgba(249,248,248,1.00);
    }
  </style>
</head>
<body>
<table>
  <tr>
    <td align="right"><img src="艺术字.png" alt="logo" width="300" height="120"></td>
    <td><h3><p>欢迎登陆ColorAS系统</p></h3></td>
  </tr>
</table>
<table align="left">
  <tr>
    <td width="80%"></td>
    <td align="center"><img src="data:image/jpeg;base64,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" alt="头像" width="100" height="75"></td>
    <td width="25%"></td>
  </tr>
</table>
<form>
  <table id="table">
    <tr>
      <td id="td"></td>
      <td><img src="用户名.jpg" alt="用户名" width="40" height="40"><br></td>
      <td width="40%"><input type="text" placeholder="用户名" name="usernumber"><br></td>
    </tr>
    <tr>
      <td id="td1"></td>
      <td><img src="密码.jpg" alt="密码" width="40" height="30"><br></td>
      <td width="40%"> <input type="password" placeholder="密码" name="password"><br></td>
    </tr>
    <tr>
      <td></td>
      <td colspan="2"><span style="color: red">${terror}</span></td>
    </tr>
    <tr id="tr">
      <td id="td2"></td>
      <td width="5%"><span id="span">记住我</span><input type="radio" name="radio" id="rad"></td>
      <td width="35%" align="center"><a href="forgetPassword.jsp" style="text-decoration: none"><span id="mima">忘记密码</span></a></td>
    </tr>
    <tr id="trButt">
      <td></td>
      <td colspan="2"><button id="butt" type="submit" formaction="loginServlet" formmethod="post">登录</button></td>
    </tr>
    <tr>
      <td></td>
      <td colspan="2"><span id="spanZc">没有账号？还不快来<a href="register.jsp" style="color: #66afe9;text-decoration: none">注册</a></span></td>
    </tr>
  </table>
</form>
<%--<script>--%>
<%--  var rad=document.getElementById("rad");--%>
<%--  var password=document.getElementsByName("password");--%>
<%--  rad.onclick=function (){--%>
<%--    var radio=document.getElementsByName("radio");--%>
<%--    if (radio[0].spellcheck){--%>
<%--     password.innerText=${password};--%>
<%--    }else{--%>
<%--      password.innerText="";--%>
<%--    }--%>
<%--  }--%>
<%--</script>--%>
</body>
</html>

