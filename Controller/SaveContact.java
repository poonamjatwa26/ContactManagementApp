/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Factory.Test1;
import Model.Contact;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class SaveContact extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Contact obj = new Contact();
        try {
            Part part = request.getPart("photo");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String phone = request.getParameter("phone");
            String phoneType = request.getParameter("phoneType");
            String email = request.getParameter("email");
            String company = request.getParameter("company");
            String date = request.getParameter("date");
            String dateType = request.getParameter("dateType");
            String grouping = request.getParameter("grouping");

            HttpSession session = request.getSession();

if (firstName == null || firstName.trim().isEmpty()
        || lastName == null || lastName.trim().isEmpty()
        || phone == null || phone.trim().isEmpty()
        || phoneType == null || phoneType.trim().isEmpty()
        || email == null || email.trim().isEmpty()
        || company == null || company.trim().isEmpty()
        || date == null || date.trim().isEmpty()
        || dateType == null || dateType.trim().isEmpty()
        || grouping == null || grouping.trim().isEmpty()
        || part == null || part.getSubmittedFileName().trim().isEmpty()) {

    session.setAttribute("message", "Contact Not Added");
    response.sendRedirect("AddContact.jsp");
    return;
}
            obj.setPhoto(part.getSubmittedFileName());
            obj.setFirstName(firstName);
            obj.setLastName(lastName);
            obj.setPhone(phone);
            obj.setPhoneType(phoneType);
            obj.setEmail(email);
            obj.setCompany(company);
            obj.setDate(date);
            obj.setDateType(dateType);
            obj.setGrouping(grouping);

            String uploadPath = "C:/Users/poona/OneDrive/Documents/NetBeansProjects/ContactManagementApp/web/images/" + part.getSubmittedFileName();

            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = part.getInputStream();
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        int i = Test1.save(obj);

        HttpSession session = request.getSession();

        if (i == 0) {
            session.setAttribute("message", "Contact Added Successfully");
        } else {
            session.setAttribute("message", "Contact Not Added");
        }

        response.sendRedirect("AddContact.jsp");

    }

}
