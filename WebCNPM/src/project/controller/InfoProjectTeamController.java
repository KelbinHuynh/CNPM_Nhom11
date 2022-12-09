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
import project.model.Lecturer;
import project.model.Major;
import project.model.Project;
import project.model.Student;
import project.service.ILecturerService;
import project.service.IMajorService;
import project.service.IProjectService;
import project.service.IStudentService;
import project.service.impl.LecturerServiceImpl;
import project.service.impl.MajorServiceImpl;
import project.service.impl.ProjectServiceImpl;
import project.service.impl.StudentServiceImpl;

@WebServlet(urlPatterns = { "/ThongTinDeTaiTeam" })
public class InfoProjectTeamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IMajorService majorService = new MajorServiceImpl();
	IProjectService projectService = new ProjectServiceImpl();
	ILecturerService lecturerService = new LecturerServiceImpl();
	IStudentService studentService = new StudentServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Major> majorList = majorService.findAll();
		List<Lecturer> lecturerList = lecturerService.findAll();
		HttpSession session = req.getSession();
		Account u = (Account) session.getAttribute("account");
		Project projectTeam = projectService.findProjectToTeam(u.getStudent().getTeam().getId());
		List<Student> studentList = studentService.findStudentToProject(projectTeam.getId());

		req.setAttribute("projectTeam", projectTeam);
		req.setAttribute("majorList", majorList);
		req.setAttribute("lecturerList", lecturerList);
		req.setAttribute("studentList", studentList);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/Views/infoProjectTeam.jsp");
		dispatcher.forward(req, resp);

	}
}
