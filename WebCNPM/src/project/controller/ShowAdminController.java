package project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.model.Account;
import project.service.IAccountService;
import project.service.impl.AccountServiceImpl;

@WebServlet(urlPatterns = {"/admin/user"})
public class ShowAdminController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	IAccountService accountService = new AccountServiceImpl(); 

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Account> accountList = accountService.findAll();
		
		req.setAttribute("accountList", accountList);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Views/admin/useraccount.jsp");
		dispatcher.forward(req, resp);
	}

	
}
