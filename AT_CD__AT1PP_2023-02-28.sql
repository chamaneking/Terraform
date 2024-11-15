/*********************************************************************
   Produit par Creer_Script_Table_E.vbs     Produit par : RIRC001
   Le : 2023-02-28        Schéma : AT1PP
*********************************************************************/

/*==============================================*/
/*  Table : ATEDEM     */
/*==============================================*/

Alter Table ATEDEM Add    COD_FAMIL_FOR                           VARCHAR2(25)        ;

/*==============================================*/
/*  Table : ATEEVEN     */
/*==============================================*/

Alter Table ATEEVEN Add    NO_SEQ_TACHE                            NUMBER(10)          ;
--==============================================================
-- Vue : AT_DEM
--==============================================================
create or replace view AT_DEM 
as
SELECT 
     ATEDEM.S_SCN_SO, 
     ATEDEM.S_SEQ_MAJ_SO, 
     ATEDEM.S_CODE_MAJ_SO, 
     ATEDEM.S_DATE_PRCH_CD, 
     ATEDEM.S_DATE_DMAJ_CD, 
     ATEDEM.S_CODE_INTERV, 
     ATEDEM.S_NO_INTERV, 
     ATEDEM.S_DATE_DEB_EFFEC_CD, 
     ATEDEM.S_DATE_FIN_EFFEC_CD, 
     ATEDEM.S_DATE_DEB_EFFEC_SO, 
     ATEDEM.S_DATE_FIN_EFFEC_SO, 
     ATEDEM.S_IND_SUPPR_SO, 
     ATEDEM.S_REF_PHYS_SO, 
     ATEDEM.NO_SEQ_DEM, 
     ATEDEM.DH_CREA_DEM, 
     ATEDEM.COD_NAT_DEM, 
     ATEDEM.COD_SOURC_DEM, 
     ATEDEM.COD_TYP_DEM, 
     ATEDEM.NO_SDU, 
     ATEDEM.DAT_DEB_PER, 
     ATEDEM.DAT_FIN_PER, 
     ATEDEM.DAT_RECEP_RQ, 
     ATEDEM.PER_FISC, 
     ATEDEM.COT_RISQ, 
     ATEDEM.DAT_PROD_COT_RISQ, 
     ATEDEM.NO_USAG, 
     ATEDEM.TYP_SDU, 
     ATEDEM.SEQ_SDU, 
     ATEDEM.NO_VERSI_DEM, 
     ATEDEM.COD_TYP_DEM_JUML, 
     ATEDEM.COD_FAMIL_FOR
 FROM ATEDEM
   WHERE S_DATE_FIN_EFFEC_CD = TO_DATE('2999-12-31','YYYY-MM-DD');

--==============================================================
-- Vue : ATGDEM
--==============================================================
create or replace view ATGDEM 
as
SELECT 
     ATEDEM.S_SCN_SO, 
     ATEDEM.S_SEQ_MAJ_SO, 
     ATEDEM.S_CODE_MAJ_SO, 
     ATEDEM.S_DATE_PRCH_CD, 
     ATEDEM.S_DATE_DMAJ_CD, 
     ATEDEM.S_CODE_INTERV, 
     ATEDEM.S_NO_INTERV, 
     ATEDEM.S_DATE_DEB_EFFEC_CD, 
     ATEDEM.S_DATE_FIN_EFFEC_CD, 
     ATEDEM.S_DATE_DEB_EFFEC_SO, 
     ATEDEM.S_DATE_FIN_EFFEC_SO, 
     ATEDEM.S_IND_SUPPR_SO, 
     ATEDEM.S_REF_PHYS_SO, 
     ATEDEM.NO_SEQ_DEM, 
     ATEDEM.DH_CREA_DEM, 
     ATEDEM.COD_NAT_DEM, 
     ATEDEM.COD_SOURC_DEM, 
     ATEDEM.COD_TYP_DEM, 
     ATEDEM.NO_SDU, 
     ATEDEM.DAT_DEB_PER, 
     ATEDEM.DAT_FIN_PER, 
     ATEDEM.DAT_RECEP_RQ, 
     ATEDEM.PER_FISC, 
     ATEDEM.COT_RISQ, 
     ATEDEM.DAT_PROD_COT_RISQ, 
     ATEDEM.NO_USAG, 
     ATEDEM.TYP_SDU, 
     ATEDEM.SEQ_SDU, 
     ATEDEM.NO_VERSI_DEM, 
     ATEDEM.COD_TYP_DEM_JUML, 
     ATEDEM.COD_FAMIL_FOR
 FROM ATEDEM;

