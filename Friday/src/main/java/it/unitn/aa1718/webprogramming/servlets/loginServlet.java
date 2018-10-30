/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unitn.aa1718.webprogramming.servlets;

import it.unitn.aa1718.webprogramming.connection.DAOFactory;
import it.unitn.aa1718.webprogramming.connection.MySQLDAOFactory;
import it.unitn.aa1718.webprogramming.dao.UserDAO;
import it.unitn.aa1718.webprogramming.dao.entities.MySQLUserDAOImpl;
import it.unitn.aa1718.webprogramming.encrypt.DBSecurity;
import it.unitn.aa1718.webprogramming.extra.Library;
import it.unitn.aa1718.webprogramming.friday.User;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import it.unitn.aa1718.webprogramming.dao.MyCookieDAO;
import it.unitn.aa1718.webprogramming.dao.entities.MySQLMyCookieDAOImpl;
import it.unitn.aa1718.webprogramming.friday.MyCookie;
import java.sql.Timestamp;

/**
 *
 * @author marta & leo97
 */
public class loginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        DBSecurity encrypt = new DBSecurity();

        DAOFactory mySqlFactory = DAOFactory.getDAOFactory();
        UserDAO riverUserDAO = mySqlFactory.getUserDAO();
        MyCookieDAO riverCookieDAO = mySqlFactory.getMyCookieDAO();

        // List myCookies = null; da implementare, dovremmo salvarci tutti i cookie del DB
        MyCookie myCookie = null;
        MyCookieDAO myCookieDAO = new MySQLMyCookieDAOImpl();


        List users = null;
        UserDAO userDAO = new MySQLUserDAOImpl();

        // creazione di user
        Library library = new Library();
      
        String email = null;
        String password = null;
        String ricordami = null;

        email = request.getParameter("email");
        password = request.getParameter("password");
        ricordami = request.getParameter("ricordami");

        System.out.println("EMIL + PASSWORD: " + email + " -- " + password);
        String pswencrypted = encrypt.setSecurePassword(password, email);
        
        System.out.println("LA PASSWORD CRIPTATA IN LOGINSERVLET è :" + pswencrypted);

        //elimina cookie scaduti
        myCookieDAO.deleteDBExpiredCookies();
        
        //associa cookie se esistente
        myCookie = myCookieDAO.getCookie(request, email);
        Long Deadline = (long)0;
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        
        Connection connection = MySQLDAOFactory.createConnection();
        PreparedStatement preparedStatement = null;
        ResultSet result = null;
        String  get_access = "SELECT password FROM users WHERE email = ?";
        String dbpassword = null;

        if (myCookie == null) {
            
            Cookie cookie = new Cookie("FridayLogin", Integer.toString(library.LastEntryTable("cookieID", "cookies")));
            
            //ricordami per 3600 secondi se selezionato, altrimenti cookie valido per la sessione
            if(ricordami != null && ricordami.equals("on")){
                cookie.setMaxAge(3600); //se ricordami selezionato, vale per un'ora
                Deadline = timestamp.getTime()+ 60*60*1000;
            } else {
                    cookie.setMaxAge(-1); //se ricordami non selezionato, vale per la sessione
            }
            
            int LID = -1;
            myCookieDAO.createCookie(new MyCookie(library.LastEntryTable("cookieID", "cookies"), LID, email, Deadline));
            (request.getSession()).setAttribute("sessionCookie", myCookieDAO.getCookie(request, email));
            response.addCookie(cookie);
            
            System.out.println("zao zao il nuovo tuo cookie è stato inserito ed è "+cookie.getName()+", "+cookie.getValue()+"");
            
        } else {
                System.out.println("Bentornato amico! il tuo ID è "+myCookie.getCookieID()+"\n");
                (request.getSession()).setAttribute("sessionCookie", myCookie);
        }

        try {
            preparedStatement = connection.prepareStatement(get_access);
            preparedStatement.setString(1, email);
            preparedStatement.execute();
            result = preparedStatement.getResultSet();               
         if (result.next() && result != null) {
            dbpassword = result.getString("password");
            System.out.println("IN LOGIN SERVLET, la password che ritorna dal database è : " + dbpassword);
        } else {
             if(result == null ){
                 System.out.println("PASSWORD NON ESISTE! ");
                 System.err.println("password inserita non è corretts, reinserire -- REDIREZIONA CON POPUP -- o errate ??' ");
             }
         }
         if(pswencrypted.equals(dbpassword)){
                System.out.println("LE PASSWORD SONO CORRETTE!! REDIREZIONO A INDEX.JSP");
                response.sendRedirect("index.jsp");
            } else {
              System.out.println("PASSWORD DIVERSE !!!!!!!!!!");
          }
          
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                result.close();
            } catch (Exception rse) {
                rse.printStackTrace();
            }
            try {
                preparedStatement.close();
            } catch (Exception sse) {
                sse.printStackTrace();
            }
            try {
                connection.close();
            } catch (Exception cse) {
                cse.printStackTrace();
            }
              
        }

 }
        


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}