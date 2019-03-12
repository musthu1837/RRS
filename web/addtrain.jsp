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
<%!boolean flagg=false;
%>
<%
    if(request.getParameter("tnumber") !=null){
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection(  
            "jdbc:mysql://localhost:3306/railway","root","");       
            PreparedStatement stmt=con.prepareStatement("select * from train where tnumber = ?");
            stmt.setString(1,request.getParameter("tnumber"));
            ResultSet rs = stmt.executeQuery();
            rs.previous();
            if(rs.next()){
                con.close();
                flagg=true;
            }       
            else{con.close();
                flagg=false;
            }
        }
        catch(Exception e){ 
           out.println("<h1>"+e+"</h1>");
        } 
    }
%>
<html>
    <head>
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.3/semantic.min.css"/>
        <title>Add train</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="./js/addtrain.js">
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
                        out.println("<a id='Schedule' href='addSchedule.jsp' class='item' style='width: 50px' title='Add schedule'><i aria-hidden='true' class='time icon' style='color: #0066ff'></i><b>Schedule</b></a>");
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
        <div class="ui bottom fixed menu">
            <center>
            <div class="item" style="margin-left: 400px">
                <b>Copyright © 2018 Copyright - RGUKT Basar. All rights reserved.</b>
            </div>
            </center>
        </div>                
        <div style="width: 800px;margin-left: 180px;margin-top: 100px">     
            <form class='ui form' method="POST">
               <div class='unstackable two fields'>
                   <div class='field'>
                       <label>Train name <span style="color:red">*</span></label>
                     <div class='ui icon input'>
                       <input type='text' placeholder='Train name' id='tname' name='tname'/>
                       <i aria-hidden='true' class='train icon' ></i>
                     </div>
                     <div id="tnameerror" style="color: red;margin-left: 10px;margin-top: 2px;display: none">Red</div>
                   </div>
                   <div class='field'>
                     <label>Train number<span style="color:red">*</span></label>
                     <div class='ui icon input'>
                       <input type='text' placeholder='Train number' id='tnumber' name='tnumber'/>
                       <i aria-hidden='true' class='train icon' ></i>
                     </div>
                     <div id="tnumbererror" style="color: red;margin-left: 10px;margin-top: 2px;display: none">Red</div>
                   </div>
                 </div>
                 <div class='two fields'>
                   <div class='field'>
                     <label>Source station code<span style="color:red">*</span></label>
                     <div class='ui icon input'>
                       <input type='text' placeholder='Source' id='source' name='source'/>
                       <i aria-hidden='true' class='home icon' ></i>
                     </div>
                   <div id="sourceerror" style="color: red;margin-left: 10px;margin-top: 2px;display: none"></div>
                   </div>
                   <div class='field'>
                     <label>Destination station code<span style="color:red">*</span></label>
                     <div class='ui icon input'>
                       <input type='text' placeholder='Destination' id='destination' name='destination'/>
                       <i aria-hidden='true' class='home icon' ></i>
                     </div>
                     <div id="destinationerror" style="color: red;margin-left: 10px;margin-top: 2px;display: none"></div>
                   </div>
                 </div>
                <div class='two fields'>
                   <div class='field'>
                       <label>Sleeper coach count<span style="color:red">*</span></label>
                     <div class='ui icon input'>
                       <input type='text' placeholder='sleeper count' name="sleeper" id="sleeper"/>
                       <i aria-hidden='true' class='pencil icon' ></i>
                     </div>
                     <div id="sleepererror" style="color: red;margin-left: 10px;margin-top: 2px;display: none"></div>
                   </div>
                   <div class='field'>
                     <label>AC coach count<span style="color:red">*</span></label>
                     <div class='ui icon input'>
                       <input type='text' placeholder='ac count' name='ac' id='ac'/>
                       <i aria-hidden='true' class='pencil icon' ></i>
                     </div>
                     <div id="acerror" style="color: red;margin-left: 10px;margin-top: 2px;display: none"></div>
                   </div>
                 </div>
                <div class="three fields">
                    <div class="field">
                        <label>Nature<span style="color:red">*</span>   </label>
                        <select name="nature" id="nature">
                            <option value="Daily">Daily</option>
                            <option value="Weekly">Weekly</option>
                            <option value="BI-Weekly">BI-Weekly</option>
                        </select>
                    </div>
                    <div id="days" class="field" style="display: none">
                        <label>Select Day</label>
                        <select name="day" id="dayy">
                            <option value="Monday">Monday</option>
                            <option value="Tuesday">Tuesday</option>
                            <option value="Wednesday">Wednesday</option>
                            <option value="Thursday">Thursday</option>
                            <option value="Friday">Friday</option>
                            <option value="Saturday">Saturday</option>
                            <option value="Sunday">Sunday</option>
                        </select>
                     </div>
                    <div id="first" class="field" style="display: none">
                        <label>First Day</label>
                        <select name="days" id="days2">
                            <option value="Monday">Monday</option>
                            <option value="Tuesday">Tuesday</option>
                            <option value="Wednesday">Wednesday</option>
                            <option value="Thursday">Thursday</option>
                            <option value="Friday">Friday</option>
                            <option value="Saturday">Saturday</option>
                            <option value="Sunday">Sunday</option>
                        </select>
                        <div class="two fields" id="dayerror" style="color: red;display: none">
                                            firstday and seconday must be different                    
                        </div>
                     </div> 
                    <div id="second" class="field" style="display: none">
                        <label>Second Day</label>
                        <select name="days1" id="days1">
                            <option value="Monday">Monday</option>
                            <option value="Tuesday">Tuesday</option>
                            <option value="Wednesday">Wednesday</option>
                            <option value="Thursday">Thursday</option>
                            <option value="Friday">Friday</option>
                            <option value="Saturday">Saturday</option>
                            <option value="Sunday">Sunday</option>
                        </select>
                     </div> 
                </div>
                <div class='two fields'>
                    <div class='field'>
                        <label>Select Intermediate In order Stations</label>
                        <div class="ui icon input">
                            <input class="ui input" id="search" placeholder="Search"/>
                            <i class="search icon"></i>     
                        </div>
                        <div id='content' class="ui card" style="max-height: 150px; overflow-y: auto;margin-top: 2px;width: 400px;margin-top: 0px">
                                    <% 
                                      try{  
                                      Class.forName("com.mysql.jdbc.Driver");  
                                      Connection con=DriverManager.getConnection(  
                                      "jdbc:mysql://localhost:3306/railway","root","");       
                                      Statement stmt=con.createStatement();
                                      ResultSet rs = stmt.executeQuery("select * from station");
                          
                                      while(rs.next()){
                                          out.println("<div name='ele' class='ui basic large label' id='"+rs.getString(1)+"' style='cursor: pointer;display:none'><span>"+rs.getString(2)+"</span><div class='ui right floated detail' style=''>"+rs.getString(1)+"</div></div>");
                                      }
                                  }
                                  catch(Exception e){ 
                                      out.println("<h1>"+e+"</h1>");
                                  }  
                                %>
                        </div>
                        <div  id="searcherror" style="color: red;margin-left: 10px;margin-top: 2px;display: none">select the stations</div>
                    </div>
                    <div class='field'>
                        <label>Selected Stations</label>
                        <div id='selected' class='ui segment' style='margin-top: 0px;overflow-x: scroll;max-height: 150px;width: 300px;'>                          
                        </div>
                        <div  id="selectederror" style="color: red;margin-left: 10px;margin-top: 2px;display: none">station already added</div>                        
                    </div>
                </div>
                        <div class="two fields" style="display: none">
                            <div class="field">
                                <input id="values" type="text" name="values"/>
                            </div>
                        </div> 
                 <button type='submit' class='ui primary button' role='button' id="submit">
                   Submit
                 </button>
                <div id="pmsg" class='ui positive message' style="display: none">
                    <div class='header'>Success!!</div>
                    <p>Train added successfully.</p>
                </div>
                <div id="emsg" class='ui negative message' style="display: none">
                    <div class='header'>Sorry!!</div>
                    <p>Train already exits.</p>
                </div>
                <div id="umsg" class='ui negative message' style="display: none">
                    <div class='header'>Sorry!!</div>
                    <p>Unable to add train.</p>
                </div> 
             </form>
        </div>
        <div class="ui bottom fixed menu">
            
            <div class="item" style="margin-left: 400px">
                <b>Copyright © 2018 Copyright - RGUKT Basar. All rights reserved.</b>
            </div>
            
        </div>
    </div>
    </body> 
</html>
