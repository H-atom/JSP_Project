<%--@elvariable id="date" type="后端"--%>
<%--@elvariable id="nothing" type="后端"--%>
<%--@elvariable id="addSuccess" type="后端"--%>
<%--@elvariable id="classTimeWeek" type="后端"--%>
<%--@elvariable id="classTimeNumber" type="后端"--%>
<%--@elvariable id="startTime" type="后端"--%>
<%--@elvariable id="endTime" type="后端"--%>
<%--@elvariable id="terrors" type="后端"--%>
<%--@elvariable id="student" type="后端"--%>
<%--@elvariable id="gpa" type="后端"--%>
<%--@elvariable id="gpaLevel" type="后端"--%>
<%--@elvariable id="score" type="后端"--%>
<%--@elvariable id="noneTable" type="后端"--%>
<%--@elvariable id="none" type="后端"--%>
<%--@elvariable id="number" type="后端"--%>
<%--@elvariable id="term" type="后端"--%>
<%--@elvariable id="course" type="后端"--%>
<%--@elvariable id="courseNumber" type="后端"--%>
<%--@elvariable id="courseName" type="后端"--%>
<%--@elvariable id="type" type="后端"--%>
<%--@elvariable id="teacher" type="后端"--%>
<%--@elvariable id="credit" type="后端"--%>
<%--@elvariable id="classroom" type="后端"--%>
<%--@elvariable id="classTime" type="后端"--%>
<%--@elvariable id="terror1" type="后端"--%>
<%--@elvariable id="terror" type="后端"--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="后端.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%--@elvariable id="username" type="后端"--%>
<%--
  Created by IntelliJ IDEA.
  User: 李光士
  Date: 2021/10/29
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>老师系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
    <link rel="icon" href="bitbug_favicon.ico">
    <link rel="stylesheet" type="text/css" href="输入框.css">
    <style>
        body{
            background-color: #f3f5f8;
            width: 100%;
            margin: 0;
        }
        a{
            text-decoration: none;
        }
        #div{
            width: 1525px;
            height: 45px;
            line-height: 24px;
            margin: 5px auto;
            box-shadow: 0 0 3px gray;
            background-color: white;
        }
        span{
            font-size: small;
            color:white;
            font-family: 方正姚体,serif ;
        }

        #td{
            width:92%;
            text-align: right;
            line-height: 45px;
        }
        #buttonMessage{
            background-image: url("消息.jpg");
            width: 30px;
            height: 31px;
            border: 0;
        }
        #buttonPassword{
            background-image: url("修改密码.jpg");
            width: 31px;
            height: 31px;
            border: 0;
        }
        #buttonExit{
            background-image: url("注销.jpg");
            width: 31px;
            height: 31px;
            border: 0;
        }
        #buttonMe{
            background-image: url("我的.png");
            width: 33px;
            height: 30px;
            border: 0;
        }
        /*.div为中间元素块*/
        .div{
            display: inline-block;
            margin-left: 180px;
            margin-top: 0;
            border-top: 0;
        }
        .div div{
            position:absolute;
            padding: 0;
            line-height: 50px;
            -webkit-border-radius: 100px / 30px;
            -moz-border-radius: 100px / 30px;
            border-radius: 10px;
            display: inline-block;
            margin-left: 10px;
            margin-top: 0;
        }
        .div button{
            border-radius:20px;
            border-style:none;
            color:rgba(249,248,248,1.00);
            width: 150px;
            height: 53px;
        }
        /*左侧选择功能表设计*/
        #divTable{
            background-color: white;
            margin-top: 60px;
            margin-left: 20px;
            width: 180px;
            height: 600px;
            /*box-shadow: 0 0 10px gray;*/
        }
        li{
            list-style: none;
        }
        #divTable li{
            font-family: 方正姚体,serif;
            color:#5f727f;
        }
        #divTable ul{
            margin: 0;
            padding: 0;
            text-align: center;
        }
        #divTable div{
            margin: 10px;
            padding-top: 5px;
        }
        #divTable div:hover{
            background-color: #f3f5f8;
        }
        #divTable li{
            height: 30px;
        }
        #divTable ul{
            padding:0;
            margin-left:20px;
            text-align:left;
            list-style-type: none;
        }
        #divTable div li:hover{
            color: #66afe9;
        }

        /*选课系统style*/
        #divChoose{
            width: 100%;
            height: 600px;
            margin-top:60px;
            margin-left:15px;
            background-color: white;
            text-align: center;
            line-height: 500px;
            /*display: none;*/
        }
        /*选课表格*/

        #divChoose tr{
            height: 30px;
            text-align: center;
            line-height: 30px;
        }

        .chooseTable{
            height: 30px;
            width: 100%;
            border-collapse: collapse;
            border: 1px solid darkgray;
            color: #66afe9;
            padding: 0;
            margin: 0;
            table-layout:fixed;
            word-wrap:break-word;
            word-break:break-all;
        }
        [contenteditable]:focus{
            outline-color: #66afe9;
        }
        .bottomTable{
            /*height: 420px;*/
            width: 100%;
            border-collapse: collapse;
            border: 1px solid darkgray;
            color: #66afe9;
            padding: 0;
            margin: 0;
            table-layout:fixed;
            word-wrap:break-word;
            word-break:break-all;
        }
        .bottomTable tr{
            height: 30px;
            text-align: center;
            line-height: 30px;
        }
        .buttonTr input{
            width: 124px;
            margin-right: 3px;
        }

        /*录入成绩界面设计*/
        #divScore{
            width: 100%;
            height: 600px;
            margin-top:60px;
            margin-left:15px;
            background-color: white;
            text-align: center;
            line-height: 500px;
        }
        #divScore tr{
            height: 30px;
            text-align: center;
            line-height: 30px;
        }
        #buttonTr input{
            width: 100px;
            margin-right: 2px;
        }
        /*查看成绩界面设计*/
        #divLook{
            width: 100%;
            height: 600px;
            margin-top:60px;
            margin-left:15px;
            background-color: white;
            text-align: center;
            line-height: 500px;
        }
        #divLook tr{
            height: 30px;
            text-align: center;
            line-height: 30px;
        }
        #buttonsTr input{
            width:150px;
            margin-right: 3px;
        }
        #divAdd{
            width: 100%;
            height: 600px;
            margin-top:60px;
            margin-left:15px;
            background-color: white;
            text-align: center;
            line-height: 500px;
        }
        .li{
            margin-top:10px;
            height: 30px;
            width: 100%;
            color: #00ccff;
            line-height: 0;
        }
        #divSure{
            width: 300px;
            height: 350px;
            padding: 50px;
            border: 0 solid gray;
            box-shadow: 0 0 10px gray;
            margin-top:60px;
            margin-left:15px;
            background-color: white;
            text-align: center;
            line-height: 350px;
            display: none;
        }
        #divStud{
            width: 100%;
            height: 600px;
            margin-top:60px;
            margin-left:15px;
            background-color: white;
            text-align: center;
            line-height: 600px;
        }
    </style>

    <script type="text/javascript">

        // input内容数目确定
        function sure(input,sum) {
            var b=0;
            // td内容的嵌入
            if (sum===3){
                var score=document.getElementById("score");
                score.value="1";
            }
            for (let i = 0; i < sum; i++) {
               if (input[i].value===""){b++;}
            }
            if (b===0){
                for (let i = 0; i < sum; i++) {
                    input[i].name="input"+i;
                }
            }
        }

        // 表格数据的删除
        function deleted(button,input,i) {
            input[i].name="courseNumber";
            if (confirm("你确定要删除吗？")){
                button.type="submit";
                button.formAction="deleteDataServlet";
            }else {
                button.type="button";
            }
        }
        function deletes(button,input,i) {
            input[i].name="courseNumber";
            if (confirm("你确定要删除吗？")){
                button.type="submit";
                button.formAction="deleteScoreServlet";
            }else {
                button.type="button";
            }
        }
        // 表格数据的更改
        function change(button,input,i) {
            input[i].name="updateCourseNumber";
            if (confirm("你确定要修改吗？")){
                button.type="submit";
                button.formAction="updateDataServlet";
            }else {
                button.type="button";
            }
        }

        function changes(button,input,i) {
            input[i].name="updateCourseNumber";
            if (confirm("你确定要修改吗？")){
                button.type="submit";
                button.formAction="updateScoreServlet";
            }else {
                button.type="button";
            }
        }
        function post(button) {
            if (confirm("你确定要提交吗？")){
                button.type="submit";
                button.formAction="postServlet";
            }else {
                button.type="button"
            }
        }
        // 页面跳转
        function turn(a,b,c,d,e) {
            a.style.display = 'block';
            b.style.display = 'none';
            c.style.display = 'none';
            d.style.display = 'none';
            e.style.display='none';
        }

        //获取时间
        function time() {
            const span=document.getElementById("span");
            var input=document.getElementById("input");
            var date=new Date();
            input.value=date.getFullYear();
            span.innerText=date.getFullYear()+"";
        }
        //获取select标签选中的值
        function selects(select,input) {
           input.value=select.value;
        }
        
        
        // 页面加载完实现的功能
        window.onload=function() {
            time();
            var divChoose = document.getElementById('divChoose');//录入课表界面
            var divScore = document.getElementById('divScore');//录入成绩界面
            var divLook = document.getElementById('divLook');//查看成绩界面
            var divAdd=document.getElementById("divAdd");//添加课程界面
            var divStud=document.getElementById('divStud');//花名册界面
            // 左侧功能表的翻转实现
            var obj1 = document.getElementById('d1');
            var obj2 = document.getElementById('d2');
            var obj3 = document.getElementById('d3');
            var obj4 = document.getElementById('d4');
            var obj5 = document.getElementById('d5');
            var obj6 = document.getElementById('d6');
            var objImg1 = document.getElementById('img1');
            var objImg2 = document.getElementById('img2');
            var objImg3 = document.getElementById('img3');
            var objImg4 = document.getElementById('img4');
            var objImg5 = document.getElementById('img5');
            var objImg6 = document.getElementById('img6');
            var flag = true;
            obj1.onclick = function () {
                if (flag) {
                    obj2.style.display = 'block';
                    objImg1.style.display = 'none';
                    objImg2.style.display = 'block';
                    flag = false;
                } else {
                    obj2.style.display = 'none';
                    objImg1.style.display = 'block';
                    objImg2.style.display = 'none';
                    flag = true;
                }
            }
            var flag2 = true;
            obj3.onclick = function () {
                if (flag2) {
                    obj4.style.display = 'block';
                    objImg3.style.display = 'none';
                    objImg4.style.display = 'block';
                    flag2 = false;
                } else {
                    obj4.style.display = 'none';
                    objImg3.style.display = 'block';
                    objImg4.style.display = 'none';
                    flag2 = true;
                }
            }
            var flag3 = true;
            obj5.onclick = function () {
                if (flag3) {
                    obj6.style.display = 'block';
                    objImg5.style.display = 'none';
                    objImg6.style.display = 'block';
                    flag3 = false;
                } else {
                    obj6.style.display = 'none';
                    objImg5.style.display = 'block';
                    objImg6.style.display = 'none';
                    flag3 = true;
                }
            }

            // 页面转换设计

            document.querySelector('#writeClass').onclick = function () {
                turn(divChoose,divScore,divLook,divAdd,divStud);
            };
            document.querySelector('#butClass').onclick = function () {
                turn(divChoose,divScore,divLook,divAdd,divStud);
            };
            document.querySelector('#writeScore').onclick = function () {
                turn(divScore,divChoose,divLook,divAdd,divStud);
            };
            document.querySelector('#butScore').onclick = function () {
                turn(divScore,divChoose,divLook,divAdd,divStud);
            };
            document.querySelector('#lookScore').onclick = function () {
                turn(divLook,divChoose,divScore,divAdd,divStud);
            };
            document.querySelector('#butLook').onclick = function () {
                turn(divLook,divChoose,divScore,divAdd,divStud);
            };
            document.getElementById('lookStud').onclick=function () {
                turn(divStud,divLook,divChoose,divScore,divAdd)
            }
            <%
                    if (request.getAttribute("introduce")!=null){
                        String str=(String) request.getAttribute("introduce");
                %>
            //反馈给areatext的内容
                var introduce=document.getElementById("introduce");
                introduce.innerText= <%=str%>;
            <%}%>

            //添加结课时间权限的展示
            const buttonAdd=document.getElementById("buttonAdd");
            <%
            if (request.getSession().getAttribute("addTime").equals("1")){%>
                buttonAdd.style.display="inline-block";
            <%}%>
        }


    </script>
