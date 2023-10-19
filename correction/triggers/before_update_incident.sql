DELIMITER //
CREATE TRIGGER before_update_incident
    BEFORE UPDATE
    ON incident
    FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIME();
END;
//
DELIMITER;
