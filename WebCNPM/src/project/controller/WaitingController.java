package project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.model.Account;


@WebServlet(urlPatterns = {"/waiting"})
public class WaitingController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if (session != null && session.getAttribute("account") != null) {
			Account u = (Account) session.getAttribute("account");
			req.setAttribute("username", u.getUsername());
			if (u.getRole() == 0) {
				resp.sendRedirect(req.getContextPath() + "/admin/user");
			} else if (u.getRole() == 1) {
				resp.sendRedirect(req.getContextPath() + "/lecturer");
			} 
			else if (u.getRole() == 2) {
				resp.sendRedirect(req.getContextPath());
			}else {
				resp.sendRedirect(req.getContextPath());
			}
		} else {
			resp.sendRedirect(req.getContextPath() + "/login");
		}
	}
}
