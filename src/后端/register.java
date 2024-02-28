package 后端;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class register {
    String sex;
    boolean sure;

    public String getSex() {
        String str = null;
        try {
            if (sex.equals("老师")){
                str="teacher";
            }else {
                str="student";
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return str;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public boolean isSure() {
        return sure;
    }

    public void setSure(boolean sure) {
        this.sure = sure;
    }


}
