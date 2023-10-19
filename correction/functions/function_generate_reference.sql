DELIMITER //

CREATE FUNCTION generate_reference()
    RETURNS VARCHAR(9)
BEGIN
    DECLARE chars VARCHAR(26);
    DECLARE charLen INT;
    DECLARE reference VARCHAR(9);

    SET chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    SET charLen = LENGTH(chars);
    SET reference = DATE_FORMAT(NOW(), "%y%m");

    WHILE LENGTH(reference) < 9 DO
        SET reference = CONCAT(reference, SUBSTRING(chars, CEILING(RAND() * charLen), 1));
    END WHILE;

RETURN reference;
END;
//

DELIMITER ;
