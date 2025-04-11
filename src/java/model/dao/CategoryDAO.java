/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import model.AccountDTO;
import model.CategoryDTO;
import util.ConnectDB;

/**
 *
 * @author nha36
 */
public class CategoryDAO implements BusinessLogic<CategoryDTO> {

    private Connection con;

    //defaut constructor
    public CategoryDAO() {
        this.con = new ConnectDB().getConnection();
    }

    public CategoryDAO(ServletContext sc) {
        this.con = new ConnectDB(sc).getConnection();
    }

    @Override
    public int add(CategoryDTO o) {
        int result = 0;
        try {

            String sql = "INSERT INTO Categories (categoryName,memo) VALUES (?,?);";
            //xóa typeId
            PreparedStatement cmd = con.prepareStatement(sql);
//            cmd.setInt(1, o.getTypeld());
            cmd.setString(1, o.getCategoryName());
            cmd.setString(2, o.getMemo());

            result = cmd.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    @Override
    public int update(CategoryDTO o) {
        int result = 0;
        try {

            String sql = "UPDATE Categories\n"
                    + "SET categoryName=?,memo=?\n"
                    + "WHERE typeId=?";
            PreparedStatement cmd = con.prepareStatement(sql);

            cmd.setString(1, o.getCategoryName());
            cmd.setString(2, o.getMemo());
            cmd.setInt(3, o.getTypeld());

            result = cmd.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    @Override
    public int delete(CategoryDTO o) {
        int rs = 0;

        try {
            String sql = "DELETE FROM Categories WHERE typeId=?;";
            PreparedStatement cmd = con.prepareStatement(sql);
            cmd.setInt(1, o.getTypeld());
            rs = cmd.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;

    }

    @Override
    public CategoryDTO getById(String id) {
        int id1 = Integer.parseInt(id);
         CategoryDTO x = null;
        for (CategoryDTO i : getAll()) {
            if (i.getTypeld()==id1) {
                return i;
            }
        }
        return x;
    }
    public CategoryDTO getById(int id) {
 
         CategoryDTO x = null;
        for (CategoryDTO i : getAll()) {
            if (i.getTypeld()==id) {
                return i;
            }
        }
        return x;
    }

    @Override
    public List<CategoryDTO> getAll() {
        List<CategoryDTO> list = new ArrayList<>();
        try {

            String sql = "SELECT typeId,categoryName,memo FROM Categories";
            Statement cmd = con.createStatement();
            ResultSet rs = cmd.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt("typeId");
                String name = rs.getString("categoryName");
                String memo = rs.getString("memo");
                CategoryDTO cate = new CategoryDTO(id, name, memo);
                list.add(cate);
                        
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
