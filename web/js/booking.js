$(document).ready(function (){    
    var tomorrow = new Date();
    tomorrow.setDate(new Date().getDate()+1);
    var next = new Date();
    next.setDate(new Date().getDate()+30);    
    $("#date").attr("min",(tomorrow.toISOString().slice(0, 19).replace('T', ' ').split(" ")[0]));
    $("#date").attr("max",(next.toISOString().slice(0, 19).replace('T', ' ').split(" ")[0]));
    $("#from").keyup(function(){
        var searchvalue = $("#from").val().toLowerCase();
        var snames = $("#content").children("div").children("span");
        for(var i=0; i<snames.length;i++ ){                        
            if($(snames[i]).html().trim().toLowerCase().search(searchvalue) <0 || !searchvalue.length){
                $($(snames[i]).parent()).hide();
            }
            else $($(snames[i]).parent()).show();
        }
    });   
    $("#to").keyup(function(){
        var searchvalue = $("#to").val().toLowerCase();
        var snames = $("#content1").children("div").children("span");
        for(var i=0; i<snames.length;i++ ){                        
            if($(snames[i]).html().trim().toLowerCase().search(searchvalue) <0 || !searchvalue.length){
                $($(snames[i]).parent()).hide();
            }
            else $($(snames[i]).parent()).show();
        }
    });  
    $("#content").children("div").click(function(event){
        window.console.log(event.currentTarget.id)
        $("#from").val($(event.currentTarget).children("span").html()+"-"+event.currentTarget.id);
        $("#content").hide()
    });
    $("#content1").children("div").click(function(event){
        window.console.log(event.currentTarget.id)
        $("#to").val($(event.currentTarget).children("span").html()+"-"+event.currentTarget.id);
        $("#content1").hide()
    });
    
    $("form").submit(function(event){
        event.preventDefault();
        var fr = $("#from").val().split("-")[1];
        var too = $("#to").val().split("-")[1];
        var days = new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");        
        var day1 = days[new Date($("#date").val()).getDay()];
        $.post('./process/checkprocess.jsp',
        {
          from:fr,
          to:too,
          date:$("#date").val(),
          day:day1
        },
          function(responseText){  
              if(responseText.trim() == 'failure'){
                   $("tbody").children().remove();
                  $("#table").hide();
                  $("#tnumbererror").html("No trains avilable").show();
              }
              else{
                  $("#tnumbererror").hide();
                   $("tbody").children().remove();
                  var values =  responseText.split("%");
                  //window.console.log(values);
                  for(var i=0;i<values.length-1;i++){                      
                      var value = values[i].split("$");                        
                      window.console.log($("tbody"));
                      $("tbody").append($("<tr><td>"+value[0]+"</td><td>"+value[1]+"</td><td>"+value[2]+"</td><td>"+value[3]+"</td><td><button id='"+value[0]+" "+value[1]+" "+fr+" "+too+"' class='ui icon right labeled button' role='button'>Book<i aria-hidden='true' class='ticket icon' /></button></td></tr>"))
                  }                  
                  $("#table").show();
              }
              $($("td").children("button")).click(function(event){
                  window.console.log(event.currentTarget.id);
                  $.post('./process/session.jsp',
                  {
                      id:event.currentTarget.id
                  },
                  function(responseText){
                      window.console.log(responseText);
                      if(responseText.trim()=="failure"){
                          
                      }
                      else{
                          window.location.href="../Railway_Reservation_System/book.jsp"
                      }
                  });
              });
          });
         // window.console.log("sdfsdkjfskdjfdkj");
    });
});

