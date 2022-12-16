package project.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import project.model.Project;
import project.model.Tkb;
import project.service.IProjectService;
import project.service.ITkbService;
import project.service.impl.ProjectServiceImpl;
import project.service.impl.TkbServiceImpl;

@WebServlet(urlPatterns = { "/lecturer/LichVanDap" })
public class ShowScheduleLecturerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ITkbService tkbService = new TkbServiceImpl();
	IProjectService projectService = new ProjectServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if (session != null && session.getAttribute("account") != null) {
			Account u = (Account) session.getAttribute("account");
			List<Tkb> tkbList = tkbService.findAllTkb();
			List<Tkb> tkbToLecturer = new ArrayList<Tkb>();
			if (u.getLecturer().getLevel().equals("Trưởng Khoa")) {
				tkbToLecturer = tkbList;
			} else {
				for (Tkb tkbItem : tkbList) {
					for (Lecturer lecturerItem : tkbItem.getLecturer()) {
						if (lecturerItem.getId().equals(u.getLecturer().getId())) {

							tkbToLecturer.add(tkbItem);
						}
					}
				}
			}

			List<Project> projectList = projectService.findAll();
			req.setAttribute("projectList", projectList);
			req.setAttribute("tkbList", tkbToLecturer);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/Views/lecturer/scheduleQ&A.jsp");
			dispatcher.forward(req, resp);
		} else {
			resp.sendRedirect(req.getContextPath() + "/login");
		}
	}

}
