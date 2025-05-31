
package model;

public abstract class Account {
    protected String email;
    protected String phoneNumber;
    protected String password;
    protected String role;
    protected int status;

    public Account() {
    }
    // Constructor
    public Account(String email, String phoneNumber, String password, String role, int status) {
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.role = role;
        this.status = status;
    }

    // Getters and Setters
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}

