package 后端;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/forgetServlet")
public class forgetServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String number=req.getParameter("number");
        String phone=req.getParameter("phone");
        String email=req.getParameter("email");
        String newPass=req.getParameter("newPassword");
        String surePass=req.getParameter("surePassword");

        if (number.isEmpty()||phone.isEmpty()||email.isEmpty()||newPass.isEmpty()||surePass.isEmpty()){
            req.setAttribute("none","有内容输入为空!!!");
        }else if (!newPass.equals(surePass)){
            req.setAttribute("terror","密码输入不一致!!!");
        }else{
            String phones=null;
            String emails=null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
                String sql="select telephone,email from webtable.用户信息 where usernumber=?";
                PreparedStatement preparedStatement=connection.prepareStatement(sql);
                preparedStatement.setString(1,number);
                ResultSet resultSet=preparedStatement.executeQuery();
                while (resultSet.next()){
                    phones=resultSet.getString("telephone");
                    emails=resultSet.getString("email");
                }

                resultSet.close();
                preparedStatement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (phone.equals(phones)&&email.equals(emails)){
                req.setAttribute("success","修改成功!!!");
            }else {
                req.setAttribute("defeat","信息输入错误");
            }
        }
        req.getRequestDispatcher("forgetPassword.jsp").forward(req,resp);
    }
}
