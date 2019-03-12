<%-- 
    Document   : logout
    Created on : Oct 10, 2018, 4:39:19 PM
    Author     : RGUKT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  if(session.getAttribute("username") != null){
         session.invalidate();
        response.sendRedirect("");
    }
    else{
            response.sendRedirect("login.jsp");
    }
%>