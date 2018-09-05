package service;

import dao.UserDao;
import entity.PageBean;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utils.MyBatisUtil;

import java.sql.SQLException;
import java.util.List;

@Service("userService")
public class UserService {
    @Autowired
    UserDao userDao;
    public void addUser(User user) throws SQLException {
        userDao.addUser(user);
    }

    public User queryCountByKeywords(User currentUser) throws SQLException {
        return userDao.queryCountByKeywords(currentUser);
    }

    public List<User> showAllUser() throws SQLException {
        return  userDao.showAllUser();
    }
    public int deleteUserById(Long id) throws SQLException {
        return userDao.deleteUserById(id);
    }

    public User queryUserById(Long id) throws SQLException{
        return userDao.queryUserById(id);
    }
    public int updateUser(User currentUser)throws SQLException{
        return userDao.updateUser(currentUser);
    }

    public List<User> queryUserByName(String name) throws SQLException{
        return userDao.queryUserByName(name);
    }
    public boolean checkUsername(String username) throws SQLException{
        Long isExit=userDao.checkUsername(username);
        return  isExit>0?true:false;
    }
    public PageBean findPageBean(int currentPage,int pageSize) throws SQLException{
        PageBean pageBean=new PageBean();
        pageBean.setCurrentPage(currentPage);
        pageBean.setPageSize(pageSize);
        int totalCount=userDao.getTotalCount();
        int totalPage=(int)Math.ceil(1.0*totalCount/pageSize);
        pageBean.setTotalPage(totalPage);
        pageBean.setTotalCount(totalCount);
        int index=(currentPage-1)*pageSize;
        List<User> userList=userDao.findUserListForPageBean(index,pageSize);
        pageBean.setPageList(userList);
        return  pageBean;
    }

    public PageBean findPageBean(int currentPage,int currentCount,String name) throws SQLException{
        PageBean pageBean=new PageBean();
        pageBean.setCurrentPage(currentPage);
        pageBean.setPageSize(currentCount);
        int totalCount=userDao.queryUserByName(name).size();
        int totalPage=(int)Math.ceil(1.0*totalCount/currentCount);
        pageBean.setTotalPage(totalPage);
        pageBean.setTotalCount(totalCount);
        int index=(currentPage-1)*currentCount;
        List<User> userList=userDao.findUserListForPageBean(index,currentCount,name);
        pageBean.setPageList(userList);
        return  pageBean;
    }

}
