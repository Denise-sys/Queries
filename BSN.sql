The BSN is the citizen service number, a unique registration number for everyone who lives in the Netherlands. 
It's able to validate a BSN via check digit proof; 

DELIMITER $$ 
create function fn_elfproef (SofiNr int)
returns boolean
	BEGIN 
    DECLARE index_i INT;
    DECLARE totaal INT;
    
    SET totaal = 0;
    SET index_i = 9;
    
    WHILE index_i > 0 DO 
		SET index_i = index_i - 1; 
        SET totaal = totaal + (index_i * (SofiNr % 10));
        SET SofiNr = FLOOR(SofiNr / 10);
	END WHILE;
    
    RETURN (totaal % 11 = 0);
END; 
;

    
