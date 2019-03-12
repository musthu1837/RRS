<%@page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    if(request.getParameter("username") != null){    
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection(  
            "jdbc:mysql://localhost:3306/railway","root","");       
            PreparedStatement stmt=con.prepareStatement("select * from railwayuser where username = ? and password = ?");
            stmt.setString(1,request.getParameter("username"));
            stmt.setString(2,request.getParameter("password"));
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                request.getSession(false);
                session.setAttribute("username",request.getParameter("username"));
                session.setAttribute("password",request.getParameter("password") );
                session.setAttribute("fname", rs.getString(1));
                session.setAttribute("lname", rs.getString(2));
                session.setAttribute("admin", rs.getInt(9));
                response.setContentType("text/plain");
                response.getWriter().write("success");    
                con.close();
            }       
            else{
                response.setContentType("text/plain");
                response.getWriter().write("failure");
                con.close();
            }
        }
        catch(Exception e){ 
            response.setContentType("text/plain");
            response.getWriter().write("unable");
        }
    }
%>