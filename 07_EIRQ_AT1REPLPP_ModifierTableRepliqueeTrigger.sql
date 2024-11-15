/*********************************************************************
   G�n�r� par le script : 7_MPD_CreerTableRepliqueeTrigger.vbs
   Mod�le d'origine     : AT1_MPD_Service de remboursement de taxes
   Produit par          : RIRC001
   Date de mise � jour  : 2023-02-28
   Description          : Script de modification des tables de r�plication transitoires correspondantes
                          aux tables op�rationnelles r�pliqu�es (dans le sch�ma REPLPP)
                          et rafra�chissement de la commande (proc�dure) de cr�ation des triggers associ�s.
   Domaine (destination): EIRQ
   Sch�ma (destination) : AT1REPLPP
*********************************************************************/


alter table AT_DEM add COD_FAMIL_FOR VARCHAR2(25);

alter table AT_EVEN add NO_SEQ_TACHE NUMBER(10);

EXEC P_GENER_TRIGR_EDO('AT1REPLPP', 'AT_DEM','AT1PP','ATSDEM','AT1');
EXEC P_GENER_TRIGR_EDO('AT1REPLPP', 'AT_EVEN','AT1PP','ATSEVEN','AT1');
