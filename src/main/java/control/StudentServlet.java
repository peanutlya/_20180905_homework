package control;

import com.github.pagehelper.PageInfo;
import dao.StudentDao;
import entity.PageBean;
import entity.Student;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.ibatis.session.SqlSession;
import service.StudentService;
import utils.ContextUtils;
import utils.MyBatisUtil;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "StudentServlet",urlPatterns = "/StudentServlet")
public class StudentServlet extends HttpServlet {
    private StudentService stuService;
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        this.stuService = ContextUtils.getBean(StudentService.class);

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String op = request.getParameter("op");
        if (("showAllStudent".equals(op))) {
            doShowAllUser(request,response);
        }else if (("addStudent".equals(op))) {
            try {
                doAddStudent(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(("delete".equals(op))){
            doDeleteStudent(request,response);
        }else if (("edit".equals(op))) {
            doEdit(request, response);
        }else if (("queryStudent".equals(op))) {
            try {
                doQueryStudent(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if (("update".equals(op))) {
            doUpdate(request,response);
        }else if(("test").equals(op)){
            doTest(request,response);
        }else if(("queryStudnetByPageHelper").equals(op)){
            doQueryStudnetByPageHelper(request,response);
        }
    }

    private void doQueryStudnetByPageHelper(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keywords=request.getParameter("keywords");
        String pageNumStr=request.getParameter("pageNum");
        if(pageNumStr==null){
            pageNumStr="1";
        }
        int pageNum=Integer.parseInt(pageNumStr);
        int pageSize=5;
        PageInfo pageInfo = stuService.doQueryStudnetByPageHelper(pageNum, pageSize, keywords);
        request.setAttribute("keywords",keywords);
        request.setAttribute("pageInfo",pageInfo);
        request.getRequestDispatcher("/admin/user/allStudent2.jsp").forward(request, response);

    }

    private void doTest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        StudentDao mapper = sqlSession.getMapper(StudentDao.class);
        List<Student> students = mapper.testHot();
        response.getWriter().write(students.toString());
    }

    private void doUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Map<String, String[]> properties = request.getParameterMap();
        Student student=new Student();

        try {
            BeanUtils.populate(student,properties);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        student.setId(Long.parseLong(id));
        try {
            stuService.updateStu(student);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath()+"/StudentServlet?op=showAllStudent");
    }

    private void doQueryStudent(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name=request.getParameter("name");
        List<Student> allStuList = stuService.queryStudentByName(name);
        request.setAttribute("allStuList",allStuList);
        request.setAttribute("name",name);
        request.getRequestDispatcher("/admin/user/allStudent.jsp").forward(request, response);
    }

    private void doEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        try {
            Student student = stuService.queryStudentById(id);
            request.setAttribute("stu",student);
            request.getRequestDispatcher("/admin/student/editStudent.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private void doDeleteStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Long.parseLong(request.getParameter("id"));
        try {
            int i = stuService.deleteStuById(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath()+"/StudentServlet?op=showAllStudent");
        //request.getRequestDispatcher("/admin/user/allStudent.jsp").forward(request, response);

    }

    private void doAddStudent(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Map<String, String[]> properties = request.getParameterMap();
        Student student=new Student();
        try {
            BeanUtils.populate(student,properties);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        student.setId(null);
        stuService.addStudent(student);
        response.sendRedirect(request.getContextPath()+"/StudentServlet?op=showAllStudent");
    }

    private void doShowAllUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentPageStr=request.getParameter("currentPage");
        if(currentPageStr==null){
            currentPageStr="1";
        }
        PageBean pageBean=new PageBean();
        int currentPage=Integer.parseInt(currentPageStr);
        int pageSize=5;
        String keywords = request.getParameter("keywords");
        try {
            pageBean = stuService.findStudentForPageBean(currentPage, pageSize, keywords);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("pageBean",pageBean);
        request.setAttribute("keywords",keywords);
        request.getRequestDispatcher("/admin/user/allStudent.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

}
