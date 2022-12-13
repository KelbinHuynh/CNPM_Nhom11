package project.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.model.Account;
import project.model.Project;
import project.service.IProjectService;
import project.service.IStudentService;
import project.service.impl.ProjectServiceImpl;
import project.service.impl.StudentServiceImpl;

@WebServlet(urlPatterns = { "/ChiTietDeTai" })
public class ShowInfomationProjectController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	IProjectService projectService = new ProjectServiceImpl();
	IStudentService studentService = new StudentServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		Account u = (Account) session.getAttribute("account");
		String idproject = req.getParameter("id");
		Project project = projectService.findOne(idproject);
		boolean check = studentService.checkStdWithPrjCare(u.getStudent().getId(), idproject);
		
		req.setAttribute("project", project);
		req.setAttribute("check", check);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Views/projectinfo.jsp");
		dispatcher.forward(req, resp);
	}
	
}
