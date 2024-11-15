--==============================================================
-- Nom de la base :  ENTRPR
-- Nom de SGBD :  RQ_ORACLE
-- Date de création :  2023-02-07 14:57:28
--==============================================================


CREATE SEQUENCE AT_S_NO_SEQ_SAIS
INCREMENT BY 1
START WITH 1
 MAXVALUE 999999999999
 MINVALUE 1;

--==============================================================
-- Table : AT_BASSN_CAS
--==============================================================
CREATE TABLE AT_BASSN_CAS (
   NO_SEQ_PROCS         NUMBER(10)            NOT NULL,
   NO_SEQ_DEM           NUMBER(12),
   NO_SEQ_DOC           NUMBER(12),
   NO_SEQ_VERIF_A_POSTR NUMBER(12),
   NO_SEQ_SAIS          NUMBER(12),
   NO_SEQ_TACHE         NUMBER(10),
   COD_PROCS            VARCHAR2(30)          NOT NULL,
   COD_ETAT_PROCS       VARCHAR2(15),
   COD_ROLE_ASSIGN      VARCHAR2(25),
   LOGON_ASSIGN         CHAR(7),
   NO_VERSI             NUMBER(10),
   NOM_TACHE            VARCHAR2(100),
   COD_LANG_OFFCL       CHAR(1),
   NO_TPS               VARCHAR2(15),
   COD_BSF              VARCHAR2(7),
   NOM_CLINT            VARCHAR2(100),
   PREN_CLINT           VARCHAR2(100),
   LOGON_TACHE_PRE      CHAR(7),
   IND_TACHE_TERMI      NUMBER(1)            DEFAULT 0  NOT NULL
      CONSTRAINT CK_01_IND_TACHE_TERMI CHECK (IND_TACHE_TERMI IN (0,1)),
   IND_TACHE_REVIS      NUMBER(1)            DEFAULT 0  NOT NULL
      CONSTRAINT CK_01_IND_TACHE_REVIS CHECK (IND_TACHE_REVIS IN (0,1)),
   DAT_CREA_TACHE       DATE                  NOT NULL,
   DAT_ACCEP_TACHE      DATE,
   COD_TACHE            VARCHAR2(20),
   DH_CREA              DATE                  NOT NULL,
   LOGON_CREA           CHAR(7)               NOT NULL,
   DH_MODIF             DATE,
   CONSTRAINT PK_01_AT_BASSN_CAS PRIMARY KEY (NO_SEQ_PROCS)
);

ALTER TABLE AT_DEM ADD COD_FAMIL_FOR VARCHAR2(25) Default 'DEFAUT' NOT NULL;

ALTER TABLE AT_EVEN ADD NO_SEQ_TACHE NUMBER(10);

--==============================================================
-- Table : AT_SAIS
--==============================================================
CREATE TABLE AT_SAIS (
   NO_SEQ_SAIS          NUMBER(12)            NOT NULL,
   NO_SDU               CHAR(16),
   COD_TYP_DEM          VARCHAR2(50)          NOT NULL,
   COD_TYP_SAIS         VARCHAR2(30)          NOT NULL,
   COD_SYS_PROP         CHAR(2),
   COD_REPER            VARCHAR2(30),
   VAL_1_NO_REPER       VARCHAR2(30),
   VAL_2_NO_REPER       VARCHAR2(30),
   VAL_3_NO_REPER       VARCHAR2(30),
   CLE_DOC_VOUTE        VARCHAR2(80),
   DAT_RECEP_RQ         DATE,
   COD_FAMIL_FOR        VARCHAR2(25)          NOT NULL,
   LOGON_CREA           CHAR(7)               NOT NULL,
   DH_CREA              DATE                 DEFAULT SYSDATE  NOT NULL,
   CONSTRAINT PK_01_AT_SAIS PRIMARY KEY (NO_SEQ_SAIS)
);


