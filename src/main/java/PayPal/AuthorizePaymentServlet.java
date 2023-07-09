/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package PayPal;

import com.mycompany.yogacenterproject.dao.HocVienDAO;
import com.mycompany.yogacenterproject.dao.LopHocDAO;
import com.mycompany.yogacenterproject.dto.HoaDonDTO;
import com.mycompany.yogacenterproject.dto.HocVienDTO;
import com.mycompany.yogacenterproject.dto.LopHocDTO;
import com.paypal.base.rest.PayPalRESTException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author iba
 */
@WebServlet(name = "AuthorizePaymentServlet", urlPatterns = {"/AuthorizePaymentServlet"})
public class AuthorizePaymentServlet extends HttpServlet {

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
            throws ServletException, IOException, PayPalRESTException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        try {
            PrintWriter out = response.getWriter();
            if (action.equals("Authorize")) {
                authorizePayment(request, response);
            }
        } catch (IOException e) {

        }

    }

    public void authorizePayment(HttpServletRequest request, HttpServletResponse response) throws PayPalRESTException, IOException {
        LopHocDTO lopHocDTO = new LopHocDTO();
        HocVienDTO hocVienDTO = new HocVienDTO();
        LopHocDAO lopHocDAO = new LopHocDAO();
        HocVienDAO hocVienDAO = new HocVienDAO();
        lopHocDTO = lopHocDAO.searchClassById("LOP0001");
        hocVienDTO = hocVienDAO.searchHocVienById("HV0001");

        PaymentServices paymentServices = new PaymentServices();
        String approvalLink = paymentServices.createPayment(lopHocDTO, hocVienDTO);
        response.sendRedirect(approvalLink);
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (PayPalRESTException ex) {
            Logger.getLogger(AuthorizePaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (PayPalRESTException ex) {
            Logger.getLogger(AuthorizePaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
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
