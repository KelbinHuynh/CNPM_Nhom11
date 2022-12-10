package project.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.model.Student;
import project.service.IStudentService;
import project.service.impl.StudentServiceImpl;

@WebServlet(urlPatterns = { "/InformationUser" })
public class ShowInformationStudentTeamController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	IStudentService studentService = new StudentServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");

		String studentid = req.getParameter("exist");
		Student student = studentService.findStudent(studentid);
		PrintWriter out = resp.getWriter();
		
		out.println("<div class=\"forms__radio\">\r\n"
				+ "										<label class=\"info_student\">Họ và tên: "+student.getFullname() + "</label>\r\n"
				+ "										<label class=\"info_student\">Chuyên ngành: "+student.getMajor().getName()+ "</label>\r\n"
				+ "										<label class=\"info_student\">Ngày sinh: "+student.getDateofbirth()+"</label>\r\n"
				+ "										<label class=\"info_student\">Ngày sinh: "+student.getPhonenumber()+"</label>\r\n");
		if(student.isMale()) {
			out.println("											<label class=\"info_student\">Giới tính: Nam</label>\r\n");
		}
		else {
			out.println("<label class=\"info_student\">Giới tính: Nữ</label>\r\n");
		}
		out.println("									</div>");
	}

	
}

