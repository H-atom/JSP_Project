<%--@elvariable id="date" type="后端"--%>
<%--@elvariable id="chooseSuccess" type="后端"--%>
<%--@elvariable id="chooseTerror" type="后端"--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="后端.*" %>
<%@ page import="java.util.Calendar" %><%--@elvariable id="username" type="后端"--%>
<%--
  Created by IntelliJ IDEA.
  User: 李光士
  Date: 2021/10/27
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
    <link rel="icon" href="bitbug_favicon.ico">
    <link rel="stylesheet" type="text/css" href="输入框.css">
    <style>
        body{
            background-color: #f3f5f8;
            width: 100%;
        }
        a{
            text-decoration: none;
        }
        /*div{*/
        /*    margin-top: 0px;*/
        /*    border: 1px solid red;*/
        /*}*/
        #div{
            width: 1500px;
            height: 45px;
            line-height: 22px;
            margin: 5px auto;
            box-shadow: 0 0 3px gray;
            background-color: white;
        }
        span{
            font-size: small;
            color:white;
            font-family: 方正姚体,serif ;
        }
        #Std{
            /*width: 89%;*/
        }
        #td{
            width:92%;
            text-align: right;
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
            height: 55px;
        }
        #buttonClass{
            background-image: url("选课.png");
        }
        #buttonTimetable{
            background-image: url("课表.png");
        }
        #buttonScore{
            background-image: url("成绩查询.png");
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
        #divTable #ul #d1{
        }
        /*选课课表style*/
        #divMain{
            background-color: white;
            margin-top:60px;
            margin-left:15px;
            width: 850px;
            height: 600px;
            text-align: center;
            /*box-shadow: 0 0 10px gray;*/
        }
        #divMain option{
            background-color: white;
            color: deepskyblue;
        }
        #divMain select{
            color: deepskyblue;
            background-color:white;
        }
        /*右侧区域的设计*/
        #divAll{
            margin-top:60px;
            margin-left:15px;
            width: 450px;
            height: 600px;
        }
        /*校历设计*/
        #divDate{
            background-color: white;
            margin-top:0;
            margin-left:0;
            width: 450px;
            height: 300px;
            /*box-shadow: 0 0 10px gray;*/
        }
        /*课程信息*/
        #divMessage{
            background-color: white;
            margin-top:20px;
            margin-left:0;
            width: 450px;
            height: 300px;
            /*box-shadow: 0 0 10px gray;*/
        }
        /*我的课表*/
        #tableClass{
            width: 100%;
            height: 500px;
            text-align: center;
            border-collapse: collapse;
            border: 1px solid darkgray;
            color: #66afe9;
            padding: 0;
            margin: 0;
        }
        #tableClass tr{
            margin: 1000px 300px;
            border: 1px solid #dad7d7;
        }
        #tableClass th{
            border: 1px solid #dad7d7;
            height: 45px;
            width: 45px;
            padding: 0;
            margin:0;
        }
        #tableClass td{
            border: 1px solid #dad7d7;
            height: 45px;
            width: 45px;
            padding: 0;
            margin:0;
        }
        /*选课系统style*/
        #divChoose{
            width: 100%;
            height: 800px;
            margin-top:60px;
            margin-left:15px;
            background-color: white;
            text-align: center;
            line-height: 500px;
            display: none;
        }
        /*选课表格*/
        .chooseTable{
            /*height: 450px;*/
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
        #divChoose tr{
            height: 30px;
            text-align: center;
            line-height: 30px;
        }
        /*我的成绩界面*/
        #divScore{
            width: 100%;
            height: 600px;
            margin-top:60px;
            margin-left:15px;
            background-color: white;
            text-align: center;
            line-height: 500px;
            display: none;
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
    </style>

    <script type="text/javascript">
        // 选课的确定
        function change(button,input,i) {
            input[i].name="chooseCourseNumber";
            if (confirm("你确定要选该课吗？")){
                button.type="submit";
                button.formAction="chooseServlet";
            }else {
                button.type="button";
            }
        }
        function deleted(button) {
            if (confirm("你确定要退课吗？")){
                button.type="submit";
                button.formAction="deleteDataServlet";
            }else {
                button.type="button";
            }
        }
        window.onload=function(){
            // 左侧功能表翻转的实现
            var obj1=document.getElementById('d1');
            var obj2=document.getElementById('d2');
            var obj3=document.getElementById('d3');
            var obj4=document.getElementById('d4');
            var obj5=document.getElementById('d5');
            var obj6=document.getElementById('d6');
            var objImg1=document.getElementById('img1');
            var objImg2=document.getElementById('img2');
            var objImg3=document.getElementById('img3');
            var objImg4=document.getElementById('img4');
            var objImg5=document.getElementById('img5');
            var objImg6=document.getElementById('img6');
            var flag=true;
            obj1.onclick=function(){
                if(flag){
                    obj2.style.display='block';
                    objImg1.style.display='none';
                    objImg2.style.display='block';
                    flag=false;
                }else{
                    obj2.style.display='none';
                    objImg1.style.display='block';
                    objImg2.style.display='none';
                    flag=true;
                }
            }
            var flag2=true;
            obj3.onclick=function(){
                if(flag2){
                    obj4.style.display='block';
                    objImg3.style.display='none';
                    objImg4.style.display='block';
                    flag2=false;
                }else{
                    obj4.style.display='none';
                    objImg3.style.display='block';
                    objImg4.style.display='none';
                    flag2=true;
                }
            }
            var flag3=true;
            obj5.onclick=function () {
                if (flag3){
                    obj6.style.display='block';
                    objImg5.style.display='none';
                    objImg6.style.display='block';
                    flag3=false;
                }else{
                    obj6.style.display='none';
                    objImg5.style.display='block';
                    objImg6.style.display='none';
                    flag3=true;
                }
            }

            // 由功能表打开不同界面
            // 我的课表界面
            var myClass=document.getElementById('myClass');
            var divPart=document.getElementById('divPart');
            var buttonTimetable=document.getElementById('buttonTimetable');
            myClass.onclick=function (){
                divPart.style.display='flex';
                divChoose.style.display='none';
                divScore.style.display='none';
            }
            buttonTimetable.onclick=function (){
                divPart.style.display='flex';
                divChoose.style.display='none';
                divScore.style.display='none';
            }
            // 选课系统界面
            var chooseClass=document.getElementById('chooseClass');
            var divChoose=document.getElementById('divChoose');
            var buttonClass=document.getElementById('buttonClass');
            chooseClass.onclick=function (){
                divChoose.style.display='block';
                divPart.style.display='none';
                divScore.style.display='none';
            }
            buttonClass.onclick=function (){
                divChoose.style.display='block';
                divPart.style.display='none';
                divScore.style.display='none';
            }
            // 我的成绩界面
            var myScore=document.getElementById('myScore');
            var divScore=document.getElementById('divScore');
            var buttonScore=document.getElementById('buttonScore');
            myScore.onclick=function (){
                divPart.style.display='none';
                divChoose.style.display='none';
                divScore.style.display='block';
            }
            buttonScore.onclick=function (){
                divPart.style.display='none';
                divChoose.style.display='none';
                divScore.style.display='block';
            }
            courseChoose();
            document.getElementById("div"+(month+1)).style.display="block";//校历学周展示
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
                &nbsp;<a href="changePassword.jsp"><button id="buttonMe" title="个人信息"></button></a>
                &nbsp;&nbsp;<span style="color: #00ccff;font-size: medium;font-family: 华文行楷,serif;font-weight: bold">${username}</span>
            </td>
        </tr>
    </table>
</div>
<div style="height: 30px;width: 99%;border-bottom: 2px solid #dddddd">
    <%
        String strs=new showClassNumber().showEndTime();
    %>
    <span style="color: #00ccff;font-size: medium;font-family: 华文宋体, serif;float: right" id="sp">选课结束时间:<%=strs%></span>
</div>
<!--    中间按钮设计-->
<div class="div">
    <div style="background-color: deepskyblue;left: 20px;width: 150px;height: 50px;">
        <span>欢迎登录ColorAS学生界面</span>
    </div>
    <div style=" height: 50px">
        <button id="buttonClass"></button>
        <button id="buttonTimetable"></button>
        <button id="buttonScore"></button>
    </div>
</div>
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
                <li id="chooseClass">
                    选课系统
                </li>
                <li id="myClass">我的课表
                </li>
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
                <li id="myScore">我的成绩</li>
            </ul>
        </div>
    </div>
    <!--        右侧功能实现区的设计,具有多个功能界面-->
    <!--        我的课表界面-->
    <div style="display: none;" id="divPart">
        <!--        课表的编写-->
        <div id="divMain">
            <ul style="text-align: right">
                <li style="text-align: left;color: #66afe9;font-size: medium;">我的课表</li>
                <li style="border-bottom:  1px solid #dddddd">
                    <select>
                        <option>2021年上</option>
                        <option>2021年下</option>
                    </select>
                    <select>
                        <option>第一周</option>
                        <option>第二周</option>
                        <option>第三周</option>
                        <option>第四周</option>
                        <option>第五周</option>
                        <option>第六周</option>
                        <option>第七周</option>
                        <option>第八周</option>
                        <option>第九周</option>
                        <option>第十周</option>
                        <option>第十一周</option>
                        <option>第十二周</option>
                        <option>第十三周</option>
                        <option>第十四周</option>
                        <option>第十五周</option>
                        <option>第十六周</option>
                        <option>第十七周</option>
                        <option>第十八周</option>
                        <option>第十九周</option>
                    </select>
                </li>
            </ul>
            <%
                String chooseCourse=(String)request.getSession().getAttribute("username");
                showTimetable showTimetables=new showTimetable();
                ArrayList<User> arrayList4=showTimetables.showC(chooseCourse);%>


            <script>
                function courseChoose() {
                    <%for (User value : arrayList4) {
                    String week = value.getClassTimeWeek();
                    String number = value.getClassTimeNumber();%>
                    var trs = document.querySelectorAll("#tableClass tr");
                    var div=document.createElement("div");
                    div.style.backgroundColor="skyblue";
                    div.style.padding="0";
                    div.style.margin="0";
                    div.style.height="80px";
                    div.style.color="black";
                    div.style.width="100%";
                    var ul=document.createElement("ul");
                    ul.style.listStyle="none";
                    ul.style.padding="0";
                    ul.style.margin="0";
                    ul.style.textAlign="left";
                    var li=document.createElement("li");
                    li.style.fontSize="medium";
                    li.style.marginBottom="5px";
                    li.innerText="<%=value.getCourseName()%>";
                    var li1=document.createElement("li");
                    li1.style.fontSize="small";
                    li1.style.marginBottom="5px";
                    li1.innerText="教室:<%=value.getClassroom()%>";
                    var li2=document.createElement("li");
                    li2.style.fontSize="small";
                    li2.style.marginBottom="5px";
                    li2.innerText="教师:<%=value.getTeacher()%>";
                    div.onclick=function () {
                        var ul=document.getElementById("uli");
                        ul.innerHTML=null;
                        var li=document.createElement("li");
                        li.style.fontSize="larger";
                        li.style.marginBottom="16px";
                        li.style.marginLeft="50px";
                        li.innerText="<%=value.getCourseName()%>";
                        var li0=document.createElement("li");
                        li0.style.fontSize="medium";
                        li0.style.marginBottom="16px";
                        li0.style.marginLeft="50px";
                        li0.innerText="课序号:<%=value.getCourseNumber()%>";
                        var li1=document.createElement("li");
                        li1.style.fontSize="medium";
                        li1.style.marginBottom="16px";
                        li1.style.marginLeft="50px";
                        li1.innerText="科目类型:<%=value.getTypes()%>";
                        var li2=document.createElement("li");
                        li2.style.fontSize="medium";
                        li2.style.marginBottom="16px";
                        li2.style.marginLeft="50px";
                        li2.innerText="上课周次:<%=value.getStartTime()%>~<%=value.getEndTime()%>"
                        var li4=document.createElement("li");
                        li4.style.fontSize="medium";
                        li4.style.marginBottom="16px";
                        li4.style.marginLeft="50px";
                        li4.innerText="课程学分:<%=value.getCredit()%>";
                        var li5=document.createElement("li");
                        li5.style.fontSize="medium";
                        li5.style.marginBottom="0";
                        li5.style.marginLeft="50px";
                        li5.innerText="课程介绍:<%=value.getIntroduce()%>";
                        var li3=document.createElement("li");
                        li3.style.height="37px";
                        li3.style.marginLeft="50px";
                        li3.style.width="78%";
                        li3.style.textAlign="right";
                        var input=document.createElement("input");
                        input.type="hidden";
                        input.name="courseNumber";
                        input.value="<%=value.getCourseNumber()%>"
                        var button=document.createElement("button");
                        button.style.height="37px";
                        button.style.width="40%";
                        button.style.margin="center";
                        button.innerText="退课";
                        button.onclick=function () {
                            deleted(this);
                        };
                        button.style.color="white";
                        button.style.backgroundColor="#66afe9";
                        <%
                         String[] times=strs.split("-");
                         %>
                        const dates=new Date();
                        if (dates.getMonth()+1<<%=times[1]%>||(dates.getMonth()+1===<%=times[1]%>&&dates.getDate()<=<%=times[2]%>)){
                            li3.appendChild(button);
                        }
                        ul.appendChild(input);
                        ul.appendChild(li);
                        ul.appendChild(li0);
                        ul.appendChild(li1);
                        ul.appendChild(li2);
                        ul.appendChild(li4);
                        ul.appendChild(li5);
                        ul.appendChild(li3);
                    }
                    ul.appendChild(li);
                    ul.appendChild(li1);
                    ul.appendChild(li2);
                    div.appendChild(ul);
                    trs[<%=number%>].children[<%=week%>].appendChild(div);
                    <%}%>
                }
            </script>

            <ul style="text-align: center">
                <li>
                    <table id="tableClass" border="1">
                        <tr style="text-align: center;background-color: #f3f5f8">
                            <th>周/节次</th>
                            <th>周一</th>
                            <th>周二</th>
                            <th>周三</th>
                            <th>周四</th>
                            <th>周五</th>
                            <th>周六</th>
                            <th>周天</th>
                        </tr>
                        <tr>
                            <th>第一节</th>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>第二节</th>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>第三节</th>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>第四节</th>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>第五节</th>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </li>
            </ul>
        </div>
        <!--        学校日历的设计-->
        <div id="divAll">
            <div id="divDate">
                <ul style="padding: 0;margin-top: 0">
                    <li style="font-family: 方正姚体,serif;color: #66afe9;"><h4 style="margin: 0">学校日历:</h4></li>
                <li><jsp:include page="time.jsp"/></li>
                </ul>
            </div>
            <!--            课程具体信息设计-->
            <div id="divMessage">
                <ul style="margin: 15px;padding: 0;">
                    <li style="font-family: 方正姚体,serif;color: #66afe9 "><h4>课程信息:</h4></li>
                </ul>
                <form method="post">
                    <input type="hidden" value="<%=request.getSession().getAttribute("username")%>" name="student">
                    <ul id="uli" style="list-style: none;padding: 0;margin: 0;text-align: left">
                    </ul>
                </form>
            </div>
        </div>
    </div>
    <!--        选课系统界面-->
    <div id="divChoose" style="display: block;">
        <ul style="width: 1000px;margin-left: 80px;padding: 0">
            <li style="margin: 0;background-color: #f3f5f8;overflow: auto;height: 450px;border: 1px solid darkgray;overflow: auto">
                <table class="chooseTable" border="1">
                    <thead>
                    <tr>
                        <td>学年学期</td>
                        <td>课序号</td>
                        <td>课程名称</td>
                        <td>课程类型</td>
                        <td>授课老师</td>
                        <td>学分</td>
                        <td>操作</td>
                    </tr>
                    </thead>
                    <tbody>
                    <table class="bottomTable" border="=1" id="bottom">
                        <form>
                            <%
                                showTimetable showTimetable=new showTimetable();
                                ArrayList<User> arrayList=showTimetable.show((String) request.getSession().getAttribute("major"));
                                for (int i = 0; i < arrayList.size(); i++) {
                            %>
                            <tr>
                                <td><%=arrayList.get(i).getTerm()%></td>
                                <td><%=arrayList.get(i).getCourseNumber()%> <input type="hidden" value="<%=arrayList.get(i).getCourseNumber()%>"/></td>
                                <td><%=arrayList.get(i).getCourseName()%></td>
                                <td><%=arrayList.get(i).getTypes()%></td>
                                <td><%=arrayList.get(i).getTeacher()%></td>
                                <td><%=arrayList.get(i).getCredit()%></td>
                                <td><button style='margin:5px;height:30px;width:50px;text-align:center' type='submit' formmethod='post' onclick='change(this,document.querySelectorAll("#bottom input"),<%=i%>)'>选课</button></td>
                            </tr>
                            <%
                                }
                            %>
                        </form>
                    </table>
                    </tbody>
                </table>
            </li>
            <li style="padding: 0;margin-top: 10px;height: 300px;margin-left: 0;">
                <form action="inquireCourseServlet" method="post" style="padding: 0;margin: 0">
                <ul style="height: 50px;line-height: 50px;display:flex;margin: 0;padding: 0">
                        <li style="margin: 0;text-align: left;width: 300px">
                            <input type="hidden" id="input" name="input">
                            <button onclick="show(this)">必修课程</button>
                            <button onclick="show(this)">限选课程</button>
                            <button onclick="show(this)">其他课程</button>
                        </li>
                        <li style="text-align: right;width: 800px;margin-right: 10px;">
                            <input type="text" placeholder="课程名称" name="name">
                            <input type="text" placeholder="课程序号" name="number">
                            <input type="text" placeholder="授课老师" name="teach">
                            <button style="color: #66afe9;width: 60px;height: 32px" title="点击搜索"><img src="搜索.png" alt="搜索" width="20" height="20" style="vertical-align: middle;margin: 0 auto;padding: 0">搜索</button>
                        </li>
                </ul>
                </form>
                <ul style="margin: 0;padding: 0">
                    <li style="margin: 0;height: 280px;background-color: #f3f5f8;border: 1px solid darkgray;overflow: auto">
                        <table class="chooseTable" border="1" style="margin: 0">
                            <thead>
                            <tr>
                                <td>学年学期</td>
                                <td>课序号</td>
                                <td>课程名称</td>
                                <td>课程类型</td>
                                <td>授课老师</td>
                                <td>学分</td>
                                <td>操作</td>
                            </tr>
                            </thead>
                        </table>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
<%--    弹窗界面--%>
    <div style="display: block;background-color: rgba(10,10,10,0.2);margin-top:0;position: absolute;top: 200px;left: 600px;z-index: 2" id="divSure">
        <div style="background-color: white;height: 207px;width: 306px;margin-top: 60px">
            <p style="color: #00ccff;margin: 0;padding: 0;line-height: 160px;height: 0">${chooseSuccess}${chooseTerror}</p>
                <button style="text-align: center;margin-top: 32px;margin-right: -212px;color:white;background-color: #00ccff;width: 60px;height: 33px" onclick="back()">确定</button>
        </div>
    </div>
    <!--        我的成绩界面-->
    <div id="divScore" style="display: none">
        <ul style="width: 1000px;margin-left: 80px;padding: 0">
            <li style="margin: 0;background-color: #f3f5f8;height: 450px;overflow: auto;border: 1px solid darkgray">
                <table class="chooseTable" border="1">
                    <thead>
                    <tr style="height: 30px;text-align: center;line-height: 30px">
                        <td>学年学期</td>
                        <td>课序号</td>
                        <td>课程名称</td>
                        <td>课程类型</td>
                        <td>科目学分</td>
                        <td>期末成绩</td>
                        <td>绩点</td>
                        <td>绩点对应等级</td>
                    </tr>
                    </thead>
                    <tbody>
                    <table class="bottomTable" border="=1" id="bottomTableScore">
                        <form>
                            <%
                                showScore showScore=new showScore();
                                String str=(String)request.getSession().getAttribute("username");
                                ArrayList<User> arrayList2=showScore.shows(str);
                                for (User user : arrayList2) {
                            %>
                            <tr>
                                <td><%=user.getTerm()%>
                                </td>
                                <td><%=user.getCourseNumber()%>
                                </td>
                                <td><%=user.getCourseName()%>
                                </td>
                                <td><%=user.getTypes()%>
                                </td>
                                <td><%=user.getCredit()%>
                                </td>
                                <td><%=user.getScore()%>
                                </td>
                                <td><%=user.getGpa()%>
                                </td>
                                <td><%=user.getGpaLevel()%>
                                </td>
                                <%--                                <td><button style='margin:5px;height:30px;width:50px;text-align:center' type='submit' formmethod='post' onclick='change(this,document.querySelectorAll("#bottomTableScore input"),<%=i%>)'>更改</button><button style='margin:5px;height:30px;width:50px;text-align:center' type='submit' formmethod='post' onclick='deleted(this,document.querySelectorAll("#bottomTableScore input"),<%=i%>)'>删除</button></td>--%>
                            </tr>
                            <%
                                }
                            %>
                        </form>
                    </table>
                    </tbody>
                </table>
            </li>
            <li style="margin-top: 10px;background-color: #f3f5f8;height: 130px;overflow: auto;border: 1px solid darkgray">
                <table style="padding: 0;margin-top: 0;width: 100%;color: #66afe9;border-collapse: collapse;" border="1">
                    <tr style="height: 30px;text-align: center;line-height: 30px">
                        <td>学年学期</td>
                        <td>课序号</td>
                        <td>课程名称</td>
                        <td>班级排名</td>
                        <td>专业排名</td>
                    </tr>
                    <tbody>
                    <%
                        totalScore totalScore=new totalScore();
                        ArrayList<User> userArrayList=totalScore.summary(str);
                        for (User user : userArrayList) {%>
                    <tr style="height: 30px;line-height: 30px">
                        <td><%=user.getTerm()%></td>
                        <td><%=user.getCourseNumber()%></td>
                        <td><%=user.getCourseName()%></td>
                        <td><%=user.getMajorSum()%></td>
                        <td><%=user.getSummary()%></td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </li>
        </ul>
    </div>
</div>
<script>
    // 关闭弹窗
    function back() {
        var div=document.getElementById("divSure");
        div.style.display="none";
    }
    // 不同课程类型展示
    function show(button) {
      var input=document.getElementById("input");
      input.value=button.innerText;
    }
</script>
</body>
</html>
