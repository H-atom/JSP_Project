package 后端;

import java.sql.*;

public class deleteData {
    public void deleted(String course) {
        String sql="delete from webtable.loginclass where courseNumber=?";
        same(course,sql);

    }

    public void deletedOne(String course) {
        String sql="delete from webtable.score where courseNumber=?";
        same(course,sql);
    }

    private void same(String course,String sql) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");

            //           删除数据
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,course);
            preparedStatement.executeUpdate();


            preparedStatement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deletedCC(String course, String student) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql="delete from webtable.studentchoosecourse where student=? and courseNumber=?";
            //           删除数据
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,student);
            preparedStatement.setString(2,course);
            preparedStatement.executeUpdate();

            preparedStatement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
