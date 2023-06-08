/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.yogacenterproject.controller;

import com.mycompany.yogacenterproject.dao.HoaDonDAO;
import com.mycompany.yogacenterproject.dto.HoaDonDTO;
import com.mycompany.yogacenterproject.dto.HocVienDTO;
import com.mycompany.yogacenterproject.util.Constants;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Oalskad
 */
public class ClassController extends HttpServlet {

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

        }
    }

    //DANG KY LOP 
    public void dangKyLopHoc(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        HocVienDTO hocVienDTO = (HocVienDTO) session.getAttribute("user");
        String maLopHoc = request.getParameter("maLopHoc");
        Date ngayThanhToan = null;
        ngayThanhToan = Date.valueOf(request.getParameter("ngayThanhToan"));
        long giaTien = Long.parseLong(request.getParameter("giaTien"));

        HoaDonDAO hoaDonDAO = new HoaDonDAO();
        String AUTO_HOADON_ID = String.format(Constants.MA_HOADON_FORMAT, (hoaDonDAO.lastIDIndex()) + 1);
        String maHoaDon = AUTO_HOADON_ID;

        HoaDonDTO hoaDonDTO = new HoaDonDTO();
        hoaDonDTO.setMahoaDon(maHoaDon);
        hoaDonDTO.setMaHV(hocVienDTO.getMaHV());
        hoaDonDTO.setMaLopHoc(maLopHoc);
        hoaDonDTO.setGiaTien(giaTien);
        hoaDonDTO.setNgayThanhToan(ngayThanhToan);
        try {
            hoaDonDAO.createHoaDonDTO(hoaDonDTO);
        } catch (SQLException e) {
        }

    }
    
    //Tao ScheduleHv
    //!!!SAU KHI TAO HOA DON XONG SE TAO SCHEDULEHv
    public void createScheduleHv(HttpServletRequest request, HttpServletResponse response){
        
        
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
        processRequest(request, response);
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
        processRequest(request, response);
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
