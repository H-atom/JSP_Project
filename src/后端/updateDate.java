package 后端;

import java.sql.*;

public class updateDate {
    public User update(String course) {
        String sql1="select * from webtable.loginclass where courseNumber=?";
        return getUser(course,sql1);
    }

    private User getUser(String course,String sql) {
        User user=new User();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
//            更新数据

            PreparedStatement preparedStatement1=connection.prepareStatement(sql);
            preparedStatement1.setString(1,course);
            ResultSet resultSet=preparedStatement1.executeQuery();
            while (resultSet.next()){
                sameData(resultSet, user);
            }

            resultSet.close();
            preparedStatement1.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    static void sameData(ResultSet resultSet, User user) throws SQLException {
        same(resultSet, user);
    }

    static void same(ResultSet resultSet, User user) throws SQLException {
        user.setTerm(resultSet.getString("term"));
        user.setCourseNumber(resultSet.getString("courseNumber"));
        user.setCourseName(resultSet.getString("courseName"));
        user.setTypes(resultSet.getString("type"));
        user.setTeacher(resultSet.getString("teacher"));
        user.setCredit(resultSet.getDouble("credit"));
        user.setClassroom(resultSet.getString("classroom"));
        user.setClassTimeWeek(resultSet.getString("classtimeWeek"));
        user.setClassTimeNumber(resultSet.getString("classtimeNumber"));
        user.setStartTime(resultSet.getString("startTime"));
        user.setEndTime(resultSet.getString("endTime"));
        user.setIntroduce(resultSet.getString("introduce"));
    }

    public User updated(String course) {
        User user=new User();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
//            更新数据
            String sql="select * from webtable.score where courseNumber=?";
            PreparedStatement preparedStatement1=connection.prepareStatement(sql);
            preparedStatement1.setString(1,course);
            ResultSet resultSet=preparedStatement1.executeQuery();
            while (resultSet.next()){
                someData(user, resultSet);
            }

            resultSet.close();
            preparedStatement1.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    static void someData(User user, ResultSet resultSet) throws SQLException {
        user.setTerm(resultSet.getString("term"));
        user.setCourseNumber(resultSet.getString("courseNumber"));
        user.setCourseName(resultSet.getString("courseName"));
        user.setTypes(resultSet.getString("type"));
        user.setStudent(resultSet.getString("student"));
        user.setCredit(resultSet.getDouble("credit"));
        user.setScore(resultSet.getDouble("score"));
        user.setGpa(resultSet.getDouble("gpa"));
        user.setTeacher(resultSet.getString("teacher"));
        user.setGpaLevel(resultSet.getString("gpaLevel"));
        user.setRight(resultSet.getString("right"));
        user.setSummary(resultSet.getInt("summary"));
        user.setMajorSum(resultSet.getInt("classSum"));
    }

    public void updates(String userName, String oldPassword, String newPassword) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
//            更新数据
            String sql="update webtable.用户信息 set password=? where password=? and usernumber=?";
            PreparedStatement preparedStatement1=connection.prepareStatement(sql);
            preparedStatement1.setString(1,newPassword);
            preparedStatement1.setString(2,oldPassword);
            preparedStatement1.setString(3,userName);
            preparedStatement1.executeUpdate();

            preparedStatement1.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