</head>
<body>
<!--顶端logo及功能按钮设计-->
<div id="div">
    <table>
        <tr>
            <td id="Std">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="艺术字.png" alt="图标" height="40" width="80">
            </td>
            <td id="td">
                <button id="buttonMessage" title="消息"></button>&nbsp;&nbsp;
                <a href="changePassword.jsp"><button id="buttonPassword" title="修改密码"></button></a>
                &nbsp;<a href="web.jsp"><button id="buttonExit" title="注销"></button></a>
                &nbsp;<a href="information.jsp"><button id="buttonMe" title="个人信息"></button></a>
                &nbsp;&nbsp;<span style="color: #00ccff;font-size: medium;font-family: 华文行楷,serif;font-weight: bold">${username}</span>
            </td>
        </tr>
    </table>
</div>
<div style="height: 30px;width: 100%;border-bottom: 2px solid #dddddd;">
    <span style="color: #00ccff;font-size: medium;font-family: 华文宋体, serif;float: right" id="sp"><%="选课结束时间:"+new showClassNumber().showEndTime()%></span>
</div>
<!--    中间按钮设计-->
<div class="div">
    <div style="background-color: deepskyblue;left: 20px;width: 150px;height: 50px;">
        <span>欢迎登录ColorAS老师界面</span>
    </div>
    <div style="height: 50px">
        <button style="background-color: #ffc36f;font-weight: bold;text-align: left" id="butClass">&nbsp;&nbsp;<img src="课表.jpg" width="40" height="40" style="vertical-align: middle;border-radius: 11px">&nbsp;&nbsp;&nbsp;录入课表</button>
        <button style="background-color: #ff7556;font-weight: bolder;text-align: left" id="butScore">&nbsp;&nbsp;<img src="成绩.jpg" height="36" width="40" style="vertical-align: middle;border-radius: 11px">&nbsp;&nbsp;&nbsp;评定成绩</button>
        <button style="background-color: #00ccff;font-weight: bolder;text-align: left" id="butLook">&nbsp;&nbsp;<img src="查询.jpg" height="36" width="40" style="vertical-align: middle;border-radius: 11px">&nbsp;&nbsp;&nbsp;查看成绩</button>
    </div>
