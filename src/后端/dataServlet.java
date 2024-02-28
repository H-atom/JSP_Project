package 后端;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/dataServlet")
public class dataServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        req.setCharacterEncoding("UTF-8");
        String input0=req.getParameter("input0");
        String input1=req.getParameter("input1");
        String input2=req.getParameter("input2");
        String input3=req.getParameter("input3");
        String input4=req.getParameter("input4");
        String input5=req.getParameter("input5");
        String input6=req.getParameter("input6");
        String input7=req.getParameter("input7");
        String input8=req.getParameter("input8");
        String input9=req.getParameter("input9");
        String input10=req.getParameter("input10");
        String input11=req.getParameter("input11");
        String introduce=req.getParameter("introduce");
        String score=req.getParameter("score");
        String selectName=req.getParameter("selectName");
        String selectGpa=req.getParameter("selectGpa");
        String teacher=(String) req.getSession().getAttribute("username");


        if (score==null){
            if (input0 != null && input1 != null && input2 != null &&input3 != null &&input4!=null&&input5!=null&& input6 != null && input7 != null&&input8!=null&&input9!=null&&input10!=null&&input11!=null) {
                enterTimetable tea = new enterTimetable();
                tea.update(input0, input1, input2, input3,input4, Double.parseDouble(input5), input6, input7,input8,input9,input10,introduce,input11);
                if (tea.backTimetable()){req.setAttribute("noneTable","课序号已有,请先删除!");
                }else {
                    showClassNumber showClassNumber=new showClassNumber();
                    showClassNumber.delete(input1);
                    req.setAttribute("addSuccess","添加成功");
                }
            }else {
                req.setAttribute("terror","括号内内容不能为空!!!");
            }
            req.getRequestDispatcher("teacher0.jsp").forward(req,resp);
        }else{
            if (input0!=null&&selectName!=null&&input1!=null&&input2!=null&&selectGpa!=null&&teacher!=null){
                enterScore enterScore=new enterScore();
                enterScore.update(input0,selectName,input1,Double.parseDouble(input2),selectGpa,teacher);
                if (enterScore.back()){req.setAttribute("none","该学生已录入,请先删除!");}
            }else {
                req.setAttribute("terror1","括号内内容不能为空!!!");
            }
            req.getRequestDispatcher("teacher1.jsp").forward(req,resp);
        }
    }

}
