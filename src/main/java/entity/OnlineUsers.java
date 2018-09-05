package entity;

import java.util.ArrayList;
import java.util.List;

public class OnlineUsers {
    private List<String> users=new ArrayList<>();
    private static OnlineUsers instance=new OnlineUsers();

    private OnlineUsers(){};

    public static OnlineUsers getInstance(){
        return instance;
    }

    public void add(String name){
        users.add(name);
    }

    public void remove(String name){
        users.remove(name);
    }

    public int getCount(){
        return users.size();
    }

    public List<String> getOnlineUsers(){
        return users;
    }
}
