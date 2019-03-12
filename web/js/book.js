$(document).ready(function(){
    
  $("form").submit(function(event){
      event.preventDefault();
      $.post('./process/bookprocess.jsp',
      {     tnumber:$($("td")[1]).html().trim(),
          from: $($("td")[3]).html().trim(),
          to:$($("td")[5]).html().trim(),
          require:"dist"
      },
              function(responseText){
                        var dist = Number(responseText.trim());
                       $.post('./process/bookprocess.jsp',
                        {       dist:responseText.trim(),
                                require:"cost"
                        },
                        function(responseText){
                            var cost = Number(responseText.trim());
                            if($("#category").val() == "Sleeper"){
                               cost= (dist*cost)*(Number($("#seats").val()));
                            }
                            else{
                                cost = (dist*(cost+50))*(Number($("#seats").val()))
                            }
                            cost=cost/100;
                            window.console.log($("#username").html());
                            window.console.log($($("td")[3]).html().trim());
                            window.console.log($($("td")[5]).html().trim());
                            window.console.log($($("td")[1]).html().trim());
                            window.console.log(cost);
                            window.console.log($("#seats").val());
                            
                            $.post(
                                    './process/bookprocess1.jsp',{
                                        user:$("#username").html(),
                                    from:$($("td")[3]).html().trim(),
                                    to:$($("td")[5]).html().trim(),
                                    tnumber:$($("td")[1]).html().trim(),
                                    cost:cost,
                                    seats:$("#seats").val(),
                                    date:$($("td")[7]).html().trim(),
                                    category:$("#category").val(),
                                    require:"book"
                                },
                                function(responseTe){
                                    window.console.log(responseTe.trim());
                                    if(responseTe.trim()== "error"){
                                        $("#bookerror").html("no seats available").show();
                                       
                                    }
                                    else{
                                         $("#bookerror").html("Booking has been successfully done and PNR is"+responseTe.trim()).show();
                                    }
                                }
                           )
                        });
                        
              });
  });
    });


