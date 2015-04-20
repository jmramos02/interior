package com.model;


import com.model.DBConnectionFactory;
import com.entity.Employee;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author Mhargoth
 */
public class EmployeeDAO {
    
    private static final String getSQLRights = "select action a\n"  +
                                               "where username = ?, password = ?";
    public void register(Employee oneEmp){
	try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            String sql = "insert into employee(employeeContactNumber, employeefirstName, employeeLastName, branch_phoneNum, username, password ) values (?,?,?,?,?,?)";
            PreparedStatement pstmt =
                            conn.prepareStatement(sql);
            pstmt.setString(1, oneEmp.getContactNumber());
            pstmt.setString(2, oneEmp.getFirstName());
            pstmt.setString(3, oneEmp.getLastName());
            pstmt.setString(4, oneEmp.getBranchPhoneNumber());
            pstmt.setString(5, oneEmp.getUserName());
            pstmt.setString(6, oneEmp.getPassword());
            int rows = pstmt.executeUpdate();
            conn.close();
	} catch (SQLException ex) {
				/*  NOT SURE ABOUT THIS*/
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
	}
			
    }
    
    
    public HashMap<String,String> login(Employee oneEmp){
          boolean successful = false;
          HashMap<String,String> rights = new HashMap<String,String>();
          try {
            DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
            Connection conn = myFactory.getConnection();
            //String sql = "select * from users where username = ? and password = ?";
            String sql = "select * from employee as rights where username = ? and password = ?";
            PreparedStatement pstmt =
                   conn.prepareStatement(sql);
            pstmt.setString(1, oneEmp.getUserName());
            pstmt.setString(2, oneEmp.getPassword());
            ResultSet rs = pstmt.executeQuery();
//            System.out.println(rs.next());
            while (rs.next()){
                successful = true;
                rights.put("s", "TRUE");
                System.out.println("banana");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (successful){
            System.out.println("hello world");
            return rights;
        }else{
            return null;
        }
    }
}
