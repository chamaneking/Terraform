/*********************************************************************
   Généré par le script : 7_MPD_CreerTableRepliqueeTrigger.vbs
   Modèle d'origine     : AT1_MPD_Service de remboursement de taxes
   Produit par          : RIRC001
   Date de mise à jour  : 2023-02-28
   Description          : Script de modification des tables de réplication transitoires correspondantes
                          aux tables opérationnelles répliquées (dans le schéma REPLPP)
                          et rafraîchissement de la commande (procédure) de création des triggers associés.
   Domaine (destination): EIRQ
   Schéma (destination) : AT1REPLPP
*********************************************************************/


alter table AT_DEM add COD_FAMIL_FOR VARCHAR2(25);

alter table AT_EVEN add NO_SEQ_TACHE NUMBER(10);

EXEC P_GENER_TRIGR_EDO('AT1REPLPP', 'AT_DEM','AT1PP','ATSDEM','AT1');
EXEC P_GENER_TRIGR_EDO('AT1REPLPP', 'AT_EVEN','AT1PP','ATSEVEN','AT1');