--==============================================================
-- Vue : AT_EVEN
--==============================================================
create or replace view AT_EVEN 
as
SELECT 
     ATEEVEN.S_SCN_SO, 
     ATEEVEN.S_SEQ_MAJ_SO, 
     ATEEVEN.S_CODE_MAJ_SO, 
     ATEEVEN.S_DATE_PRCH_CD, 
     ATEEVEN.S_DATE_DMAJ_CD, 
     ATEEVEN.S_CODE_INTERV, 
     ATEEVEN.S_NO_INTERV, 
     ATEEVEN.S_DATE_DEB_EFFEC_CD, 
     ATEEVEN.S_DATE_FIN_EFFEC_CD, 
     ATEEVEN.S_DATE_DEB_EFFEC_SO, 
     ATEEVEN.S_DATE_FIN_EFFEC_SO, 
     ATEEVEN.S_IND_SUPPR_SO, 
     ATEEVEN.S_REF_PHYS_SO, 
     ATEEVEN.NO_SEQ_EVEN, 
     ATEEVEN.COD_TYP_EVEN, 
     ATEEVEN.COD_EVEN, 
     ATEEVEN.DH_EVEN, 
     ATEEVEN.LOGON_INSCR_EVEN, 
     ATEEVEN.NO_SDU, 
     ATEEVEN.NO_USAG, 
     ATEEVEN.TYP_SDU, 
     ATEEVEN.SEQ_SDU, 
     ATEEVEN.NO_SEQ_TACHE
 FROM ATEEVEN
   WHERE S_DATE_FIN_EFFEC_CD = TO_DATE('2999-12-31','YYYY-MM-DD');

--==============================================================
-- Vue : ATGEVEN
--==============================================================
create or replace view ATGEVEN 
as
SELECT 
     ATEEVEN.S_SCN_SO, 
     ATEEVEN.S_SEQ_MAJ_SO, 
     ATEEVEN.S_CODE_MAJ_SO, 
     ATEEVEN.S_DATE_PRCH_CD, 
     ATEEVEN.S_DATE_DMAJ_CD, 
     ATEEVEN.S_CODE_INTERV, 
     ATEEVEN.S_NO_INTERV, 
     ATEEVEN.S_DATE_DEB_EFFEC_CD, 
     ATEEVEN.S_DATE_FIN_EFFEC_CD, 
     ATEEVEN.S_DATE_DEB_EFFEC_SO, 
     ATEEVEN.S_DATE_FIN_EFFEC_SO, 
     ATEEVEN.S_IND_SUPPR_SO, 
     ATEEVEN.S_REF_PHYS_SO, 
     ATEEVEN.NO_SEQ_EVEN, 
     ATEEVEN.COD_TYP_EVEN, 
     ATEEVEN.COD_EVEN, 
     ATEEVEN.DH_EVEN, 
     ATEEVEN.LOGON_INSCR_EVEN, 
     ATEEVEN.NO_SDU, 
     ATEEVEN.NO_USAG, 
     ATEEVEN.TYP_SDU, 
     ATEEVEN.SEQ_SDU, 
     ATEEVEN.NO_SEQ_TACHE
 FROM ATEEVEN;

