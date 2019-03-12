/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var a=b=c=d=f=h=e=i=false;
var g=true;
            var c="";
var source=null;
var destination=null;
function trainname(){
    var tname =document.getElementById("tname").value;
    var patt1 =     /^[a-zA-Z ]+$/;
      var result = tname.match(patt1);
      if(!result){
          document.getElementById("tnameerror").style.display = "block";
          document.getElementById("tnameerror").innerHTML = "invalid train name"
          a=false;
      }
      else{
          document.getElementById("tnameerror").style.display = "none";
          a=true;
      }
}
function trainnumber(){
    var tnumber =document.getElementById("tnumber").value;
      var result = Number(tnumber);
      if(!result){
          document.getElementById("tnumbererror").style.display = "block";
          document.getElementById("tnumbererror").innerHTML="invalid train number";          
          b=false;
      }
      else{
          document.getElementById("tnumbererror").style.display = "none";
          b=true;
      }
}
function sourceValidate(){
    window.console.log(source);
    if (source != null)   { 
        document.getElementById(source).style.display ="block";
    }
    source =document.getElementById("source").value
    var patt1 =     /^[a-zA-Z ]+$/;
      var result = source.match(patt1);
      if(!result){
          document.getElementById("sourceerror").style.display = "block";
          document.getElementById("sourceerror").innerHTML="invalid source name";
          source=null;
          c=false;
      } 
      else if((document.getElementById("destination").value != null)&&((document.getElementById("destination").value)==source)){
          document.getElementById("sourceerror").style.display = "block";
          document.getElementById("sourceerror").innerHTML="Destination and source should not be matched";
          source     = null;
          c=false;          
      }
      else if(document.getElementById(source+"1")){
          document.getElementById("sourceerror").style.display = "block";
          document.getElementById("sourceerror").innerHTML="Station selected in intermediate stations";
          source     = null;
          c=false;          
      }
      else{
         window.console.log(document.getElementById(source+"1"));
            if (document.getElementById(source) == null ){
                document.getElementById("sourceerror").style.display = "block";
                document.getElementById("sourceerror").innerHTML="station doesn't exits"; 
                source=null
            }
            else{
                document.getElementById("sourceerror").style.display = "none";
                c=true;                
            }

      }
}
function destinationValidate(){
    if (destination != null)   { 
        document.getElementById(destination).style ="visibility: visible;";
    }
    destination =document.getElementById("destination").value
    var patt1 =     /^[a-zA-Z ]+$/;
      var result = destination.match(patt1);
      if(!result){
          document.getElementById("destinationerror").style.display = "block";
          document.getElementById("destinationerror").innerHTML="invalid destination name";
          destination = null;
          d=false;
      }
      else if((document.getElementById("source").value != null)&&((document.getElementById("source").value))==destination){
          document.getElementById("destinationerror").style.display = "block";
          document.getElementById("destinationerror").innerHTML="Destination and source should not be matched";
          destination = null;
          d=false;          
      }
      else if(document.getElementById(destination+"1")){
          document.getElementById("destinationerror").style.display = "block";
          document.getElementById("destinationerror").innerHTML="Station selected in intermediate stations";
          destination = null;
          d=false;          
      }
      else{
          window.console.log(document.getElementById("VSPK"));
          if (document.getElementById(destination) == null ){
                document.getElementById("destinationerror").style.display = "block";
                document.getElementById("destinationerror").innerHTML="station doesn't exits"; 
                destination=null;
                d=false;
          }
          else{
            d=true;     
                document.getElementById("destinationerror").style.display = "none";
          }
      }
}
function sleeperValidate(){
    var sleeper =document.getElementById("sleeper").value
      var result = Number(sleeper);
      if(!result){
          document.getElementById("sleepererror").style.display = "block";
          document.getElementById("sleepererror").innerHTML="invalid sleeper coach count";
          e=false;
      }
      else{
          document.getElementById("sleepererror").style.display = "none";
          e=true;
      }
}
function acValidate(){
    var ac =document.getElementById("ac").value
      var result = Number(ac);
      if(!result){
          document.getElementById("acerror").style.display = "block";
          document.getElementById("acerror").innerHTML="invalid ac coach count";
          f=false;
      }
      else{
          document.getElementById("acerror").style.display = "none";
          f=true;
      }
}
function clickk(){
   var nature =  document.getElementById("nature").value;
   window.console.log(nature);
   if (nature == "Weekly"){
        document.getElementById("first").style.display = "none";
        document.getElementById("second").style.display = "none";
        document.getElementById("days").style.display = "block";
    }
    else if(nature == "By Weekly"){
         document.getElementById("days").style.display = "none";
         document.getElementById("first").style.display = "block";
         document.getElementById("second").style.display = "block";
    }
    else{
        document.getElementById("first").style.display = "none";
        document.getElementById("second").style.display = "none";
        document.getElementById("days").style.display = "none";
    }
}
            function add(event){
                var id =event.srcElement.id;
                if(id.length!=0){
                    if(document.getElementById("source").value == id){
                        window.console.log(document.getElementById("source").value);
                        document.getElementById("selectederror").style.display="block";
                        document.getElementById("selectederror").innerHTML ="It is source station";
                    }
                    else if(document.getElementById("destination").value == id){
                        window.console.log(document.getElementById("destination").value);
                        document.getElementById("selectederror").style.display="block";
                        document.getElementById("selectederror").innerHTML ="It is destination station";                       
                    }
                    else if(!(document.getElementById(id +"1"))){
                        document.getElementById("selectederror").style.display="none";
                        var div = document.createElement("DIV");
                        div.id = id +"1";
                        div.className = "ui basic large label";
                        div.style.display ="block";
                        var span = document.createElement("SPAN");
                        span.appendChild(document.createTextNode(document.getElementById(id).childNodes[0].innerHTML));
                        var childdiv = document.createElement("DIV");
                        childdiv.className = "ui right floated detail";
                        childdiv.style ="float:right";
                        childdiv.appendChild((document.createTextNode(id)));
                        var i = document.createElement("I");
                        i.className = "delete icon";
                        i.style ="float:right";
                        i.onclick = function clicked(event){
                            document.getElementById("selected").removeChild(document.getElementById(id +"1"));
                        };
                        div.appendChild(span);
                        div.appendChild(i);
                        div.appendChild(childdiv);

                       // Append the text to <p>
                       document.getElementById("selected").appendChild(div);           
                   }
                   else{
                       document.getElementById("selectederror").innerHTML = "station already selected";
                       document.getElementById("selectederror").style.display="block";
                   }
               }                       //document.getElementById("selected").innerHTML = "hai";*/
        }
        function call(){
            var ele = document.getElementsByName("ele");
            
            if(document.getElementById("search").value.trim() != 0){
                for(var i=0 ;i< ele.length;i++){
                    var a = ele[i].innerHTML.split(" ");
                    for(var e=0;e<a.length;e++){
                        if(a[e].trim().length !== 0){
                            if( a[e].trim().toLowerCase().search(document.getElementById("search").value.trim().toLowerCase())>=0){
                                ele[i].style.display  = "block";
                            }
                            else 
                            { 
                                ele[i].style.display  = "none";
                            }
                           break;
                        }
                    }
                }
            }
            else{
                for(var i=0 ;i< ele.length;i++){
                    ele[i].style.display  = "none";
                }
            }
                                   
        }
            function firstday(){
                
                var day1 = document.getElementById("days2").value;
                var day2 = document.getElementById("days1").value;
                window.console.log(day1);
                window.console.log(day2);
                if(day1 == day2){
                    document.getElementById("dayerror").style.display="block";
                    g=false;
                }
                else{
                    document.getElementById("dayerror").style.display="none";
                    g=true;                    
                     
                }
}
function stationValidate(){
    if(Number(document.getElementById("selected").childElementCount) == 0){
        h=false;
        document.getElementById("searcherror").style.display = "block";
    }
    else{
        document.getElementById("searcherror").style.display = "none";
        h=true;
    }
}
function flag(){
    document.getElementById("values").value ="";
    var nodes = document.getElementById("selected").childNodes;
     for(var i =1; i<nodes.length;i++){
          var str =  nodes[i].childNodes[2].innerHTML;
          window.console.log(str);
          document.getElementById("values").value +=" "+str;
   }
   window.console.log(a,b,c,d,e,f,g,h);
    return (a && b && c && d && e && f && g  && h);
}