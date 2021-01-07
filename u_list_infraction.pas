unit u_list_infraction;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, ExtCtrls, Buttons, Grids, ComCtrls,
  StdCtrls, u_liste, Controls;

type

  { Tf_list_inscrit }

  Tf_list_inscrit = class(TF_liste)
    lbl_nbligne: TLabel;
    tb_nbligne: TTrackBar;
    procedure btn_line_addClick(Sender: TObject);
    procedure btn_line_deleteClick(Sender: TObject);
    procedure btn_line_detailClick(Sender: TObject);
    procedure btn_line_editClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Init;
    procedure tb_nbligneChange(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_list_inscrit: Tf_list_inscrit;

implementation

{$R *.lfm}


{ Tf_list_inscrit }

uses u_feuille_style, u_detail_infraction, u_modele;

procedure Tf_list_inscrit.btn_line_addClick(Sender: TObject);
begin
   f_detail_inscription.add;
end;

procedure Tf_list_inscrit.btn_line_deleteClick(Sender: TObject);
begin
   f_detail_inscription.delete (sg_liste.cells[0,sg_liste.row]);
end;

procedure Tf_list_inscrit.btn_line_detailClick(Sender: TObject);
begin
   f_detail_inscription.detail (sg_liste.cells[0,sg_liste.row]);
end;

procedure Tf_list_inscrit.btn_line_editClick(Sender: TObject);
begin
   f_detail_inscription.edit (sg_liste.cells[0,sg_liste.row]);
end;

procedure Tf_list_inscrit.FormShow(Sender: TObject);
begin
end;

procedure Tf_list_inscrit.Init;
begin
   style.panel_travail(pnl_titre);
   style.panel_travail(pnl_btn);
   style.panel_travail(pnl_affi);
   style.grille (sg_liste);
end;

procedure Tf_list_inscrit.tb_nbligneChange(Sender: TObject);
begin
  f_list_inscrit.affi_data(modele.inscrit_liste_tous);
  sg_liste.rowcount := tb_nbligne.Position;
  lbl_nbligne.Caption := InttoStr(tb_nbligne.Position);
end;


end.

