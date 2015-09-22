<%-- 
    Document   : SudokuPlay
    Created on : Aug 26, 2012, 6:47:27 PM
    Author     : BHARGAVA MOURYA
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PLAY</title>
        <script type='text/javascript'>
            window.history.forward();function noBack() { window.history.forward(); }
         </script>
    </head>
    <body onload='noBack();' onpageshow='if (event.persisted) noBack();' onunload='' bgcolor="MistyRose" >
        
    <center> <h2>Hello!! <%= session.getAttribute("UserName")%> </h2> <center/>
        
        <br/><br/><br/>
         <% ArrayList arr=(ArrayList)request.getAttribute("ErrMsg");
            
             if(arr!=null)
             {
                Iterator it = arr.iterator();
                while(it.hasNext())
                {
                 out.println("<b>"+it.next()+"<b/>");                 
                }
                
                arr.removeAll(arr);
             }
        
       %>
       <br><br>
        <form action="Sudoku_Solve" method="POST">
            <input type="submit" value="NEW GAME" name="button" />
            <input type="submit" value="DONE" name="button" />
            <input type="submit" value="ON/OFF SOLUTION" name="button" />
            <input type="submit" value="CLEAR ALL" name="button" />
       
        
        <br/><br/>
        <% 
        int[][] game=(int[][])session.getAttribute("game");
        int[][] solution=(int[][])session.getAttribute("solution");
        int view=Integer.parseInt((String)(session.getAttribute("view")));
       
        %>
        
        <table border="1" bgcolor="khaki">
            <%
                int X=0;
                for(int k=0;k<3;k++)
                {                                  
            %>
            <tr>
                <td>
                    <table cellpadding="5" >
                        <%
                            for(int i=X;i<X+3;i++) 
                             {
                        %>
                        <tr>
                             <%
                                 for(int j=0;j<3;j++) 
                                 { 
                             %>
                             <td>
                                 <%
                                  if(game[i][j]>0)
                                  {
                                      out.println("<b><center>&nbsp&nbsp&nbsp&nbsp"+game[i][j]+"&nbsp&nbsp&nbsp&nbsp&nbsp<center/><b/>");
                                      //out.print("<b><input  type = 'text' name = '"+game[i][j]+"' value = '"+game[i][j]+"' size = '2' readonly = 'readonly' / ><b/>");
                                  
                                  }
                                  else
                                  {
                                      int temp=((int[][])session.getAttribute("par_game"))[i][j];
                                      if(temp==0)
                                        out.print("<input  type = 'text' name = '"+i+","+j+"' value = '' size = '2'  / >");
                                      else
                                          out.print("<input  type = 'text' name = '"+i+","+j+"' value = '"+temp+"' size = '2'  / >");    
                                  }                                   
                                 %>
                                 
                             </td>
                             <% }%>
                        </tr>
                      <% }%>
                      </table>
                 </td>
                 
                 <td>
                    <table cellpadding="5">
                        <%
                            for(int i=X;i<X+3;i++) 
                             {
                        %>
                        <tr>
                             <% for(int j=3;j<6;j++) 
                                 { 
                             %>
                             <td>
                                 <%
                                  if(game[i][j]>0)
                                  {
                                      out.println("<b><center>&nbsp&nbsp&nbsp&nbsp"+game[i][j]+"&nbsp&nbsp&nbsp&nbsp&nbsp<center/><b/>");
                                      //out.print("<b><input  type = 'text' name = '"+game[i][j]+"' value = '"+game[i][j]+"' size = '2' readonly = 'readonly' / ><b/>");
                                  }
                                  else
                                  {
                                     int temp=((int[][])session.getAttribute("par_game"))[i][j];
                                      if(temp==0)
                                        out.print("<input  type = 'text' name = '"+i+","+j+"' value = '' size = '2'  / >");
                                      else
                                          out.print("<input  type = 'text' name = '"+i+","+j+"' value = '"+temp+"' size = '2'  / >");                                      }                                 
                                 %>
                                 
                             </td>
                             <% }%>
                        </tr>
                      <% }%>
                      </table>
                 </td>
                 
                 <td>
                    <table cellpadding="5">
                        <%
                            for(int i=X;i<X+3;i++) 
                             {
                        %>
                        <tr>
                             <%
                                 for(int j=6;j<9;j++) 
                                 { 
                             %>
                             <td>
                                 <%
                                  if(game[i][j]>0)
                                  {
                                        out.println("<b><center>&nbsp&nbsp&nbsp&nbsp"+game[i][j]+"&nbsp&nbsp&nbsp&nbsp&nbsp<center/><b/>");
                                      //out.print("<b><input  type = 'text' name = '"+game[i][j]+"' value = '"+game[i][j]+"' size = '2' readonly = 'readonly' / ><b/>");                                  
                                  }
                                  else
                                  {
                                      int temp=((int[][])session.getAttribute("par_game"))[i][j];
                                      if(temp==0)
                                        out.print("<input  type = 'text' name = '"+i+","+j+"' value = '' size = '2'  / >");
                                      else
                                          out.print("<input  type = 'text' name = '"+i+","+j+"' value = '"+temp+"' size = '2'  / >");                                      }                                  
                                 %>
                                 
                             </td>
                             <% }%>
                        </tr>
                      <% } %>
                      </table>
                 </td>
                 </tr>
                 <% X=X+3; 
                } %>
        </table>                
     
                
        </form>
      
        <br><br>
       
        <%
            

            if(session.getAttribute("view").equals("1"))
            { out.println(" <center> SOLUTION</center>");
               out.println("  <table cellspacing='15' bgcolor='moccasin'>");
             for(int i=0;i<9;i++) {
                 for(int j=0;j<9;j++) {
               out.println(" <td>");
               out.print(solution[i][j]);
               out.println("  <td/>");
                 } 
               out.println("    <tr/>");
                  } 
               out.println("  </table>");      
                        
       } %>
            
                 
       
        
    </body>
    
</html>
