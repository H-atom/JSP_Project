package 后端;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Objects;


public class Model {
    String username;
    String number;
    String identity;
    String password;
    String major;
    String classes;
    String courseType;
    int addTime;

    public boolean login(User user) {
        boolean existUser=false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql="select * from webtable.用户信息 where usernumber=? and password=?";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,user.getUserNumber());
            preparedStatement.setString(2,user.getPassword());
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                    username=resultSet.getString("username");
                    number=resultSet.getString("usernumber");
                    identity=resultSet.getString("identity");
                    password=resultSet.getString("password");
                    classes=resultSet.getString("classes");
                    major=resultSet.getString("major");
                    courseType=resultSet.getString("coursetype");
                    addTime=resultSet.getInt("addTime");
                    existUser=true;
            }
            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return existUser;
    }
    public String getMajor() {return major;}
    public String getClasses() {return classes;}
    public String getCourseType() {return courseType;}
    public int getAddTime(){return addTime;}
    public String getUserName(){
        return username;
    }
    public String getPassword(){
        return password;
    }
    public String getNumber(){
        return number;
    }
    public String getIdentity(){
        String ident="";
        if (Objects.equals(identity, "学生")){ ident="student";}
        if (Objects.equals(identity, "老师")){ ident="teacher";}
        return ident;
    }
}
