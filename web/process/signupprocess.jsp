<%-- 
    Document   : signupprocess
    Created on : Oct 23, 2018, 12:25:27 AM
    Author     : M
--%>

<%@page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  boolean flag = false;
    try{  
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection(  
        "jdbc:mysql://localhost:3306/railway","root","");       
        PreparedStatement stmt=con.prepareStatement("select * from railwayuser where username = ?");
        stmt.setString(1,request.getParameter("username"));
        ResultSet rs = stmt.executeQuery();
        if(rs.next()){
            flag=false;
        }       
        else{
            flag=true;
        }
        con.close();
    }
    catch(Exception e){ 
        response.setContentType("text/plain");
        response.getWriter().write("unable");           
    }     
    if(flag){
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection(  
            "jdbc:mysql://localhost:3306/railway","root","");       
            PreparedStatement stmt=con.prepareStatement("insert into railwayuser values (?,?,?,?,?,?,?,?,?)");
            stmt.setString(1,request.getParameter("fname"));
            stmt.setString(2,request.getParameter("lname"));
            stmt.setString(3,request.getParameter("mobile"));
            stmt.setString(4,request.getParameter("email"));
            stmt.setString(5,request.getParameter("username"));
            stmt.setString(6,request.getParameter("dob"));
            stmt.setString(7,request.getParameter("cpassword"));
            stmt.setString(8,request.getParameter("address"));
            stmt.setInt(9, 0);
            int i =stmt.executeUpdate();
            con.close();
            response.setContentType("text/plain");
            response.getWriter().write("sucess");
                                              //    out.println("<div class='ui positive message'><div class='header'>Success!!</div><p>you are successfully registered.</p></div> ");
        }
        catch(Exception e){ 
            response.setContentType("text/plain");
            response.getWriter().write("unable");             
        }  
    }
    else{
        response.setContentType("text/plain");
        response.getWriter().write("failure");        
    }
%>
