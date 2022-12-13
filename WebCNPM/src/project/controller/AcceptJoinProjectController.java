package project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.model.Student;
import project.service.IStudentService;
import project.service.ITeamService;
import project.service.impl.StudentServiceImpl;
import project.service.impl.TeamServiceImpl;

@WebServlet(urlPatterns = { "/AcceptJoinProject" })
public class AcceptJoinProjectController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	IStudentService studentService = new StudentServiceImpl();
	ITeamService teamService = new TeamServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sid = req.getParameter("sid");
		String idproject = req.getParameter("idproject");
		teamService.insertSTD_TEAM(sid, idproject);
		List<Student> studentList = studentService.findStudentToProject(idproject);
		for(Student student: studentList) {
			studentService.deleteStdCarePrj(student.getId(), idproject);
		}
			
		resp.sendRedirect(req.getContextPath()+"/ThongTinDeTaiTeam");
	}

}