</div>
<!--    主要功能区实现-->
<div style="display: flex">
    <!--    左侧功能表的设计-->
    <div id="divTable">
        <div></div>
        <div>
            <ul id="ul">
                <li id="d1" style="text-align: left;"><img src="个人信息.png" alt="个人信息" width="150" height="25" id="img1">
                    <img src="个人信息2.png" alt="个人信息" height="25" width="150" id="img2" style="display: none"></li>
            </ul>
            <ul style="display: none;list-style: none" id="d2">
                <hr style="height: 1px;margin: 0;padding: 0;background-color: deepskyblue">
                <a href="information.jsp"><li>修改个人信息</li></a>
                <a href="changePassword.jsp"><li>修改个人密码</li></a>
            </ul>
        </div>
        <div>
            <ul id="d3" style="display: inline">
                <li style="display: inline-block">
                    <img src="选课系统1.png" alt="选课系统" width="150" height="25" id="img3">
                    <img src="选课系统2.png" alt="选课系统" width="150" height="25" id="img4" style="display: none">
                </li>
            </ul>
            <ul style="display: none" id="d4">
                <hr style="height: 1px;margin: 0;padding: 0;background-color: deepskyblue">
                <li id="writeClass">
                    录入课表
                </li>
                <li id="lookStud">查看花名册</li>
            </ul>
        </div>
        <div>
            <ul id="d5">
                <li>
                    <img src="成绩1.png" alt="成绩" width="150" height="25" id="img5">
                    <img src="成绩2.png" alt="成绩" width="150" height="25" id="img6" style="display: none">
                </li>
            </ul>
            <ul id="d6" style="display: none">
                <hr style="height: 1px;margin: 0;padding: 0;background-color: deepskyblue">
                <li id="writeScore">录入成绩</li>
                <li id="lookScore">查询成绩</li>
            </ul>
        </div>
    </div>
    <!--    添加课程界面的实现-->
    <div style="display: none" id="divAdd">
        <ul style="width: 1200px;margin-left: 40px;padding: 0;background-color: #f3f5f8;height: 600px">
            <li class="li" style="text-align: left;"><span style="font-size: small;color: #00ccff;line-height: 40px">录入课表>></span><button style="width: 43px;height: 40px;text-align: left;margin-left: 2px;background-color:coral;color: #f3f5f8" onclick="back()"><h3 style="margin: 0;padding: 0;">返回</h3></button></li>
        <form style="margin: 0;padding: 0" id="form">
                <li class="li" style="margin-left: -110px;margin-bottom: -11px">学年学期:&nbsp;&nbsp;<span id="span" style="color: black;font-size: medium;font-family: 方正姚体,serif"></span><input type="hidden" id="input"></li>
                <li class="li" style="margin-left: -98px;margin-bottom: -22px">&nbsp;&nbsp;课序号:&nbsp;&nbsp;&nbsp;
                    <%
                        showClassNumber showClassNumber=new showClassNumber();
                        String string=showClassNumber.showNumber();
                    %>
                    <input type="hidden"  value="<%=string%>">
                    <span style="color: black;font-size: medium;font-family: 方正姚体,serif"><%=string%></span>
                </li>
                <li class="li" style="margin-left: -43px">课程名称:&nbsp;&nbsp;<input type="text" placeholder="全称" value="${courseName}"></li>
                <li class="li" style="margin-left: -85px;margin-bottom: 22px">课程类型:&nbsp;&nbsp;<input type="hidden" id="input0">
                    <select id="select0" onclick="selects(document.getElementById('select0'),document.getElementById('input0'))">
                        <option>请选择</option>
                        <option value="必修课程">必修课程</option>
                        <option value="限选课程">限选课程</option>
                        <option value="其他课程">其他课程</option>
                    </select>
                <li class="li" style="margin-left: -114px">授课老师:&nbsp;&nbsp;<input type="hidden" value="<%=request.getSession().getAttribute("username")%>"> <span style="color: black;font-size: medium;font-family: 方正姚体,serif"><%=request.getSession().getAttribute("username")%></span></li>
                <li class="li" style="margin-left: -58px;margin-top:-10px ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学分:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="课程学分" value="${credit}"></li>
                <li class="li" style="margin-left: -43px">所在教室:&nbsp;&nbsp;<input type="text" placeholder="几区几号教室" value="${classroom}"></li>
                <li class="li" style="margin-left: -94px">上课周次:&nbsp;&nbsp;<input type="hidden" id="input1">
                    <select name="select" id="select" onclick="selects(document.getElementById('select'),document.getElementById('input1'))">
                        <option>请选择</option>
                        <option value="1">星期一</option>
                        <option value="2">星期二</option>
                        <option value="3">星期三</option>
                        <option value="4">星期四</option>
                        <option value="5">星期五</option>
                        <option value="6">星期六</option>
                        <option value="7">星期天</option>
                    </select>
                </li>
                <li class="li" style="margin-left: -87px">上课节次:&nbsp;&nbsp;<input type="hidden" id="input2">
                    <select id="select1" onclick="selects(document.getElementById('select1'),document.getElementById('input2'))">
                        <option>请选择</option>
                        <option value="1">第一大节</option>
                        <option value="2">第二大节</option>
                        <option value="3">第三大节</option>
                        <option value="4">第四大节</option>
                        <option value="5">第五大节</option>
                    </select>
                </li>
                <li class="li" style="margin-left: -87px">开始周次:&nbsp;&nbsp;<input type="hidden" id="input3">
                    <select id="select2" onclick="selects(document.getElementById('select2'),document.getElementById('input3'))">
                        <option>请选择</option>
                        <option value="1">第一周</option>
                        <option value="2">第二周</option>
                        <option value="3">第三周</option>
                        <option value="4">第四周</option>
                        <option value="5">第五周</option>
                        <option value="6">第六周</option>
                        <option value="7">第七周</option>
                        <option value="8">第八周</option>
                        <option value="9">第九周</option>
                        <option value="10">第十周</option>
                        <option value="11">第十一周</option>
                        <option value="12">第十二周</option>
                        <option value="13">第十三周</option>
                        <option value="14">第十四周</option>
                        <option value="15">第十五周</option>
                        <option value="16">第十六周</option>
                        <option value="17">第十七周</option>
                        <option value="18">第十八周</option>
                        <option value="19">第十九周</option>
                        <option value="20">第二十周</option>
                    </select>
                </li>
                <li class="li" style="margin-left: -87px">结束周次:&nbsp;&nbsp;<input type="hidden" id="input4">
                    <select id="select3" onclick="selects(document.getElementById('select3'),document.getElementById('input4'))">
                        <option>请选择</option>
                        <option value="1">第一周</option>
                        <option value="2">第二周</option>
                        <option value="3">第三周</option>
                        <option value="4">第四周</option>
                        <option value="5">第五周</option>
                        <option value="6">第六周</option>
                        <option value="7">第七周</option>
                        <option value="8">第八周</option>
                        <option value="9">第九周</option>
                        <option value="10">第十周</option>
                        <option value="11">第十一周</option>
                        <option value="12">第十二周</option>
                        <option value="13">第十三周</option>
                        <option value="14">第十四周</option>
                        <option value="15">第十五周</option>
                        <option value="16">第十六周</option>
                        <option value="17">第十七周</option>
                        <option value="18">第十八周</option>
                        <option value="19">第十九周</option>
                        <option value="20">第二十周</option>
                    </select>
                </li>
                <li class="li" style="margin-left: -80px">
                    &nbsp;&nbsp;选课专业:<input type="hidden" id="input5">&nbsp;&nbsp;
                    <select id="select4" onclick="selects(document.getElementById('select4'),document.getElementById('input5'))">
                        <option>课程针对专业</option>
                        <option value="软件工程">软件工程</option>
                        <option value="大数据">大数据</option>
                        <option value="AI实验班">AI实验班</option>
                        <option value="数字媒体技术">数字媒体技术</option>
                        <option value="网络安全">网络安全</option>
                        <option value="全部专业">全部专业</option>
                </select>
                </li>
                <li style="line-height: 60px; margin-top:10px;height: 60px;width: 100%;color: #00ccff;"><span style="vertical-align:top;color: #00ccff;font-size: large;">课程介绍:&nbsp;&nbsp;</span><textarea style="height: 60px;width: 250px" name="introduce" id="introduce"></textarea></li>
                <li style="line-height: 60px; margin-top:10px;height: 60px;width: 100%;color: #00ccff;"><button type="submit" formmethod="post" formaction="dataServlet" class="buttonSure" id="button1" style="width: 80px;background-color: coral;color: #f3f5f8" onclick="sure(document.querySelectorAll('#divAdd input'),12)"><h3 style="margin: 0;padding: 0">确定</h3></button></li>
        </form>
        </ul>
    </div>
    <%--  弹窗的实现--%>
    <div style="display: none;background-color: rgba(10,10,10,0.2);margin-top:0;position: absolute;top: 200px;left: 600px;z-index: 2" id="divSure">
        <div style="background-color: white;height: 207px;width: 306px;margin-top: 60px">
            <p style="color: #00ccff;line-height: 20px;height: 20px;margin-left: -150px;margin-bottom: -135px;padding-top: 46px">学生选课截止时间:</p>
            <form method="post" action="timeEndServlet">
                <input type="date" id="date" name="date">
                <button style="text-align: center;margin-top: -139px;margin-left: 145px;color:white;background-color: #00ccff;width: 60px;height: 33px;display: block">确定</button>
            </form>
            <button style="text-align: center;margin-top: -33px;margin-left: 230px;color:white;background-color: #00ccff;width: 60px;height: 33px;display: block" onclick="exit()">取消</button>
        </div>
    </div>
    <script>
        var flags=true;
        function exit() {
            var div=document.getElementById("divSure");
           if (flags){
               div.style.display="block";
               flags=false;
           }else {
               div.style.display="none";
               flags=true;
           }
        }
    </script>
    <!--    录入课表界面的实现-->
    <div id="divChoose" style="display: block">
        <li style="line-height: 0px;margin-top: 8px;margin-bottom: -8px;text-align: left"><p style="margin: 0;padding: 0;font-size: small;color: #00ccff">录入课表>></p></li>
        <ul style="width: 1200px;margin-left: 40px;padding: 0">
                <li style="margin:0;height: 70px;background-color: #f3f5f8;width: 100%">
                    <%--                <table style="height: 70px;line-height: 70px;margin: 0;padding: 0;width: 100%">--%>
                    <%--<tr style="margin:0;text-align: center;line-height: 30px" class="buttonTr">--%>
                    <ul style="padding-right: 375px;margin: 0">
                        <li style="margin:0;padding: 0;text-align: center;line-height: 30px" class="buttonTr">
                            <form>
                                <input type="text" placeholder="学年学期" name="terms">
                                <input type="text" placeholder="课序号" name="courseNumbers">
                                <input type="text" placeholder="课程名称" name="courseNames">
                                <input type="text" placeholder="课程类型" name="types">
                                <input type="text" placeholder="授课老师" name="teachers">
                                <button class="buttonSure" id="button" type="submit" formmethod="post" formaction="inquireCourseServlet" style="width: 80px;background-color: coral;color: #f3f5f8"><h3 style="margin: 0;padding: 0">查询</h3></button>
                            </form>
                        </li>
                        <li style="margin:0;line-height: 30px;width: 1200px" class="buttonTr">
                            <table>
                                <tr>
                                    <td style="width:1000px;text-align: left">
                                        <span style="color: red;font-family: 华文行楷,serif; font-size: medium">${terrors}${nothing}</span>
                                    </td>
                                    <td style="width: 200px">
                                        <button onclick="exit()" style="color: white;background-color: #ec6941;display: none;height: 37px;width: 100px;margin-left: -60px" id="buttonAdd">选课结束设置</button>
                                        <button style="background-color: #00ccff;margin-right: 20px;width: 93px;color: white" onclick="show()"><h3 style="margin: 0;padding: 0">添加课程</h3></button>
                                    </td>
                                    <script>
                                        function show() {
                                            var divAdd=document.getElementById("divAdd");
                                            var divChoose=document.getElementById("divChoose");
                                            divAdd.style.display="block";
                                            divChoose.style.display="none";
                                        }
                                        function back() {
                                            var divAdd=document.getElementById("divAdd");
                                            var divChoose=document.getElementById("divChoose");
                                            divAdd.style.display="none";
                                            divChoose.style.display="block";
                                        }
                                    </script>
                                </tr>
                            </table>
                            <%--                </table>--%>
                        </li>
                    </ul>

                </li>
            <li style="margin-top: 10px;background-color: #f3f5f8;height: 500px;border: 1px solid darkgray;overflow: auto">
                <table border="1" class="chooseTable">
                    <thead>
                    <tr>
                        <th>学年学期</th>
                        <th>课序号</th>
                        <th>课程名称</th>
                        <th>课程类型</th>
                        <th>授课老师</th>
                        <th>学分</th>
                        <th>所在教室</th>
                        <th>上课时间</th>
                        <th>上课周次</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <table class="bottomTable" border="=1" id="bottom" style="height: 30px">
                        <form>
                        <%
                            showTimetable showTimetable=new showTimetable();
                            ArrayList<User> arrayList=showTimetable.showU((String) request.getSession().getAttribute("username"));
                            for (int i = 0; i < arrayList.size(); i++) {
                        %>
                            <tr>
                                <td><%=arrayList.get(i).getTerm()%></td>
                                <td><%=arrayList.get(i).getCourseNumber()%> <input type="hidden" value="<%=arrayList.get(i).getCourseNumber()%>"/></td>
                                <td><%=arrayList.get(i).getCourseName()%></td>
                                <td><%=arrayList.get(i).getTypes()%></td>
                                <td><%=arrayList.get(i).getTeacher()%></td>
                                <td><%=arrayList.get(i).getCredit()%></td>
                                <td><%=arrayList.get(i).getClassroom()%></td>
                                <td><%=arrayList.get(i).getClassTimeWeek()+arrayList.get(i).getClassTimeNumber()%></td>
                                <td><%=arrayList.get(i).getStartTime()+"~"+arrayList.get(i).getEndTime()%></td>
                                <td><button style='margin:5px;height:30px;width:50px;text-align:center' type='submit' formmethod='post' onclick='change(this,document.querySelectorAll("#bottom input"),<%=i%>)'>更改</button><button style='margin:5px;height:30px;width:50px;text-align:center' type='submit' formmethod='post' onclick='deleted(this,document.querySelectorAll("#bottom input"),<%=i%>)'>删除</button></td>
                            </tr>
                          <%
                            }
                        %>
                        </form>
                    </table>
                    <table class="bottomTable" border="=1" id="bottoms" style="height: 30px">
                        <form>
                            <%
                                String terms=(String) request.getAttribute("terms");
                                String names=(String) request.getAttribute("courseNames");
                                String numbers=(String) request.getAttribute("courseNumbers");
                                String types=(String) request.getAttribute("types");
                                String teachers=(String) request.getAttribute("teachers");
                                showTimetable showTimetable1=new showTimetable();
                                ArrayList<User> arrayList2=showTimetable1.showT(terms,names,numbers,types,teachers);
                                for (int i = 0; i < arrayList2.size(); i++) {
                            %>
                            <tr>
                                <td><%=arrayList2.get(i).getTerm()%></td>
                                <td><%=arrayList2.get(i).getCourseNumber()%> <input type="hidden" value="<%=arrayList2.get(i).getCourseNumber()%>"/></td>
                                <td><%=arrayList2.get(i).getCourseName()%></td>
                                <td><%=arrayList2.get(i).getTypes()%></td>
                                <td><%=arrayList2.get(i).getTeacher()%></td>
                                <td><%=arrayList2.get(i).getCredit()%></td>
                                <td><%=arrayList2.get(i).getClassroom()%></td>
                                <td><%=arrayList2.get(i).getClassTimeWeek()+arrayList2.get(i).getClassTimeNumber()%></td>
                                <td><%=arrayList2.get(i).getStartTime()+"~"+arrayList2.get(i).getEndTime()%></td>
                                <td><button style='margin:5px;height:30px;width:50px;text-align:center' type='submit' formmethod='post' onclick='change(this,document.querySelectorAll("#bottoms input"),<%=i%>)'>更改</button><button style='margin:5px;height:30px;width:50px;text-align:center' type='submit' formmethod='post' onclick='deleted(this,document.querySelectorAll("#bottoms input"),<%=i%>)'>删除</button></td>
                            </tr>
                            <%
                                }
                            %>
                        </form>
                    </table>
                            <script>
                                var tables=document.getElementById("bottom");
                                var tabled=document.getElementById("bottoms");
                                <%
                                if (terms!=null){%>
                               tables.style.display="none";
<%--                                <%}else{%>--%>
                                <%}%>
                            </script>
                    </tbody>
                </table>
            </li>
        </ul>
    </div>
