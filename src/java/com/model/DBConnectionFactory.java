/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.sql.Connection;

/**
 *
 * @author kristeltariman
 */
public abstract class DBConnectionFactory {
    
    private String username = "root";
    private String pasword = "";
    private String url = "jdbc:mysql://localhost:3306/interiordb";
    private String driverName = "com.mysql.jdbc.Driver";
    
    public static DBConnectionFactory getInstance(){
        return new DBConnectionFactoryImpl();
    }
    
    public abstract Connection getConnection();

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPasword() {
        return pasword;
    }

    public void setPasword(String pasword) {
        this.pasword = pasword;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }
    
}
