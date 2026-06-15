package windy.homepage.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FileServlet", urlPatterns = { "/uploads/*" })
public class FileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * 업로드된 파일을 서빙하는 서블릿.
     * 파일은 ServletContext attribute "uploadBasePath" 경로에서 읽어옵니다.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pathInfo = request.getPathInfo(); // e.g. "/certification/uuid.png"
        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // 경로 탐색 공격 방지
        if (pathInfo.contains("..")) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        String uploadBasePath = (String) getServletContext().getAttribute("uploadBasePath");
        if (uploadBasePath == null) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "업로드 경로가 설정되지 않았습니다.");
            return;
        }

        File file = new File(uploadBasePath + pathInfo.replace("/", File.separator));

        if (!file.exists() || !file.isFile()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        String contentType = getServletContext().getMimeType(file.getName());
        response.setContentType(contentType != null ? contentType : "application/octet-stream");
        response.setContentLengthLong(file.length());

        Files.copy(file.toPath(), response.getOutputStream());
    }
}
