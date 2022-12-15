package project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.model.Account;
import project.model.Lecturer;
import project.model.Tkb;
import project.service.ITkbService;
import project.service.impl.TkbServiceImpl;

@WebServlet(urlPatterns = { "/lecturer/schedule" })
public class ShowScheduleLecturerController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	ITkbService tkbService = new TkbServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if (session != null && session.getAttribute("account") != null) {
			Account u = (Account) session.getAttribute("account");
			List<Tkb> tkbList = tkbService.findAllTkb();
			List<Tkb> tkbToLecturer = new ArrayList<Tkb>();
			for(Tkb tkbItem : tkbList) {
				for(Lecturer lecturerItem: tkbItem.getLecturer()) {
					if(lecturerItem.getId() == u.getLecturer().getId()) {
						tkbToLecturer.add(tkbItem);
					}
				}
			}
			req.setAttribute("tkbList", tkbToLecturer);
		}
		else {
			resp.sendRedirect(req.getContextPath() + "/login");
		}
	}

	
}
