/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;

/**
 *
 * @author nha36
 */
public class ConnectDB {
    private String host;
    private String port;
    private String dbName;
    private String uName;
    private String pass;

    /**
     * Default constructor
     */
    public ConnectDB() {
        this.host = "localhost";
        this.port = "1433";
        this.dbName = "ProductIntro";
        this.uName = "sa";
        this.pass = "12345";
    }
    
    public ConnectDB(ServletContext sc){
        this.host = sc.getInitParameter("host");
        this.port = sc.getInitParameter("port");
        this.dbName = sc.getInitParameter("db");
        this.uName = sc.getInitParameter("user");
        this.pass = sc.getInitParameter("pass");
    }

    public String getUrlString() {
        return "jdbc:sqlserver://" + this.host + ":" + this.port + ";"
                + "DatabaseName=" + this.dbName + ";"
                + "user=" + this.uName + ";"
                + "password=" + this.pass + ";";
    }

    public Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(getUrlString());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ConnectDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }
    
}
