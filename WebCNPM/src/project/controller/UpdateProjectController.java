package project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.model.Project;
import project.service.IProjectService;
import project.service.impl.ProjectServiceImpl;

@WebServlet(urlPatterns = { "/CapNhatDeTai" })
public class UpdateProjectController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	IProjectService projectService = new ProjectServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String idproject = req.getParameter("idproject");
		String name = req.getParameter("name");
		String details = req.getParameter("details");
		Project project = projectService.findOne(idproject);
		if (name == null) {
			name = project.getName();
		}
		
		if (details == null) {
			details = project.getDetails();
		}
		
		project.setName(req.getParameter("name"));
		project.setDetails(req.getParameter("details"));
		
		projectService.updateProject(project);
		
		resp.sendRedirect(req.getContextPath() + "/ThongTinDeTaiTeam");
		
	}
	
	

}
