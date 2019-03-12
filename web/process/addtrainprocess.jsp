<%-- 
    Document   : addtrainprocess
    Created on : Nov 2, 2018, 9:35:58 PM
    Author     : RGUKT
--%>

<%@page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{  
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection(  
            "jdbc:mysql://localhost:3306/railway","root","");    
            if(request.getParameter("nature").equals("Daily")){
                 PreparedStatement stmt=con.prepareStatement("insert into train(tnumber,tname,source,destination,sleepercount,account,Nature) values (?,?,?,?,?,?,?)");
                 stmt.setString(1,request.getParameter("tnumber"));
                 stmt.setString(2,request.getParameter("tname"));
                 stmt.setString(3,request.getParameter("source"));
                 stmt.setString(4,request.getParameter("destination"));
                 stmt.setString(5,request.getParameter("sleeper"));
                 stmt.setString(6,request.getParameter("ac"));
                 stmt.setString(7,request.getParameter("nature"));

                 int i =stmt.executeUpdate(); 
            }
            else if(request.getParameter("nature").equals("Weekly")){
                 PreparedStatement stmt=con.prepareStatement("insert into train(tnumber,tname,source,destination,sleepercount,account,Nature,first) values (?,?,?,?,?,?,?,?)");
                 stmt.setString(1,request.getParameter("tnumber"));
                 stmt.setString(2,request.getParameter("tname"));
                 stmt.setString(3,request.getParameter("source"));
                 stmt.setString(4,request.getParameter("destination"));
                 stmt.setString(5,request.getParameter("sleeper"));
                 stmt.setString(6,request.getParameter("ac"));
                 stmt.setString(7,request.getParameter("nature"));
                 stmt.setString(8,request.getParameter("day"));

                 int i =stmt.executeUpdate();                                       
            }
            else{
                 PreparedStatement stmt=con.prepareStatement("insert into train(tnumber,tname,source,destination,sleepercount,account,Nature,first,second) values (?,?,?,?,?,?,?,?,?)");
                 stmt.setString(1,request.getParameter("tnumber"));
                 stmt.setString(2,request.getParameter("tname"));
                 stmt.setString(3,request.getParameter("source"));
                 stmt.setString(4,request.getParameter("destination"));
                 stmt.setString(5,request.getParameter("sleeper"));
                 stmt.setString(6,request.getParameter("ac"));
                 stmt.setString(7,request.getParameter("nature"));
                 stmt.setString(8,request.getParameter("first"));
                 stmt.setString(9,request.getParameter("second"));
                 int i =stmt.executeUpdate(); 
            } 
                 PreparedStatement stmt1=con.prepareStatement("insert into intermediatestations (tnumber,scode) values (?,?)");
                 stmt1.setString(1,request.getParameter("tnumber"));
                 stmt1.setString(2,request.getParameter("source")); 
                 int k =stmt1.executeUpdate();            
              String s=   request.getParameter("intermediatestations");
              String[] ss= s.split("%");
              for(int j=0;j<ss.length;j++){
                try{ 
                  stmt1=con.prepareStatement("insert into intermediatestations (tnumber,scode) values (?,?)");
                  stmt1.setString(1,request.getParameter("tnumber"));
                  stmt1.setString(2,ss[j]); 
                  k =stmt1.executeUpdate();

                }
                catch(Exception e){
                    out.println(e);
                } 
                }
                stmt1=con.prepareStatement("insert into intermediatestations (tnumber,scode) values (?,?)");
                 stmt1.setString(1,request.getParameter("tnumber"));
                 stmt1.setString(2,request.getParameter("destination")); 
                 k =stmt1.executeUpdate(); 
              
              out.println("success");
               con.close();
        }
        catch(Exception e){ 
            out.println("error");
        } 
%> 