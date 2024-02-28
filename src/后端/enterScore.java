package 后端;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class enterScore {
    boolean update=false;
    public void update(String input0,String input2,String input4,double input6,String input8,String teacher) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql3="select * from webtable.loginclass where term=? and courseName=? and teacher=?";
            PreparedStatement preparedStatement3=connection.prepareStatement(sql3);
            preparedStatement3.setString(1,input0);
            preparedStatement3.setString(2,input2);
            preparedStatement3.setString(3,teacher);
            ResultSet resultSet2=preparedStatement3.executeQuery();
            String input3=null;
            String input1=null;
            double input5=0;
            double input7=0;
            while (resultSet2.next()){
                input1=resultSet2.getString("courseNumber");
                input3=resultSet2.getString("type");
                input5=resultSet2.getDouble("credit");
                input7=input6*input5/100;
            }

            String sql1="select * from webtable.score where courseNumber=? and student=?";
            PreparedStatement preparedStatement1=connection.prepareStatement(sql1);
            preparedStatement1.setString(1,input1);
            preparedStatement1.setString(2,input4);
            ResultSet resultSet=preparedStatement1.executeQuery();
            String sql2="select * from webtable.用户信息 where username=?";
            PreparedStatement preparedStatement2=connection.prepareStatement(sql2);
            preparedStatement2.setString(1,input4);
            ResultSet resultSet1=preparedStatement2.executeQuery();
            String classes=null;
            while (resultSet1.next()){
                classes=resultSet1.getString("classes");
            }
            if (resultSet.next()){update=true;
            }else {
                String sql="insert into webtable.score values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement preparedStatement=connection.prepareStatement(sql);
                preparedStatement.setString(1,input0);
                preparedStatement.setString(2,input1);
                preparedStatement.setString(3,input2);
                preparedStatement.setString(4,input3);
                preparedStatement.setString(5,input4);
                preparedStatement.setString(6,classes);
                preparedStatement.setDouble(7,input5);
                preparedStatement.setDouble(8,input6);
                preparedStatement.setDouble(9,input7);
                preparedStatement.setString(10,input8);
                preparedStatement.setString(11,teacher);
                preparedStatement.setString(12,"0");
                preparedStatement.setInt(13,0);
                preparedStatement.setInt(14,0);

                preparedStatement.executeUpdate();
                preparedStatement.close();
            }
            resultSet.close();
            preparedStatement1.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public boolean back(){
        return update;
    }
}
