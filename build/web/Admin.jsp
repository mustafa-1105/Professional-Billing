<%-- 
    Document   : admin
    Created on : Mar 25, 2016, 10:54:58 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="billingStyles.css">
        
      <script language="Javascript" type="text/javascript">
<!--

function createRequestObject() {
    var tmpXmlHttpObject;
    if (window.XMLHttpRequest) {
            tmpXmlHttpObject = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
    }

    return tmpXmlHttpObject;
}


var http = createRequestObject();

function makeGetRequest() {
   // id=document.frm.uid.value;
    http.open('get', 'ShowItems.jsp');
    http.onreadystatechange = processResponse;
    http.send(null);
}
function makeGetRequest1() {
   // id=document.frm.uid.value;
    http.open('get', 'AddItem.jsp');
    http.onreadystatechange = processResponse;
    http.send(null);
}

function processResponse() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('result').innerHTML = response;
    }
}

-->
      </script>
    </head>
    <body bgcolor="cornsilk">
    <center>
        <br><br><br>
        <table cellspacing="20">
            <tr>
                <td><a href="javascript:makeGetRequest()">Show Items</a>
                <td><a href="javascript:makeGetRequest1()">Add Item</a>
            </tr>
            </table>
            <div id="result"></div>
            <br><br><br><br>
            <a href="index.html">Logout</a>
            
        
        
    </center>
    </body>
</html>
