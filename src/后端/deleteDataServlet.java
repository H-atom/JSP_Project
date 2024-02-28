package 后端;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteDataServlet")
public class deleteDataServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String course= req.getParameter("courseNumber");
        String student=req.getParameter("student");

        if(student.isEmpty()){
            deleteData deleteData=new deleteData();
            deleteData.deleted(course);
            req.getRequestDispatcher("teacher.jsp").forward(req,resp);
        } else {
            deleteData deleteData=new deleteData();
            deleteData.deletedCC(course,student);
            req.getRequestDispatcher("student.jsp").forward(req,resp);
        }
    }
}
