package project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.model.Account;
import project.model.Project;
import project.model.Team;
import project.service.IProjectService;
import project.service.IStudentService;
import project.service.ITeamService;
import project.service.impl.ProjectServiceImpl;
import project.service.impl.StudentServiceImpl;
import project.service.impl.TeamServiceImpl;

@WebServlet(urlPatterns = { "/QuanTamDeTai" })
public class CareProjectToStudentController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	IStudentService studentService = new StudentServiceImpl();
	IProjectService projectService = new ProjectServiceImpl();
	ITeamService teamService = new TeamServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Account u = (Account) session.getAttribute("account");
		String idproject = req.getParameter("idproject");
		Project project = projectService.findOne(idproject);
		if (project.getTeam().getStudent() == null) {
			Team team = new Team();
			team.setLeader(u.getStudent().getId());
			teamService.insertTeam(team);
			
			List<Team> teamList = teamService.findAll();
			int idxteam = teamList.size() - 1;
			teamService.insertSTD_TEAM(u.getStudent().getId(), teamList.get(idxteam).getId());
			projectService.insertTEAM_PRJ(idproject, teamList.get(idxteam).getId());
			u.getStudent().setTeam(teamList.get(idxteam));
		}
		else {
			studentService.insertToProject(u.getStudent().getId(), idproject);	
		}
		
		resp.sendRedirect(req.getContextPath());
	}

	
}
