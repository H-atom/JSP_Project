package 后端;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class enterTimetable {
    boolean update=false;
    public void update(String input0,String input1,String input2,String input3,String input4,double input5,String input6,String input7,String input8,String input9,String input10,String introduce,String input13) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql1="select * from webtable.loginclass where courseNumber=?";
            PreparedStatement preparedStatement1=connection.prepareStatement(sql1);
            preparedStatement1.setString(1,input1);
            ResultSet resultSet=preparedStatement1.executeQuery();
            if (resultSet.next()){update=true;
            }else{
                String sql="insert into webtable.loginclass values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement preparedStatement=connection.prepareStatement(sql);
                preparedStatement.setString(1,input0);
                preparedStatement.setString(2,input1);
                preparedStatement.setString(3,input2);
                preparedStatement.setString(4,input3);
                preparedStatement.setString(5,input4);
                preparedStatement.setDouble(6,input5);
                preparedStatement.setString(7,input6);
                preparedStatement.setString(8,input7);
                preparedStatement.setString(9,input8);
                preparedStatement.setString(10,input9);
                preparedStatement.setString(11,input10);
                preparedStatement.setString(12,introduce);
                preparedStatement.setString(13,input13);

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
    public boolean backTimetable(){
        return update;
    }
}
