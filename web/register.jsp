<%--@elvariable id="none" type="后端"--%>
<%--@elvariable id="nothing" type="后端"--%>
<%--@elvariable id="divs" type="后端"--%>
<%--@elvariable id="terror" type="后端"--%>
<%--@elvariable id="success" type="后端"--%>
<%@ page import="后端.registerServlet" %><%--
  Created by IntelliJ IDEA.
  User: 李光士
  Date: 2021/11/1
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册界面</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="icon" href="bitbug_favicon.ico">
    <link rel="stylesheet" type="text/css" href="输入框.css">
    <style>
        body{
            background-image: url("黑布2.jpg");
            background-repeat:no-repeat ;
            background-attachment: fixed;
            background-size: 100% 110%;
        }
        div{
            width: 300px;
            height: 350px;
            padding: 50px;
            margin: 100px auto;
            border: 0 solid gray;
            box-shadow: 0 0 10px gray;
        }
        p{
            font-family: 方正姚体,serif;
            color: white;
        }
        span{
            font-family: 方正姚体,serif;
            color: white;
        }
        #table{
            padding: 0;
            margin: 0;
        }
        #tr{
            height: 20px;
        }
        #butt{
            font-family: 方正姚体,serif;
            width:250px;
            height:35px;
            border-radius:20px;
            border-style:none;
            background:#ec6941;
            font-size:16px;
            color:rgba(249,248,248,1.00);
        }
        #butt1{
            font-family: 方正姚体,serif;
            width:250px;
            height:35px;
            border-radius:20px;
            border-style:none;
            background:#ec6941;
            font-size:16px;
            color:rgba(249,248,248,1.00);
        }
    </style>
</head>
<body>
<div style="position: relative;z-index: 1">
        <table id="table">
            <form>
                <tr id="tr"></tr>
                <tr>
                    <td id="td"><p>*用户名:</p></td>
                    <td><input type="text" placeholder="学号/工号" name="userNumber" ></td>
                </tr>
                <tr>
                    <td><p>*密码:</p></td>
                    <td><input type="password" placeholder="6~16位" name="password" ></td>
                </tr>
                <tr>
                    <td><p>*确认密码:</p></td>
                    <td><input type="password" placeholder="6~16位"  name="pass"></td>
                </tr>
                <%--            <tr style="display: none;" id="trOne"><td></td><td colspan="2" style="color: red;" id="tdOne">${terror}</td></tr>--%>
                <tr style="display: none;width: 140px" id="trOne"><td colspan="2"><span style="width: 200px;height: 15px;color: red;margin: 0;padding: 0" id="pr">${none}${nothing}</span></td></tr>
                <tr>
                    <td><p>*电话:</p></td>
                    <td><input type="number" name="phone" ></td>
                </tr>
                <tr>
                    <td><p>*身份:</p></td>
                    <td><input type="radio" style="width: 20px" name="sex" value="老师"><span>老师</span><input type="radio" style="width: 20px" name="sex" value="学生" checked><span>学生</span></td>
                </tr>
                <tr id="tr1">
                    <td colspan="2"><button id="butt" type="submit" formmethod="post" formaction="registerServlet"><h4 style="margin: 0;padding: 0;font-family: 华文宋体,serif ">立即注册</h4></button></td>
                </tr>

                <tr>
                    <td colspan="2"><p style="font-size: small">点击注册即代表你同意<a href="协议.html" style="text-decoration: none;color: mediumvioletred">ColorAS系统协议</a></p></td>
                </tr>
            </form>
        </table>
</div>
<script>
// window.onload=function (){
// var tr=document.getElementById("trOne");
// tr.style.display="block";
// }
</script>
</body>
</html>