<%--    查看花名册界面的实现--%>
    <div id="divStud" style="display: none">
        <jsp:include page="chooseStudent.jsp"/>
    </div>
    <!--    评定成绩界面的实现-->
    <div id="divScore" style="display: none">
        <li style="line-height: 0px;margin-top: 8px;margin-bottom: -8px;text-align: left"><p style="margin: 0;padding: 0;font-size: small;color: #00ccff">评定成绩>></p></li>
        <ul style="width: 1200px;margin-left: 40px;padding: 0">
            <li style="margin:0;height: 70px;background-color: #f3f5f8;width: 100%">
                <table style="height: 70px;line-height: 70px;margin: 0;padding: 0;width: 100%">
                    <tr style="margin:0;text-align: center;line-height: 30px;float: right" id="buttonTr">
                        <form style="margin: 0;padding: 0">
                        <td><input type="text" placeholder="学年学期" value="${term}"></td>
                        <td>
                        <select name="selectName">
                            <option>课程名</option>
                            <%showTimetable showTimetable2=new showTimetable();
                                Calendar calendar=Calendar.getInstance();
                                String year=calendar.get(Calendar.YEAR)+"";
                            ArrayList<String> stringArrayList1=showTimetable2.showN(year,(String)request.getSession().getAttribute("username") );
                                for (String user : stringArrayList1) {%>
                            <option value="<%=user%>"><%=user%></option>
                            <%}%>
                        </select></td>
