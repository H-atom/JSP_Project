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
import java.util.Calendar;

@WebServlet("/postServlet")
public class postServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        Calendar calendar=Calendar.getInstance();
        String term=calendar.get(Calendar.YEAR)+"";
        String name=(String)req.getSession().getAttribute("username");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql0="select * from webtable.loginclass where teacher=? and term=?";
            PreparedStatement preparedStatement0=connection.prepareStatement(sql0);
            preparedStatement0.setString(1,name);
            preparedStatement0.setString(2,term);
            ResultSet resultSet0=preparedStatement0.executeQuery();
            while (resultSet0.next()){
                String sql1="select * from webtable.score where term=? and courseName=? order by score desc";
                PreparedStatement preparedStatement=connection.prepareStatement(sql1);
                preparedStatement.setString(1,term);
                preparedStatement.setString(2,resultSet0.getString("courseName"));
                ResultSet resultSet=preparedStatement.executeQuery();
                int sum=0,sam=0;
                String sql2="update webtable.score set summary=? where student=?";
                PreparedStatement preparedStatement2=connection.prepareStatement(sql2);
                String sql3="update webtable.score set classSum=? where student=? and classes=?";
                PreparedStatement preparedStatement3=connection.prepareStatement(sql3);
                while (resultSet.next()){
                    sum++;sam++;
                    preparedStatement2.setInt(1,sum);
                    preparedStatement2.setString(2,resultSet.getString("student"));
                    preparedStatement2.executeUpdate();
                    preparedStatement3.setInt(1,sam);
                    preparedStatement3.setString(2,resultSet.getString("student"));
                    preparedStatement3.setString(3,resultSet.getString("classes"));
                    preparedStatement3.executeUpdate();
                }
                resultSet.close();
                preparedStatement.close();
                preparedStatement2.close();
                preparedStatement3.close();
            }


            String sql="update webtable.score set `right`='1' where term=? and teacher=?";
            PreparedStatement preparedStatement1=connection.prepareStatement(sql);
            preparedStatement1.setString(1,term);
            preparedStatement1.setString(2,name);
            preparedStatement1.executeUpdate();
            resultSet0.close();
            preparedStatement0.close();
            preparedStatement1.close();

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.getRequestDispatcher("teacher1.jsp").forward(req,resp);
    }
}
