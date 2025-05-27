package model;

/**
 *
 * @author Sekiro
 */
public class Customer extends Account {

    private String firstName;
    private String lastName;

    // Constructor
    public Customer(int id, String email, String phoneNumber, String password, String role, int status, String firstName, String lastName) {
        // Call to superclass constructor with account details
        super(id, email, phoneNumber, password, role, status);  
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

    // Override toString method for easy display of Customer data
    @Override
    public String toString() {
        return "Customer{" +
                "id=" + getId() +  // Inherited from Account
                ", email='" + getEmail() + '\'' +
                ", phoneNumber='" + getPhoneNumber() + '\'' +
                ", password='" + getPassword() + '\'' +
                ", role='" + getRole() + '\'' +
                ", status=" + getStatus() +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                '}';
    }
}
