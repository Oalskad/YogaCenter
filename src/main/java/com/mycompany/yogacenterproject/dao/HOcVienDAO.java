/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.yogacenterproject.dao;

import com.mycompany.yogacenterproject.dto.HocVienDTO;
import com.mycompany.yogacenterproject.util.Constants;
import com.mycompany.yogacenterproject.util.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class HocVienDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null; 

//Read list của toàn bộ học viên

    public List<HocVienDTO> readListHocVien() {
        List<HocVienDTO> listHocVien = new ArrayList<>();
        try {
            String sql = "SELECT * FROM hocVien";
            PreparedStatement stm = DBUtils.getConnection().prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String maHV = rs.getString("maHV");
                String Ho = rs.getString("Ho");
                String Ten = rs.getString("Ten");
                Date dob = rs.getDate("dob");
                String username = rs.getString("username");
                String psw = rs.getString("psw");
                String maLopHoc = rs.getString("maLopHoc");
                String maLoaiTK = rs.getString("maLoaiTK");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String gender = rs.getString("gender");
                HocVienDTO newTrainee = new HocVienDTO(maHV, Ho, Ten, dob, username, phone, psw, maLopHoc, maLoaiTK, email,gender);
                listHocVien.add(newTrainee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listHocVien;
    }

// Tìm kiếm details của 1 người dựa trên id
    public HocVienDTO searchHocVienById(String maHV) {
        try {
            String sql = "SELECT * FROM hocVien where maHV=?";
            PreparedStatement stm = DBUtils.getConnection().prepareStatement(sql);
            stm.setString(1, maHV);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String Ho = rs.getString("Ho");
                String Ten = rs.getString("Ten");
                Date dob = rs.getDate("dob");
                String username = rs.getString("username");
                String psw = rs.getString("psw");
                String maLopHoc = rs.getString("maLopHoc");
                String maLoaiTK = rs.getString("maLoaiTK");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String gender = rs.getString("gender");
                HocVienDTO newTrainee = new HocVienDTO(maHV, Ho, Ten, dob, username, phone, psw, maLopHoc, maLoaiTK, email,gender);
                return newTrainee;
            }
        } catch (SQLException e) {
            Logger.getLogger(HocVienDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

/// Add thêm học viên
    public void addHocVien(HocVienDTO newHocVien) {
        try {
            String sql = "Insert into hocVien(maHV,Ho,Ten,dob,username,psw,maLopHoc,maLoaiTK,email,phone,gender)"
                    + "values (?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement stm = DBUtils.getConnection().prepareStatement(sql);
            stm.setString(1, newHocVien.getMaHV());
            stm.setString(2, newHocVien.getHo());
            stm.setString(3, newHocVien.getTen());
            stm.setDate(4, newHocVien.getDob());
            stm.setString(5, newHocVien.getUsername());
            stm.setString(6, newHocVien.getPsw());
            stm.setString(7, newHocVien.getMaLopHoc());
            stm.setString(8, newHocVien.getMaLoaiTK());
            stm.setString(9, newHocVien.getEmail());
            stm.setString(10, newHocVien.getPhone());
            stm.setString(11, newHocVien.getGender());
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(TrainerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

///Update học viên
    public void updateHocVien(HocVienDTO upTrainee) {
        try {
            String sql = "Update hocVien set Ho=?,Ten=?,dob=?, username=?,psw=? WHERE maHV=?";
            PreparedStatement stmt = DBUtils.getConnection().prepareStatement(sql);
            stmt.setString(1, upTrainee.getHo());
            stmt.setString(2, upTrainee.getTen());
            stmt.setDate(3, upTrainee.getDob());
            stmt.setString(4, upTrainee.getUsername());
            stmt.setString(4, upTrainee.getPsw());
            stmt.setString(5, upTrainee.getMaHV());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HocVienDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    ////Hủy diệt 1 đứa học sinh bằng id
    public void deleteHocVienById(String maHV) {
        try {
            String sql = "DELETE FROM hocVien where maHV =?";
            PreparedStatement stm;
            stm = DBUtils.getConnection().prepareStatement(sql);
            stm.setString(1, maHV);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HocVienDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
//    Login
    public HocVienDTO login(String username, String pass){
        String querry = "SELECT * FROM hocVien\n" +
                "where username = ? and psw = ? ";
        try {
            conn = new DBUtils().getConnection(); // connect DB
            ps = conn.prepareStatement(querry);
            ps.setString(1, username);
            ps.setString(2, pass);
            rs=ps.executeQuery();
            while(rs.next()){
                
//              String maHV, String Ho, String Ten, Date dob, String username, String psw, String maLopHoc, String maLoaiTK, String email, String phone
                return new HocVienDTO(rs.getString("maHV"),rs.getString("Ho"), rs.getString("Ten"), rs.getDate("dob"),rs.getString("username"),rs.getString("phone"),rs.getString("psw"),rs.getString("maLopHoc"),rs.getString("maLoaiTk"),rs.getString("email"),rs.getString("gender"));
                
            }
        } catch (Exception e) {
        }
        return null;
        
    }   
    
    
    
    //GENERATE ID 
     public int lastIDIndex() {
        String sql = "SELECT TOP 1 maHV FROM [hocVien] ORDER BY maHV DESC";
        int index = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                
                int numberOnly = Integer.parseInt(rs.getString("maHV").replaceAll("[^0-9]", ""));
                index = numberOnly;
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return index;
    }
    
     //KIEM TRA USERNAME CUA HOC VIEN DA TON TAI CHUA
     public boolean selectByUserName(String userName) {

        try {

            // Bước 1: tạo kết nối đến CSDL
            Connection con = DBUtils.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "SELECT * FROM [dbo].[hocVien] where username=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, userName);

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            // Bước 4:
            if (rs.next()) {

                return true;
            }

            // Bước 5:
            DBUtils.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }
     
    //KIEM TRA EMAIL DA TON TAI CHUA
     public boolean selectByHocVienEmail(String email) {

        try {

            // Bước 1: tạo kết nối đến CSDL
            Connection con = DBUtils.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "SELECT * FROM [dbo].[hocVien] where email= ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, email);

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            // Bước 4:
            if (rs.next()) {
//               
                return true;
            }

            // Bước 5:
            DBUtils.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }
    
    public static void main(String[] args) {
        
        List<HocVienDTO> listHocVienDTO = new ArrayList<>();
        HocVienDAO hocVienDAO = new HocVienDAO();

        HocVienDTO hocVienDTO = new HocVienDTO();
        System.out.println(hocVienDAO.selectByHocVienEmail("Oalskad1904@gmail.com"));
//        String AUTO_HOCVIEN_ID = String.format(Constants.MA_HOCVIEN_FORMAT, hocVienDAO.lastIDIndex()+1 );
//Date a = Date.valueOf("2003-02-13");
//            hocVienDTO.setUsername("A");
//            hocVienDTO.setTen("Long");
//            hocVienDTO.setPsw("1234");
//            hocVienDTO.setPhone("123");
//            hocVienDTO.setMaLopHoc(null);
//            hocVienDTO.setMaLoaiTK("HOCVIEN");
//            hocVienDTO.setMaHV(AUTO_HOCVIEN_ID);
//            hocVienDTO.setHo("Nguyen");
//            hocVienDTO.setGender("Male");
//            hocVienDTO.setEmail("huylong2");
//            hocVienDTO.setDob(a);
//            hocVienDAO.addHocVien(hocVienDTO);
        
//        System.out.println(AUTO_HOCVIEN_ID);
//        HocVienDTO login = hocVienDAO.login("HV001", "abcd1234");
//        int a = hocVienDAO.lastIDIndex();
//        System.out.println(a);


    }
}
