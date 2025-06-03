package model;

public class Customer {
    private int id;
    private int accountId;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private int status;

    // ✅ Constructor đầy đủ dùng cho getAll, checkCustomer,...

    public Customer(int id, int accountId, String firstName, String lastName, String email, String phoneNumber, int status) {
        this.id = id;
        this.accountId = accountId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.status = status;
    }
    

    // ✅ Constructor ngắn gọn nếu chỉ lấy thông tin cơ bản
    public Customer(int id, int accountId, String firstName, String lastName) {
        this.id = id;
        this.accountId = accountId;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    // ✅ Getters & Setters
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }



    // ✅ Debug tiện lợi
    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", accountId=" + accountId +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
