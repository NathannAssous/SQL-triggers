CREATE TABLE audit (
   `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `date`datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
   `message`longtext COLLATE utf8mb4_unicode_ci,
   `tech_email` VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
