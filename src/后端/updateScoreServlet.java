package 后端;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateScoreServlet")
public class updateScoreServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String course= req.getParameter("updateCourseNumber");

        updateDate updateDate=new updateDate();
        User user=updateDate.updated(course);
        req.setAttribute("term",user.getTerm());
        req.setAttribute("courseNumber",user.getCourseNumber());
        req.setAttribute("courseName",user.getCourseName());
        req.setAttribute("type",user.getTypes());
        req.setAttribute("student",user.getStudent());
        req.setAttribute("credit",user.getCredit());
        req.setAttribute("score",user.getScore());
        req.setAttribute("gpa",user.getGpa());
        req.setAttribute("gpaLevel",user.getGpaLevel());

        deleteData deleteData=new deleteData();
        deleteData.deletedOne(course);
        req.getRequestDispatcher("teacher1.jsp").forward(req,resp);

    }
}
