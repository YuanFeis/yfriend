package com.yfriend.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtiltest {
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mytwitter?autoReconnect=true&useUnicode=true&characterEncoding=utf8&useSSl=false&serverTimezone=GMT%2B8", "root", "wsxzaq19990130");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/mytwitter?autoReconnect=true&useUnicode=true&characterEncoding=utf8&useSSl=false&serverTimezone=GMT%2B8", "root", "wsxzaq19990130");

    }

    public static void main(String[] args) throws SQLException{
        System.out.println(getConnection());
    }
}