/** ne pas faire pusique que la vrai vue est fait dans un autre script
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
  DAT_CREA_TACHE,
  MONT_REMB,
  DAT_DEB_PER,
  DAT_FIN_PER,
  COD_MOTIF,
  DEM_REMB_EFFEC
) 
  BEQUEATH DEFINER
AS
SELECT
   BAS.NO_SEQ_PROCS                            AS NO_SEQ_PROCS,
   DEM.NO_SEQ_DEM                              AS NO_SEQ_DEM,
   BAS.NO_SEQ_DOC                              AS NO_SEQ_DOC,
   BAS.NO_SEQ_VERIF_A_POSTR 		           AS NO_SEQ_VERIF_A_POSTR,
   BAS.NO_SEQ_SAIS                             AS NO_SEQ_SAIS,
   COALESCE(DEM.COD_TYP_DEM, SA.COD_TYP_DEM)   AS COD_TYP_DEM,
   DEM.COD_NAT_DEM                             AS COD_NAT_DEM,
   COALESCE(DEM.NO_SDU, SA.NO_SDU)             AS NO_SDU,
   COALESCE(DEM.DAT_RECEP_RQ, SA.DAT_RECEP_RQ) AS DAT_RECEP_RQ,
   SA.COD_TYP_SAIS 					           AS COD_TYP_SAIS,
   BAS.NO_SEQ_TACHE                            AS NO_SEQ_TACHE,
   BAS.COD_PROCS                               AS COD_PROCS,
   BAS.COD_ETAT_PROCS                          AS COD_ETAT_PROCS,
   BAS.COD_ROLE_ASSIGN                         AS COD_ROLE_ASSIGN,
   BAS.LOGON_ASSIGN                            AS LOGON_ASSIGN,
   BAS.NO_VERSI                                AS NO_VERSI,
   BAS.NOM_TACHE                               AS NOM_TACHE,
   BAS.COD_LANG_OFFCL                          AS COD_LANG_OFFCL,
   BAS.NO_TPS                                  AS NO_TPS,
   BAS.COD_BSF                                 AS COD_BSF,
   BAS.NOM_CLINT                               AS NOM_CLINT,
   BAS.PREN_CLINT                              AS PREN_CLINT,
   BAS.LOGON_TACHE_PRE                         AS LOGON_TACHE_PRE,
   BAS.IND_TACHE_TERMI                         AS IND_TACHE_TERMI,
   BAS.IND_TACHE_REVIS                         AS IND_TACHE_REVIS,
   BAS.DAT_CREA_TACHE                          AS DAT_CREA_TACHE,
   COALESCE(ELE_MONT_REMB_PS.VAL_ATTRB_NB_DECIML, ELE_MONT_REMB_SU.VAL_ATTRB_NB_DECIML, ELE_MONT_REMB_RS.VAL_ATTRB_NB_DECIML, ELE_MONT_REMB_DS.VAL_ATTRB_NB_DECIML) AS MONT_REMB,
   COALESCE(ELE_DAT_PER_DEB_PS.VAL_ATTRB_DAT, ELE_DAT_PER_DEB_SU.VAL_ATTRB_DAT, ELE_DAT_PER_DEB_RS.VAL_ATTRB_DAT, ELE_DAT_PER_DEB_DS.VAL_ATTRB_DAT) AS DAT_DEB_PER,
   COALESCE(ELE_DAT_PER_FIN_PS.VAL_ATTRB_DAT, ELE_DAT_PER_FIN_SU.VAL_ATTRB_DAT, ELE_DAT_PER_FIN_RS.VAL_ATTRB_DAT, ELE_DAT_PER_FIN_DS.VAL_ATTRB_DAT) AS DAT_FIN_PER,
   COALESCE(ELE_COD_MOTIF_PS.VAL_ATTRB_CHAIN, ELE_COD_MOTIF_SU.VAL_ATTRB_CHAIN, ELE_COD_MOTIF_RS.VAL_ATTRB_CHAIN, ELE_COD_MOTIF_DS.VAL_ATTRB_CHAIN) AS COD_MOTIF,
   DECODE(COALESCE(ELE_DEM_REMB_EFFEC_PARTI_PS.VAL_ATTRB_CHAIN, ELE_DEM_REMB_EFFEC_PARTI_SU.VAL_ATTRB_CHAIN, ELE_DEM_REMB_EFFEC_PARTI_RS.VAL_ATTRB_CHAIN, ELE_DEM_REMB_EFFEC_PARTI_DS.VAL_ATTRB_CHAIN), 1, 'COCHE', 0, 'NON-COCHE') AS DEM_REMB_EFFEC
FROM
              AT_BASSN_CAS           BAS 
    LEFT JOIN AT_DEM                 DEM             ON DEM.NO_SEQ_DEM = BAS.NO_SEQ_DEM
    LEFT JOIN AT_SAIS                SA				 ON SA.NO_SEQ_SAIS = BAS.NO_SEQ_SAIS	
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
**/

