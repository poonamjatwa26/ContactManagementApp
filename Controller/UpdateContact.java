package Controller;

import Factory.Test1;
import Model.Contact;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/UpdateContact")
@MultipartConfig
public class UpdateContact extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String oldphoto = request.getParameter("oldphoto");
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

            String fileName = part.getSubmittedFileName();

            if (fileName == null || fileName.trim().isEmpty()) {
                fileName = oldphoto;
            } else {
                String uploadPath = "C:/Users/poona/OneDrive/Documents/NetBeansProjects/ContactManagementApp/web/images/" + fileName;

                FileOutputStream fos = new FileOutputStream(uploadPath);
                InputStream is = part.getInputStream();

                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
                fos.close();
            }

            Contact obj = new Contact();
            obj.setId(id);
            obj.setPhoto(fileName);
            obj.setFirstName(firstName);
            obj.setLastName(lastName);
            obj.setPhone(phone);
            obj.setPhoneType(phoneType);
            obj.setEmail(email);
            obj.setCompany(company);
            obj.setDate(date);
            obj.setDateType(dateType);
            obj.setGrouping(grouping);

            int i = Test1.update(obj);

            if (i == 0) {

                out.println("<html><head><style>");
                out.println("body{"
                        + "background:linear-gradient(135deg,#E8F5E9,#C8E6C9);"
                        + "font-family:Arial;text-align:center;padding-top:120px;}");
                out.println(".card{"
                        + "background:white;"
                        + "width:400px;"
                        + "margin:auto;"
                        + "padding:30px;"
                        + "border-radius:15px;"
                        + "box-shadow:0 5px 15px #999;}");
                out.println("h2{color:#198754;}");
                out.println("a{"
                        + "background:#198754;"
                        + "color:white;"
                        + "padding:10px 20px;"
                        + "text-decoration:none;"
                        + "border-radius:6px;}");
                out.println("</style></head><body>");
                out.println("<div class='card'>");
                out.println("<h2>Contact Updated Successfully!</h2>");
                out.println("<p>Your contact has been updated successfully.</p>");
                out.println("<a href='ViewContact.jsp'>View Contacts</a>");
                out.println("</div>");
                out.println("</body></html>");
            } else {
                out.println("<html><head><style>");
                out.println("body{"
                        + "background:linear-gradient(135deg,#E8F5E9,#C8E6C9);"
                        + "font-family:Arial;text-align:center;padding-top:120px;}");
                out.println(".card{"
                        + "background:white;"
                        + "width:400px;"
                        + "margin:auto;"
                        + "padding:30px;"
                        + "border-radius:15px;"
                        + "box-shadow:0 5px 15px #999;}");
                out.println("h2{color:#198754;}");
                out.println("a{"
                        + "background:#198754;"
                        + "color:white;"
                        + "padding:10px 20px;"
                        + "text-decoration:none;"
                        + "border-radius:6px;}");
                out.println("</style></head><body>");
                out.println("<div class='card'>");
                out.println("<h2 style='color:red;text-align:center;'>Contact Not Updated!</h2>");
                out.println("<p>Your contact Not Updated</p>");
                out.println("<a href='ViewContact.jsp'>View Contacts</a>");
                out.println("</div>");
                out.println("</body></html>");
            }
        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}
