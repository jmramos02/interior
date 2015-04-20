package com.entity;


import java.sql.Date;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author Mhargoth
 */
public class Employee {
    private String contactNum, firstName, lastName, userName, password, bPhoneNum;
    private Date fromDate, toDate;

    public String getContactNumber() {
        return contactNum;
    }

    public void setContactNumber(String contactNum) {
        this.contactNum = contactNum;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getBranchPhoneNumber() {
        return bPhoneNum;
    }

    public void setBranchPhoneNumber(String bPhoneNum) {
        this.bPhoneNum = bPhoneNum;
    }
    
    public Date getFromDate() {
        return fromDate;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }
    
    public Date getToDate() {
        return toDate;
    }

    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }
}
