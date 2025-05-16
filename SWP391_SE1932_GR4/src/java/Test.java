/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author MSI
 */
@WebServlet(urlPatterns={"/test"})
public class Test extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
      String name = request.getParameter("name");
      String a = request.getParameter("a");
<<<<<<< HEAD
      
 String a1 = request.getParameter("a1");
     
=======
      String ok = request.getParameter("cf");
       String a1 = request.getParameter("a1");
       //âfafadfdsfsf
       //sâfbaubufbua
       //ádasdadas//ádsafasfsafsafsafsaf
       //huýadas
>>>>>>> 36c56544ec2056503799170918a37e211081528b
    } 

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
     
    }


}
