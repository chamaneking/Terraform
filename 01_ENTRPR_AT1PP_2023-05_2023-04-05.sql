--==============================================================
-- Nom de la base :  ENTRPR
-- Nom de SGBD :  RQ_ORACLE
-- Date de création :  2023-04-05 12:36:06
--==============================================================


--DROP VIEW AT_V_BUR_VIRTL;

--==============================================================
-- Vue : AT_V_BUR_VIRTL
--==============================================================
CREATE OR REPLACE VIEW AT_V_BUR_VIRTL(
  NO_SEQ_PROCS,
  NO_SEQ_DEM,
  NO_SEQ_DOC,
  NO_SEQ_VERIF_A_POSTR,
  NO_SEQ_SAIS,
  COD_TYP_DEM,
  COD_NAT_DEM,
  NO_SDU,
  DAT_RECEP_RQ,
  COD_TYP_SAIS,
  NO_SEQ_TACHE,
  COD_PROCS,
  COD_ETAT_PROCS,
  COD_ROLE_ASSIGN,
  LOGON_ASSIGN,
  NO_VERSI,
  NOM_TACHE,
  COD_LANG_OFFCL,
  NO_TPS,
  COD_BSF,
  NOM_CLINT,
  PREN_CLINT,
  LOGON_TACHE_PRE,
  IND_TACHE_TERMI,
  IND_TACHE_REVIS,
  VAL_1_NO_REPER,
  VAL_2_NO_REPER,
  DAT_ACCEP_TACHE,
  DAT_CREA_TACHE,
  MONT_REMB,
  DAT_DEB_PER,
  DAT_FIN_PER,
  COD_MOTIF,
  DEM_REMB_EFFEC,
  LOGON_CREA,
  COD_FAMIL_FOR,
  TACHE_CHEF_EQUIP,
  TACHE_AGENT_SAIS,
  TACHE_AGENT_OUV_CPT,
  TACHE_AGENT_CONFOR,
  TACHE_VERIF,
  COD_TACHE
) 
  BEQUEATH DEFINER
