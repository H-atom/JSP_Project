package 后端;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteScoreServlet")
public class deleteScoreServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String course= req.getParameter("courseNumber");

        deleteData deleteData=new deleteData();
        deleteData.deletedOne(course);
        req.getRequestDispatcher("teacher1.jsp").forward(req,resp);
    }
}
