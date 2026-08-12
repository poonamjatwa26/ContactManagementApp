/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Factory.Test;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserSave extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User obj = new User();
        obj.setName(name);
        obj.setEmail(email);
        obj.setPassword(password);
        
           HttpSession session = request.getSession();
           if (name == null || name.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || password == null || password.trim().isEmpty()) {

            session.setAttribute("message", "Not Registered");
            response.sendRedirect("Register.jsp");
            return;
        }

        int i = Test.save(obj);

     

        if (i == 0) {
            session.setAttribute("message", "Register Successfully");
        } else {
            session.setAttribute("message", "Not Registered");
        }

        response.sendRedirect("Register.jsp");

    }
}
