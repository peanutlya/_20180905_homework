package entity;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

@WebListener()
public class User implements HttpSessionBindingListener{
    private OnlineUsers onlineUsers=OnlineUsers.getInstance();

    private Integer id;
    private String username;
    private String password;
    private Integer age;
    private String address;

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    @Override
    public String toString() {
        return username +
                "," + password +
                "," + age +
                "," + address ;
    }

    public User(String username, String password, Integer age, String address) {
        this.username = username;
        this.password = password;
        this.age = age;
        this.address = address;
    }

    public User() {

    }

    public Integer getId() {

        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public void valueBound(HttpSessionBindingEvent httpSessionBindingEvent) {
        onlineUsers.add(username);
    }

    @Override
    public void valueUnbound(HttpSessionBindingEvent httpSessionBindingEvent) {
        onlineUsers.remove(username);
    }
}
