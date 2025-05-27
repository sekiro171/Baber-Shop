package model;

public class Account {
    private int accountId;
    private String email;
    private String phoneNumber;
    private String password;
    private String role;
    private int status; // Change to int to match SQL type

    // Constructor
    public Account(int accountId, String email, String phoneNumber, String password, String role, int status) {
        this.accountId = accountId;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.role = role;
        this.status = status;
    }

    // Getters and Setters
    public int getId() {
        return accountId;
    }

    public void setId(int id) {
        this.accountId = accountId;
    }

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
