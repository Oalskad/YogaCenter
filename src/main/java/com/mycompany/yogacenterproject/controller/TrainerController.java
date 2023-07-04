/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.yogacenterproject.controller;

import com.mycompany.yogacenterproject.dao.HocVienDAO;
import com.mycompany.yogacenterproject.dao.TrainerDAO;
import com.mycompany.yogacenterproject.dto.HocVienDTO;
import com.mycompany.yogacenterproject.dto.TrainerDTO;
import com.mycompany.yogacenterproject.util.Constants;
import com.mycompany.yogacenterproject.util.DateUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Oalskad
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class TrainerController extends HttpServlet {

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
        String action = request.getParameter("action");

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if (action.equals("addTrainer")) {
                addTrainer(request, response);
            } else if (action.equals("UpdateStatus")) {
                updateStatus(request, response);
            }
        }
    }

    public void updateStatus(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String maTrainer = request.getParameter("maTrainer");
        TrainerDAO trainerDAO = new TrainerDAO();
        trainerDAO.updateTrainerStatus(maTrainer, false);
        response.sendRedirect("AdminController?action=listTrainer&page=1");

    }

    public void addTrainer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        TrainerDAO trainerDAO = new TrainerDAO();
        String errorMessage = "";
        String errorMessageDate = "";
        boolean error = true;
        //DATE USING SQL.DATE
        Date dateOfBirth = null;

        //AUTO GENERATE HOCVIEN ID WITH PATTERN
        String AUTO_TRAINER_ID = String.format(Constants.MA_TRAINER_FORMAT, (trainerDAO.lastIDIndex() + 1));

        //HOCVIEN CONSTRUCTOR
        String maTrainer = AUTO_TRAINER_ID;
        String username = request.getParameter("username");
        String psw = request.getParameter("psw");
        String ho = request.getParameter("Ho");
        String ten = request.getParameter("Ten");
        long salary = Long.parseLong(request.getParameter("Salary"));
        try {
            dateOfBirth = Date.valueOf(request.getParameter("dateOfBirth"));
        } catch (Exception e) {
            errorMessageDate = "invalid Date";
            error = false;
        }
        String phone = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String maloaiYoga = request.getParameter("loaiLopHoc");

        if (trainerDAO.selectByUserName(username)) {
            errorMessage += "Username has already taken";
            error = false;
        }
        request.setAttribute("errorMessage", errorMessage);
        request.setAttribute("errorMessageDate", errorMessageDate);

        if (error == true) {
            TrainerDTO trainerDTO = new TrainerDTO();
            trainerDTO.setMaTrainer(maTrainer);
            trainerDTO.setUsername(username);
            trainerDTO.setTrainerType(maloaiYoga);
            trainerDTO.setMaLoaiTK("TRAINER");
            trainerDTO.setPhone(phone);
            trainerDTO.setEmail(email);
            trainerDTO.setHo(ho);
            trainerDTO.setTen(ten);
            trainerDTO.setStatus(false);
            trainerDTO.setSoNgayNghi(0);
            trainerDTO.setSalary(salary);
            trainerDTO.setPsw(psw);
            LocalDate dob = DateUtils.asLocalDate(dateOfBirth);
            trainerDTO.setDob(dob);
            trainerDTO.setGender(gender);

            trainerDAO.addTrainer(trainerDTO);
            RequestDispatcher rd = request.getRequestDispatcher("/Public/signin.jsp");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("/Public/signup.jsp");
            rd.forward(request, response);
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
