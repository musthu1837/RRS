<%-- 
    Document   : session
    Created on : Nov 4, 2018, 2:56:02 PM
    Author     : RGUKT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("book", request.getParameter("id"));
    out.print("success");
%>
