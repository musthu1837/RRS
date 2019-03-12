 $(document).ready(function (){
                var toggle1 = true,toggle2 = true;
                $("#passwordbtn").click(function(event){
                    event.preventDefault();
                    $("#pswicon").toggleClass("eye icon eye slash icon");
                    $("#password").attr("type",function(index ,value){
                        return   toggle1 ? (toggle1=false,"text") :(toggle1=true,"password");
                    });
                });
                $("#cpasswordbtn").click(function(event){
                    event.preventDefault();
                    $("#cpswicon").toggleClass("eye icon eye slash icon");
                    $("#cpassword").attr("type",function(index ,value){
                        return   toggle2 ? (toggle2=false,"text") :(toggle2=true,"password");
                    });
                });
                $("form").submit(function (event){
                    event.preventDefault();
                    $("#pmsg").hide();
                    $("#emsg").hide();
                    $("#umsg").hide();
                    var a=b=c=d=e=f=g=h=false;
                    var pattern1 = /^[a-zA-Z ]+$/;
                    var pattern2 = /^[6-9]\d{9}$/ ;
                    //window.console.log( $("#dob").val().length);
                    $("#fname").val().match(pattern1) ? (a = true,$("#fnameerror").hide()): (a=false,$("#fname").val().length == 0 ? ($("#fnameerror").html("first name can't be empty"),$("#fnameerror").show()) : ($("#fnameerror").html("Invalid first name"),$("#fnameerror").show()));
                    $("#lname").val().match(pattern1) ? (b = true,$("#lnameerror").hide()): (b=false,$("#lname").val().length == 0 ? ($("#lnameerror").html("last name can't be empty"),$("#lnameerror").show()) : ($("#lnameerror").html("Invalid last name"),$("#lnameerror").show()));
                    $("#mobile").val().match(pattern2) ? (c = true,$("#mobileerror").hide()): (c=false,$("#mobile").val().length == 0 ? ($("#mobileerror").html("mobile number can't be empty"),$("#mobileerror").show()) : ($("#mobileerror").html("Invalid mobile number name"),$("#mobileerror").show()));
                    $("#email").val().search("@gmail.com") > 0 ? (d = true,$("#emailerror").hide()): (d=false,$("#email").val().length == 0 ? ($("#emailerror").html("email address can't be empty"),$("#emailerror").show()) : ($("#emailerror").html("Invalid email address"),$("#emailerror").show()));
                    if($("#dob").val().length != 0){
                        var now = new Date();
                        var year = Number($("#dob").val().substr(0,4));
                        if((now.getFullYear()-year)>=18){
                            e=true;
                            $("#doberror").hide();
                        }
                        else {
                            e=false;
                            $("#doberror").html("age must be 18+");
                            $("#doberror").show();                            
                        }
                    }
                    else{ e=false;
                        $("#doberror").html("dob can't be empty");
                        $("#doberror").show();
                    }
                    var psw = $("#password").val();
                    var cpsw = $("#cpassword").val();
                    (psw.length != 0 && cpsw.length != 0) ? ((psw == cpsw) ? (psw.length >= 8) ? (f=true,$("#passworderror").hide()) : (f=false,$("#passworderror").html("password must contain atleat 8 letters") ,$("#passworderror").show()) : (f=false,$("#passworderror").html("passwords not matched") ,$("#passworderror").show())) : (f=false,$("#passworderror").html("password cant't be empty") ,$("#passworderror").show());
                    $("#address").val().length == 0 ? (g=false,$("#addresserror").html("address can't be empty"),$("#addresserror").show()) : ($("#addresserror").hide(),g=true);
                    $("#uname").val().length == 0 ? (h=false,$("#unameerror").html("username can't be empty"),$("#unameerror").show()) : ($("#unameerror").hide(),h=true);
                    
                    window.console.log(a,b,c,d,e,f,g);
                    if(a && b && c && d && e && f && g){
                        $.post(  './process/signupprocess.jsp', 
                                {   fname : $("#fname").val(),
                                    lname:  $("#lname").val(),
                                    mobile: $("#mobile").val(),
                                    email:  $("#email").val(),
                                    username:   $("#uname").val(),
                                    dob:    $("#dob").val(),
                                    cpassword:  $("#cpassword").val(),
                                    address:    $("#address").val()
                                }, 
                                function(responseText) {
                                    window.console.log(responseText);
                                    
                                    if(responseText.trim() == "sucess"){
                                        $("#pmsg").show();
                                         $("form").trigger("reset");
                                    }
                                    else if (responseText.trim() == "failure"){
                                        $("#emsg").show();
                                    }
                                    else{
                                        $("#umsg").show();
                                        
                                    }
                                }
                        );  
                    }
                });
            })