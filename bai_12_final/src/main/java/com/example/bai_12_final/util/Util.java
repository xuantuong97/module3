package com.example.bai_12_final.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Util {
    private static final String URL ="jdbc:mysql://localhost:3306/users";
    private static final String USER ="root";
    private static final String PASS ="123456";

    public static Connection getConnectDB(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection= DriverManager.getConnection(URL,USER,PASS);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

}
