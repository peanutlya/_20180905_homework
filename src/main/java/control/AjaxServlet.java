package control;

import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AjaxServlet",urlPatterns = "/AjaxServlet")
public class AjaxServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op = request.getParameter("op");
        if (("checkUsername".equals(op))) {
                doCheckUsername(request,response);
        }else if(("test").equals(op)){
            doTest(request,response);
        }
    }

    private void doTest(HttpServletRequest request, HttpServletResponse response) throws IOException {


        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String result=name+":"+age;
       // System.out.println(result);
        /*Gson gson=new Gson();
        String s = gson.toJson(result);
        String gsonString = GsonUtils.createGsonString(result);
        System.out.println(s);
        System.out.println();*/
        response.getWriter().write("{\"username\":"+name+"}");
    }

    private void doCheckUsername(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username=request.getParameter("username");
        UserService userService=new UserService();
        boolean isExist=false;
        try {
            isExist= userService.checkUsername(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.getWriter().write("{\"isExist\":"+isExist+"}");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
