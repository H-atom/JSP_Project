package 后端;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateDataServlet")
public class updateDataServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String course= req.getParameter("updateCourseNumber");
        String userName=req.getParameter("userName");
        String oldPassword=req.getParameter("oldPassword");
        String newPassword=req.getParameter("newPassword");
        String surePassword=req.getParameter("surePassword");

        if (course==null){
            if (userName.isEmpty()||oldPassword.isEmpty()||newPassword.isEmpty()||surePassword.isEmpty()){
                req.setAttribute("none","内容输入为空!!!");
            }else if (!newPassword.equals(surePassword)){
                req.setAttribute("terror","密码输入不一致!!!");
            }else {
                updateDate updateDate=new updateDate();
                updateDate.updates(userName,oldPassword,newPassword);
                req.setAttribute("user",userName);
                req.setAttribute("password",newPassword);
                req.setAttribute("success","修改成功!!!");
            }
            req.getRequestDispatcher("changePassword.jsp").forward(req,resp);
        }else {

            updateDate updateDate=new updateDate();
            User user=updateDate.update(course);
            req.setAttribute("term",user.getTerm());
            req.setAttribute("courseNumber",user.getCourseNumber());
            req.setAttribute("courseName",user.getCourseName());
            req.setAttribute("type",user.getTypes());
            req.setAttribute("teacher",user.getTeacher());
            req.setAttribute("credit",user.getCredit());
            req.setAttribute("classroom",user.getClassroom());
            req.setAttribute("classTimeWeek",user.getClassTimeWeek());
            req.setAttribute("classTimeNumber",user.getClassTimeNumber());
            req.setAttribute("startTime",user.getStartTime());
            req.setAttribute("endTime",user.getEndTime());
            req.setAttribute("introduce",user.getIntroduce());


            deleteData deleteData=new deleteData();
            deleteData.deleted(course);
            req.getRequestDispatcher("teacher0.jsp").forward(req,resp);
        }

    }
}
