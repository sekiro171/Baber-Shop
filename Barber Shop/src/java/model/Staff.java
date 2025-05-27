package model;

public class Staff extends Account {
    private String firstName;
    private String lastName;
    private String img;

    // Constructor
    public Staff(int id, String email, String phoneNumber, String password, String role, int status, String firstName, String lastName, String img) {
        // Call to superclass constructor with account details
        super(id, email, phoneNumber, password, role, status); 
        this.firstName = firstName;
        this.lastName = lastName;
        this.img = img;
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

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Staff{" +
                "id=" + getId() +  // Use inherited getId() method from Account class
                ", email='" + getEmail() + '\'' +
                ", phoneNumber='" + getPhoneNumber() + '\'' +
                ", role='" + getRole() + '\'' +
                ", status=" + getStatus() +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", img='" + img + '\'' +
                '}';
    }
}
