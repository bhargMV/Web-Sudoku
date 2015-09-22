/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author BHARGAVA MOURYA
 */
public class SudokuSolve extends HttpServlet {

    
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        HttpSession ses=request.getSession();
        
        int[][] par_game=new int[9][9];
        for(int i=0;i<9;i++)
         {
                 for(int j=0;j<9;j++)
                 {
                     par_game[i][j]=((int[][])ses.getAttribute("game"))[i][j];
                 }
         }
        
        ArrayList ErrMsg = new ArrayList();
        request.setAttribute("ErrMsg",ErrMsg);
        
        try {
            String button = request.getParameter("button");
            if (button.equals("NEW GAME"))
            {
               RequestDispatcher rd=request.getRequestDispatcher("Sudoku_Create");
               rd.forward(request, response);
            } 
            
            if(button.equals("ON/OFF SOLUTION"))
             {
                    if(ses.getAttribute("view").equals("0"))
                       ses.setAttribute("view", "1");
                    else
                        ses.setAttribute("view", "0");
                 
                  for(int i=0;i<9;i++)
                  {
                      for(int j=0;j<9;j++)
                      {
                          if(((int[][])ses.getAttribute("game"))[i][j]==0)
                          {
                              try
                              {
                                  if(Integer.parseInt(request.getParameter((i+","+j).trim()))>0&&Integer.parseInt(request.getParameter((i+","+j).trim()))<10)
                                      
                                  {
                                      par_game[i][j]=Integer.parseInt(request.getParameter((i+","+j).trim()));
                                  }
                                  else
                                  {
                                      par_game[i][j]=0;
                                      ErrMsg.add("GRID "+i+","+j+"should be an integer among 1 to 9");
                                  }
                              }
                              catch(Exception e)
                              {
                                   par_game[i][j]=0;
                                  //ErrMsg.add("index"+i+","+j+"should be an integer");
                              }
                          }
                      }
                  }
                    
                ses.setAttribute("par_game",par_game);
                RequestDispatcher rd=request.getRequestDispatcher("Sudoku_Play");
               rd.forward(request, response);
             }
            
            
            if(button.equals("DONE"))
            {
                int count=1;
                
                ses.setAttribute("view", "1");
                    
                for(int i=0;i<9;i++)
                  {
                      for(int j=0;j<9;j++)
                      {
                          if(((int[][])ses.getAttribute("game"))[i][j]==0)
                          {
                              try
                              {
                                  if(Integer.parseInt(request.getParameter((i+","+j).trim()))>0&&Integer.parseInt(request.getParameter((i+","+j).trim()))<10)
                                      
                                  {
                                     if( ((int[][])ses.getAttribute("solution"))[i][j]==Integer.parseInt(request.getParameter((i+","+j).trim())))
                                     {
                                         
                                     }
                                     else
                                         count=0;
                                     par_game[i][j]=Integer.parseInt(request.getParameter((i+","+j).trim()));
                                  }
                                  else
                                  {   
                                      count=0;
                                      par_game[i][j]=0;
                                      //ErrMsg.add("GRID "+i+","+j+"should be an integer between 1 to 9");
                                  }
                              }
                              catch(Exception e)
                              {   
                                  count=0;
                                  par_game[i][j]=0;
                                  //ErrMsg.add("index"+i+","+j+"should be an integer");
                              }
                          }
                      }
                  }
                
                if(count==1)
                {
                    ErrMsg.add("CONGRATS!!! YOU HAVE SUCCESSFULLY SOLVED.. TRY ANOTHER ONE");
                }
                else
                {
                    ErrMsg.add("HUH!!! YOU HAVE MESSED UP SOME WHERE ...... CHECK THE SOLUTION BELOW AND TRY A NEW ONE");
                }
                ses.setAttribute("par_game",par_game);
                RequestDispatcher rd=request.getRequestDispatcher("Sudoku_Play");
               rd.forward(request, response);
            }
            if(button.equals("CLEAR ALL"))
            {
                ses.setAttribute("par_game",(int [][])ses.getAttribute("game"));
                RequestDispatcher rd=request.getRequestDispatcher("Sudoku_Play");
               rd.forward(request, response);
            }
            
        } finally {            
            out.close();
        }
    }

   
}