AS
SELECT
   BAS.NO_SEQ_PROCS                                 AS NO_SEQ_PROCS,
   DEM.NO_SEQ_DEM                                   AS NO_SEQ_DEM,
   BAS.NO_SEQ_DOC                                   AS NO_SEQ_DOC,
   BAS.NO_SEQ_VERIF_A_POSTR 		                AS NO_SEQ_VERIF_A_POSTR,
   BAS.NO_SEQ_SAIS                                  AS NO_SEQ_SAIS,
   COALESCE(DEM.COD_TYP_DEM, SA.COD_TYP_DEM)        AS COD_TYP_DEM,
   DEM.COD_NAT_DEM                                  AS COD_NAT_DEM,
   COALESCE(DEM.NO_SDU, SA.NO_SDU)                  AS NO_SDU,
   COALESCE(DEM.DAT_RECEP_RQ, SA.DAT_RECEP_RQ)      AS DAT_RECEP_RQ,
   SA.COD_TYP_SAIS 					                AS COD_TYP_SAIS,
   BAS.NO_SEQ_TACHE                                 AS NO_SEQ_TACHE,
   BAS.COD_PROCS                                    AS COD_PROCS,
   BAS.COD_ETAT_PROCS                               AS COD_ETAT_PROCS,
   BAS.COD_ROLE_ASSIGN                              AS COD_ROLE_ASSIGN,
   BAS.LOGON_ASSIGN                                 AS LOGON_ASSIGN,
   BAS.NO_VERSI                                     AS NO_VERSI,
   BAS.NOM_TACHE                                    AS NOM_TACHE,
   BAS.COD_LANG_OFFCL                               AS COD_LANG_OFFCL,
   BAS.NO_TPS                                       AS NO_TPS,
   BAS.COD_BSF                                      AS COD_BSF,
   BAS.NOM_CLINT                                    AS NOM_CLINT,
   BAS.PREN_CLINT                                   AS PREN_CLINT,
   BAS.LOGON_TACHE_PRE                              AS LOGON_TACHE_PRE,
   BAS.IND_TACHE_TERMI                              AS IND_TACHE_TERMI,
   BAS.IND_TACHE_REVIS                              AS IND_TACHE_REVIS,
   COALESCE(CLE.VAL_1_NO_REPER, SA.VAL_1_NO_REPER)  AS VAL_1_NO_REPER,
   COALESCE(CLE.VAL_2_NO_REPER, SA.VAL_2_NO_REPER)  AS VAL_2_NO_REPER,
   BAS.DAT_ACCEP_TACHE                              AS DAT_ACCEP_TACHE,
   BAS.DAT_CREA_TACHE                               AS DAT_CREA_TACHE,
   COALESCE(ELE_MONT_REMB_PS.VAL_ATTRB_NB_DECIML, ELE_MONT_REMB_SU.VAL_ATTRB_NB_DECIML, ELE_MONT_REMB_RS.VAL_ATTRB_NB_DECIML, ELE_MONT_REMB_DS.VAL_ATTRB_NB_DECIML) AS MONT_REMB,
   COALESCE(ELE_DAT_PER_DEB_PS.VAL_ATTRB_DAT, ELE_DAT_PER_DEB_SU.VAL_ATTRB_DAT, ELE_DAT_PER_DEB_RS.VAL_ATTRB_DAT, ELE_DAT_PER_DEB_DS.VAL_ATTRB_DAT) AS DAT_DEB_PER,
   COALESCE(ELE_DAT_PER_FIN_PS.VAL_ATTRB_DAT, ELE_DAT_PER_FIN_SU.VAL_ATTRB_DAT, ELE_DAT_PER_FIN_RS.VAL_ATTRB_DAT, ELE_DAT_PER_FIN_DS.VAL_ATTRB_DAT) AS DAT_FIN_PER,
   COALESCE(ELE_COD_MOTIF_PS.VAL_ATTRB_CHAIN, ELE_COD_MOTIF_SU.VAL_ATTRB_CHAIN, ELE_COD_MOTIF_RS.VAL_ATTRB_CHAIN, ELE_COD_MOTIF_DS.VAL_ATTRB_CHAIN) AS COD_MOTIF,
   DECODE(COALESCE(ELE_DEM_REMB_EFFEC_PARTI_PS.VAL_ATTRB_CHAIN, ELE_DEM_REMB_EFFEC_PARTI_SU.VAL_ATTRB_CHAIN, ELE_DEM_REMB_EFFEC_PARTI_RS.VAL_ATTRB_CHAIN, ELE_DEM_REMB_EFFEC_PARTI_DS.VAL_ATTRB_CHAIN), 1, 'COCHE', 0, 'NON-COCHE') AS DEM_REMB_EFFEC,
   BAS.LOGON_CREA                                   AS LOGON_CREA,
   COALESCE(DEM.COD_FAMIL_FOR, SA.COD_FAMIL_FOR)    AS COD_FAMIL_FOR,
   COD_TACHE                                        AS TACHE_CHEF_EQUIP,
   COD_TACHE                                        AS TACHE_AGENT_SAIS,
   COD_TACHE                                        AS TACHE_AGENT_OUV_CPT,
   COD_TACHE                                        AS TACHE_AGENT_CONFOR,
   COD_TACHE                                        AS TACHE_VERIF,
   COD_TACHE                                        AS COD_TACHE
