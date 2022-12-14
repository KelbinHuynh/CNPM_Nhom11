package project.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.model.Account;
import project.service.IStudentService;
import project.service.impl.StudentServiceImpl;

@WebServlet(urlPatterns = { "/information" })
public class ShowInformationStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IStudentService studentService = new StudentServiceImpl();


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if (session != null && session.getAttribute("account") != null) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/Views/infoStudent.jsp");
			dispatcher.forward(req, resp);
		} else {
			resp.sendRedirect(req.getContextPath() + "/login");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();	 
			resp.setContentType("text/html");
			resp.setCharacterEncoding("UTF-8");
			req.setCharacterEncoding("UTF-8");
			Account u = (Account) session.getAttribute("account");
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String date = req.getParameter("date");
			java.util.Date date1 = format.parse(date);
			
			java.sql.Date dateofbirth = new java.sql.Date(date1.getTime());  
			if (date == null) {
				dateofbirth = u.getStudent().getDateofbirth();
			}
			String phone = req.getParameter("phone");
			if (phone == null) {
				phone=u.getStudent().getPhonenumber();
			}
			
			u.getStudent().setPhonenumber(phone);
			u.getStudent().setDateofbirth(dateofbirth);
			studentService.updateToStudent(u.getStudent());
			resp.sendRedirect(req.getContextPath()+ "/information");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
