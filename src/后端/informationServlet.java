package 后端;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/informationServlet")
public class informationServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String number=req.getParameter("number");
        String email=req.getParameter("email");
        String phone=req.getParameter("phone");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql="update webtable.用户信息 set email=? and telephone=? where usernumber=?";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,email);
            preparedStatement.setString(2,phone);
            preparedStatement.setString(3,number);
            preparedStatement.executeUpdate();
            req.setAttribute("success","修改成功!!!");
            req.getRequestDispatcher("information.jsp").forward(req,resp);
            preparedStatement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
