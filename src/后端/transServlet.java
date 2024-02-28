package 后端;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/transServlet")
public class transServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String input=req.getParameter("input");
        String input1=req.getParameter("input1");
        if (input.isEmpty()&&!input1.isEmpty()){
            req.getRequestDispatcher("register.jsp").forward(req,resp);
        }else{
            req.getRequestDispatcher(input+".jsp").forward(req,resp);
        }
    }
}
