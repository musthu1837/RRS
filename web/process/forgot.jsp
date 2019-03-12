<%-- 
    Document   : forgot.jsp
    Created on : Oct 23, 2018, 5:47:13 PM
    Author     : M
--%>

<%@page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{  
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection(  
        "jdbc:mysql://localhost:3306/railway","root","");       
        PreparedStatement stmt=con.prepareStatement("select password from railwayuser where dob = ?");
        stmt.setString(1,request.getParameter("dob"));
        ResultSet rs = stmt.executeQuery();
        if(rs.next()){
            response.setContentType("text/plain");
            response.getWriter().write(rs.getString(1));             
        }       
        else{
            response.setContentType("text/plain");
            response.getWriter().write("failure");             
        }
        con.close();
    }
    catch(Exception e){ 
        response.setContentType("text/plain");
        response.getWriter().write("unable");           
    }     
%>