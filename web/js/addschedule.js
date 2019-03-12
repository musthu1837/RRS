function hai(event){
    if(document.getElementById(event.srcElement.id).parentNode.parentNode.parentNode.parentNode.previousSibling.previousSibling != null){
        var a = document.getElementById(event.srcElement.id).parentNode.parentNode.parentNode.parentNode.previousSibling;
        var id = a.childNodes[3].childNodes[0].childNodes[0].childNodes[0];
        var pre = document.getElementById(id.id).value.split(":");
        var present = document.getElementById(event.srcElement.id).value.split(":");
        pre[0] = Number(pre[0]);
        pre[1] = Number(pre[1]);
        present[0]= Number(present[0]);
        present[1]= Number(present[1]);
        if(pre[1]+"" != "NaN" && present[1]+"" != "NaN"){
            if(pre[0] == present[0] && pre[1] >= present[1]){
                id.parentNode.className = "ui error input";
                document.getElementById(event.srcElement.id).parentNode.className = "ui error input";
                window.console.log("error1");
            }
            else if(pre[1] == present[1] && pre[0] >= present[0]){
                id.parentNode.className = "ui error input";
                document.getElementById(event.srcElement.id).parentNode.className = "ui error input";
                window.console.log("error2");
            }
            else{
                             id.parentNode.className = "ui input";
                document.getElementById(event.srcElement.id).parentNode.className = "ui input"; 
                window.console.log("good4");
            }
        }
        else {
            id.parentNode.className = "ui error input";
            document.getElementById(event.srcElement.id).parentNode.className = "ui error input";
            window.console.log("error5");
        }
    }
    else window.console.log("does not");
    a = document.getElementById(event.srcElement.id).parentNode.parentNode.parentNode.nextSibling.childNodes[0].childNodes[0].childNodes[0];
    id = document.getElementById(event.srcElement.id);
    present = a.value.split(":");
    pre = id.value.split(":");
    pre[0] = Number(pre[0]);
    pre[1] = Number(pre[1]);
    present[0]= Number(present[0]);
    present[1]= Number(present[1]);
    if(pre[1]+"" != "NaN" && present[1]+"" != "NaN"){
        if(pre[0] == present[0] && pre[1] >= present[1]){
            a.parentNode.className = "ui error input";
            id.parentNode.className = "ui error input";
            window.console.log("error1");
        }
        else if(pre[1] == present[1] && pre[0] >= present[0]){
            a.parentNode.className = "ui error input";
            id.parentNode.className = "ui error input";
            window.console.log("error2");
        }
        else{
            a.parentNode.className = "ui input";
            id.parentNode.className = "ui input";     
            window.console.log("good3");
        }        
    }
    else{
            a.parentNode.className = "ui error input";
            id.parentNode.className = "ui error input";
        window.console.log("error4");        
    }
}
function bye(event){
    var a = document.getElementById(event.srcElement.id).parentNode.parentNode.parentNode.previousSibling.childNodes[0].childNodes[0].childNodes[0];
    var id = document.getElementById(event.srcElement.id);
    var pre = a.value.split(":");
    var present = id.value.split(":");
    pre[0] = Number(pre[0]);
    pre[1] = Number(pre[1]);
    present[0]= Number(present[0]);
    present[1]= Number(present[1]);
    if(pre[1]+"" != "NaN" && present[1]+"" != "NaN"){
        if(pre[0] == present[0] && pre[1] >= present[1]){
            a.parentNode.className = "ui error input";
            id.parentNode.className = "ui error input";
            window.console.log("error1");
        }
        else if(pre[1] == present[1] && pre[0] >= present[0]){
            a.parentNode.className = "ui error input";
            id.parentNode.className = "ui error input";
            window.console.log("error2");
        }
        else{
            a.parentNode.className = "ui input";
            id.parentNode.className = "ui input";         
            window.console.log("good3");
        }        
    }
    else{
        a.parentNode.className = "ui error input";
        id.parentNode.className = "ui error input";
        window.console.log("error4");        
    }
    if(document.getElementById(event.srcElement.id).parentNode.parentNode.parentNode.parentNode.nextSibling.nextSibling != null){
        a = document.getElementById(event.srcElement.id).parentNode.parentNode.parentNode.parentNode.nextSibling;
        id = a.childNodes[2].childNodes[0].childNodes[0].childNodes[0];
        window.console.log(id.parentNode);
        window.console.log(document.getElementById(event.srcElement.id).parentNode);
        present = document.getElementById(id.id).value.split(":");
        pre = document.getElementById(event.srcElement.id).value.split(":");
        pre[0] = Number(pre[0]);
        pre[1] = Number(pre[1]);
        present[0]= Number(present[0]);
        present[1]= Number(present[1]);
        if(pre[1]+"" != "NaN" && present[1]+"" != "NaN"){
            if(pre[0] == present[0] && pre[1] >= present[1]){
                id.parentNode.className = "ui error input";
                document.getElementById(event.srcElement.id).parentNode.className = "ui error input";
                window.console.log("error11");
            }
            else if(pre[1] == present[1] && pre[0] >= present[0]){
                id.parentNode.className = "ui error input";
                document.getElementById(event.srcElement.id).parentNode.className = "ui error input";
                window.console.log("error22");
            }
            else{
                             id.parentNode.className = "ui input";
                document.getElementById(event.srcElement.id).parentNode.className = "ui input";               
                window.console.log("good33");
            }
        }
        else{ 
                            id.parentNode.className = "ui error input";
                document.getElementById(event.srcElement.id).parentNode.className = "ui error input";
                window.console.log("error55");
        }  
    }
    else window.console.log("does not");
}
function dis(event){
    if(document.getElementById(event.srcElement.id).parentNode.parentNode.parentNode.parentNode.previousSibling.previousSibling != null){
        var a = document.getElementById(event.srcElement.id).parentNode.parentNode.parentNode.parentNode.previousSibling;   
        var id = a.childNodes[4].childNodes[0].childNodes[0].childNodes[0];
        if(Number(id.value.trim())+"" != "NaN" && id.value.trim().length!=0 && Number(document.getElementById(event.srcElement.id).value.trim())+"" != "NaN" && document.getElementById(event.srcElement.id).value.trim().length != 0){
                var pre = Number(id.value.trim());
                var present = Number(document.getElementById(event.srcElement.id).value.trim());
                if(pre >= present){
                       id.parentNode.className = "ui error input";
                       document.getElementById(event.srcElement.id).parentNode.className = "ui error input";
                   }
                else{
                       id.parentNode.className = "ui input";
                       document.getElementById(event.srcElement.id).parentNode.className = "ui input";
                } 
                    
        }
        else{
            id.parentNode.className = "ui error input";
            document.getElementById(event.srcElement.id).parentNode.className = "ui error input";            
        }
    }
    else {
        window.console.log("does not");
    }
 if(document.getElementById(event.srcElement.id).parentNode.parentNode.parentNode.parentNode.nextSibling.nextSibling != null){
        a = document.getElementById(event.srcElement.id).parentNode.parentNode.parentNode.parentNode.nextSibling;
        id = a.childNodes[4].childNodes[0].childNodes[0].childNodes[0];
        window.console.log(id.parentNode);
        window.console.log(document.getElementById(event.srcElement.id).parentNode);
        if(Number(id.value)+"" != "NaN" && id.value.length!=0 && Number(document.getElementById(event.srcElement.id).value)+"" != "NaN" && document.getElementById(event.srcElement.id).value.length!=0){
                var next = id.value;
                var present = document.getElementById(event.srcElement.id).value;
                if(next <= present){
                       id.parentNode.className = "ui error input";
                       document.getElementById(event.srcElement.id).parentNode.className = "ui error input";
                   }
                else{
                       id.parentNode.className = "ui input";
                       document.getElementById(event.srcElement.id).parentNode.className = "ui input";
                } 
                    
        }
        else{
            id.parentNode.className = "ui error input";
            document.getElementById(event.srcElement.id).parentNode.className = "ui error input";            
        }       
    }
    else window .console.log("does not");
}
function flag(){
    window.console.log(document.getElementsByClassName("ui error input").length);
     var num = document.getElementById("header").innerHTML.trim();
     window.console.log(document.getElementsByName("trainnumber"));
     document.getElementById("train").value =num;
      window.console.log(document.getElementById("train").value);
    if(document.getElementsByClassName("ui error input").length == 0){
       
        //document.getElementById("train").value = document.getElementById("header").innerHTML.trum();
        return true;
    }
    else 
        return false;
}
