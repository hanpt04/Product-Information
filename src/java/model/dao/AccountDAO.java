/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AccountDTO;
import util.ConnectDB;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletContext;

/**
 *
 * @author nha36
 */
public class AccountDAO implements BusinessLogic<AccountDTO> {

    private Connection con;

    //defaut constructor
    public AccountDAO() {
        this.con = new ConnectDB().getConnection();
    }

    public AccountDAO(ServletContext sc) {
        this.con = new ConnectDB(sc).getConnection();
    }

    @Override
    public int add(AccountDTO o) {
        int result = 0;
        try {

            String sql = "INSERT INTO accounts (account,pass,lastName,firstName,birthday,gender,phone,isUse,roleInSystem) VALUES (?,?,?,?,?,?,?,?,?);";
            PreparedStatement cmd = con.prepareStatement(sql);
            cmd.setString(1, o.getAccount());
            cmd.setString(2, o.getPass());
            cmd.setString(3, o.getLastName());
            cmd.setString(4, o.getFirstName());
            cmd.setDate(5, o.getBirthday());
            cmd.setBoolean(6, o.isGender());
            cmd.setString(7, o.getPhone());
            cmd.setBoolean(8, o.isIsUse());
            cmd.setInt(9, o.getRoleInSystem());
            result = cmd.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    @Override
    public int update(AccountDTO o) {
        int result = 0;

        try {
            String sql = "UPDATE accounts SET pass=?,lastName=?, firstName=?,birthday=?,gender=?,phone=?,isUse=?,roleInSystem=? WHERE account=?;";
            PreparedStatement cmd = con.prepareStatement(sql);

            cmd.setString(1, o.getPass());
            cmd.setString(2, o.getLastName());
            cmd.setString(3, o.getFirstName());
            cmd.setDate(4, o.getBirthday());
            cmd.setBoolean(5, o.isGender());
            cmd.setString(6, o.getPhone());
            cmd.setBoolean(7, o.isIsUse());
            cmd.setInt(8, o.getRoleInSystem());
            cmd.setString(9, o.getAccount());
            result = cmd.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;

    }

    @Override
    public int delete(AccountDTO o) {
        int rs = 0;

        try {
            String sql = "DELETE FROM accounts WHERE account=?;";
            PreparedStatement cmd = con.prepareStatement(sql);
            cmd.setString(1, o.getAccount());
            rs = cmd.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;

    }

    @Override
    public AccountDTO getById(String id) {
        AccountDTO x = null;
        for (AccountDTO i : getAll()) {
            if (i.getAccount().equalsIgnoreCase(id)) {
                return i;
            }
        }
        return x;
    }

    @Override
    public List<AccountDTO> getAll() {
        List<AccountDTO> list = new ArrayList<>();
        try {

            Connection con = new ConnectDB().getConnection();
            String sql = "SELECT account,pass,lastName,firstName,birthday,gender,phone,isUse,roleInSystem FROM accounts";
            Statement cmd = con.createStatement();
            ResultSet rs = cmd.executeQuery(sql);
            while (rs.next()) {
                String account = rs.getString("account");
                String pass = rs.getString("pass");
                String lastName = rs.getString("lastName");
                String firstName = rs.getString("firstName");
                Date birthday = rs.getDate("birthday");
                Boolean gender = rs.getBoolean("gender");
                String phone = rs.getString("phone");
                Boolean isUse = rs.getBoolean("isUse");
                int roleInsytem = rs.getInt("roleInSystem");
                AccountDTO accountDTO = new AccountDTO(account, pass, lastName, firstName, birthday, gender, phone, isUse, roleInsytem);
                list.add(accountDTO);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
