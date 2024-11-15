/*********************************************************************
   Généré par le script : 3_EDO_ModifierTableSvueM.vbs
   Modèle d'origine     : AT1_EDO_Service de remboursement de taxes
   Produit par          : RIRC001
   Date de mise à jour  : 2023-02-28
   Description          : Script de rafraîchissement des vues M suite à une modification des tables historiques (tables S).
   Domaine (destination): EIRQ
   Schéma (destination) : AT1PP
*********************************************************************/
create or replace view ATMDEM as 
select 
    S_CODE_MAJ_SO,
    S_IND_SUPPR_SO,
    S_CLE_REPER_LIGN,
    S_IND_MAJ_CLE_PRIMR_SO,
    S_DATE_DEB_EFFEC_SO,
    S_DATE_FIN_EFFEC_SO,
    S_IDENT_TABL_COMPL,
    NO_SEQ_DEM,
    DH_CREA_DEM,
    COD_NAT_DEM,
    COD_SOURC_DEM,
    COD_TYP_DEM,
    NO_SDU,
    DAT_DEB_PER,
    DAT_FIN_PER,
    DAT_RECEP_RQ,
    PER_FISC,
    COT_RISQ,
    DAT_PROD_COT_RISQ,
    NO_USAG,
    TYP_SDU,
    SEQ_SDU,
    NO_VERSI_DEM,
    COD_TYP_DEM_JUML,
    COD_FAMIL_FOR
from ATSDEM;

create or replace view ATMEVEN as 
select 
    S_CODE_MAJ_SO,
    S_IND_SUPPR_SO,
    S_CLE_REPER_LIGN,
    S_IND_MAJ_CLE_PRIMR_SO,
    S_DATE_DEB_EFFEC_SO,
    S_DATE_FIN_EFFEC_SO,
    S_IDENT_TABL_COMPL,
    NO_SEQ_EVEN,
    COD_TYP_EVEN,
    COD_EVEN,
    DH_EVEN,
    LOGON_INSCR_EVEN,
    NO_SDU,
    NO_USAG,
    TYP_SDU,
    SEQ_SDU,
    NO_SEQ_TACHE
from ATSEVEN;


