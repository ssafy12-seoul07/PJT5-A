package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.service.VideoService;
import model.service.VideoServiceImpl;

@WebServlet("/video")
public class VideoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VideoService service = VideoServiceImpl.getInstance();
	private final String prefix = "/WEB-INF/video";

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");

		switch (action) {
		case "player":
			doPlayer(req, res);
			break;
		default:
			break;
		}

	}

	// 비디오 재생 페이지로 이동
	private void doPlayer(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("videoId"));

		req.setAttribute("video", service.getVideo(id));
		req.getRequestDispatcher(prefix + "player.jsp").forward(req, res);
	}
}
