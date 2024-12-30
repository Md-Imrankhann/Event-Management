package model;
//POJO class or java bean class
public class User {

    private String id;
    private String name;
    private String phoneNumber;
    private String email;
    private String date;

    // Getter and Setter for ID
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    // Getter and Setter for Name
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // Getter and Setter for Phone Number
    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    // Getter and Setter for Email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Getter and Setter for Date
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}

