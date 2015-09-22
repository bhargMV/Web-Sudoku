<%-- 
    Document   : index
    Created on : Aug 26, 2012, 1:55:31 AM
    Author     : BHARGAVA MOURYA
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SUDOKU</title>
        <script type='text/javascript'>
            window.history.forward();function noBack() { window.history.forward(); }
         </script>
    </head>
     
    <body onload='noBack();' onpageshow='if (event.persisted) noBack();' onunload='' bgcolor="MistyRose" >
    <center><h1>WELCOME TO THE GAME</h1>  <center/>
           <% ArrayList arr=(ArrayList)request.getAttribute("ErrMsg");
            
             if(arr!=null)
             {
                Iterator it = arr.iterator();
                while(it.hasNext())
                {
                 out.println(it.next());
                 out.println("<br/>");
                }
                
                arr.removeAll(arr);
             }
        
       %>

        <form action="LoginVerification" method="POST">
            <center>User Name :<input type="text" name="UserName" value="" /> <center/>
                <input type="submit" value="PLAY" name="Play" />
        </form>
        
    </body>
</html>
