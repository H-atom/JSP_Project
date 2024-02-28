package 后端;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/inquireCourseServlet")
public class inquireCourseServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String input = req.getParameter("input");
        String name = req.getParameter("name");
        String number = req.getParameter("number");
        String teach = req.getParameter("teach");
        String terms = req.getParameter("terms");
        String names = req.getParameter("courseNames");
        String numbers = req.getParameter("courseNumbers");
        String types = req.getParameter("types");
        String teachers = req.getParameter("teachers");


        req.setAttribute("input", input);
        if (input != null) {
            if (!name.isEmpty() || !number.isEmpty() || !teach.isEmpty()) {
                req.setAttribute("name", name);
                req.setAttribute("number", number);
                req.setAttribute("teacher", teach);
            }
            req.getRequestDispatcher("student2.jsp").forward(req, resp);
        } else {
            if (terms.isEmpty() && names.isEmpty() && numbers.isEmpty() && teachers.isEmpty() && types.isEmpty()) {
                req.setAttribute("terrors", "输入全为空!!!");
            } else {
                showTimetable showTimetable = new showTimetable();
                ArrayList<User> arrayList2 = showTimetable.showT(terms, names, numbers, types, teachers);
                if (arrayList2.isEmpty()) {
                    req.setAttribute("nothing", "搜索结果为空!!!");
                } else {
                    req.setAttribute("terms", terms);
                    req.setAttribute("courseNumbers", numbers);
                    req.setAttribute("courseNames", names);
                    req.setAttribute("types", types);
                    req.setAttribute("teachers", teachers);
                }
            }
            req.getRequestDispatcher("teacher.jsp").forward(req, resp);
        }

    }
}
