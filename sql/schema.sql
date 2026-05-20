-- =============================================
-- windy_homepage DB schema
-- =============================================

CREATE DATABASE IF NOT EXISTS windy_homepage DEFAULT CHARACTER SET utf8mb4;

CREATE USER IF NOT EXISTS 'windy_homepage'@'localhost' IDENTIFIED BY 'homepage@0136';
GRANT ALL PRIVILEGES ON windy_homepage.* TO 'windy_homepage'@'localhost';
FLUSH PRIVILEGES;

USE windy_homepage;

-- 관리자
CREATE TABLE admin (
    admin_id    INT             NOT NULL AUTO_INCREMENT,
    admin_name  VARCHAR(50)     NOT NULL,
    admin_pw    VARCHAR(255)    NOT NULL,
    PRIMARY KEY (admin_id)
);

-- 공지사항
CREATE TABLE notice (
    notice_id   INT             NOT NULL AUTO_INCREMENT,
    title       VARCHAR(200)    NOT NULL,
    content     LONGTEXT,
    created_at  DATETIME        NOT NULL DEFAULT NOW(),
    updated_at  DATETIME        NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (notice_id)
);

-- Contact Us
CREATE TABLE contact (
    contact_id  INT             NOT NULL AUTO_INCREMENT,
    name        VARCHAR(100)    NOT NULL,
    email       VARCHAR(100)    NOT NULL,
    subject     VARCHAR(200)    NOT NULL,
    content     TEXT            NOT NULL,
    created_at  DATETIME        NOT NULL DEFAULT NOW(),
    PRIMARY KEY (contact_id)
);

-- 포트폴리오
CREATE TABLE portfolio (
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

-- 기존 DB에 컬럼 추가 시 실행
-- ALTER TABLE portfolio ADD COLUMN category VARCHAR(20) NOT NULL DEFAULT 'AI' AFTER title;
-- ALTER TABLE portfolio ADD COLUMN summary VARCHAR(500) AFTER category;

-- 포트폴리오 이미지 (슬라이드)
CREATE TABLE portfolio_image (
    image_id        INT             NOT NULL AUTO_INCREMENT,
    portfolio_id    INT             NOT NULL,
    image_path      VARCHAR(500)    NOT NULL,
    sort_order      INT             NOT NULL DEFAULT 0,
    PRIMARY KEY (image_id),
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(portfolio_id) ON DELETE CASCADE
);

-- 연혁
CREATE TABLE history (
    history_id      INT             NOT NULL AUTO_INCREMENT,
    history_year    INT             NOT NULL,
    history_month   INT             NOT NULL,
    content         VARCHAR(500)    NOT NULL,
    created_at      DATETIME        NOT NULL DEFAULT NOW(),
    PRIMARY KEY (history_id)
);

-- 인증서/문서
CREATE TABLE certification (
    cert_id     INT             NOT NULL AUTO_INCREMENT,
    title       VARCHAR(200)    NOT NULL,
    file_path   VARCHAR(500)    NOT NULL,
    file_type   VARCHAR(10)     NOT NULL COMMENT 'pdf / png / jpg',
    created_at  DATETIME        NOT NULL DEFAULT NOW(),
    PRIMARY KEY (cert_id)
);

-- 프로덕트
CREATE TABLE product (
    product_id  INT             NOT NULL AUTO_INCREMENT,
    title       VARCHAR(200)    NOT NULL,
    summary     TEXT,
    created_at  DATETIME        NOT NULL DEFAULT NOW(),
    updated_at  DATETIME        NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (product_id)
);

-- 프로덕트 특징
CREATE TABLE product_feature (
    feature_id  INT             NOT NULL AUTO_INCREMENT,
    product_id  INT             NOT NULL,
    content     VARCHAR(500)    NOT NULL,
    sort_order  INT             NOT NULL DEFAULT 0,
    PRIMARY KEY (feature_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE
);

-- 프로덕트 이미지 (슬라이드)
CREATE TABLE product_image (
    image_id    INT             NOT NULL AUTO_INCREMENT,
    product_id  INT             NOT NULL,
    image_path  VARCHAR(500)    NOT NULL,
    sort_order  INT             NOT NULL DEFAULT 0,
    PRIMARY KEY (image_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE
);

-- 에디터 업로드 이미지
CREATE TABLE editor_image (
    image_id    INT             NOT NULL AUTO_INCREMENT,
    image_path  VARCHAR(500)    NOT NULL,
    created_at  DATETIME        NOT NULL DEFAULT NOW(),
    PRIMARY KEY (image_id)
);
