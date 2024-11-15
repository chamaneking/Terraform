/*********************************************************************
   Tâche : Produire_Scripts_Log_TRV.vbs     Produit par : RIRC001
   Le : 2023-02-28        Schéma : AT1PP
*********************************************************************/
 
Alter Table ATHDEM Add COD_FAMIL_FOR                           VARCHAR2(25);

Alter Table ATTDEM Add COD_FAMIL_FOR                           VARCHAR2(25);
 
Alter Table ATHEVEN Add NO_SEQ_TACHE                            NUMBER(10);

Alter Table ATTEVEN Add NO_SEQ_TACHE                            NUMBER(10);

/******************** Traitement de vues ***********************************/

Create or Replace View ATLDEM AS 
SELECT 
	T2.S_COMMIT_SCN_SOURC
	,T2.S_SEQ_JOURN
	,decode(T2.S_COD_OPER,
		'I', decode(fv,'D','U', 'U','U', T2.S_COD_OPER),
		'U', decode(fv,'I','I', t2.S_COD_OPER),
		T2.S_COD_OPER )   AS S_COD_OPER
	,T2.S_DAT_COMMIT
	,T2.S_NO_SEQ_REC_TRANS
	,T2.S_DAT_CMD_DML
	,T2.S_DAT_COMMM_DML_DEST
	,T2.S_NOM_SERVR_EXTRCT
	,T2.S_DB_INSTC
	,T2.S_LOGON_ID
	,T2.S_IND_ARCHIV
	,T2.NO_SEQ_DEM
	,T2.DH_CREA_DEM
	,T2.COD_NAT_DEM
	,T2.COD_SOURC_DEM
	,T2.COD_TYP_DEM
	,T2.NO_SDU
	,T2.DAT_DEB_PER
	,T2.DAT_FIN_PER
	,T2.DAT_RECEP_RQ
	,T2.PER_FISC
	,T2.COT_RISQ
	,T2.DAT_PROD_COT_RISQ
	,T2.NO_USAG
	,T2.TYP_SDU
	,T2.SEQ_SDU
	,T2.NO_VERSI_DEM
	,T2.COD_TYP_DEM_JUML
	,T2.COD_FAMIL_FOR
 FROM ATHDEM PARTITION (AT_P1_ACTV  ) T2,
 (SELECT max(S_SEQ_JOURN) OVER 
(PARTITION BY T1.S_COMMIT_SCN_SOURC,
              T1.NO_SEQ_DEM
     ORDER BY S_COMMIT_SCN_SOURC DESC, S_SEQ_JOURN DESC) AS max,
 min(S_SEQ_JOURN) OVER (PARTITION BY t1.S_COMMIT_SCN_SOURC,
              T1.NO_SEQ_DEM
     ORDER BY S_COMMIT_SCN_SOURC asc, S_SEQ_JOURN asc) AS min,
 LAST_VALUE(s_cod_oper) OVER 
(PARTITION BY t1.S_COMMIT_SCN_SOURC,
              T1.NO_SEQ_DEM
     ORDER BY S_COMMIT_SCN_SOURC asc, S_SEQ_JOURN asc
 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS lv,
 first_VALUE(S_COD_OPER) OVER 
(PARTITION BY t1.S_COMMIT_SCN_SOURC,
              T1.NO_SEQ_DEM
     ORDER BY S_COMMIT_SCN_SOURC asc, S_SEQ_JOURN asc 
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS fv,
lag(s_cod_oper)OVER 
(PARTITION BY t1.S_COMMIT_SCN_SOURC,
              T1.NO_SEQ_DEM
     ORDER BY S_COMMIT_SCN_SOURC DESC, S_SEQ_JOURN DESC) AS lag1,
 t1.*
 FROM ATHDEM PARTITION (AT_P1_ACTV  ) T1 ) T3
 where T2.S_COMMIT_SCN_SOURC = T3.S_COMMIT_SCN_SOURC
   AND T2.NO_SEQ_DEM = T3.NO_SEQ_DEM
   AND T2.s_cod_oper = T3.s_cod_oper 
   AND (T3.S_SEQ_JOURN = T3.min or T3.S_SEQ_JOURN = T3.max) 
   AND T3.S_SEQ_JOURN = T2.S_SEQ_JOURN 
   AND ( (T2.s_cod_oper ='D' and FV <> 'I'and fv <> T2.s_cod_oper) --u/d ->d 
    OR (T2.s_cod_oper ='D' and FV = 'D' and LV = 'D' and lag1 is null) --d 
    OR (T2.s_cod_oper ='U' and FV = 'U' and LV = 'U' and lag1 is null) --u 
    OR (T2.s_cod_oper ='I' and FV = 'I' and LV = 'I' and lag1 is null) --i 
    OR (T2.s_cod_oper ='U' and FV = 'I')  --i/U ->U 
    OR (T2.s_cod_oper ='U' and FV = 'D') 
    OR (T2.s_cod_oper ='I' and FV <> 'I') --U/I/D -> i 
 ); 
 
Create or Replace View ATLEVEN AS 
SELECT 
	T2.S_COMMIT_SCN_SOURC
	,T2.S_SEQ_JOURN
	,decode(T2.S_COD_OPER,
		'I', decode(fv,'D','U', 'U','U', T2.S_COD_OPER),
		'U', decode(fv,'I','I', t2.S_COD_OPER),
		T2.S_COD_OPER )   AS S_COD_OPER
	,T2.S_DAT_COMMIT
	,T2.S_NO_SEQ_REC_TRANS
	,T2.S_DAT_CMD_DML
	,T2.S_DAT_COMMM_DML_DEST
	,T2.S_NOM_SERVR_EXTRCT
	,T2.S_DB_INSTC
	,T2.S_LOGON_ID
	,T2.S_IND_ARCHIV
	,T2.NO_SEQ_EVEN
	,T2.COD_TYP_EVEN
	,T2.COD_EVEN
	,T2.DH_EVEN
	,T2.LOGON_INSCR_EVEN
	,T2.NO_SDU
	,T2.NO_USAG
	,T2.TYP_SDU
	,T2.SEQ_SDU
	,T2.NO_SEQ_TACHE
 FROM ATHEVEN PARTITION (AT_P1_ACTV  ) T2,
 (SELECT max(S_SEQ_JOURN) OVER 
(PARTITION BY T1.S_COMMIT_SCN_SOURC,
              T1.NO_SEQ_EVEN
     ORDER BY S_COMMIT_SCN_SOURC DESC, S_SEQ_JOURN DESC) AS max,
 min(S_SEQ_JOURN) OVER (PARTITION BY t1.S_COMMIT_SCN_SOURC,
              T1.NO_SEQ_EVEN
     ORDER BY S_COMMIT_SCN_SOURC asc, S_SEQ_JOURN asc) AS min,
 LAST_VALUE(s_cod_oper) OVER 
(PARTITION BY t1.S_COMMIT_SCN_SOURC,
              T1.NO_SEQ_EVEN
     ORDER BY S_COMMIT_SCN_SOURC asc, S_SEQ_JOURN asc
 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS lv,
 first_VALUE(S_COD_OPER) OVER 
(PARTITION BY t1.S_COMMIT_SCN_SOURC,
              T1.NO_SEQ_EVEN
     ORDER BY S_COMMIT_SCN_SOURC asc, S_SEQ_JOURN asc 
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS fv,
lag(s_cod_oper)OVER 
(PARTITION BY t1.S_COMMIT_SCN_SOURC,
              T1.NO_SEQ_EVEN
     ORDER BY S_COMMIT_SCN_SOURC DESC, S_SEQ_JOURN DESC) AS lag1,
 t1.*
 FROM ATHEVEN PARTITION (AT_P1_ACTV  ) T1 ) T3
 where T2.S_COMMIT_SCN_SOURC = T3.S_COMMIT_SCN_SOURC
   AND T2.NO_SEQ_EVEN = T3.NO_SEQ_EVEN
   AND T2.s_cod_oper = T3.s_cod_oper 
   AND (T3.S_SEQ_JOURN = T3.min or T3.S_SEQ_JOURN = T3.max) 
   AND T3.S_SEQ_JOURN = T2.S_SEQ_JOURN 
   AND ( (T2.s_cod_oper ='D' and FV <> 'I'and fv <> T2.s_cod_oper) --u/d ->d 
    OR (T2.s_cod_oper ='D' and FV = 'D' and LV = 'D' and lag1 is null) --d 
    OR (T2.s_cod_oper ='U' and FV = 'U' and LV = 'U' and lag1 is null) --u 
    OR (T2.s_cod_oper ='I' and FV = 'I' and LV = 'I' and lag1 is null) --i 
    OR (T2.s_cod_oper ='U' and FV = 'I')  --i/U ->U 
    OR (T2.s_cod_oper ='U' and FV = 'D') 
    OR (T2.s_cod_oper ='I' and FV <> 'I') --U/I/D -> i 
 ); 