FROM
              AT_BASSN_CAS           BAS 
    LEFT JOIN AT_DEM                 DEM             ON DEM.NO_SEQ_DEM = BAS.NO_SEQ_DEM
    LEFT JOIN AT_SAIS                SA				 ON SA.NO_SEQ_SAIS = BAS.NO_SEQ_SAIS
    LEFT JOIN AT_CLE_DEM             CLE             ON CLE.NO_SEQ_DEM = BAS.NO_SEQ_DEM
    LEFT JOIN AT_ELE_DONN_MISS ELE_MONT_REMB_PS      ON ELE_MONT_REMB_PS.NO_SEQ_DOC = BAS.NO_SEQ_DOC
                                                        AND ELE_MONT_REMB_PS.COD_ATTRB = '1049'
                                                        AND ELE_MONT_REMB_PS.VAL_PERMI = 'PS'
    LEFT JOIN AT_ELE_DONN_MISS ELE_MONT_REMB_SU      ON ELE_MONT_REMB_SU.NO_SEQ_DOC = BAS.NO_SEQ_DOC
                                                        AND ELE_MONT_REMB_SU.COD_ATTRB = '1049'
                                                        AND ELE_MONT_REMB_SU.VAL_PERMI = 'SU'
    LEFT JOIN AT_ELE_DONN_MISS ELE_MONT_REMB_RS      ON ELE_MONT_REMB_RS.NO_SEQ_DOC = BAS.NO_SEQ_DOC
                                                        AND ELE_MONT_REMB_RS.COD_ATTRB = '1049'
                                                        AND ELE_MONT_REMB_RS.VAL_PERMI = 'RS'
    LEFT JOIN AT_ELE_DONN_MISS ELE_MONT_REMB_DS      ON ELE_MONT_REMB_DS.NO_SEQ_DOC = BAS.NO_SEQ_DOC
                                                        AND ELE_MONT_REMB_DS.COD_ATTRB = '1049'
                                                        AND ELE_MONT_REMB_DS.VAL_PERMI = 'DS'
    LEFT JOIN AT_ELE_DONN_MISS ELE_DAT_PER_DEB_PS    ON ELE_DAT_PER_DEB_PS.NO_SEQ_DOC = BAS.NO_SEQ_DOC
                                                        AND ELE_DAT_PER_DEB_PS.COD_ATTRB = '1047'
                                                        AND ELE_DAT_PER_DEB_PS.VAL_PERMI = 'PS'
    LEFT JOIN AT_ELE_DONN_MISS ELE_DAT_PER_DEB_SU    ON ELE_DAT_PER_DEB_SU.NO_SEQ_DOC = BAS.NO_SEQ_DOC
                                                        AND ELE_DAT_PER_DEB_SU.COD_ATTRB = '1047'
                                                        AND ELE_DAT_PER_DEB_SU.VAL_PERMI = 'SU'
    LEFT JOIN AT_ELE_DONN_MISS ELE_DAT_PER_DEB_RS    ON ELE_DAT_PER_DEB_RS.NO_SEQ_DOC = BAS.NO_SEQ_DOC
                                                        AND ELE_DAT_PER_DEB_RS.COD_ATTRB = '1047'
                                                        AND ELE_DAT_PER_DEB_RS.VAL_PERMI = 'RS'
    LEFT JOIN AT_ELE_DONN_MISS ELE_DAT_PER_DEB_DS    ON ELE_DAT_PER_DEB_DS.NO_SEQ_DOC = BAS.NO_SEQ_DOC
                                                        AND ELE_DAT_PER_DEB_DS.COD_ATTRB = '1047'
                                                        AND ELE_DAT_PER_DEB_DS.VAL_PERMI = 'DS'
    LEFT JOIN AT_ELE_DONN_MISS ELE_DAT_PER_FIN_PS    ON ELE_DAT_PER_FIN_PS.NO_SEQ_DOC = BAS.NO_SEQ_DOC
                                                        AND ELE_DAT_PER_FIN_PS.COD_ATTRB = '1048'
                                                        AND ELE_DAT_PER_FIN_PS.VAL_PERMI = 'PS'
    LEFT JOIN AT_ELE_DONN_MISS ELE_DAT_PER_FIN_SU    ON ELE_DAT_PER_FIN_SU.NO_SEQ_DOC = BAS.NO_SEQ_DOC
                                                        AND ELE_DAT_PER_FIN_SU.COD_ATTRB = '1048'
                                                        AND ELE_DAT_PER_FIN_SU.VAL_PERMI = 'SU'
    LEFT JOIN AT_ELE_DONN_MISS ELE_DAT_PER_FIN_RS    ON ELE_DAT_PER_FIN_RS.NO_SEQ_DOC = BAS.NO_SEQ_DOC
                                                        AND ELE_DAT_PER_FIN_RS.COD_ATTRB = '1048'
                                                        AND ELE_DAT_PER_FIN_RS.VAL_PERMI = 'RS'
    LEFT JOIN AT_ELE_DONN_MISS ELE_DAT_PER_FIN_DS    ON ELE_DAT_PER_FIN_DS.NO_SEQ_DOC = BAS.NO_SEQ_DOC
                                                        AND ELE_DAT_PER_FIN_DS.COD_ATTRB = '1048'
                                                        AND ELE_DAT_PER_FIN_DS.VAL_PERMI = 'DS'
    LEFT JOIN AT_ELE_DONN_MISS ELE_COD_MOTIF_PS      ON ELE_COD_MOTIF_PS.NO_SEQ_DOC = BAS.NO_SEQ_DOC
                                                        AND ELE_COD_MOTIF_PS.COD_ATTRB = '8017'
                                                        AND ELE_COD_MOTIF_PS.VAL_PERMI = 'PS'
    LEFT JOIN AT_ELE_DONN_MISS ELE_COD_MOTIF_SU      ON ELE_COD_MOTIF_SU.NO_SEQ_DOC = BAS.NO_SEQ_DOC
                                                        AND ELE_COD_MOTIF_SU.COD_ATTRB = '8017'
                                                        AND ELE_COD_MOTIF_SU.VAL_PERMI = 'SU'
    LEFT JOIN AT_ELE_DONN_MISS ELE_COD_MOTIF_RS      ON ELE_COD_MOTIF_RS.NO_SEQ_DOC = BAS.NO_SEQ_DOC
                                                        AND ELE_COD_MOTIF_RS.COD_ATTRB = '8017'
                                                        AND ELE_COD_MOTIF_RS.VAL_PERMI = 'RS'
    LEFT JOIN AT_ELE_DONN_MISS ELE_COD_MOTIF_DS      ON ELE_COD_MOTIF_DS.NO_SEQ_DOC = BAS.NO_SEQ_DOC
                                                        AND ELE_COD_MOTIF_DS.COD_ATTRB = '8017'
                                                        AND ELE_COD_MOTIF_DS.VAL_PERMI = 'DS'
    LEFT JOIN AT_ELE_DONN_MISS ELE_DEM_REMB_EFFEC_PARTI_PS   ON ELE_DEM_REMB_EFFEC_PARTI_PS.NO_SEQ_DOC = BAS.NO_SEQ_DOC
                                                                AND ELE_DEM_REMB_EFFEC_PARTI_PS.COD_ATTRB = '7100'
                                                                AND ELE_DEM_REMB_EFFEC_PARTI_PS.VAL_PERMI = 'PS'
    LEFT JOIN AT_ELE_DONN_MISS ELE_DEM_REMB_EFFEC_PARTI_SU   ON ELE_DEM_REMB_EFFEC_PARTI_SU.NO_SEQ_DOC = BAS.NO_SEQ_DOC
                                                                AND ELE_DEM_REMB_EFFEC_PARTI_SU.COD_ATTRB = '7100'
                                                                AND ELE_DEM_REMB_EFFEC_PARTI_SU.VAL_PERMI = 'SU'
    LEFT JOIN AT_ELE_DONN_MISS ELE_DEM_REMB_EFFEC_PARTI_RS   ON ELE_DEM_REMB_EFFEC_PARTI_RS.NO_SEQ_DOC = BAS.NO_SEQ_DOC
                                                                AND ELE_DEM_REMB_EFFEC_PARTI_RS.COD_ATTRB = '7100'
                                                                AND ELE_DEM_REMB_EFFEC_PARTI_RS.VAL_PERMI = 'RS'
    LEFT JOIN AT_ELE_DONN_MISS ELE_DEM_REMB_EFFEC_PARTI_DS   ON ELE_DEM_REMB_EFFEC_PARTI_DS.NO_SEQ_DOC = BAS.NO_SEQ_DOC
                                                                AND ELE_DEM_REMB_EFFEC_PARTI_DS.COD_ATTRB = '7100'
                                                                AND ELE_DEM_REMB_EFFEC_PARTI_DS.VAL_PERMI = 'DS';

--grant et synonyme

Create Or Replace Public Synonym AT_V_BUR_VIRTL For AT_V_BUR_VIRTL;
GRANT DELETE, INSERT, SELECT, UPDATE ON AT_V_BUR_VIRTL TO AT1PP_PLSQL;
GRANT SELECT ON AT_V_BUR_VIRTL TO ROLE_AT_R_ALL;
GRANT DELETE, INSERT, SELECT, UPDATE ON AT_V_BUR_VIRTL TO ROLE_AT_RW_ALL;
--GRANT DELETE, INSERT, SELECT, UPDATE ON AT_V_BUR_VIRTL TO ROLE_CELLULE_RW_ALL;



