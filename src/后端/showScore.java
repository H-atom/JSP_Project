package 后端;

import java.sql.*;
import java.util.ArrayList;

public class showScore {
    public ArrayList<User> show(String teacher) {
        ArrayList<User> arrayList=new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql="select * from webtable.score where teacher=? order by summary desc";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,teacher);
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
    public String right(String teacher){
     String string="";
     String string1="";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql="select * from webtable.score where teacher=?";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,teacher);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                if (resultSet.getString("right").equals("0")){
                 string="0";
                }else {
                  string1="1";
                }
            }

            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return string+string1;
    }
    public ArrayList<User> shows(String userName){
        ArrayList<User> arrayList=new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql="select * from webtable.score where student=? and `right`=? order by term desc ";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,userName);
            preparedStatement.setString(2,"1");
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
