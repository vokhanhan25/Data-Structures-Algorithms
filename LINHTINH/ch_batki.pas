FUNCTION DOI_BK(N:INTEGER;SO:INTEGER):STRING;
VAR CH:CHAR;tam:string;
DU:INTEGER;
BEGIN
TAM:=&#39;&#39;;
WHILE N&gt;0 DO
BEGIN
DU:=N MOD SO;
IF DU&gt;=10 THEN
CH:=CHR(DU+55)
ELSE CH:=CHR(DU+48);
tam:=ch+tam;
N:=N DIV SO;
END;
DOI_BK:=TAM;
END;
