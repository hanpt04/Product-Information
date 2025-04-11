/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author nha36
 */
public class CategoryDTO {
    private int typeld;
    private String categoryName;
    private String memo;

    public CategoryDTO() {
    }

    public CategoryDTO(int typeld, String categoryName, String memo) {
        this.typeld = typeld;
        this.categoryName = categoryName;
        this.memo = memo;
    }

    public int getTypeld() {
        return typeld;
    }

    public void setTypeld(int typeld) {
        this.typeld = typeld;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }
    
    
}
