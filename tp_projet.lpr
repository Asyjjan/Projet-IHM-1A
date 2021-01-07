program tp_projet;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, datetimectrls, zcomponent, u_gabarit, u_select_infraction,
  u_list_infraction, u_detail_infraction, u_amende_list, u_modele, u_liste
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(Tf_gabarit, f_gabarit);
  Application.CreateForm(Tf_select_etu, f_select_etu);
  Application.CreateForm(Tf_list_inscrit, f_list_inscrit);
  Application.CreateForm(Tf_detail_inscription, f_detail_inscription);
  Application.CreateForm(Tf_note_list, f_note_list);
  Application.CreateForm(Tf_liste, f_liste);
  Application.Run;
end.

