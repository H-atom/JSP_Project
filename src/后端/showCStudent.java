package 后端;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class showCStudent {
    public ArrayList<User> show(String teacher){
        ArrayList<User> arrayList=new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql="select * from webtable.studentchoosecourse where teacher=?";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,teacher);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                User user=new User();
                user.setTerm(resultSet.getString("term"));
                user.setCourseNumber(resultSet.getString("courseNumber"));
                user.setCourseName(resultSet.getString("courseName"));
                user.setStudent(resultSet.getString("student"));
                user.setClasses(resultSet.getString("classes"));
                user.setMajor(resultSet.getString("major"));
                arrayList.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arrayList;
    }
}
