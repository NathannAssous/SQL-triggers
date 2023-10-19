DELIMITER //
CREATE TRIGGER after_update_incident
    AFTER UPDATE
    ON incident
    FOR EACH ROW
BEGIN
    INSERT INTO audit VALUES (
      NULL,
      CURRENT_TIME(),
      CONCAT("L'incident ",NEW.reference," a été modifié."),
      NULL
    )
END;
//

DELIMITER ;
