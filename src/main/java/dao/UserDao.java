package dao;

import entity.User;

import java.util.List;

public interface UserDao {
    void addUser(User user);

    User queryCountByKeywords(User currentUser);

    List<User> showAllUser();

    int deleteUserById(Long id);

    User queryUserById(Long id);

    int updateUser(User currentUser);

    List<User> queryUserByName(String name);

    Long checkUsername(String username);

    int getTotalCount();

    List<User> findUserListForPageBean(int index, int currentCount);

    List<User> findUserListForPageBean(int index, int currentCount, String name);

}
