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
import project.service.impl.MajorServiceImpl;
import project.service.impl.ProjectServiceImpl;

@WebServlet(urlPatterns = {""})
public class ShowHomeController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	IMajorService majorService = new MajorServiceImpl();
	IProjectService projectService = new ProjectServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Major> majorList = majorService.findAll();
		List<Project> projectList = projectService.findAll();
		int quantity = projectService.countAllProject();
		
		req.setAttribute("projectList", projectList);
		req.setAttribute("majorList", majorList);
		req.setAttribute("quantityProject", quantity);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
		dispatcher.forward(req, resp);
	}
	
}