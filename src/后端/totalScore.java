package 后端;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class totalScore {
    public ArrayList<User> summary(String student){
        ArrayList<User> arrayList=new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql="select * from webtable.score where student=? and `right`=? order by term desc";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,student);
            preparedStatement.setString(2,"1");
            ResultSet resultSet=preparedStatement.executeQuery();

            while (resultSet.next()){
                User user=new User();
                user.setTerm(resultSet.getString("term"));
                user.setCourseNumber(resultSet.getString("courseNumber"));
                user.setCourseName(resultSet.getString("courseName"));
                user.setSummary(resultSet.getInt("summary"));
                user.setMajorSum(resultSet.getInt("classSum"));
                arrayList.add(user);
            }

            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arrayList;
    }

}
