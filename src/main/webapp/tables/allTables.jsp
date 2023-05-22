<%@page import="java.sql.Statement"%>
<%@page import="connection.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

Connection con = DatabaseConnection.getCon();

Statement st = con.createStatement();

String t1 = "create table product(id int PRIMARY KEY auto_increment , productName varchar(255), productPrice int , productMRPPrice int , productDescription varchar(255) , status varchar(255),productCategory varchar(255), filePath varchar(1000) , fileName varchar(255))";

String t2= "create table customer(Name varchar(255), email varchar(255) PRIMARY KEY , password varchar(255) , phone bigint , gender varchar(255),address varchar(1000), pincode int)";

String t3 = "create table cart(id int PRIMARY KEY auto_increment , productName varchar(255), fileName varchar(255),productPrice int , productMRPPrice int,totalAmount int , quantity int,email varchar(255), status varchar(255))";

String t4 = "create table orders(id int PRIMARY KEY auto_increment , name varchar(255), email varchar(255),phone bigint , address varchar(1000), pincode int , addressType varchar(200), paymentMode varchar(255), dateAndTime datetime default now(),status varchar(255),productName varchar(255),fileName varchar(255),quantity int , totalAmount int)";
//st.execute(t1);
//st.execute(t2);
//st.execute(t3);
st.execute(t4);
System.out.println("created table");


%>