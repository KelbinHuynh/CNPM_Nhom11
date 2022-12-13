package project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.model.Account;
import project.service.IStudentService;
import project.service.impl.StudentServiceImpl;

@WebServlet(urlPatterns = { "/QuanTamDeTai" })
public class CareProjectToStudentController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	IStudentService studentService = new StudentServiceImpl();
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Account u = (Account) session.getAttribute("account");
		String idproject = req.getParameter("idproject");
		studentService.insertToProject(u.getStudent().getId(), idproject);	
		resp.sendRedirect(req.getContextPath());
	}

	
}
