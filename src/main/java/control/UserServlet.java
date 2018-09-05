package control;

import entity.OnlineUsers;
import entity.PageBean;
import entity.Student;
import entity.User;
import org.apache.commons.beanutils.BeanUtils;
import service.UserService;
import utils.ContextUtils;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "UserServlet",urlPatterns = "/UserServlet")
public class UserServlet extends HttpServlet {
    private UserService userService;
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        this.userService = ContextUtils.getBean(UserService.class);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String op = request.getParameter("op");
        if (("register".equals(op))) {
            doRegister(request, response);
        } else if (("delete".equals(op))) {
            doDeleteUser(request,response);
        } else if (("update".equals(op))) {
            doUpdate(request,response);
        } else if (("showAllUser".equals(op))) {
            doShowAllUser(request,response);
        }else if (("edit".equals(op))) {
            doEdit(request, response);
        }else if (("exit".equals(op))) {
            doExit(request, response);
        }else if (("getOnlineUsers".equals(op))) {
            doGetOnlineUsers(request,response);
        }else if (("queryUser".equals(op))) {
            try {
                doQueryUser(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if (("addUser".equals(op))) {
            try {
                doAddUser(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if("showUsersByPage".equals(op)){
            doShowUsersByPage(request,response);
        }

    }

    private void doShowUsersByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentPageStr = request.getParameter("currentPage");
        String name=request.getParameter("name");
        if(currentPageStr==null){
            currentPageStr="1";
        }
        PageBean<Student> pageBean=null;
        int currentPage=Integer.parseInt(currentPageStr);
        int currentCount=5;
        try{
            if(name==null||name.equals("")){
                pageBean=userService.findPageBean(currentPage,currentCount);
            }else{
                pageBean=userService.findPageBean(currentPage,currentCount,name);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("name",name);
        request.setAttribute("pageBean",pageBean);
        request.getRequestDispatcher("/admin/user/allUser.jsp").forward(request, response);

    }

    private void doGetJsonUser(HttpServletRequest request, HttpServletResponse response) {

    }

    private void doAddUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Map<String, String[]> properties = request.getParameterMap();
        User user=new User();
        try {
            BeanUtils.populate(user,properties);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        user.setId(null);
        userService.addUser(user);
       /* List<User> allUserList = userService.showAllUser();
        request.setAttribute("allUserList",allUserList);
        request.getRequestDispatcher("/admin/user/allUser.jsp").forward(request, response);*/
        response.sendRedirect("/UserServlet?op=showUsersByPage");
    }


    private void doQueryUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name=request.getParameter("name");
        String currentPageStr = request.getParameter("currentPage");
        if(currentPageStr==null){
            currentPageStr="1";
        }
        PageBean<User> pageBean=null;
        int currentPage=Integer.parseInt(currentPageStr);
        int currentCount=5;
        if(name==null||name.equals("")){
            pageBean = userService.findPageBean(currentPage, currentCount);
        }else{
            pageBean=userService.findPageBean(currentPage,currentCount,name);
        }
        request.setAttribute("pageBean",pageBean);
        request.setAttribute("name",name);
        request.getRequestDispatcher("/admin/user/allUser.jsp").forward(request, response);


    }

    private void doGetOnlineUsers(HttpServletRequest request, HttpServletResponse response) {
        OnlineUsers onlineUsers = OnlineUsers.getInstance();
        System.out.println("当前在线"+onlineUsers.getCount()+"人:");
        List<String> users = onlineUsers.getOnlineUsers();
        for (String user : users) {
            System.out.print(user+"\t");
        }
    }

    private void doExit(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        Cookie[] cookies=request.getCookies();
        for(int i=0;cookies!=null && i<cookies.length;i++){
            if(cookies[i].getName().equals("admin")||cookies[i].getName().equals("password")){
                Cookie cookie = new Cookie(cookies[i].getName(), null);
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
        response.sendRedirect(request.getContextPath()+"/login.jsp");
    }

    private void doEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        try {
            User user = userService.queryUserById(id);
            request.setAttribute("user",user);
            request.getRequestDispatcher("/admin/user/editUser.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void doDeleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Long.parseLong(request.getParameter("id"));
        try {
             userService.deleteUserById(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/UserServlet?op=showUsersByPage");


    }

    private void doShowAllUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> allUserList=null;
        try {
            allUserList = userService.showAllUser();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("allUserList",allUserList);
        request.getRequestDispatcher("/admin/user/allUser.jsp").forward(request, response);
    }

    private void doUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Map<String, String[]> properties = request.getParameterMap();
        User user=new User();

        try {
            BeanUtils.populate(user,properties);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        user.setId(Integer.parseInt(id));
        try {
            userService.updateUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/UserServlet?op=showUsersByPage");

    }

    private void doRegister(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String, String[]> properties = request.getParameterMap();
        User user=new User();
        try {
            BeanUtils.populate(user,properties);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        user.setId(null);
        try {
            userService.addUser(user);
            response.sendRedirect("/login.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
