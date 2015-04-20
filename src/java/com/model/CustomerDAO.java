
package com.model;

import com.entity.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class CustomerDAO {
    
    public void create(Customer customer) {
        try {
            DBConnectionFactory factory = DBConnectionFactory.getInstance();
            Connection connection = factory.getConnection();
            String sql = "INSERT INTO Customer(customerContactNumber,customerFirstName, customerLastName, customerAddress, companyName, customerType) VALUES (?,?,?,?,?,?)";
            PreparedStatement stmt;
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, customer.getCustomerContactNumber());
            stmt.setString(2, customer.getCustomerFirstName());
            stmt.setString(3, customer.getCustomerLastName());
            stmt.setString(4, customer.getCustomerAddress());
            stmt.setString(5, customer.getCompanyName());
            stmt.setString(6, customer.getCustomerType() + "");
            stmt.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void update(Customer customer) {
        try {
            DBConnectionFactory factory = DBConnectionFactory.getInstance();
            Connection connection = factory.getConnection();
            String sql = "UPDATE Customer SET customerContactNumber = ?,customerFirstName = ?, customerLastName = ?, customerAddress = ?, companyName = ?, customerType = ?  WHERE customerID = ?";
            PreparedStatement stmt;
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, customer.getCustomerContactNumber());
            stmt.setString(2, customer.getCustomerFirstName());
            stmt.setString(3, customer.getCustomerLastName());
            stmt.setString(4, customer.getCustomerAddress());
            stmt.setString(5, customer.getCompanyName());
            stmt.setInt(6, customer.getCustomerID());
            stmt.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     public List<Customer> read() {
        List<Customer> customerList = new ArrayList<Customer>();
         try {
            DBConnectionFactory factory = DBConnectionFactory.getInstance();
            Connection connection = factory.getConnection();
            String sql = "SELECT * FROM Customer";
            PreparedStatement stmt;
            stmt = connection.prepareStatement(sql);
            ResultSet set = stmt.executeQuery();
            while(set.next()){
                Customer customer = new Customer();
                customer.setCustomerID(set.getInt("customerID"));
                customer.setCustomerContactNumber(set.getString("customerContactNumber"));
                customer.setCustomerFirstName(set.getString("customerFirstName"));
                customer.setCustomerLastName(set.getString("customerLastName"));
                customer.setCustomerAddress(set.getString("customerAddress"));
                customer.setCompanyName(set.getString("companyName"));
                customer.setCustomerType(set.getString("customerType")); //FIX THIS
                customerList.add(customer);
            }
            connection.close();
            return customerList;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return null;
    }
    
    public List<Customer> search(int id) {
        List<Customer> customerList = new ArrayList<Customer>();
         try {
            DBConnectionFactory factory = DBConnectionFactory.getInstance();
            Connection connection = factory.getConnection();
            String sql = "SELECT * FROM Customer WHERE customerID = ?";
            PreparedStatement stmt;
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet set = stmt.executeQuery();
            while(set.next()){
                Customer customer = new Customer();
                customer.setCustomerID(set.getInt("customerID"));
                customer.setCustomerContactNumber(set.getString("customerContactNumber"));
                customer.setCustomerFirstName(set.getString("customerFirstName"));
                customer.setCustomerLastName(set.getString("customerLastName"));
                customer.setCustomerAddress(set.getString("customerAddress"));
                customer.setCompanyName(set.getString("companyName"));
                customer.setCustomerType(set.getString("customerType")); //FIX THIS
                customerList.add(customer);
            }
            connection.close();
            return customerList;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return null;
    }
    public List<Customer> all(){
         List<Customer> customerList = new ArrayList<Customer>();
         DBConnectionFactory factory = DBConnectionFactory.getInstance();
            Connection connection = factory.getConnection();
            String sql = "SELECT * FROM Customer";
            PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement(sql);
            ResultSet set = stmt.executeQuery();
            while(set.next()){
                Customer customer = new Customer();
                customer.setCustomerID(set.getInt("customerID"));
                customer.setCustomerFirstName(set.getString("customerFirstName"));
                customerList.add(customer);
            }
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return customerList;
    }
     
}
