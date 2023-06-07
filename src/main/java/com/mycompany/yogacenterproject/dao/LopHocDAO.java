/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.yogacenterproject.dao;

import com.mycompany.yogacenterproject.dto.LopHocDTO;
import com.mycompany.yogacenterproject.dto.HocVienDTO;
import com.mycompany.yogacenterproject.util.DBUtils;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LopHocDAO {

///Hiện danh sách lớp
    public List<LopHocDTO> readListClass() {
        List<LopHocDTO> listClass = new ArrayList<>();
        try {
            String sql = "SELECT * FROM lopHoc";
            PreparedStatement stm = DBUtils.getConnection().prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String maLopHoc = rs.getString("maLopHoc");
                int soLuongHV = rs.getInt("soLuongHV");
                int soBuoi = rs.getInt("soBuoi");
                String maTrainer = rs.getString("maTrainer");
                String maLoaiLopHoc = rs.getString("maLoaiLopHoc");
                String maSlot = rs.getString("maSlot");
                String maRoom = rs.getString("maRoom");
                Date ngay = rs.getDate("ngay");
                LopHocDTO displayClass = new LopHocDTO(maLopHoc, soLuongHV, soBuoi, maTrainer, maLoaiLopHoc, maSlot, maRoom, ngay);
                listClass.add(displayClass);
            }
            return listClass;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

////Search class by id
    public LopHocDTO searchClassById(String maLopHoc) {
        try {
            String sql = "SELECT * FROM lopHoc where maLopHoc=?";
            PreparedStatement stm = DBUtils.getConnection().prepareStatement(sql);
            stm.setString(1, maLopHoc);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int soLuongHV = rs.getInt("soLuongHV");
                int soBuoi = rs.getInt("soBuoi");
                String maTrainer = rs.getString("maTrainer");
                String maLoaiLopHoc = rs.getString("maLoaiLopHoc");
                String maSlot = rs.getString("maSlot");
                String maRoom = rs.getString("maRoom");
                Date ngay = rs.getDate("ngay");
                LopHocDTO foundClass = new LopHocDTO(maLopHoc, soLuongHV, soBuoi, maTrainer, maLoaiLopHoc, maSlot, maRoom, ngay);
                return foundClass;
            }
        } catch (SQLException e) {
            Logger.getLogger(LopHocDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

//////Insert a class
    public void addClass(LopHocDTO newClass) {
        try {
            String sql = "insert into lopHoc(maLopHoc,soLuongHV,soBuoi,maTrainer,maLoaiLopHoc,maSlot,maRoom,ngay)"
                    + "values(?,?,?,?,?,?,?,?)";
            PreparedStatement stm = DBUtils.getConnection().prepareStatement(sql);
            stm.setString(1, newClass.getMaLopHoc());
            stm.setInt(2, newClass.getSoLuongHV());
            stm.setInt(3, newClass.getSoBuoi());
            stm.setString(4, newClass.getMaTrainer());
            stm.setString(5, newClass.getMaLoaiLopHoc());
            stm.setString(6, newClass.getMaSlot());
            stm.setString(7, newClass.getMaRoom());
            stm.setDate(8, newClass.getNgay());
        } catch (SQLException e) {
            Logger.getLogger(LopHocDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

//TAO LOP HOC DUA TREN SLOT VA CHECK XEM SLOT DO PHONG CO TRONG KHONG
    public void addClassBasedOnRoom(LopHocDTO newClass) {
        try {
            String sql = "insert into lopHoc(maLopHoc,soLuongHV,soBuoi,maTrainer,maLoaiLopHoc,maSlot,maRoom,ngay)"
                    + "values(?,?,?,?,?,?,?,?)";
            PreparedStatement stm = DBUtils.getConnection().prepareStatement(sql);
            stm.setString(1, newClass.getMaLopHoc());
            stm.setInt(2, newClass.getSoLuongHV());
            stm.setInt(3, newClass.getSoBuoi());
            stm.setString(4, newClass.getMaTrainer());
            stm.setString(5, newClass.getMaLoaiLopHoc());
            stm.setString(6, newClass.getMaSlot());
            stm.setString(7, newClass.getMaRoom());
            stm.setDate(8, newClass.getNgay());
        } catch (SQLException e) {
            Logger.getLogger(LopHocDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

/////Update Class (1 lớp có thể thay đổi giáo viên và mã phòng nhưng không thể thay đổi ngày, số buổi, loại lớp học)
    public void updateClass(LopHocDTO upClass) {
        try {
            String sql = "UPDATE lopHoc set soLuongHV=?,maTrainer=?,maSlot=?,maRoom=?"
                    + "where maLopHoc=?";
            PreparedStatement stm = DBUtils.getConnection().prepareStatement(sql);
            stm.setInt(1, upClass.getSoLuongHV());
            stm.setString(2, upClass.getMaTrainer());
            stm.setString(3, upClass.getMaSlot());
            stm.setString(4, upClass.getMaRoom());
            stm.setString(5, upClass.getMaLopHoc());
        } catch (SQLException e) {
            Logger.getLogger(LopHocDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

///Delete Class by id
    public void deleteClassById(String maLopHoc) {
        try {
            String sql = "DELETE FROM lopHoc where maLopHoc =?";
            PreparedStatement stm;
            stm = DBUtils.getConnection().prepareStatement(sql);
            stm.setString(1, maLopHoc);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LopHocDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
//LAY ID LOAI LOP HOC 
    public String IDLoaiLopHoc(String maLopHoc) {
        try {
            String sql = "SELECT maLoaiLopHoc from [dbo].[lopHoc] where maLopHoc = ?";
            PreparedStatement stm;
            stm = DBUtils.getConnection().prepareStatement(sql);
            stm.setString(1, maLopHoc);
            ResultSet rs; 
            rs = stm.executeQuery();
            if(rs.next()){
                return rs.getString("maLoaiLopHoc");
            }
        } catch (SQLException ex) {
            Logger.getLogger(LopHocDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
        
    }
    
//LAY LOAI LOP BEN BAN LOAILOPHOC
    public String tenLopHoc(String maLoaiLopHoc) {
        try {
            String sql = "SELECT tenLoaiLopHoc from [dbo].[loaiLopHoc] where maLoaiLopHoc = ?";
            PreparedStatement stm;
            stm = DBUtils.getConnection().prepareStatement(sql);
            stm.setString(1, maLoaiLopHoc);
            ResultSet rs; 
            rs = stm.executeQuery();
            if(rs.next()){
                return rs.getString("tenLoaiLopHoc");
            }
        } catch (SQLException ex) {
            Logger.getLogger(LopHocDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
        
    }
    
    public static void main(String[] args) {
        LopHocDAO a = new LopHocDAO();
        
        System.out.println(a.tenLopHoc(a.IDLoaiLopHoc("LOP0001")));
    }

}
