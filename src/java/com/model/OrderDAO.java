package com.model;

import com.entity.Order;
import com.entity.Product;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hp
 */
public class OrderDAO {
        public void addOrder(Order ORDER) {
        try {
            DBConnectionFactory factory = DBConnectionFactory.getInstance();
            Connection connection = factory.getConnection();
            String sql = "INSERT INTO `interiordb`.`order` (`productID`, `itemCode`, `customerContactNumber`, `orderStatus`, `orderDate`, `orderArrivalDate`, `branch_phoneNum`, `employee_employeeContactNumber`) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement stmt;
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, ORDER.getProductID());
            stmt.setInt(2, ORDER.getItemCode());
            stmt.setInt(3, ORDER.getCustomerContact());
            stmt.setString(4, ORDER.getOrderStatus()+"");
            stmt.setDate(5, (Date) ORDER.getOrderDate());
            stmt.setDate(6, (Date) ORDER.getArrivalDate());
            stmt.setInt(7, ORDER.getPhoneNumber());
            stmt.setInt(8, ORDER.getEmployeeContact());
            stmt.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        
        public void updateOrder(Order ORDER) {
        try {
            DBConnectionFactory factory = DBConnectionFactory.getInstance();
            Connection connection = factory.getConnection();
            String sql = "UPDATE `interiordb`.`order` SET `orderID`=?, `productID`=?, `itemCode`=?, `customerContactNumber`=?, `orderStatus`=?, `orderDate`=?, `orderArrivalDate`=?, `branch_phoneNum`=?, `employee_employeeContactNumber`=? WHERE `orderID`=? and`productID`=? and`itemCode`=?;";
            PreparedStatement stmt;
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, ORDER.getProductID());
            stmt.setInt(2, ORDER.getItemCode());
            stmt.setInt(3, ORDER.getCustomerContact());
            stmt.setString(4, ORDER.getOrderStatus());
            stmt.setDate(5, (Date) ORDER.getOrderDate());
            stmt.setDate(6, (Date) ORDER.getArrivalDate());
            stmt.setInt(7, ORDER.getPhoneNumber());
            stmt.setInt(8, ORDER.getEmployeeContact());
            stmt.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        public List<Order> read(Order ORDER) {
            List<Order> orderList = new ArrayList<Order>();
        try {
            DBConnectionFactory factory = DBConnectionFactory.getInstance();
            Connection connection = factory.getConnection();
            String sql = "SELECT * FROM order";
            PreparedStatement stmt;
            stmt = connection.prepareStatement(sql);
            ResultSet set = stmt.executeQuery();
            while(set.next()){
                Order odr;
                odr = new Order();
                odr.setOrderID(set.getInt("orderID"));
                odr.setProductID(set.getInt("productID"));
                odr.setItemCode(set.getInt("itemCode"));
                odr.setCustomerContact(set.getInt("customerContactNumber"));
                odr.setOrderStatus(set.getString("orderStatus"));
                odr.setOrderDate(set.getDate("orderDate"));
                odr.setArrivalDate(set.getDate("orderArrivalDate"));
                odr.setEmployeeContactNumber(set.getInt("employee_employeeContactNumber"));
                odr.setPhoneNumber(set.getInt("branch_PhoneNum"));
                orderList.add(odr);
            }
            connection.close();
            return orderList;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return null;
    }
        public List<Order> searchByID(int orderID) { //search by ID
            List<Order> orderList = new ArrayList<Order>();
        List<Product> productList = new ArrayList<Product>();
         try {
            DBConnectionFactory factory = DBConnectionFactory.getInstance();
            Connection connection = factory.getConnection();
            String sql = "SELECT * FROM order WHERE orderID = ?";
            PreparedStatement stmt;
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, orderID);
            ResultSet set = stmt.executeQuery();
            while(set.next()){
                Order ORDER = new Order();
                ORDER.setOrderID(set.getInt("orderID"));
                ORDER.setProductID(set.getInt("productID"));
                ORDER.setItemCode(set.getInt("itemCode"));
                ORDER.setCustomerContact(set.getInt("customerContactNumber"));
                ORDER.setOrderStatus(set.getString("orderStatus"));
                ORDER.setOrderDate(set.getDate("orderDate"));
                ORDER.setArrivalDate(set.getDate("orderArrivalDate"));
                ORDER.setEmployeeContactNumber(set.getInt("employee_employeeContactNumber"));
                ORDER.setPhoneNumber(set.getInt("branch_PhoneNum"));
                orderList.add(ORDER);
            }
            connection.close();
            return orderList;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return null;
    }
        
        public int getPendingOrderCount(){
            String sql = "SELECT COUNT(*) as dami FROM `order` WHERE orderStatus = 'P'";
            DBConnectionFactory factory = DBConnectionFactory.getInstance();
            Connection connection = factory.getConnection();
            PreparedStatement stmt;
            int count = 0;
            try {
                stmt = connection.prepareStatement(sql);
                ResultSet set = stmt.executeQuery();
                set.next();
                count = set.getInt("dami");
            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            return count;
            
        }
        
        public List<Order> getPendingOrders(){
            List<Order> orders = new ArrayList<Order>();
             String sql = "SELECT * FROM `order` WHERE orderStatus = 'P'";
             DBConnectionFactory factory = DBConnectionFactory.getInstance();
            Connection connection = factory.getConnection();
            PreparedStatement stmt;
            
            try {
                stmt = connection.prepareStatement(sql);
                ResultSet set = stmt.executeQuery();
                while(set.next()){
                    Order order = new Order();
                    order.setOrderID(set.getInt("orderID"));
                    order.setCustomerContact(set.getInt("customerContactNumber"));
                    order.setArrivalDate(set.getDate("orderArrivalDate"));
                    order.setOrderDate(set.getDate("orderDate"));
                    order.setPhoneNumber(set.getInt("branch_phoneNum"));
                    order.setEmployeeContactNumber(set.getInt("employeeContactNumber"));
                    orders.add(order);
                }
                System.out.print("Size: " + orders.size());
            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            return orders;
        }
        
        public List<Order> all(){
            List<Order> orders = new ArrayList<Order>();
             String sql = "SELECT * FROM `order`";
             DBConnectionFactory factory = DBConnectionFactory.getInstance();
            Connection connection = factory.getConnection();
            PreparedStatement stmt;
            
            try {
                stmt = connection.prepareStatement(sql);
                ResultSet set = stmt.executeQuery();
                while(set.next()){
                    Order order = new Order();
                    order.setOrderID(set.getInt("orderID"));
                    order.setCustomerContact(set.getInt("customerContactNumber"));
                    order.setArrivalDate(set.getDate("orderArrivalDate"));
                    order.setOrderDate(set.getDate("orderDate"));
                    order.setPhoneNumber(set.getInt("branch_phoneNum"));
                    order.setEmployeeContactNumber(set.getInt("employeeContactNumber"));
                    orders.add(order);
                }
            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            return orders;
        }
        
}
