<%-- 
    Document   : viewscheduleprocess
    Created on : Nov 3, 2018, 1:48:25 PM
    Author     : RGUKT
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{  
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection(  
            "jdbc:mysql://localhost:3306/railway","root","");
            PreparedStatement stmt=con.prepareStatement("select * from schedule where tnumber=?");
            stmt.setString(1,request.getParameter("tnumber"));   
            ResultSet rs  = stmt.executeQuery();
            String s="";
            if(rs.next()){
                rs.previous();
                while(rs.next()){
                    s+=rs.getInt(1)+"$"+rs.getString(3)+"$"+rs.getString(4)+"$"+rs.getString(5)+"$"+rs.getString(6)+"%";
                }
                out.print(s);
            }
            else{
                out.print("failure");
            }
            con.close();
    }
    catch(Exception e){
        out.print("unable");
    }
%>
