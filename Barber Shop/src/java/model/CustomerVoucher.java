
package model;

import java.util.Date;

public class CustomerVoucher {
    private int customerId;
    private int voucherId;
    private Date receivedDate;

    // Constructor không tham số
    public CustomerVoucher() { }

    // Constructor có tham số
    public CustomerVoucher(int customerId, int voucherId, Date receivedDate) {
        this.customerId = customerId;
        this.voucherId = voucherId;
        this.receivedDate = receivedDate;
    }

    // Getters and Setters
    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }

    public int getVoucherId() { return voucherId; }
    public void setVoucherId(int voucherId) { this.voucherId = voucherId; }

    public Date getReceivedDate() { return receivedDate; }
    public void setReceivedDate(Date receivedDate) { this.receivedDate = receivedDate; }
}
