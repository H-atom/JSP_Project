package 后端;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class showTimetable {
    public ArrayList<User> show(String major) {//课表全展示
        ArrayList<User> arrayList=new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql="select * from webtable.loginclass where major=? or major='全部专业'";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,major);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                User user=new User();
                updateDate.sameData(resultSet,user);
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
    public ArrayList<User> shows(String type,String major) {//根据学科类型不同进行指定输出，针对学生端
        ArrayList<User> arrayList=new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql="select * from webtable.loginclass where type like ? and (major=? or major=?)";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,"%"+type+"%");
            preparedStatement.setString(2,major);
            preparedStatement.setString(3,"全部专业");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                User user=new User();
                updateDate.sameData(resultSet,user);
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
    public ArrayList<User> showD(String name, String number, String teacher, String stringMajor) {//根据传入信息输出课表内容，针对学生端
        ArrayList<User> arrayList=new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql="select * from webtable.loginclass where courseName like ? and courseNumber like ? and teacher like ? and (major=? or major=?)";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,"%"+name+"%");
            preparedStatement.setString(2,"%"+number+"%");
            preparedStatement.setString(3,"%"+teacher+"%");
            preparedStatement.setString(4,stringMajor);
            preparedStatement.setString(5,"全部专业");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                User user=new User();
                updateDate.sameData(resultSet,user);
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
    //老师端的课表输出
    public ArrayList<User> showT(String terms, String names, String numbers, String types, String teachers) {
        ArrayList<User> arrayList=new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql="select * from webtable.loginclass where term like ? and courseName like ? and courseNumber like ? and type like ? and teacher like ?";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,"%"+terms+"%");
            preparedStatement.setString(2,"%"+names+"%");
            preparedStatement.setString(3,"%"+numbers+"%");
            preparedStatement.setString(4,"%"+types+"%");
            preparedStatement.setString(5,"%"+teachers+"%");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                User user=new User();
                updateDate.sameData(resultSet,user);
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

    public ArrayList<User> showC(String chooseCourse) {
        ArrayList<User> arrayList=new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql="select * from webtable.studentchoosecourse where student =?";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,chooseCourse);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                User user=new User();
                updateDate.sameData(resultSet,user);
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
    public ArrayList<User> showU(String teacher) {//课表全展示
        ArrayList<User> arrayList=new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql="select * from webtable.loginclass where teacher=?";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,teacher);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                User user=new User();
                updateDate.sameData(resultSet,user);
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
    public ArrayList<String> showN(String term,String teacher){
        ArrayList<String> arrayList=new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtable" ,"root","li370829");
            String sql="select * from webtable.loginclass where teacher=? and term=?";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,teacher);
            preparedStatement.setString(2,term);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                arrayList.add(resultSet.getString("courseName"));
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
