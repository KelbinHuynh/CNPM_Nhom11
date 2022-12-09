package project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.model.Project;
import project.service.IMajorService;
import project.service.IProjectService;
import project.service.impl.MajorServiceImpl;
import project.service.impl.ProjectServiceImpl;

@WebServlet(urlPatterns = { "/DanhSach" })
public class ShowProjectToMajorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IMajorService majorService = new MajorServiceImpl();
	IProjectService projectService = new ProjectServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		String idmajor = req.getParameter("exist");
		List<Project> projectList = projectService.findAllToMajor(idmajor);
		int quantityProject = projectService.countProjectToMajor(idmajor);
		if (idmajor.equals("-1")) {
			projectList = projectService.findAll();
			quantityProject = projectService.countAllProject();
		}
		PrintWriter out = resp.getWriter();

		for (Project project : projectList) {
			int stt = (Integer.parseInt(project.getId()) + 1);
			out.println("<div class=\"navbar_purchase d-flex\">\r\n"
					+ "						<div class=\"navbar_purchase--title \">Tổng Số Đề Tài: "+quantityProject+"\r\n"
					+ "							</div>\r\n"
					+ "						<div class=\"navbar_purchase--filter d-flex\"></div>\r\n"
					+ "					</div>" + "<div class=\"order_purchase\">\r\n"
					+ "						<div class=\"purchase_tabcontent\" id=\"purchase_tabcontent--my\">"
					+ "<div class=\"purchase_item\" style=\"margin-bottom: 20px;\">\r\n"
					+ "									<div class=\"purchase_item--order\">\r\n"
					+ "										<div>\r\n"
					+ "											<a href=\"\" class=\"purchase_item--order--title\">\r\n"
					+ "												<div class=\"purchase_item--order--id\">\r\n"
					+ "													STT: <strong>" + stt + "</strong>\r\n"
					+ "												</div>\r\n"
					+ "												<div class=\"purchase_item--order--date\">Chuyên ngành:\r\n"
					+ "													" + project.getMajor().getName()
					+ "</div>\r\n");

			if (!project.getTeam().getId().equals("-1")) {
				out.println(
						"<div class=\"purchase_item--order--status\" style=\"top: 5%\">Tình trạng: Đã có người đăng ký</div>\r\n"
								+ "					<div class=\"purchase_item--order--status\" style=\"top: 50%\">Số lượng: "
								+ project.getTeam().getStudent().size() + "/2</div>\r\n");
			} else {
				out.println(
						"<div class=\"purchase_item--order--status\" style=\"background-color: #CD5C5C; color: white\">Tình trạng: Chưa có người đăng ký</div>");
			}
			out.println("											</a>\r\n"
					+ "											<c:set var=\"sum\" value=\"0\" />\r\n"
					+ "														<div class=\"purchase_item--order--product\">\r\n"
					+ "															<a href=\"\" class=\"purchase_item--product\">\r\n"
					+ "																<div class=\"purchase_item--caption\">\r\n"
					+ "																	<div class=\"purchase_item--name\">Tên đề tài: "
					+ project.getName() + "</div>\r\n"
					+ "																	<div class=\"purchase_item--amount\">Giảng viên hướng dẫn:\r\n"
					+ "																		"
					+ project.getLecturer().getFullname() + "</div>\r\n"
					+ "																</div>\r\n"
					+ "															</a>\r\n"
					+ "														</div>\r\n"
					+ "											<div class=\"purchase_item--order--total\">\r\n"
					+ "												\r\n"
					+ "											</div>\r\n"
					+ "											<button onclick=\"location.href='/WebCNPM/ChiTietDeTai?id="+project.getId()+"'\"\r\n"
					+ "												class=\"btn btn_confirm\">Thông tin đề tài</button>\r\n"
					+ "										</div>\r\n" + "									</div>\r\n"
					+ "								</div>" + "</div>\r\n" + "					</div>\r\n"
					+ "				</div>");
		}

	}

}
