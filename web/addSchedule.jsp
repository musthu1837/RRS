<%-- 
    Document   : index
    Created on : Oct 8, 2018, 5:16:36 PM
    Author     : RGUKT
--%>

<%@page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("username") == null)    
        response.sendRedirect("login.jsp");
%>
<%! boolean flag2= false;
%>
<html>
    <head>
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.3/semantic.min.css"/>
        <title>Add train</title>
        <script src="./js/addschedule.js">    

        </script>
        <script>
                        
        </script>
    </head>
    <body>
    <div>
        <div class='ui top fixed labeled mini icon menu' style="height:60px">
            <a class='active item'>
                <i aria-hidden='true' class='gamepad icon'></i>
                Games
            </a>
            <p>
                <%   if(session.getAttribute("fname") != null){
                        out.println("<p style='margin-left:40px;margin-top:10px;font-size:25px;font-family:san-serif;'>Welcome "+session.getAttribute("fname")+" "+session.getAttribute("lname")+" <i class='smile outline icon' style='color:#99ff99'></i></p>");
                    }
                %>
            </p>
            <div class="ui right floated labeled mini icon menu">               
                <div class='ui huge icon input' style="width:300px;margin-right: 10px;height: 40px;margin-top: 10px;margin-left: 10px">
                    <input type='text' placeholder='Search...' />
                    <i aria-hidden='true' class='search icon' style="color: #0066ff"></i>
                </div>
                <%
                    if(session.getAttribute("fname") == null){
                        out.print("<a class='item' href='signup.jsp'><i aria-hidden='true' class='user add icon' style='color: #0066ff'></i><b>Sign UP</b></a>");
                        out.print("<a class='item' href='login.jsp' style='border-right: 1px solid #f0f0f5'><i aria-hidden='true' class='user circle icon' style='color: #0066ff'></i><b>Login</b></a>");
                    }
                %>
                <%
                    if(session.getAttribute("fname") != null){
                        out.print("<a class='item' href='logout.jsp' style='border-right: 1px solid #f0f0f5' id='logout'><i aria-hidden='true' class='user circle icon' style='color: #0066ff'></i><b>Logout</b></a>");
                    }
                %>                
                <a class='item' id="about">
                    <i aria-hidden='true' class='question circle icon' style="color: #0066ff"></i>
                    <b>About</b>
                </a>
            </div>
        </div> 
        <div class='ui left fixed vertical labeled tiny icon menu' style='width: 70px'>
            <a class='active item' style="width: 50px;height: 60px;" href="./">
                <i aria-hidden='true' class='home icon' style="color: #0066ff"></i>
                <b>Home</b>
            </a>
            <%   if(session.getAttribute("admin") == "1"){
                        out.println("<a id='Train' href='addtrain.jsp' class='item' style='width: 50px' title='Add Train'><i aria-hidden='true' class='train icon' style='color: #0066ff'></i><b>Train</b></a>");
                        
                    }
            %>
            <a id="Book" class='item' style="width: 50px" title="Book Ticket" href="booking.jsp">
                <i aria-hidden='true' class='ticket icon' style="color: #0066ff"></i> 
                <b>Book</b> 
            </a>
            <a id="PNR" class='item' style="width: 50px" title="PNR status">
                <i aria-hidden='true' class='tv icon' style="color: #0066ff"></i>
                <b>PNR</b>                
            </a>
            <a id="Check" class='item' style="width: 50px" title="Check Availability" href="checkAvailability.jsp">
                <i aria-hidden='true' class='exchange icon' style="color: #0066ff"></i>
                <b>Check</b>               
            </a>
            <a id="View" class='item' style="width: 50px" title="View Schedule" href="viewSchedule.jsp">                
                <i aria-hidden='true' class='time icon' style="color: #0066ff"></i>
                <b>View</b>               
            </a>            
            <a class='item' style="width: 50px">
            </a>
        </div>                
        <div style="width: 800px;margin-left: 500px;margin-top: 100px">  
            <div class="ui large card">
                <div class="content">
                    <div class="header">
                            Enter the train number
                    </div><br/>
                    <div class="description">
                        <form class='ui form' method="POST" action="addSchedule.jsp">
                               <div class='field'>
                                 <div class='ui icon input'>
                                   <input type='text' placeholder='Train number' id='tnumber' name='tnumber'/>
                                   <i aria-hidden='true' class='train icon' ></i>
                                 </div>
          
                               </div>
                                <div class='field'>  
                                   <button type='submit' class='ui primary button' role='button' id="submit">
                                    Submit
                                   </button>
                                </div>
                        </form>
                    </div>
                </div>
                <div class="extra content">
                    <%
                        if(request.getParameter("tnumber") !=null){
                            try{  
                                Class.forName("com.mysql.jdbc.Driver");  
                                Connection con=DriverManager.getConnection(  
                                "jdbc:mysql://localhost:3306/railway","root","");       
                                PreparedStatement stmt=con.prepareStatement("select * from train where tnumber = ?");
                                stmt.setString(1,request.getParameter("tnumber"));
                                ResultSet rs = stmt.executeQuery();
                                if(rs.next()){
                                    PreparedStatement stmt1=con.prepareStatement("select * from schedule where tnumber = ?");
                                    stmt1.setString(1,request.getParameter("tnumber"));
                                    ResultSet rs1 = stmt1.executeQuery(); 
                                    if(rs1.next()){
                                        flag2=false;
                                        out.println("<div class='ui negative message'><div class='header'>Sorry!!</div><p>Schedule already exits.</p></div> ");
                                    }
                                    else{
                                        flag2=true;
                                    }
                                }       
                                else{
                                    out.println("<div class='ui negative message'><div class='header'>Sorry!!</div><p>Invalid train number</p></div> ");
                                                                      
                                }
                                con.close(); 
                            }               
                            catch(Exception e){ 
                               out.println("<div class='ui negative message'><div class='header'>Sorry!!</div><p>"+e+"</p></div> ");
                            } 
                        }
                    %>
                </div>
            </div>
        </div>
                <br/>
        <div style="width: 900px;margin-left: 16%;" >
            <form action="addSchedule.jsp" method="POST" onsubmit="return flag()">
                <div class='ui red fluid large card'>
                    <div class='content'>
                        <div class='header' id="header">
                            <% if (flag2) out.print(request.getParameter("tnumber")); else out.print("");%>
                        </div>
                            <%  if(request.getParameterValues("at")  != null){
                                            try{  
                                                String at[] = request.getParameterValues("at");
                                                String dt[] = request.getParameterValues("dt");
                                                String dis[] = request.getParameterValues("distance");
                                                for(int i = 0 ;i< at.length ; i++){
                                                    String s[] = at[i].split(":");
                                                    int val = Integer.parseInt(s[0]);
                                                    if(val >= 12) at[i] = at [i] +"PM";
                                                    else at[i] = at[i] + "AM";
                                                 //   out.print(at[i]);
                                                    String s1[] = dt[i].split(":");
                                                    int val1 = Integer.parseInt(s1[0]);
                                                    if(val1 >= 12) dt[i] = dt [i] +"PM";
                                                    else dt[i] = dt[i] + "AM";
                                                   // out.print(dt[i]);                                                    
                                                }
                                                Class.forName("com.mysql.jdbc.Driver");  
                                                Connection con=DriverManager.getConnection(  
                                                "jdbc:mysql://localhost:3306/railway","root","");       
                                                PreparedStatement stmt=con.prepareStatement("select scode from intermediatestations where tnumber = ?");
                                                stmt.setString(1,request.getParameter("trainnumber"));
                                                ResultSet rs = stmt.executeQuery();
                                                rs.next();
                                                PreparedStatement stmt1=con.prepareStatement("select source,destination from train where tnumber = ?");
                                                stmt1.setString(1,request.getParameter("trainnumber"));
                                                ResultSet rs1 = stmt1.executeQuery();
                                                rs1.next();
                                                PreparedStatement stmt5=con.prepareStatement("insert into schedule(tnumber,scode,arrivaltime,departuretime,distance) values (?,?,?,?,?)");
                                                stmt5.setString(1,request.getParameter("trainnumber"));
                                                stmt5.setString(2,rs1.getString(1)); 
                                                stmt5.setString(3,at[0]); 
                                                stmt5.setString(4,dt[0]); 
                                                stmt5.setString(5,dis[0]); 
                                                int k =stmt5.executeUpdate();
                                                for (int i=1 ; i<at.length-1;i++){
                                                    stmt5=con.prepareStatement("insert into schedule(tnumber,scode,arrivaltime,departuretime,distance) values (?,?,?,?,?)");
                                                    stmt5.setString(1,request.getParameter("trainnumber"));
                                                    stmt5.setString(2,rs.getString(1)); 
                                                    stmt5.setString(3,at[i]); 
                                                    stmt5.setString(4,dt[i]); 
                                                    stmt5.setString(5,dis[i]); 
                                                    stmt5.executeUpdate();   
                                                    rs.next();
                                                }
                                                stmt5=con.prepareStatement("insert into schedule(tnumber,scode,arrivaltime,departuretime,distance) values (?,?,?,?,?)");
                                                stmt5.setString(1,request.getParameter("trainnumber"));
                                                stmt5.setString(2,rs1.getString(2)); 
                                                stmt5.setString(3,at[at.length-1]); 
                                                stmt5.setString(4,dt[at.length-1]); 
                                                stmt5.setString(5,dis[at.length-1]);
                                                stmt5.executeUpdate();
                                                out.println("<div class='ui positive message'><div class='header'>Success!!</div><p>Schedule added successfully</p></div> ");                       
                                                con.close(); 
                                            }               
                                            catch(Exception e){ 
                                                 out.println("<div class='ui negative message'><div class='header'>Sorry!!</div><p>"+e.getMessage()+request.getParameter("trainnumber")+"</p></div> ");                       
                                            }                                        
                                              
                                }
                            %>
                        
                        <br/>
                        <div class='description'>
                            <table class='ui red table'>
                               <thead>
                                 <tr>
                                   <th>Station Code</th>  
                                   <th>Station Name</th>
                                   <th>Arrival Time</th>
                                   <th>Departure Time</th>
                                   <th>Distance(KM)</th>
                                 </tr>
                               </thead>
                               <tbody>
                                    <%
                                        if(flag2){
                                            try{  
                                                Class.forName("com.mysql.jdbc.Driver");  
                                                Connection con=DriverManager.getConnection(  
                                                "jdbc:mysql://localhost:3306/railway","root","");       
                                                PreparedStatement stmt=con.prepareStatement("select scode from intermediatestations where tnumber = ?");
                                                stmt.setString(1,request.getParameter("tnumber"));
                                                ResultSet rs = stmt.executeQuery();                            
                                                while(rs.next()){
                                                    stmt=con.prepareStatement("select sname from station where scode =?");
                                                    stmt.setString(1, rs.getString(1));
                                                    ResultSet rs3 = stmt.executeQuery();
                                                    if(rs3.next()) out.print("<tr><td>"+rs.getString(1)+"</td><td>"+rs3.getString(1)+"</td><td><div class='field'><div class='ui error input'><input type='time' name='at' id='"+rs.getString(1)+"AT"+"' onfocusout='hai(event)'/></div></div></td><td><div class='field'><div class='ui error input'><input type='time' name='dt' id='"+rs.getString(1)+"DT"+"' onfocusout='bye(event)'/></div></div></td><td><div class='field'><div class='ui error input'><input type='text' placeholder='distance' name='distance' onfocusout='dis(event)' id='"+rs.getString(1)+"DS"+"'/></div></div></td></tr>");
                                                }
                                                                                              
                                                
                                                con.close(); 
                                            }               
                                            catch(Exception e){ 
                                                 out.println("<div class='ui negative message'><div class='header'>Sorry!!</div><p>"+e.getMessage()+request.getParameter("tnumber")+"</p></div> ");                       
                                            } 
                                        }
                                    %>
                               </tbody>
                            </table>  
                        </div>
                    </div>
                         <%      if(flag2){
                        out.print("<div class='extra content'><button type='submit' class='ui primary button' role='button' id='submit'>Add</button></div>");     
                        flag2=false;
                                }
                    %>
                               <div class="field" style="display: none">
                                   <div class="ui input">
                                       <input id="train" name='trainnumber'/>
                                   </div>
                    </div><br/><br/><br/>
                </div>
            </form>
        </div>
        <div class="ui bottom fixed menu">
            <center>
            <div class="item" style="margin-left: 400px">
                <b>Copyright © 2018 Copyright - RGUKT Basar. All rights reserved.</b>
            </div>
            </center>
        </div>
    </div>
    </body> 
</html>
