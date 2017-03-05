<%-- 
    Document   : MakeBill
    Created on : Apr 2, 2016, 5:16:31 PM
    Author     : admin
--%>

<%@page import="professionalbean.DBConnector"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="robots" content="noindex,nofollow" />

<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/jquery-ui.min.js" type="text/javascript"></script>
 
<script type="text/javascript">
$(document).ready(function() {
 
 var counter = 0;
 
  
 $("#addElement").click(function(event){
   
  counter++;   
          
   //add Input Text Box
    var $newDiv = $("<div></div>");
    var $newInput = $("<input type='text'>");
    $newInput
      .attr("name", "ProdName" + counter)
      .addClass("text");
    $newInput.appendTo($newDiv);
    $newDiv.appendTo($("#generatedForm"));
    
    var $newInput = $("<input type='text'>");
    $newInput
      .attr("name", "Selling" + counter)
      .addClass("text");
    $newInput.appendTo($newDiv);
    $newDiv.appendTo($("#generatedForm"));
    
    var $newInput = $("<input type='text'>");
    $newInput
      .attr("name", "Quantity" + counter)
      .addClass("text");
    $newInput.appendTo($newDiv);
    $newDiv.appendTo($("#generatedForm"));
 });
  
});
</script>


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
    http.open('get', 'ProcessBill.jsp');
    http.onreadystatechange = processResponse;
    http.send(null);
}


function processResponse() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('generatedForm').innerHTML = response;
    }
}

-->
      </script>

        <link rel="stylesheet" href="billingStyles.css">
</head>

<body>
    <br><br>
   <div>   
       <center>
       <input id="addElement" type="button" value="Add New Item"  style="background-color: burlywood"/>
       <br><br><br><br>
       </center>
    <table>
     <tr>
         <th style="color: brown">&nbsp;Product Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
         <th style="color: brown">Selling Price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
         <th style="color: brown">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Quantity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
     </tr>
    </table>
   </div>

    <form id="makebill" name="makebill" method="POST" action="ProcessBill.jsp">
      <div id="generatedForm"></div>
      <br><br>
      
      <center>
          <input type="submit" value="Process Bill" style="background-color: burlywood">
      </center>
        </form>
    <!--    
<form id="makebill" name="makebill" >
      <div id="generatedForm"></div>
      <br><br>
      
      <center>
          <input type="button"  onclick="makeGetRequest()" value="submit">
      </center>
        </form>
    -->
    
</body>
</html>

