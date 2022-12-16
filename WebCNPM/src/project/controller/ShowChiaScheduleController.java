package project.controller;

import java.io.IOException;
import java.sql.Time;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.model.Lecturer;
import project.model.Major;
import project.model.Project;
import project.model.Tkb;
import project.service.ILecturerService;
import project.service.IMajorService;
import project.service.IProjectService;
import project.service.ITeamService;
import project.service.ITkbService;
import project.service.impl.LecturerServiceImpl;
import project.service.impl.MajorServiceImpl;
import project.service.impl.ProjectServiceImpl;
import project.service.impl.TeamServiceImpl;
import project.service.impl.TkbServiceImpl;

@WebServlet(urlPatterns = { "/lecturer/XepLich" })
public class ShowChiaScheduleController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	IMajorService majorService = new MajorServiceImpl();
	IProjectService projectService = new ProjectServiceImpl();
	ILecturerService lecturerService = new LecturerServiceImpl();
	ITeamService teamService = new TeamServiceImpl();
	ITkbService tkbService = new TkbServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Major> majorList = majorService.findAll();
		List<Lecturer> lecturerList = lecturerService.findAll();
		List<Project> projectList = projectService.findAll();
		req.setAttribute("majorList", majorList);
		req.setAttribute("lecturerList", lecturerList);
		req.setAttribute("projectList", projectList);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Views/lecturer/ChiaSchedule.jsp");
		dispatcher.forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String phong = req.getParameter("phong");
		String daySchedule = req.getParameter("day");
		String timeofdate = req.getParameter("timeofdate");
		timeofdate = timeofdate + ":00";
		String[] listlecturer = req.getParameterValues("method-lecturer");
		String[] listproject = req.getParameterValues("method-project");
		
		
		Tkb tkb = new Tkb();
		tkb.setRoom(phong);
		tkb.setDate(Date.valueOf(daySchedule));
		tkb.setTimeofday(Time.valueOf(timeofdate));
		tkbService.insertTkb(tkb);
		
		List<Tkb> tkbList = tkbService.findAllTkb();
		int tkbcount = tkbList.size();
		Tkb tkbnow = tkbList.get(tkbcount-1); 
		
		for(String lecturerid : listlecturer) {
			tkbService.insertLecturerToTkb(lecturerid, tkbnow.getId());
		}
		
		for (String projectid : listproject) {
			Project project = projectService.findOne(projectid);
			System.out.println(project.getTeam().getId());
		}
		
		resp.sendRedirect(req.getContextPath() + "/lecturer/LichVanDap");
	}
	
}
