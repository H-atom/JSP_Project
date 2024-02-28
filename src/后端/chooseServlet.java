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

@WebServlet("/chooseServlet")
public class chooseServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       req.setCharacterEncoding("UTF-8");
       String number= req.getParameter("chooseCourseNumber");
       String str=(String)req.getSession().getAttribute("username");
       String classes=(String)req.getSession().getAttribute("classes");
       String major=(String)req.getSession().getAttribute("major");
       String timeWeek=null;
       String timeWeek1=null;
       String timeNumber=null;
       String timeNumber1=null;
       String course=null;
       String course1=null;
       String term=null;
       String term1=null;
       String type=null;
       String teacher=null;
       double credit=0;
       String classroom=null;
       String start=null;
       String end=null;
       String introduce=null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql="select * from webtable.loginclass where courseNumber=?";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,number);
            ResultSet resultSet=preparedStatement.executeQuery();

            String sql1="select * from webtable.studentchoosecourse where student=? and courseNumber=?";
            PreparedStatement preparedStatement1=connection.prepareStatement(sql1);
            preparedStatement1.setString(1,str);
            preparedStatement1.setString(2,number);
            ResultSet resultSet1=preparedStatement1.executeQuery();
            while (resultSet.next()){
                timeWeek=resultSet.getString("classtimeWeek");
                timeNumber=resultSet.getString("classtimeNumber");
                term=resultSet.getString("term");
                course=resultSet.getString("courseName");
                classroom=resultSet.getString("classroom");
                type=resultSet.getString("type");
                teacher=resultSet.getString("teacher");
                credit=resultSet.getDouble("credit");
                start=resultSet.getString("startTime");
                end=resultSet.getString("endTime");
                introduce=resultSet.getString("introduce");
            }
            while (resultSet1.next()){
                timeWeek1=resultSet1.getString("classtimeWeek");
                timeNumber1=resultSet1.getString("classtimeNumber");
                term1=resultSet1.getString("term");
                course1=resultSet1.getString("courseName");
            }
            if (Objects.equals(timeWeek, timeWeek1)&&Objects.equals(timeNumber,timeNumber1)&&Objects.equals(term,term1)){
                req.setAttribute("chooseTerror","所选课程上课时间与"+course1+"冲突!");
            }else {
                req.setAttribute("chooseSuccess","选课成功!");
                chooseCourse chooseCourse=new chooseCourse();
                chooseCourse.set(term,number,course,type,str,credit,teacher,classroom,timeWeek,timeNumber,start,end,introduce,classes,major);
            }

            req.getRequestDispatcher("student1.jsp").forward(req,resp);
            resultSet.close();
            resultSet1.close();
            preparedStatement1.close();
            preparedStatement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
