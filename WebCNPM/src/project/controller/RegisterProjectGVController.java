package project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.model.Lecturer;
import project.model.Major;
import project.service.ILecturerService;
import project.service.IMajorService;
import project.service.IProjectService;
import project.service.ITeamService;
import project.service.impl.LecturerServiceImpl;
import project.service.impl.MajorServiceImpl;
import project.service.impl.ProjectServiceImpl;
import project.service.impl.TeamServiceImpl;

@WebServlet(urlPatterns = { "/lecturer/DangKyDeTaiGV" })
public class RegisterProjectGVController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	IMajorService majorService = new MajorServiceImpl();
	IProjectService projectService = new ProjectServiceImpl();
	ILecturerService lecturerService = new LecturerServiceImpl();
	ITeamService teamService = new TeamServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Major> majorList = majorService.findAll();
		List<Lecturer> lecturerList = lecturerService.findAll();
		
		req.setAttribute("majorList", majorList);
		req.setAttribute("lecturerList", lecturerList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Views/lecturer/registerprojectGV.jsp");
		dispatcher.forward(req, resp);
		
	}
}
