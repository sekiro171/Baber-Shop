
package model;

public class Service {
    private int id;
    private String name;
    private float price;
    private int duration;
    private String description;
    private String image;

    // Constructor không tham số
    public Service() { }

    // Constructor có tham số
    public Service(String name, float price, int duration, String description, String image) {
        this.name = name;
        this.price = price;
        this.duration = duration;
        this.description = description;
        this.image = image;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public float getPrice() { return price; }
    public void setPrice(float price) { this.price = price; }

    public int getDuration() { return duration; }
    public void setDuration(int duration) { this.duration = duration; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }
}
