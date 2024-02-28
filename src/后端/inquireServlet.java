package 后端;

import 后端.inquireData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

@WebServlet("/inquireServlet")
public class inquireServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String term=req.getParameter("inTerm");
        String number=req.getParameter("inNumber");
        String name=req.getParameter("inName");
        String type=req.getParameter("inType");
        String student=req.getParameter("inStudent");


            if (term.isEmpty()&&name.isEmpty()&&number.isEmpty()&&student.isEmpty()&&type.isEmpty()){
                req.setAttribute("terrors","输入全为空!!!");
                req.getRequestDispatcher("teacher2.jsp").forward(req,resp);
            }else {
                inquireData inquireData=new inquireData();
                ArrayList<User> arrayList=inquireData.inquire(term,number,name,type,student);
                if (arrayList.isEmpty()){
                    req.setAttribute("nothing","搜索结果为空!!!");
                }else {
                    req.setAttribute("term", term);
                    req.setAttribute("number", number);
                    req.setAttribute("name", name);
                    req.setAttribute("type", type);
                    req.setAttribute("student", student);
                }
                req.getRequestDispatcher("teacher2.jsp").forward(req,resp);
            }


    }

}
