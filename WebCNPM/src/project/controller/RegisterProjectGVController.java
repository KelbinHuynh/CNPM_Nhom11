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
import project.model.Team;
import project.service.ILecturerService;
import project.service.IMajorService;
import project.service.IProjectService;
import project.service.IStudentService;
import project.service.ITeamService;
import project.service.impl.LecturerServiceImpl;
import project.service.impl.MajorServiceImpl;
import project.service.impl.ProjectServiceImpl;
import project.service.impl.StudentServiceImpl;
import project.service.impl.TeamServiceImpl;

@WebServlet(urlPatterns = { "/lecturer/DangKyDeTaiGV" })
public class RegisterProjectGVController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	IMajorService majorService = new MajorServiceImpl();
	IProjectService projectService = new ProjectServiceImpl();
	ILecturerService lecturerService = new LecturerServiceImpl();
	ITeamService teamService = new TeamServiceImpl();
	IStudentService studentService = new StudentServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Major> majorList = majorService.findAll();
		List<Lecturer> lecturerList = lecturerService.findAll();

		req.setAttribute("majorList", majorList);
		req.setAttribute("lecturerList", lecturerList);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/Views/lecturer/registerprojectGV.jsp");
		dispatcher.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		Account u = (Account) session.getAttribute("account");
		String nameprj = req.getParameter("name");
		String detailsprj = req.getParameter("details");
		String studentid = req.getParameter("studentleader");
		String idlecturer = u.getLecturer().getId();
		String majorid = u.getLecturer().getMajor().getId();
		
		if (studentid == null) {
			Project project = new Project();
			project.setName(nameprj);
			project.setDetails(detailsprj);
			projectService.insertProject(project);

			List<Project> projectList = projectService.findAll();
			int idx = projectList.size() - 1;

			projectService.insertPRJ_MAJ(projectList.get(idx).getId(), majorid);
			projectService.insertLEC_PRJ(idlecturer, projectList.get(idx).getId());
			
			resp.sendRedirect(req.getContextPath() + "/lecturer");
		}else {
			if (studentService.checkStudent(studentid)) {
				Project project = new Project();
				project.setName(nameprj);
				project.setDetails(detailsprj);
				projectService.insertProject(project);

				List<Project> projectList = projectService.findAll();
				int idx = projectList.size() - 1;

				projectService.insertPRJ_MAJ(projectList.get(idx).getId(), majorid);
				projectService.insertLEC_PRJ(idlecturer, projectList.get(idx).getId());
				Team team = new Team();
				Student idStudent = studentService.findStudentToMSSV(studentid);
				team.setLeader(idStudent.getId());
				teamService.insertTeam(team);

				List<Team> teamList = teamService.findAll();
				int idxteam = teamList.size() - 1;
				
				teamService.insertSTD_TEAM(idStudent.getId(), teamList.get(idxteam).getId());
				projectService.insertTEAM_PRJ(projectList.get(idx).getId(), teamList.get(idxteam).getId());
				resp.sendRedirect(req.getContextPath() + "/lecturer");
			} else {
				String text = "Sinh viên không tồn tại";
				req.setAttribute("thongbao", text);
				RequestDispatcher dispatcher = req.getRequestDispatcher("/Views/lecturer/registerprojectGV.jsp");
				dispatcher.forward(req, resp);
			}
		}		
	}

}
