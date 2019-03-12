<%-- 
    Document   : index
    Created on : Oct 8, 2018, 5:16:36 PM
    Author     : RGUKT
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("username") != null)    
        response.sendRedirect("");
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.3/semantic.min.css"/>
        <title>Sign up</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="./js/index.js">

        </script>
        <script src="./js/signup.js">
        </script>
        <script>
            $(document).ready(function (){
                $("#about").click(function (){
                   $("#aboutcard").toggle("slow");
                });
                $("#aboutcancel").click(function (){
                   $("#aboutcard").toggle("slow");
                });
            });           
        </script>
    </head>
    <body>
        <div>
            <div class='ui top fixed labeled mini icon menu'>
                <a class='active item'>
                    <i aria-hidden='true' class='gamepad icon'></i>
                    Games
                </a>
                <div class="ui right floated labeled mini icon menu">               
                    <div class='ui huge icon input' style="width:300px;margin-right: 10px;height: 40px;margin-top: 10px;margin-left: 10px">
                        <input type='text' placeholder='Search...' />
                        <i aria-hidden='true' class='search icon' style="color: #0066ff"></i>
                    </div>
                    <a class='item' href="login.jsp" style="border-right: 1px solid #f0f0f5">
                        <i aria-hidden='true' class='user circle icon' style="color: #0066ff"></i>  
                        <b>Login</b>
                    </a>
                    <a class='item' id="about">
                        <i aria-hidden='true' class='question circle icon' style="color: #0066ff"></i>
                        <b>About</b>
                    </a>
                </div>
            </div>
            <div style="margin-top: 50px">
                <div class='ui segment'><br/><br/>
                    <div style="width: 800px;margin-left: 180px">
                        <form class='ui form' method="POST">
                            <div id="pmsg" class='ui positive message' style="display: none">
                                <div class='header'>Success!!</div>
                                <p>you are successfully registered.</p>
                            </div>
                            <div id="emsg" class='ui negative message' style="display: none">
                                <div class='header'>Sorry!!</div>
                                <p>Account already exits.</p>
                            </div>
                            <div id="umsg" class='ui negative message' style="display: none">
                                <div class='header'>Sorry!!</div>
                                <p>Unable to create account.</p>
                            </div>
                            <div class='unstackable two fields'>
                                <div class='field'>
                                    <label>First name <span style="color:red">*</span></label>
                                    <div class='ui icon input'>
                                        <input type='text' placeholder='First name' id='fname' name='fname'/>
                                        <i aria-hidden='true' class='pencil icon' ></i>
                                    </div>
                                    <div id="fnameerror" style="color: red;margin-left: 10px;margin-top: 2px;display: none"></div>
                                </div>
                                <div class='field'>
                                    <label>Last name<span style="color:red">*</span></label>
                                    <div class='ui icon input'>
                                        <input type='text' placeholder='Last name' id='lname' name='lname'/>
                                        <i aria-hidden='true' class='pencil icon' ></i>
                                    </div>
                                    <div id="lnameerror" style="color: red;margin-left: 10px;margin-top: 2px;display: none">Red</div>
                                </div>
                            </div>
                            <div class='two fields'>
                                <div class='field'>
                                    <label>Mobile<span style="color:red">*</span></label>
                                    <div class='ui icon input'>
                                        <input type='tel' placeholder='Mobile' id='mobile' name='mobile'/>
                                        <i aria-hidden='true' class='mobile alternate icon' ></i>
                                    </div>
                                    <div id="mobileerror" style="color: red;margin-left: 10px;margin-top: 2px;display: none"></div>
                                </div>
                                <div class='field'>
                                    <label>Email<span style="color:red">*</span></label>
                                    <div class='ui icon input'>
                                        <input type='text' placeholder='Email' id='email' name='email'/>
                                        <i aria-hidden='true' class='mail icon' ></i>
                                    </div>
                                    <div id="emailerror" style="color: red;margin-left: 10px;margin-top: 2px;display: none"></div>
                                </div>
                            </div>
                            <div class='two fields'>
                                <div class='field'>
                                    <label>Username<span style="color:red">*</span></label>
                                    <div class='ui icon input'>
                                        <input type='text' placeholder='Username' name="username" id="uname"/>
                                        <i aria-hidden='true' class='user icon' ></i>
                                    </div>
                                    <div id="unameerror" style="color: red;margin-left: 10px;margin-top: 2px;display: none"></div>
                                </div>
                                <div class='field'>
                                    <label>Dob<span style="color:red">*</span></label>
                                    <div class='ui icon input'>
                                        <input type='date' placeholder='Dob' name='dob' id='dob'/>
                                        <i aria-hidden='true' class='calendar outline icon' ></i>
                                    </div>
                                    <div id="doberror" style="color: red;margin-left: 10px;margin-top: 2px;display: none"></div>
                                </div>
                            </div>
                            <div class='two fields'>
                                <div class='field'>
                                    <label>Password<span style="color:red">*</span></label>
                                    <div class='ui action input'>
                                        <input type='password' placeholder='Password' id='password' name='password'/>
                                        <button class="ui icon button" id="passwordbtn"><i id="pswicon" aria-hidden='true' class='eye icon' ></i></button>
                                    </div>
                                </div>
                                <div class='field'>
                                    <label>Confirm Password<span style="color:red">*</span></label>
                                    <div class='ui action input'>
                                        <input type='password' placeholder='Confirm password' id='cpassword' name='cpassword'/>
                                        <button class="ui icon button" id="cpasswordbtn"><i id="cpswicon" aria-hidden='true' class='eye icon' ></i></button>
                                    </div>
                                </div>
                                <div id="passworderror" style="color: red;margin-left: 10px;margin-top: 20px;display: none"></div>
                            </div>
                            <div class="field">
                                <label>Address<span style="color:red">*</span></label>
                                <div class='ui input'>
                                    <textarea placeholder='Address.....' rows='3' style='resize:' id='address' name='address'></textarea>
                                </div>
                                <div id="addresserror" style="color: red;margin-left: 10px;margin-top: 2px;display: none"></div>
                            </div>
                            <button type='submit' class='ui primary button' role='button' id="submit">
                                Submit
                            </button>   
                        </form><br/><br/><br/><br/>
                     </div>
                </div>     
            </div>
            <div class='ui left fixed vertical labeled tiny icon menu' style='width: 70px'>
                <a class='active item' style="width: 50px;height: 60px;" href="./">
                    <i aria-hidden='true' class='home icon' style="color: #0066ff"></i>
                    <b>Home</b>
                </a>
                <%   if(session.getAttribute("admin") == "1"){
                            out.println("<a id='Train' class='item' style='width: 50px' title='Add Train'><i aria-hidden='true' class='train icon' style='color: #0066ff'></i><b>Train</b></a>");
                            out.println("<a id='Schedule' class='item' style='width: 50px' title='Add schedule'><i aria-hidden='true' class='time icon' style='color: #0066ff'></i><b>Schedule</b></a>");
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
                <a id="Check" class='item' style="width: 50px" title="Check Availability">
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
        </div>
   <div class="ui card" id="aboutcard" style="display: none;width: 700px;height: 450px;position: fixed;background-color: #f2f2f2;top:80px;left:290px;border-radius: 10px">
       <div class="content">
           <div class="header"> About Developers <i id="aboutcancel" class="cancel icon" style="float: right;cursor: pointer"></i></div>
            <div class="description" style="margin-top: 20px">
                <div class="ui cards">
                    <div class='ui mini card' style="width:200px">
                        <img src='./images/Muneer.jpg' class='ui image' width="500" height="200" style="border-radius: 15px"/>
                     <div class='content'>
                       <div class='header'>Musthafa</div>
                       <div class='meta'>Developer</div>
                       <div class='description'>

                       </div>
                     </div>
                     <div class='extra content'>
                       <a>
                           9640932548
                           <i style="float:right" aria-hidden='true' class='phone square icon'></i>
                       </a>
                     </div>
                   </div>
                    <div class='ui mini card' style="width:200px">
                        <img src='./images/Muneer.jpg' class='ui image' width="500" height="200" style="border-radius: 15px"/>
                     <div class='content'>
                       <div class='header'>Musthafa</div>
                       <div class='meta'>Developer</div>
                       <div class='description'>

                       </div>
                     </div>
                     <div class='extra content'>
                       <a>
                           9640932548
                           <i style="float:right" aria-hidden='true' class='phone square icon'></i>
                       </a>
                     </div>
                   </div> 
                    <div class='ui mini card' style="width:200px">
                        <img src='./images/Muneer.jpg' class='ui image' width="500" height="200" style="border-radius: 15px"/>
                     <div class='content'>
                       <div class='header'>Musthafa</div>
                       <div class='meta'>Developer</div>
                       <div class='description'>

                       </div>
                     </div>
                     <div class='extra content'>
                       <a>
                           9640932548
                           <i style="float:right" aria-hidden='true' class='phone square icon'></i>
                       </a>
                     </div>
                   </div> 
                </div>
            </div>
        </div>
       <div class="extra content">
           You can mail suggestions to <span style="float: right;font-weight: bold">musthu1837@gmail.com</span> <i class="mail icon" style="float: right"></i> 
       </div>
    </div>
    </body>
</html>