<%--                        <td><input type="text" placeholder="课程类型" value="${type}"></td>--%>
                        <td><input type="text" placeholder="学生姓名" value="${student}"></td>
<%--                        <td><input type="text" placeholder="科目学分" value="${credit}"></td>--%>
                        <td><input type="text" placeholder="成绩" value="${score}"></td>
<%--                        <td><input type="text" placeholder="绩点" value="${gpa}"></td>--%>
                        <td>
                        <select name="selectGpa">
                            <option>绩点对应等级</option>
                            <option value="A+">A+</option>
                            <option value="A">A</option>
                            <option value="A-">A-</option>
                            <option value="B+">B+</option>
                            <option value="B">B</option>
                            <option value="B-">B-</option>
                            <option value="C+">C+</option>
                            <option value="C">C</option>
                            <option value="C-">C-</option>
                            <option value="D">D</option>
                        </select></td>
                        <td><input type="hidden" id="score" name="score"></td>
                        <td><button class="buttonSure" type="submit" formmethod="post" formaction="dataServlet" style="width: 80px;background-color: coral;color: #f3f5f8" onclick="sure(document.querySelectorAll('#divScore input'),3)"><h3 style="margin: 0;padding: 0">暂存</h3></button></td>
                        <td><button formmethod="post" style="width: 80px;background-color: coral;color: #f3f5f8" onclick="post(this)"><h3 style="margin: 0;padding: 0">提交</h3></button></td>
                    </form>
                    </tr>
                        <tr><td colspan="2"><span style="color: red;font-family: 华文行楷,serif; font-size: medium">${terror1}${none}</span></td></tr>
                </table>
            </li>
            <li style="margin-top: 10px;background-color: #f3f5f8;height: 500px;border: 1px solid darkgray;overflow: auto">
                <%
                    String teacher=(String)request.getSession().getAttribute("username");
                    showScore showScore=new showScore();
                    String right=showScore.right(teacher);
                if (right.equals("0")||right.equals("01")){
                %>
                <table border="1" class="chooseTable" id="bottomTableScore">
                    <tr>
                    <th>学年学期</th>
                    <th>课序号</th>
                    <th>课程名称</th>
                    <th>课程类型</th>
                    <th>学生姓名</th>
                    <th>科目学分</th>
                    <th>成绩</th>
                    <th>绩点</th>
                    <th>绩点等级</th>
                    <th>操作</th>
                    </tr>
                    <form>
                        <%
                            ArrayList<User> arrayList1=showScore.show(teacher);
                            for (int i = 0; i < arrayList1.size(); i++) {
                                if (arrayList1.get(i).getRight().equals("0")){%>
                        <tr>
                            <td><%=arrayList1.get(i).getTerm()%></td>
                            <td><%=arrayList1.get(i).getCourseNumber()%> <input type="hidden" value="<%=arrayList1.get(i).getCourseNumber()%>"/></td>
                            <td><%=arrayList1.get(i).getCourseName()%></td>
                            <td><%=arrayList1.get(i).getTypes()%></td>
                            <td><%=arrayList1.get(i).getStudent()%></td>
                            <td><%=arrayList1.get(i).getCredit()%></td>
                            <td><%=arrayList1.get(i).getScore()%></td>
                            <td><%=arrayList1.get(i).getGpa()%></td>
                            <td><%=arrayList1.get(i).getGpaLevel()%></td>
                            <td><button style='margin:5px;height:30px;width:50px;text-align:center' type='submit' formmethod='post' onclick='changes(this,document.querySelectorAll("#bottomTableScore input"),<%=i%>)'>更改</button><button style='margin:5px;height:30px;width:50px;text-align:center' type='submit' formmethod='post' onclick='deletes(this,document.querySelectorAll("#bottomTableScore input"),<%=i%>)'>删除</button></td>
                        </tr>
                        <%}}%>
                    </form>
                </table>
                <%}if (right.equals("1")||right.equals("01")){%>
                <table class="chooseTable" border="1">
                    <tr>
                        <th>学年学期</th>
                        <th>课序号</th>
                        <th>课程名称</th>
                        <th>课程类型</th>
                        <th>学生姓名</th>
                        <th>老师姓名</th>
                        <th>科目学分</th>
                        <th>成绩</th>
                        <th>绩点</th>
                        <th>绩点等级</th>
                        <th>班级排名</th>
                        <th>专业排名</th>
                    </tr>
                    <form>
                        <%
                            ArrayList<User> arrayList1s=showScore.show(teacher);
                            for (int i = 0; i < arrayList1s.size(); i++) {
                                if (arrayList1s.get(i).getRight().equals("1")){%>
                        <tr>
                            <td><%=arrayList1s.get(i).getTerm()%></td>
                            <td><%=arrayList1s.get(i).getCourseNumber()%></td>
                            <td><%=arrayList1s.get(i).getCourseName()%></td>
                            <td><%=arrayList1s.get(i).getTypes()%></td>
                            <td><%=arrayList1s.get(i).getStudent()%></td>
                            <td><%=arrayList1s.get(i).getTeacher()%></td>
                            <td><%=arrayList1s.get(i).getCredit()%></td>
                            <td><%=arrayList1s.get(i).getScore()%></td>
                            <td><%=arrayList1s.get(i).getGpa()%></td>
                            <td><%=arrayList1s.get(i).getGpaLevel()%></td>
                            <td><%=arrayList1s.get(i).getMajorSum()%></td>
                            <td><%=arrayList1s.get(i).getSummary()%></td>
                        </tr>
                        <%}}%>
                    </form>
                </table>
                <%}%>
            </li>
        </ul>
    </div>

