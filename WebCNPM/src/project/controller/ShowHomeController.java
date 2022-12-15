package project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.model.Major;
import project.model.Project;
import project.service.IMajorService;
import project.service.IProjectService;
import project.service.IStudentService;
import project.service.ITeamService;
import project.service.impl.MajorServiceImpl;
import project.service.impl.ProjectServiceImpl;
import project.service.impl.StudentServiceImpl;
import project.service.impl.TeamServiceImpl;

@WebServlet(urlPatterns = {"", "/lecturer"})
public class ShowHomeController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	IMajorService majorService = new MajorServiceImpl();
	IProjectService projectService = new ProjectServiceImpl();
	ITeamService teamService = new TeamServiceImpl();
	IStudentService studentService = new StudentServiceImpl(); 

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Major> majorList = majorService.findAll();
		String indexPage = req.getParameter("index");
		if (indexPage == null) {
			indexPage = "1";
		}
		
		int indexp = Integer.parseInt(indexPage);
		int countP;
		int endPage;
		
		countP = projectService.countAllProject();
		endPage = countP / 8;
		if (countP % 8 != 0) {
			endPage++;
		}
		
		List<Project> projectList = projectService.findAllPage(indexp - 1);
		
		req.setAttribute("endP", endPage);
		req.setAttribute("tag", indexp);
		req.setAttribute("projectList", projectList);
		req.setAttribute("majorList", majorList);
		req.setAttribute("countP", countP);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
		dispatcher.forward(req, resp);
	}
	
}