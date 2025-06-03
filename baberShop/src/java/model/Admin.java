/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Sekiro
 */
public class Admin extends Account {
    private int id;
    private String firstName;
    private String lastName;

    public Admin(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }
    public Admin(String firstName, String lastName, String email, String phoneNumber) {
        super(email, phoneNumber);
        this.firstName = firstName;
        this.lastName = lastName;
    }
    public Admin(String firstName, String lastName, String email, String phoneNumber, String password) {
        super(email, phoneNumber, password);
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
}