ALTER TABLE AT_BASSN_CAS
   ADD CONSTRAINT FK_01_AT_SAIS FOREIGN KEY (NO_SEQ_SAIS)
      REFERENCES AT_SAIS (NO_SEQ_SAIS);

ALTER TABLE AT_BASSN_CAS
   ADD CONSTRAINT FK_03_AT_VERIF_A_POSTR FOREIGN KEY (NO_SEQ_VERIF_A_POSTR)
      REFERENCES AT_VERIF_A_POSTR (NO_SEQ_VERIF_A_POSTR);

ALTER TABLE AT_BASSN_CAS
   ADD CONSTRAINT FK_07_AT_DOC FOREIGN KEY (NO_SEQ_DOC)
      REFERENCES AT_DOC (NO_SEQ_DOC);

ALTER TABLE AT_BASSN_CAS
   ADD CONSTRAINT FK_11_AT_DEM FOREIGN KEY (NO_SEQ_DEM)
      REFERENCES AT_DEM (NO_SEQ_DEM);


--grants et synonymes

CREATE OR REPLACE PUBLIC SYNONYM AT_S_NO_SEQ_SAIS FOR AT_S_NO_SEQ_SAIS;
GRANT SELECT ON AT_S_NO_SEQ_SAIS TO ROLE_AT_R_ALL;
GRANT SELECT ON AT_S_NO_SEQ_SAIS TO ROLE_AT_RW_ALL;
GRANT SELECT ON AT_S_NO_SEQ_SAIS TO AT1PP_PLSQL;
--GRANT SELECT ON AT_S_NO_SEQ_SAIS TO ROLE_CELLULE_RW_ALL;

Create Or Replace Public Synonym AT_BASSN_CAS For AT_BASSN_CAS;
GRANT DELETE, INSERT, SELECT, UPDATE ON AT_BASSN_CAS TO AT1PP_PLSQL;
GRANT SELECT ON AT_BASSN_CAS TO ROLE_AT_R_ALL;
GRANT DELETE, INSERT, SELECT, UPDATE ON AT_BASSN_CAS TO ROLE_AT_RW_ALL;
--GRANT DELETE, INSERT, SELECT, UPDATE ON AT_BASSN_CAS TO ROLE_CELLULE_RW_ALL;

Create Or Replace Public Synonym AT_SAIS For AT_SAIS;
GRANT DELETE, INSERT, SELECT, UPDATE ON AT_SAIS TO AT1PP_PLSQL;
GRANT SELECT ON AT_SAIS TO ROLE_AT_R_ALL;
GRANT DELETE, INSERT, SELECT, UPDATE ON AT_SAIS TO ROLE_AT_RW_ALL;
--GRANT DELETE, INSERT, SELECT, UPDATE ON AT_SAIS TO ROLE_CELLULE_RW_ALL;

Create Or Replace Public Synonym AT_V_BUR_VIRTL For AT_V_BUR_VIRTL;
GRANT DELETE, INSERT, SELECT, UPDATE ON AT_V_BUR_VIRTL TO AT1PP_PLSQL;
GRANT SELECT ON AT_V_BUR_VIRTL TO ROLE_AT_R_ALL;
GRANT DELETE, INSERT, SELECT, UPDATE ON AT_V_BUR_VIRTL TO ROLE_AT_RW_ALL;
--GRANT DELETE, INSERT, SELECT, UPDATE ON AT_V_BUR_VIRTL TO ROLE_CELLULE_RW_ALL;


