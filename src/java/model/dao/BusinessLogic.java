/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.List;

/**
 *
 * @author nha36
 */
public interface BusinessLogic <T> {
    int add(T o);
    int update(T o);
    int delete(T o);
    T getById(String id);
    List<T> getAll();
}
