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
            PreparedStatement stmt=con.prepareStatement("select * from train as t, (SELECT a.tnumber from (select * from intermediatestations WHERE scode=?) as a , (select * from intermediatestations where scode=?) as b WHERE a.tnumber=b.tnumber and a.id < b.id) as c WHERE t.tnumber=c.tnumber and (Nature='Daily' or first=? or second=?);");
            stmt.setString(1,request.getParameter("from"));  
            stmt.setString(2,request.getParameter("to"));
            stmt.setString(3,request.getParameter("day"));
            stmt.setString(4,request.getParameter("day"));
            ResultSet rs  = stmt.executeQuery();
            String s="";
            if(rs.next()){
                rs.previous();
                while(rs.next()){
                    PreparedStatement stmt1=con.prepareStatement("select * from seats where date=? and tnumber=?");
                   stmt1.setString(1,request.getParameter("date"));  
                   stmt1.setString(2,rs.getString(1));
                   ResultSet rs1  = stmt1.executeQuery();
                   if(!rs1.next()){
                        PreparedStatement stmt2=con.prepareStatement("insert into seats values(?,?,(select 70*sleepercount from train where tnumber=?),(select 70*account from train where tnumber=?));");
                       stmt2.setString(1,rs.getString(1));  
                       stmt2.setString(2,request.getParameter("date")); 
                       stmt2.setString(3,rs.getString(1));  
                       stmt2.setString(4,rs.getString(1));                   
                        int i  = stmt2.executeUpdate(); 
                        stmt2=con.prepareStatement("select * from seats where date=? and tnumber=?");
                       stmt2.setString(1,request.getParameter("date"));  
                       stmt2.setString(2,rs.getString(1));
                       ResultSet rs2  = stmt2.executeQuery();
                       rs2.next();
                       s+=rs2.getString(1)+"$"+rs2.getString(2)+"$"+rs2.getString(3)+"$"+rs2.getString(4)+"%";
                   }
                   else{
                       s+=rs1.getString(1)+"$"+rs1.getString(2)+"$"+rs1.getString(3)+"$"+rs1.getString(4)+"%";
                   }
                }
                out.print(s);
            }
            else{
                out.print("failure");
            }            
       
            con.close();
            
    }
    catch(Exception e){
        out.print(e);
    }
%>
