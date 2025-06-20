
package model;

public class Staff extends Account{
    private int id;
    private int accountId;
    private String firstName;
    private String lastName;
    private String img;

    // Constructor

    public Staff(int accountId, String firstName, String lastName, String img, String email, String phoneNumber, String password, String role, String status) {
        super(email, phoneNumber, password, role, status);
        this.accountId = accountId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.img = img;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
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

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
