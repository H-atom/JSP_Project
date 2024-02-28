package 后端;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class inquireData {

    public ArrayList<User> inquire(String term, String number, String name, String type, String student){
        ArrayList<User> arrayList=new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql="select *from webtable.score where term like ? and courseNumber like ? and courseName like ? and type like ? and student like ? order by score desc ";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,"%"+term+"%");
            preparedStatement.setString(2,"%"+number+"%");
            preparedStatement.setString(3,"%"+name+"%");
            preparedStatement.setString(4,"%"+type+"%");
            preparedStatement.setString(5,"%"+student+"%");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                User user=new User();
                updateDate.someData(user, resultSet);
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
