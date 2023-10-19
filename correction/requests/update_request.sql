UPDATE `incident` SET `status` = 'PROCESSING' WHERE `incident`.`id` = 5;
UPDATE `incident` SET `status` = 'NEW', `followed_by_id`=1 WHERE `incident`.`id` = 5;
