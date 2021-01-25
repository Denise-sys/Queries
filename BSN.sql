The BSN is the citizen service number, a unique registration number for everyone who lives in the Netherlands. 
It's able to validate a BSN via check digit proof; 

CREATE OR REPLACE FUNCTION BSNPROEF(BSN_NR_VARCHAR2)
RETURN VARCHAR2
    AS i INT :=1;
    totaal INT :=0;
    VAR_BSN INT; 
    
BEGIN 
VAR_BSN := TO_NUMBER(BSN_NR);
totaal := (-1*MOD(VAR_BSN,10));
   WHILE i < 9 
    LOOP
    i:= i + 1;
    totaal := totaal +(i*MOD(VAR_BSN,10)):
    VAR_BSN := (VAR_BSN - MOD(VAR_BSN,10))/10;
    END LOOP;

  IF MOD(totaal,11) = 0 AND totaal != 0 THEN
  RETURN LPAD(BSN_NR, 9, '0');
  END IF;
  
EXCEPTION
  WHEN VALUE_ERROR THEN RETURN NULL;
END;