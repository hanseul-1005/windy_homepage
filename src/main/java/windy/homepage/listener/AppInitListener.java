package windy.homepage.listener;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AppInitListener implements ServletContextListener {

    private static final String[] UPLOAD_SUBDIRS = {
        "certification", "portfolio", "product", "press", "board"
    };

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext ctx = sce.getServletContext();

        // web.xml context-param에서 upload.base.path 읽기
        String configuredPath = ctx.getInitParameter("upload.base.path");

        String uploadBasePath;
        if (configuredPath != null && !configuredPath.trim().isEmpty()) {
            // web.xml에 명시적 경로가 설정된 경우 사용
            uploadBasePath = configuredPath.trim();
        } else {
            // 기본값: {user.home}/windy_uploads
            uploadBasePath = System.getProperty("user.home") + File.separator + "windy_uploads";
        }

        // 경로 끝에 구분자 추가
        if (!uploadBasePath.endsWith(File.separator)) {
            uploadBasePath += File.separator;
        }

        // 서브디렉토리 생성
        for (String sub : UPLOAD_SUBDIRS) {
            File dir = new File(uploadBasePath + sub);
            if (!dir.exists()) {
                boolean created = dir.mkdirs();
                if (created) {
                    ctx.log("[AppInitListener] 업로드 디렉토리 생성: " + dir.getAbsolutePath());
                }
            }
        }

        // ServletContext attribute에 저장 (서블릿에서 공유 사용)
        ctx.setAttribute("uploadBasePath", uploadBasePath);
        ctx.log("[AppInitListener] 업로드 기본 경로: " + uploadBasePath);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // 정리 작업 없음
    }
}
