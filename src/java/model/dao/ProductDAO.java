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
import model.ProductDTO;
import util.ConnectDB;

/**
 *
 * @author nha36
 */
public class ProductDAO implements BusinessLogic<ProductDTO> {

    private Connection con;

    public ProductDAO() {
        this.con = new ConnectDB().getConnection();
    }

    public ProductDAO(ServletContext sc) {
        this.con = new ConnectDB(sc).getConnection();
    }

    @Override
    public int add(ProductDTO o) {
        int rs = 0;
        try {
            String sql = "INSERT INTO products (productId,productName,productImage,brief,postedDate,typeId,account,unit,price,discount) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?);";
            PreparedStatement cmd = con.prepareStatement(sql);
            cmd.setString(1, o.getProductId());
            cmd.setString(2, o.getProductName());
            cmd.setString(3, o.getProductImage());
            cmd.setString(4, o.getBrief());
            cmd.setDate(5, o.getPostedDate());
            cmd.setInt(6, o.getType().getTypeld());
            cmd.setString(7, o.getAccount().getAccount());
            cmd.setString(8, o.getUnit());
            cmd.setInt(9, o.getPrice());
            cmd.setInt(10, o.getDiscount());
            rs = cmd.executeUpdate();
            if(rs>0){
                System.out.println("SUCCESS!!!!");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    @Override
    public int update(ProductDTO o) {
        int rs = 0;
        try {
            String sql = "UPDATE products\n "
                    + "SET productName=?,productImage=?,brief=?,postedDate=?,typeId=?,account=?,unit=?,price=?,discount=? \n"
                    + "WHERE productId=?\n ;";
            PreparedStatement cmd = con.prepareStatement(sql);

            cmd.setString(1, o.getProductName());
            cmd.setString(2, o.getProductImage());
            cmd.setString(3, o.getBrief());
            cmd.setDate(4, o.getPostedDate());
            cmd.setInt(5, o.getType().getTypeld());
            cmd.setString(6, o.getAccount().getAccount());
            cmd.setString(7, o.getUnit());
            cmd.setInt(8, o.getPrice());
            cmd.setInt(9, o.getDiscount());
            cmd.setString(10, o.getProductId());
            rs = cmd.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    @Override
    public int delete(ProductDTO o) {
        int rs = 0;

        try {
            String sql = "DELETE FROM products WHERE productId=?;";
            PreparedStatement cmd = con.prepareStatement(sql);
            cmd.setString(1, o.getProductId());
            rs = cmd.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    @Override
    public ProductDTO getById(String id) {
            ProductDTO pro = null;
            for (ProductDTO i : getAll()) {
            if(i.getProductId().equalsIgnoreCase(id)){
                return i;
            }
        }
            return pro;
            
    }

    @Override
    public List<ProductDTO> getAll() {
        List<ProductDTO> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM products";
            Statement cmd = con.createStatement();
            ResultSet rs = cmd.executeQuery(sql);
            while (rs.next()) {
                String id = rs.getString("productId");
                String name = rs.getString("productName");
                String img = rs.getString("productImage");
                String brief = rs.getString("brief");
                Date postDate = rs.getDate("postedDate");
                String typeId = rs.getString("typeId");
                CategoryDAO dao = new CategoryDAO();
                CategoryDTO type = dao.getById(typeId);
                String account = rs.getString("account");
                AccountDAO aDao = new AccountDAO();
                AccountDTO accountDTO = aDao.getById(account);
                String unit = rs.getString("unit");
                int price = rs.getInt("price");
                int discount = rs.getInt("discount");
                
                ProductDTO product = new ProductDTO(id, name, img, brief,
                        postDate, type, accountDTO, unit, price, discount);
                list.add(product);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

}
