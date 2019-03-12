 $(document).ready(function(){
                    $("#nature").change(function(){
                        if($("#nature").val() == 'BI-Weekly'){
                            $("#days").hide();
                            $("#first").show();
                            $("#second").show();
                        }
                        else if($("#nature").val() == 'Weekly') {
                            $("#days").show();
                            $("#first").hide();
                            $("#second").hide();
                        }
                        else{
                             $("#days").hide();
                            $("#first").hide();
                            $("#second").hide();                           
                        }
                    });
                $("#search").keyup(function(){
                    var searchvalue = $("#search").val().toLowerCase();
                    var snames = $("#content").children("div").children("span");
                    for(var i=0; i<snames.length;i++ ){                        
                        if($(snames[i]).html().trim().toLowerCase().search(searchvalue) <0 || !searchvalue.length){
                            $($(snames[i]).parent()).hide();
                        }
                        else $($(snames[i]).parent()).show();
                    }
                });               
                $("#content").children("div").click(function(event){
                    if($("#source").val() == event.currentTarget.id){
                        $("#selectederror").html("It is a source station").show();
                    }
                    else if($("#destination").val() == event.currentTarget.id){
                         $("#selectederror").html("It is a destination station").show();
                    }
                    else if($("#"+event.currentTarget.id+1).length ==0) {
                            var text  = $($("#"+event.currentTarget.id).children()[0]).html().trim();
                            var label = $("<div id="+event.currentTarget.id+1+" class='ui basic large label' style='display:block'><span>"+text+"</span><i class='delete icon' style='float:right'></i><div class='ui right floated detail' style='float:right'>"+event.currentTarget.id+"</div></div>")
                            $("#selected").append(label)          
                            $("#"+event.currentTarget.id+1).children("i").click(function (event){
                               $(event.currentTarget).parent().remove();
                            });    
                            $("#selectederror").hide();
                    }
                    else $("#selectederror").show();
                        //$("#selectederror").hide();
                        
                    
                });

                $("form").submit(function (event){
                    event.preventDefault();
                    $("#pmsg").hide();
                    $("#emsg").hide();
                    $("#umsg").hide();
                    var a=b=c=d=e=f=h=i=false;
                    var g=true;
                    var pattern1 = /^[a-zA-Z ]+$/;                    
                    $("#tname").val().match(pattern1) ? (a = true,$("#tnameerror").hide()): (a=false,$("#tname").val().length == 0 ? ($("#tnameerror").html("train name can't be empty"),$("#tnameerror").show()) : ($("#tnameerror").html("Invalid train name"),$("#tnameerror").show()));
                    (! isNaN($("#tnumber").val()) && !$("#tnumber").val().length == 0) ? (  b = true,$("#tnumbererror").hide()): (b=false,$("#tnumber").val().length == 0 ? ($("#tnumbererror").html("train number can't be empty"),$("#tnumbererror").show(),$("tnumbererror").show()) : ($("#tnumbererror").html("Invalid  train number"),$("#tnumbererror").show()));
                    (! isNaN($("#sleeper").val()) && !$("#sleeper").val().length == 0) ? (c = true,$("#sleepererror").hide()): (c=false,$("#sleeper").val().length == 0 ? ($("#sleepererror").html("sleeper count can't be empty"),$("#sleepererror").show()) : ($("#sleepererror").html("Invalid sleeper count"),$("#sleepererror").show()));
                    (! isNaN($("#ac").val()) && !$("#ac").val().length == 0) ? (d = true,$("#acerror").hide()): (d=false,$("#ac").val().length == 0 ? ($("#acerror").html("ac count can't be empty"),$("#acerror").show()) : ($("#acerror").html("Invalid ac count"),$("#acerror").show()));
                    if($("#source").val().trim().length == 0){
                         e=false;
                        $("#sourceerror").html("source station code cannot be empty").show();                         
                    }                     
                    else if($("#"+($("#source").val()+1)).length){
                        e=false;
                        $("#sourceerror").html("station already selected in intermediate stations").show();
                    }                   
                    else if(!$("#"+($("#source").val())).length){
                        e=false;
                        $("#sourceerror").html("station does not exits").show();                        
                    }
                    else{ 
                        $("#sourceerror").hide();
                        e=true;
                    }

                    if($("#destination").val().trim().length == 0){
                         e=false;
                        $("#destinationerror").html("destination station code cannot be empty").show();                         
                    }                    
                    else if($("#"+($("#destination").val()+1)).length){
                        f=false;
                        $("#destinationerror").html("station already selected in intermediate stations").show();
                    }
                    else if(!$("#"+($("#destination").val())).length){
                        f=false;
                        $("#destinationerror").html("station does not exits").show();                        
                    }                    
                    else{ $("#destinationerror").hide();
                        f=true;
                    }                  
                    
                   if($("#nature").val() == "BI-Weekly"){
                //        window.console.log($("#nature").val());
                  //      window.console.log($("#days2").val()==$("#days1").val());
                        if($("#days2").val()==$("#days1").val()){
                            g=false;
                            $("#dayerror").show();
                        }
                        else{
                            g=true;
                            $("#dayerror").hide();
                        }
                    }
                  //  window.console.log(!$("#selected").children().length);
                    if(!$("#selected").children().length){
                        h=false;
                        $("#selectederror").html("please select intermediate stations").show();
                    }
                    else{
                        h=true;
                        $("#selectederror").hide();
                    }
                    if($("#source").val() == $("#destination").val()){
                        i=false;
                        $("#sourceerror").html("source and destination should not be same").show();
                    }
                    else{
                        i=true;
                        $("#sourceerror").hide();
                    }
                    window.console.log(a , b , c , d , e , f , g ,h,i);
                    if(a && b && c && d && e && f && g && h && i){
                        var snames = $("#selected").children("div").children("div");
                        var snamesstring="";
                    for(var i=0; i<snames.length;i++ ){                        
                         snamesstring+=$(snames[i]).html().trim()+"%"  ;                      
                    }         
                    window.console.log($("#sleeper").val(),$("#ac").val(),snamesstring,$("#tname").val(),$("#tnumber").val(),$("#source").val(),$("#destination").val(),$("#nature").val(),$("#dayy").val(),$("#days2").val(),$("#days1").val());
                        $.post(  './process/addtrainprocess.jsp', 
                                {   tname : $("#tname").val(),
                                    tnumber:  $("#tnumber").val(),
                                    source:  $("#source").val(),
                                    destination:   $("#destination").val(),
                                    intermediatestations:    snamesstring,
                                    nature:  $("#nature").val(),
                                    ac: $("#ac").val(),
                                    sleeper: $("#sleeper").val(),
                                    day: $("#dayy").val(),
                                    first:    $("#days2").val(),
                                    second:    $("#days1").val()
                                }, 
                                function(responseText) {
                                   // window.console.log(responseText.trim());
                                    if(responseText.trim() == "success"){
                                        window.console.log(responseText.trim()+1);
                                        $("#pmsg").show();
                                         $("form").trigger("reset");
                                         $("#umsg").hide();
                                         $("#emsg").hide();
                                    }
                                    else if (responseText.trim() == "error"){
                                        window.console.log(responseText.trim()+2);
                                        $("#pmsg").hide();
                                        $("#emsg").show();
                                         $("#umsg").hide();
                                    }
                                    else{
                                        window.console.log(responseText.trim()+3);
                                        $("#pmsg").hide();
                                        $("#umsg").show();
                                        $("#emsg").hide();
                                        
                                    }                                        
                                }
                        );  
                    }
                });
            })