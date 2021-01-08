USE SingerSongwriter;

DROP PROCEDURE IF EXISTS fill_date_dimension;
DELIMITER //
CREATE PROCEDURE fill_date_dimension(IN startdate DATE,IN stopdate DATE)
BEGIN
    DECLARE currentdate DATE;
    SET currentdate = startdate;
    WHILE currentdate <= stopdate DO
        INSERT INTO dimDate (`Month`,  `Day`, `Year`,WeekNumberOfYear,`Date`) VALUES (
                        MONTH(currentdate),
                         DAY(currentdate),
                         YEAR(currentdate),
                        WEEKOFYEAR(currentdate),
                        currentdate);
        SET currentdate = ADDDATE(currentdate,INTERVAL 1 DAY);
    END WHILE;
END
//
DELIMITER ;

CALL fill_date_dimension('1800-01-01','2021-01-07');