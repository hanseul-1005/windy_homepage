-- =============================================
-- windy_homepage DB schema
-- 실서버 DB: mariadb114.windygnt.myds.me:63307
-- =============================================

CREATE DATABASE IF NOT EXISTS homedb DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE homedb;

-- 관리자
CREATE TABLE IF NOT EXISTS admin (
    admin_id    INT             NOT NULL AUTO_INCREMENT,
    admin_name  VARCHAR(50)     NOT NULL,
    admin_pw    VARCHAR(255)    NOT NULL,
    PRIMARY KEY (admin_id)
);

-- 공지사항
CREATE TABLE IF NOT EXISTS notice (
    notice_id   INT             NOT NULL AUTO_INCREMENT,
    title       VARCHAR(200)    NOT NULL,
    content     LONGTEXT,
    created_at  DATETIME        NOT NULL DEFAULT NOW(),
    updated_at  DATETIME        NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (notice_id)
);

-- Contact Us
CREATE TABLE IF NOT EXISTS contact (
    contact_id  INT             NOT NULL AUTO_INCREMENT,
    name        VARCHAR(100)    NOT NULL,
    email       VARCHAR(100)    NOT NULL,
    subject     VARCHAR(200)    NOT NULL,
    content     TEXT            NOT NULL,
    created_at  DATETIME        NOT NULL DEFAULT NOW(),
    PRIMARY KEY (contact_id)
);

-- 연혁
CREATE TABLE IF NOT EXISTS history (
    history_id      INT             NOT NULL AUTO_INCREMENT,
    history_year    INT             NOT NULL,
    history_month   INT             NOT NULL,
    history_day     INT             NULL COMMENT '일자(선택), NULL이면 월까지만 표시',
    content         VARCHAR(500)    NOT NULL,
    created_at      DATETIME        NOT NULL DEFAULT NOW(),
    PRIMARY KEY (history_id)
);

-- 인증서/문서
CREATE TABLE IF NOT EXISTS certification (
    cert_id     INT             NOT NULL AUTO_INCREMENT,
    title       VARCHAR(200)    NOT NULL,
    file_path   VARCHAR(500)    NOT NULL,
    file_type   VARCHAR(10)     NOT NULL COMMENT 'pdf / png / jpg',
    created_at  DATETIME        NOT NULL DEFAULT NOW(),
    PRIMARY KEY (cert_id)
);

-- 포트폴리오
CREATE TABLE IF NOT EXISTS portfolio (
    portfolio_id    INT             NOT NULL AUTO_INCREMENT,
    title           VARCHAR(200)    NOT NULL,
    category        VARCHAR(20)     NOT NULL DEFAULT 'AI' COMMENT 'AI / Data / Vision / Monitoring',
    summary         VARCHAR(500),
    right_content   LONGTEXT,
    bottom_content  LONGTEXT,
    created_at      DATETIME        NOT NULL DEFAULT NOW(),
    updated_at      DATETIME        NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (portfolio_id)
);

-- 포트폴리오 이미지 (슬라이드)
CREATE TABLE IF NOT EXISTS portfolio_image (
    image_id        INT             NOT NULL AUTO_INCREMENT,
    portfolio_id    INT             NOT NULL,
    image_path      VARCHAR(500)    NOT NULL,
    sort_order      INT             NOT NULL DEFAULT 0,
    PRIMARY KEY (image_id),
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(portfolio_id) ON DELETE CASCADE
);

-- 프로덕트
CREATE TABLE IF NOT EXISTS product (
    product_id  INT             NOT NULL AUTO_INCREMENT,
    title       VARCHAR(200)    NOT NULL,
    summary     TEXT,
    created_at  DATETIME        NOT NULL DEFAULT NOW(),
    updated_at  DATETIME        NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (product_id)
);

-- 프로덕트 특징
CREATE TABLE IF NOT EXISTS product_feature (
    feature_id  INT             NOT NULL AUTO_INCREMENT,
    product_id  INT             NOT NULL,
    content     VARCHAR(500)    NOT NULL,
    sort_order  INT             NOT NULL DEFAULT 0,
    PRIMARY KEY (feature_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE
);

-- 프로덕트 이미지 (슬라이드)
CREATE TABLE IF NOT EXISTS product_image (
    image_id    INT             NOT NULL AUTO_INCREMENT,
    product_id  INT             NOT NULL,
    image_path  VARCHAR(500)    NOT NULL,
    sort_order  INT             NOT NULL DEFAULT 0,
    PRIMARY KEY (image_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE
);

-- 언론보도 (News)
CREATE TABLE IF NOT EXISTS press (
    press_id        INT             NOT NULL AUTO_INCREMENT,
    title           VARCHAR(200)    NOT NULL,
    content         LONGTEXT,
    thumbnail_path  VARCHAR(500),
    source_url      VARCHAR(1000),
    created_at      DATETIME        NOT NULL DEFAULT NOW(),
    updated_at      DATETIME        NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (press_id)
);

-- 유튜브 영상 (Video)
CREATE TABLE IF NOT EXISTS video (
    video_id        INT             NOT NULL AUTO_INCREMENT,
    title           VARCHAR(200)    NOT NULL,
    youtube_url     VARCHAR(500)    NOT NULL,
    description     TEXT,
    created_at      DATETIME        NOT NULL DEFAULT NOW(),
    updated_at      DATETIME        NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (video_id)
);

-- 동적 게시판 정의 (Technology/About 메뉴 하위에 동적 추가)
CREATE TABLE IF NOT EXISTS board (
    board_id      INT          NOT NULL AUTO_INCREMENT,
    board_name    VARCHAR(100) NOT NULL COMMENT '메뉴에 표시될 게시판 이름',
    menu_group    VARCHAR(20)  NOT NULL COMMENT 'technology / about',
    board_type    VARCHAR(20)  NOT NULL DEFAULT 'list' COMMENT 'list(목록형) / gallery(갤러리형)',
    display_order INT          NOT NULL DEFAULT 0 COMMENT '메뉴 내 정렬 순서',
    use_yn        CHAR(1)      NOT NULL DEFAULT 'Y' COMMENT '노출 여부 Y/N',
    created_at    DATETIME     NOT NULL DEFAULT NOW(),
    PRIMARY KEY (board_id)
);

-- 동적 게시판 게시글
CREATE TABLE IF NOT EXISTS board_post (
    post_id     INT          NOT NULL AUTO_INCREMENT,
    board_id    INT          NOT NULL,
    title       VARCHAR(200) NOT NULL,
    content     LONGTEXT     COMMENT 'Quill 에디터 HTML (이미지 본문 삽입)',
    view_count  INT          NOT NULL DEFAULT 0,
    created_at  DATETIME     NOT NULL DEFAULT NOW(),
    updated_at  DATETIME     NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (post_id),
    FOREIGN KEY (board_id) REFERENCES board(board_id) ON DELETE CASCADE
);

-- 에디터 업로드 이미지
CREATE TABLE IF NOT EXISTS editor_image (
    image_id    INT             NOT NULL AUTO_INCREMENT,
    image_path  VARCHAR(500)    NOT NULL,
    created_at  DATETIME        NOT NULL DEFAULT NOW(),
    PRIMARY KEY (image_id)
);

-- =============================================
-- 초기 관리자 계정 (비밀번호는 평문, 필요시 해시로 변경)
-- INSERT INTO admin (admin_name, admin_pw) VALUES ('admin', 'windy@0136');
-- =============================================
