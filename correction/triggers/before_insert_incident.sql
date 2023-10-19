DELIMITER //
CREATE TRIGGER before_insert_incident
    BEFORE INSERT
    ON incident
    FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIME()
    SET NEW.reference = generate_reference()
    SET NEW.status = "NEW";
END;
//

DELIMITER;
