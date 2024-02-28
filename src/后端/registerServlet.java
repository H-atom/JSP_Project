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
import java.sql.ResultSet;
import java.util.Objects;

@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
    boolean sure=false;
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       req.setCharacterEncoding("UTF-8");
       String userNumber=req.getParameter("userNumber");
       String password=req.getParameter("password");
       String pass=req.getParameter("pass");
       String phone=req.getParameter("phone");
       String sex=req.getParameter("sex");

       if (userNumber.isEmpty()&&pass.isEmpty()&&password.isEmpty()&&phone.isEmpty()){
           req.setAttribute("none","有内容输入为空!!!");
           req.getRequestDispatcher("register2.jsp").forward(req,resp);
       }else if (!userNumber.isEmpty()&&!password.isEmpty()&&!phone.isEmpty()&&!pass.isEmpty()&&!pass.equals(password)){
           req.setAttribute("nothing","密码输入不一致!!!");
           req.getRequestDispatcher("register2.jsp").forward(req,resp);
       }else if (!userNumber.isEmpty()&&!password.isEmpty()&&!phone.isEmpty()&&!pass.isEmpty()){
               try {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
//            更新数据
                   String sql="select * from webtable.用户信息 where usernumber=?";
                   PreparedStatement preparedStatement1=connection.prepareStatement(sql);
                   preparedStatement1.setString(1,userNumber);
                   ResultSet resultSet=preparedStatement1.executeQuery();
                   while (resultSet.next()){
                       sure=true;
                   }
                   if (sure){
                       req.setAttribute("terror","用户名重复,请重新注册!!!");
                       req.getRequestDispatcher("register2.jsp").forward(req,resp);
                   }else{
                       String sql1="insert into webtable.用户信息 values (?,?,?,?,?,?)";
                       PreparedStatement preparedStatement=connection.prepareStatement(sql1);
                       preparedStatement.setString(1,userNumber);
                       preparedStatement.setString(2,password);
                       preparedStatement.setString(3,phone);
                       preparedStatement.setString(4,"邮箱账号");
                       preparedStatement.setString(5,sex);
                       preparedStatement.setString(6,"姓名");
                       preparedStatement.executeUpdate();
                       preparedStatement.close();
                       req.setAttribute("success","注册成功,点击登录");
                       if (sex.equals("老师")) {
                           req.setAttribute("sex","teacher");
                       }else {
                           req.setAttribute("sex","student");
                       }
                       req.getRequestDispatcher("register1.jsp").forward(req,resp);
                   }
                   resultSet.close();
                   preparedStatement1.close();
                   connection.close();
               } catch (Exception e) {
                   e.printStackTrace();
               }
           }

    }
}
