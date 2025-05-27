package model;

public class Admin extends Account {

    private String firstName;
    private String lastName;

    // Constructor
    public Admin(int accountId, String email, String phoneNumber, String password, String role, int status, String firstName, String lastName) {
        // Call to superclass constructor with accountId, email, phoneNumber, password, role, and status
        super(accountId, email, phoneNumber, password, role, status);  
        this.firstName = firstName;
        this.lastName = lastName;
    }

    // Getters and Setters
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
