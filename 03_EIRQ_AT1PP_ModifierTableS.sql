/*********************************************************************
   G�n�r� par le script : 3_EDO_ModifierTableSVueM.vbs
   Mod�le d'origine     : AT1_EDO_Service de remboursement de taxes
   Produit par          : RIRC001
   Date de mise � jour  : 2023-02-28
   Description          : Script de modification des tables historiques (tables S).
   Domaine (destination): EIRQ
   Sch�ma (destination) : AT1PP
*********************************************************************/

alter table ATSDEM add COD_FAMIL_FOR VARCHAR2(25);

alter table ATSEVEN add NO_SEQ_TACHE NUMBER(10);
