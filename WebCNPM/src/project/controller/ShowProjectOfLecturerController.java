package project.controller;

import java.io.IOException;
import java.util.List;

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
import project.service.impl.ProjectServiceImpl;

@WebServlet(urlPatterns = { "/lecturer/projectoflecturer" })
public class ShowProjectOfLecturerController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	IProjectService projectService = new ProjectServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if (session != null && session.getAttribute("account") != null) {
			Account u = (Account) session.getAttribute("account");
			List<Project> projectList = projectService.findProjectOfLecturer(u.getLecturer().getId());
			int countLecturer = projectService.countProjectOfLecturer(u.getLecturer().getId());
			
			req.setAttribute("countLecturer", countLecturer);
			req.setAttribute("projectList", projectList);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/Views/lecturer/lecturerProject.jsp");
			dispatcher.forward(req, resp);
		} else {
			resp.sendRedirect(req.getContextPath() + "/login");
		}
	}
	
	

}
