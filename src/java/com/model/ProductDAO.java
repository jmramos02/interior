/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kristeltariman
 */
public class ProductDAO {

    public void create(Product product) {
        try {
            DBConnectionFactory factory = DBConnectionFactory.getInstance();
            Connection connection = factory.getConnection();
            String sql = "INSERT INTO Product(productname, productdescription, productprice, employeeContactNumber, productLine) VALUES (?,?,?,?,?)";
            PreparedStatement stmt;
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, product.getProductName());
            stmt.setString(2, product.getProductDescription());
            stmt.setString(3, product.getProductPrice() + "");
            stmt.setString(4, product.getEmployeeContactNumber());
            stmt.setString(5, product.getProductLine());
            stmt.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /*public void delete(Product product){
     try{
     DBConnectionFactory factory = DBConnectionFactory.getInstance();
     Connection connection = factory.getConnection();
     String sql = "DELETE FROM Product WHERE productID = ?";
     PreparedStatement stmt;
     stmt = connection.prepareStatement(sql);
     stmt.setInt(1, product.getProductID());
     stmt.executeUpdate();
     connection.close();
     }catch(SQLException ex){
     Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
     }
     }*/
    public void update(Product product) {
        try {
            DBConnectionFactory factory = DBConnectionFactory.getInstance();
            Connection connection = factory.getConnection();
            String sql = "UPDATE Product SET productname = ?, productdescription = ?, productprice = ?, employeeContactNumber = ? WHERE productID = ?";
            PreparedStatement stmt;
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, product.getProductName());
            stmt.setString(2, product.getProductDescription());
            stmt.setInt(3, product.getProductPrice());
            stmt.setString(4, product.getEmployeeContactNumber());
            stmt.setInt(5, product.getProductID());
            stmt.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Product> read() {
        List<Product> productList = new ArrayList<Product>();
         try {
            DBConnectionFactory factory = DBConnectionFactory.getInstance();
            Connection connection = factory.getConnection();
            String sql = "SELECT * FROM Product";
            PreparedStatement stmt;
            stmt = connection.prepareStatement(sql);
            ResultSet set = stmt.executeQuery();
            while(set.next()){
                Product product = new Product();
                product.setProductID(set.getInt("productID"));
                product.setProductDescription(set.getString("productdescription"));
                product.setProductName(set.getString("productname"));
                product.setEmployeeContactNumber(set.getString("employeeContactNumber"));
                product.setProductPrice(set.getInt("productPrice"));
                productList.add(product);
            }
            connection.close();
            return productList;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return null;
    }
    
    public List<Product> search(int id) {
        List<Product> productList = new ArrayList<Product>();
         try {
            DBConnectionFactory factory = DBConnectionFactory.getInstance();
            Connection connection = factory.getConnection();
            String sql = "SELECT * FROM Product WHERE productID = ?";
            PreparedStatement stmt;
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet set = stmt.executeQuery();
            while(set.next()){
                Product product = new Product();
                product.setProductID(set.getInt("productID"));
                product.setProductDescription(set.getString("productdescription"));
                product.setProductName(set.getString("productname"));
                product.setEmployeeContactNumber(set.getString("employeeContactNumber"));
                product.setProductPrice(set.getInt("productPrice"));
                productList.add(product);
            }
            connection.close();
            return productList;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return null;
    }
}
