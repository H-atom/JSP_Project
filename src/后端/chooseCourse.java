package 后端;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class chooseCourse {
    public void set(String term, String number, String courseName, String type, String student, double credit, String teacher, String classroom, String timeWeek, String timeNumber, String start, String end, String introduce,String classes,String major) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql="insert into webtable.studentchoosecourse values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,term);
            preparedStatement.setString(2,number);
            preparedStatement.setString(3,courseName);
            preparedStatement.setString(4,type);
            preparedStatement.setString(5,student);
            preparedStatement.setDouble(6,credit);
            preparedStatement.setString(7,teacher);
            preparedStatement.setString(8,classroom);
            preparedStatement.setString(9,timeWeek);
            preparedStatement.setString(10,timeNumber);
            preparedStatement.setString(11,start);
            preparedStatement.setString(12,end);
            preparedStatement.setString(13,introduce);
            preparedStatement.setString(14,classes);
            preparedStatement.setString(15,major);
            preparedStatement.executeUpdate();

            preparedStatement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
