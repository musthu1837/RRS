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
        try{  
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection(  
                "jdbc:mysql://localhost:3306/railway","root","");
              if(request.getParameter("category").equals("Sleeper")){
                    PreparedStatement stmt2=con.prepareStatement("select sleeperseats from seats where date=? and tnumber=?");
                    stmt2.setString(1,request.getParameter("date")); 
                    stmt2.setString(2,request.getParameter("tnumber")); 
                    ResultSet rs = stmt2.executeQuery();rs.next();
                    if(Integer.parseInt(request.getParameter("seats"))<Integer.parseInt(rs.getString(1))){
                    int v = Integer.parseInt(rs.getString(1)) - Integer.parseInt(request.getParameter("seats"));
                    PreparedStatement stmt1=con.prepareStatement("update seats set sleeperseats=? where tnumber=? and date=?");
                    stmt1.setInt(1,v); 
                    stmt1.setString(2,request.getParameter("tnumber"));
                    stmt1.setString(3,request.getParameter("date"));
                    stmt1.executeUpdate();
                PreparedStatement stmt=con.prepareStatement("insert into ticket(tnumber,username,fr,too,cost,seats,date,category) values(?,?,?,?,?,?,?,?)");
                stmt.setString(1,request.getParameter("tnumber")); 
                stmt.setString(2,request.getParameter("user"));
                stmt.setString(3,request.getParameter("from"));
                stmt.setString(4,request.getParameter("to"));
                stmt.setString(5,request.getParameter("cost"));
                stmt.setString(6,request.getParameter("seats"));
                stmt.setString(7, request.getParameter("date"));
                stmt.setString(8, request.getParameter("category"));
                int i = stmt.executeUpdate(); 
                    PreparedStatement stmt3=con.prepareStatement("select max(id) from ticket");; 
                    ResultSet rs3 = stmt3.executeQuery();rs3.next();                
                    out.print(rs3.getString(1));
                    }
                    else out.print("error");
                }
                else{                  
                    PreparedStatement stmt2=con.prepareStatement("select acseats from seats where date=? and tnumber=?");
                    stmt2.setString(1,request.getParameter("date")); 
                    stmt2.setString(2,request.getParameter("tnumber"));
                    ResultSet rs = stmt2.executeQuery();
                    rs.next();
                    if(Integer.parseInt(request.getParameter("seats"))<Integer.parseInt(rs.getString(1))){
                    int v = Integer.parseInt(rs.getString(1)) - Integer.parseInt(request.getParameter("seats"));
                    PreparedStatement stmt1=con.prepareStatement("update seats set acseats=? where tnumber=? and date=?");
                    stmt1.setInt(1,v); 
                    stmt1.setString(2,request.getParameter("tnumber"));
                    stmt1.setString(3,request.getParameter("date"));
                    stmt1.executeUpdate();
                PreparedStatement stmt=con.prepareStatement("insert into ticket(tnumber,username,fr,too,cost,seats,date,category) values(?,?,?,?,?,?,?,?)");
                stmt.setString(1,request.getParameter("tnumber")); 
                stmt.setString(2,request.getParameter("user"));
                stmt.setString(3,request.getParameter("from"));
                stmt.setString(4,request.getParameter("to"));
                stmt.setString(5,request.getParameter("cost"));
                stmt.setString(6,request.getParameter("seats"));
                stmt.setString(7, request.getParameter("date"));
                stmt.setString(8, request.getParameter("category"));
                int i = stmt.executeUpdate();                    
                    PreparedStatement stmt3=con.prepareStatement("select max(id) from ticket");; 
                    ResultSet rs3 = stmt3.executeQuery();rs3.next();                
                    out.print(rs3.getString(1));
                    }
                    else out.print("error");
                }                


                con.close();

        }
        catch(Exception e){
            out.print(e);
        }          
%>
