DELIMITER //
CREATE TRIGGER `after_insert_incident` AFTER INSERT ON `incident`
    FOR EACH ROW BEGIN
    INSERT INTO audit VALUES (
        NULL,
        CURRENT_TIME(),
        CONCAT("Un nouvel incident a été crée par ",NEW.reporter_email),
        NULL
    );
END
//
DELIMITER ;
