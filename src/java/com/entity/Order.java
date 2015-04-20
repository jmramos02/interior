package com.entity;

import java.util.Date; 
public class Order {
private int orderID;
private int productID;
private int itemCode;
private int customerContactNumber;
private String orderStatus;
private Date orderDate;
private Date arrivalDate;
private int employeeContactNumber;
private int phoneNumber;
private int getProductID, quantity;

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

public int getPhoneNumber(){
    return phoneNumber;
}

public int getOrderID(){
	return orderID;
}
public int getProductID(){
	return productID;
}
public int getItemCode(){
	return itemCode;
}
public int getCustomerContact(){
	return customerContactNumber;
}
public String getOrderStatus(){
	return orderStatus;
}
public Date getOrderDate(){
	return orderDate;
}
public Date getArrivalDate(){
	return arrivalDate;
}
public int getEmployeeContact(){
    return employeeContactNumber;
}
 
public void setPhoneNumber(int x){
    phoneNumber=x;
}
 
public void setOrderID(int x){
	 orderID=x;
}
public void setProductID(int x){
	 productID=x;
}
public void setItemCode(int x){
	 itemCode=x;
}
public void setCustomerContact(int x){
	 customerContactNumber=x;
}
public void setOrderStatus(String x){
	 orderStatus=x;
}
public void setOrderDate(Date x){
	 orderDate=x;
}
public void setArrivalDate(Date x){
	 arrivalDate=x;
}
public void setEmployeeContactNumber(int x){
     employeeContactNumber=x;
}

 /*   void setOrderStatus(String string) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }*/

}