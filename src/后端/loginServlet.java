package 后端;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String usernumber=req.getParameter("usernumber");
        String password=req.getParameter("password");
        User user=new User();
        user.setUserNumber(usernumber);
        user.setPassword(password);

        Model model=new Model();
        boolean existUser=model.login(user);

        if (existUser){
            req.getSession().setAttribute("username",model.getUserName());
            req.getSession().setAttribute("number",model.getNumber());
            req.getSession().setAttribute("Password",model.getPassword());
            req.getSession().setAttribute("sex",model.getIdentity());
            req.getSession().setAttribute("classes",model.getClasses());
            req.getSession().setAttribute("major",model.getMajor());
            req.getSession().setAttribute("courseType",model.getCourseType());
            req.getSession().setAttribute("addTime",model.getAddTime()+"");
            req.getRequestDispatcher(model.getIdentity()+".jsp").forward(req,resp);
//            resp.sendRedirect("/"+model.getIdentity()+".jsp");
        }else{
            req.setAttribute("terror","用户名或密码错误！！！");
            req.getRequestDispatcher("web.jsp").forward(req,resp);
        }
    }
}
