--==============================================================
-- Nom de la base :  ENTRPR
-- Nom de SGBD :  RQ_ORACLE
-- Date de création :  2023-04-06 11:28:45
--==============================================================


--DROP VIEW AT_V_BUR_VIRTL;

--==============================================================
-- Index : IX_01_AT_BASSN_CAS
--==============================================================
CREATE INDEX IX_01_AT_BASSN_CAS ON AT_BASSN_CAS (
   NO_SEQ_DEM ASC
);

--==============================================================
-- Index : IX_02_AT_BASSN_CAS
--==============================================================
CREATE INDEX IX_02_AT_BASSN_CAS ON AT_BASSN_CAS (
   NO_SEQ_SAIS ASC
);

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
   0                                                AS MONT_REMB,
   TO_DATE('01-01-2023', 'DD-MM-YYYY')              AS DAT_DEB_PER,
   TO_DATE('01-01-2023', 'DD-MM-YYYY')              AS DAT_FIN_PER,
   ''                                               AS COD_MOTIF,
   'NON-COCHE'                                      AS DEM_REMB_EFFEC,
   BAS.LOGON_CREA                                   AS LOGON_CREA,
   COALESCE(DEM.COD_FAMIL_FOR, SA.COD_FAMIL_FOR)    AS COD_FAMIL_FOR,
   BAS.COD_TACHE                                    AS TACHE_CHEF_EQUIP,
   BAS.COD_TACHE                                    AS TACHE_AGENT_SAIS,
   BAS.COD_TACHE                                    AS TACHE_AGENT_OUV_CPT,
   BAS.COD_TACHE                                    AS TACHE_AGENT_CONFOR,
   BAS.COD_TACHE                                    AS TACHE_VERIF,
   BAS.COD_TACHE                                    AS COD_TACHE
FROM
              AT_BASSN_CAS           BAS 
    LEFT JOIN AT_DEM                 DEM             ON DEM.NO_SEQ_DEM = BAS.NO_SEQ_DEM
    LEFT JOIN AT_SAIS                SA				 ON SA.NO_SEQ_SAIS = BAS.NO_SEQ_SAIS
    LEFT JOIN AT_CLE_DEM             CLE             ON CLE.NO_SEQ_DEM = BAS.NO_SEQ_DEM;



--grant et synonyme
Create Or Replace Public Synonym AT_V_BUR_VIRTL For AT_V_BUR_VIRTL;
GRANT DELETE, INSERT, SELECT, UPDATE ON AT_V_BUR_VIRTL TO AT1PP_PLSQL;
GRANT SELECT ON AT_V_BUR_VIRTL TO ROLE_AT_R_ALL;
GRANT DELETE, INSERT, SELECT, UPDATE ON AT_V_BUR_VIRTL TO ROLE_AT_RW_ALL;
--GRANT DELETE, INSERT, SELECT, UPDATE ON AT_V_BUR_VIRTL TO ROLE_CELLULE_RW_ALL;