<%--    查找成绩界面--%>
    <div id="divLook" style="display: none ">
        <li style="line-height: 0px;margin-top: 8px;margin-bottom: -8px;text-align: left"><p style="margin: 0;padding: 0;font-size: small;color: #00ccff">查找成绩>></p></li>
        <ul style="width: 1200px;margin-left: 40px;padding: 0">
            <li style="margin:0;height: 70px;background-color: #f3f5f8;width: 100%">
                <table style="height: 70px;line-height: 70px;margin: 0;padding: 0;width: 100%">
                    <form>
                    <tr style="margin:0;text-align: center;line-height: 30px" id="buttonsTr">
                        <td><input type="text" placeholder="学年学期" style="margin-left: 300px" name="inTerm"></td>
                        <td><input type="text" placeholder="课序号" name="inNumber"></td>
                        <td><input type="text" placeholder="课程名称" name="inName"></td>
                        <td><input type="text" placeholder="课程类型" name="inType"></td>
                        <td><input type="text" placeholder="学生" name="inStudent"></td>
                        <td><button class="buttonSure" style="width: 80px;background-color: coral;color: #f3f5f8"  type="submit" formaction="inquireServlet" formmethod="post"><h3 style="margin: 0;padding: 0">查询</h3></button></td>
                    </tr>
                        <tr><td colspan="2"><span style="color: red;font-family: 华文行楷,serif; font-size: medium">${terrors}</span></td></tr>
                    </form>
                </table>
            </li>
            <li style="margin-top: 10px;background-color: #f3f5f8;height: 450px;border: 1px solid darkgray;overflow: auto">
                <table border="1" class="chooseTable">
                    <thead>
                    <tr>
                        <th>学年学期</th>
                        <th>课序号</th>
                        <th>课程名称</th>
                        <th>课程类型</th>
                        <th>学生</th>
                        <th>科目学分</th>
                        <th>成绩</th>
                        <th>绩点</th>
                        <th>绩点对应等级</th>
                    </tr>
                    </thead>
                    <tbody>
                    <table class="bottomTable" border="=1">
                    </table>
                    </tbody>
                </table>
            </li>
        </ul>
    </div>
</div>
</body>
</html>
