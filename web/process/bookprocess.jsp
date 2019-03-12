<%-- 
    Document   : checkprocess
    Created on : Nov 4, 2018, 10:13:02 AM
    Author     : RGUKT
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("require").equals("dist")){
        try{  
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection(  
                "jdbc:mysql://localhost:3306/railway","root","");
                PreparedStatement stmt=con.prepareStatement("SELECT b.distance-a.distance from (select * from schedule WHERE scode=?) as a , (select * from schedule where scode=?) as b WHERE a.tnumber=b.tnumber and a.id < b.id and a.tnumber=?;");
                stmt.setString(1,request.getParameter("from"));  
                stmt.setString(2,request.getParameter("to"));
                stmt.setString(3,request.getParameter("tnumber"));
                ResultSet rs  = stmt.executeQuery();
                String s="";
                if(rs.next()){
                    out.print(rs.getString(1));
                }
                else{
                    out.print("failure");
                }            

                con.close();

        }
        catch(Exception e){
            out.print(e);
        }
    }
    else if(request.getParameter("require").equals("cost")){
        try{ 
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection(  
                "jdbc:mysql://localhost:3306/railway","root","");
                PreparedStatement stmt=con.prepareStatement("select cost from cost where km =(select min(a.km) from (SELECT * from cost where km>?) as a);");
                stmt.setString(1,request.getParameter("dist"));  
                ResultSet rs  = stmt.executeQuery();
                String s="";
                if(rs.next()){
                    out.print(rs.getString(1));
                }
                else{
                    out.print("failure");
                }            

                con.close();

        }
        catch(Exception e){
            out.print(e);
        }        
    }
    else{
        try{  out.print("sdfsdfsd");
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection(  
                "jdbc:mysql://localhost:3306/railway","root","");
                PreparedStatement stmt=con.prepareStatement("insert into ticket(tnumber,username,fr,too,cost,seats) values(?,?,?,?,?,?)");
                stmt.setString(1,request.getParameter("tnumber")); 
                stmt.setString(2,request.getParameter("user"));
                stmt.setString(3,request.getParameter("from"));
                stmt.setString(4,request.getParameter("to"));
                stmt.setString(5,request.getParameter("cost"));
                stmt.setString(6,request.getParameter("seats"));
                int i = stmt.executeUpdate();
                out.print("success");

                con.close();

        }
        catch(Exception e){
            out.print(e);
        }        
    }    
%>
