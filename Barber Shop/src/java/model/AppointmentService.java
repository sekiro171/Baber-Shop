/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Sekiro
 */
public class AppointmentService {
    private int appointmentId;
    private int serviceId;
    private int quantity;

    private Appointment appointment;
    private Service service;

    // Constructor không tham số
    public AppointmentService() { }

    // Constructor có tham số
    public AppointmentService(int appointmentId, int serviceId, int quantity) {
        this.appointmentId = appointmentId;
        this.serviceId = serviceId;
        this.quantity = quantity;
    }

    // Getters and Setters
    public int getAppointmentId() { return appointmentId; }
    public void setAppointmentId(int appointmentId) { this.appointmentId = appointmentId; }

    public int getServiceId() { return serviceId; }
    public void setServiceId(int serviceId) { this.serviceId = serviceId; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
}
