package project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.model.Student;
import project.service.IStudentService;
import project.service.impl.StudentServiceImpl;

@WebServlet(urlPatterns = { "/InformationUserToSearch" })
public class ShowInformationStudentToSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IStudentService studentService = new StudentServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");

		String studentid = req.getParameter("exist");
		List<Student> studentList = studentService.findStudentToKey(studentid);
		PrintWriter out = resp.getWriter();

		for (Student student : studentList) {
			out.println("<div class=\"forms__radio\" style=\"position: relative;\">\r\n"
					+ "										<label class=\"info_student\">Mã số sinh viên: "
					+ student.getMssv() + "</label>\r\n"
					+ "										<label class=\"info_student\">Họ và tên: "
					+ student.getFullname() + "</label>\r\n"
					+ "										<label class=\"info_student\">Chuyên ngành: "
					+ student.getMajor().getName() + "</label>\r\n"
					+ "										<label class=\"info_student\">Ngày sinh: "
					+ student.getDateofbirth() + "</label>\r\n"
					+ "										<label class=\"info_student\">Số điện thoại: "
					+ student.getPhonenumber() + "</label>\r\n");
			if (student.isMale()) {
				out.println(
						"											<label class=\"info_student\">Giới tính: Nam</label>\r\n");
			} else {
				out.println("<label class=\"info_student\">Giới tính: Nữ</label>\r\n");
			}
			out.println("<span style=\"cursor: pointer;position: absolute;right: 20px;top: 20px;\"\r\n"
					+ "													class=\" btn_update_1\" onclick=\"acceptStudentLeader("+student.getMssv()+")\">\r\n"
					+ "													<i class=\"fa-solid fa-check update_info\"></i>Thêm sinh viên \r\n"
					+ "												</span>								</div>");
		}
	}

}
