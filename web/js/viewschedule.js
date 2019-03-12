$(document).ready(function(){
    $("form").submit(function(event){
        event.preventDefault();
        $("tbody").children().remove();
        window.console.log($("#tnumber").val());
        $.post(
                './process/viewscheduleprocess.jsp',
                {
                    tnumber: $("#tnumber").val()
                },
                function(responseText){                    
                    if(responseText.trim() == "failure"){                       
                        $("table").hide();
                        $("#tnumbererror").html("Schedule does not exist.").show();
                    }
                    else if(responseText.trim() == "unable"){
                        $("table").hide();
                        $("#tnumbererror").html("unable to load").show();
                    }
                    else{
                        $("#tnumbererror").hide();
                        $("table").show();
                        var values = responseText.split("%");
                        for(var i=0;i<values.length-1;i++){
                            var value = values[i].split("$");
                            $("tbody").append($("<tr><td>"+(i+1)+"</td><td>"+value[1]+"</td><td>"+value[2]+"</td><td>"+value[3]+"</td></tr>"))
                        }
                    }
                }
                
        );
    });
});


