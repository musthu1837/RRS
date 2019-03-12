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
        <title>Login</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="./js/index.js"></script>
        <script>
            $(document).ready(function (){
                var toggle1 = true;
                /*$("#forgotpsw").mouseenter()(function (){
                   $("#forgotpsw").css("color","red");
                });
                $("#forgotpsw").mouseleave()(function (){
                    $("#forgotpsw").css("color","red");
                });*/                
                $("#forgotpsw").click(function (){ 
                    $("#loginerror").hide();
                    $("#loginuerror").hide();
                    $("#forgotpswcard").slideToggle("slow")
                });
                $("#forgotpswcancel").click(function (){
                   $("#forgotpswcard").slideToggle("slow");
                });
                $("#about").click(function (){
                   $("#aboutcard").toggle("slow");
                });
                $("#aboutcancel").click(function (){
                   $("#aboutcard").toggle("slow");
                });
                $("#passwordbtn").click(function(event){
                    event.preventDefault();
                    $("#pswicon").toggleClass("eye icon eye slash icon");
                    $("#password").attr("type",function(index ,value){
                        return   toggle1 ? (toggle1=false,"text") :(toggle1=true,"password");
                    });
                });
                $("#login").attr("class","ui primary loding button");
                $('#form1').submit(function (event){
                    event.preventDefault();
                    //window.console.log("hai");
                    $("#loginerror").hide();
                    $("#loginuerror").hide();
                    $.post(
                        './process/loginprocess.jsp',
                        {
                            username : $("#uname").val(),
                            password : $("#password").val()
                        },
                        function (responseText){
                            window.console.log(responseText);
                            if(responseText.trim() == "failure"){
                                $("#loginerror").show();
                                $("#login").attr("class","ui primary button")
                            }
                            else if (responseText.trim() == "unable"){
                                $("#loginuerror").show();
                                $("#login").attr("class","ui primary button")
                            }
                            else{
                                window.location.href = './';
                            }
                    });
                });
                $('#form2').submit(function (event){
                    event.preventDefault();
                    //window.console.log("hai");
                    $("#pswresult").hide();
                    $.post(
                        './process/forgot.jsp',
                        {
                            dob: $("#dob").val()
                        },
                        function (responseText){
                            window.console.log(responseText);
                            if(responseText.trim() == "failure"){  
                                $("#pswresult").children("span").hide();  
                                $("#pswresult").children("b").hide();                                
                                $("#pswresult").children("p").hide();                                
                                $("#pswresult").append($("<p></p>").text("Invalid date of birth").css("color","red"));
                                $("#pswresult").show();                            
                            }
                            else if (responseText.trim() == "unable"){
                                $("#pswresult").children("span").hide();  
                                $("#pswresult").children("b").hide();                                
                                $("#pswresult").children("p").hide();
                                $("#pswresult").append($("<p></p>").text("unable to get password").css("color","red"));                                
                                $("#pswresult").show();                               
                            }
                            else{
                                $("#pswresult").children("p").hide(); 
                                $("#pswresult").children("span").hide();  
                                $("#pswresult").children("b").hide();
                                $("#pswresult").append($("<span></span>").text("Your password is "));
                                $("#pswresult").append($("<b></b>").text(responseText));
                                $("#pswresult").show();
                                setTimeout(10000,function(){
                                    $("#pswresult").hide(2000);
                                });
                            }
                    });
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
                <a class='item' href="signup.jsp" style="border-right: 1px solid #f0f0f5">
                    <i aria-hidden='true' class='user add icon' style="color: #0066ff"></i>
                    <b>Sign UP</b>
                </a>
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
        <div style="margin-top: 50px">
            <div class='ui very segment'><br/><br/>
                <div style="width: 350px;margin-left: 150px;float: left;margin-top: 80px">
                    <div class="ui large card" style="margin-left: 50px">
                        <div class="content">
                            <div class="header">
                                Login
                                <a style="float: right;color:#ffb3b3" id="forgotpsw"><u>forgot?</u></a>
                            </div>
                            <div class="description">
                                <form method="post"  class='ui form' id="form1">
                                    <div class='field'>
                                      <label>Username</label>
                                       <div class='ui icon input'>
                                        <input type='text' placeholder='Username' name="username" id="uname"/>
                                        <i aria-hidden='true' class='user icon' ></i>
                                      </div>                 
                                    </div>
                                    <div class='field'>
                                      <label>Password</label>
                                      <div class='ui action input'>
                                        <input type='password' placeholder='Password' name="password" id="password"/>
                                        <button class="ui icon button" id="passwordbtn"><i id="pswicon" aria-hidden='true' class='eye icon' ></i></button>
                                      </div>
                                    </div>
                                    <button type='submit' class='ui primary button' role='button' id='login'>
                                      Login
                                    </button>
                                    <div id="loginerror" class='ui negative message' style="display: none">
                                        <div class='header'>
                                            Sorry!!
                                        </div>
                                        <p>Invalid username or password</p>
                                    </div>
                                    <div id="loginuerror" class='ui negative message' style="display: none">
                                        <div class='header'>
                                            Sorry!!
                                        </div>
                                        <p>Unable to login</p>
                                    </div>                                     
                                </form>
                            </div>  
                        </div>
                    </div>
                  </div>
                  <image src='./images/train-logo.jpg' class='ui medium image' style='margin-left:290px;display: inline-block;margin-top: 0px;' id="logo"/>
                <br/><br/><br/><br/><br/> <br/><br/><br/><br/><br/>
            </div>
        </div>
        <div class="ui bottom fixed menu">           
            <div class="item" style="margin-left: 400px">
                <b>Copyright © 2018 Copyright - RGUKT Basar. All rights reserved.</b>
            </div>          
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
    <div id="forgotpswcard" class="ui card" style="display: none;width: 290px;height: 250px;position: fixed;top:159px;left:214px;border-radius: 5px">
            <div class="content">
                <div class="header">Recover Password<i title="close" id="forgotpswcancel" class="arrow up icon" style="float: right;cursor: pointer"></i></div>
                <div class='meta'>using dob</div>
                <div class="description">
                    <form class="ui form" method="post" id="form2">
                        <div class='field'>
                            <label>Enter the dob<span style="color:red">*</span></label>
                            <div class='ui icon input'>
                                <input type='date' placeholder='Dob' name='dob' id='dob'/>
                                <i aria-hidden='true' class='calendar outline icon' ></i>
                            </div>   
                        </div>  
                        <div class="field">
                            <button class="ui primary button" type="submit">Get</button>
                        </div>
                        <div class="field" style="display: hide" id="pswresult">
                            
                        </div>
                    </form>
                </div>
            </div>
        <div class="extra content">
        </div>
    </div>
    </body>
</html>
