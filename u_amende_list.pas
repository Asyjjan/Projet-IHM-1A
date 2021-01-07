unit u_amende_list;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, Grids, StdCtrls, u_liste;

type

  { Tf_note_list }

  Tf_note_list = class(TF_liste)
    procedure Init (affi : boolean);
    procedure btn_line_deleteClick(Sender: TObject);
    procedure btn_line_addClick(Sender: TObject);
    procedure pnl_btnClick(Sender: TObject);
    procedure pnl_btn_ligneClick(Sender: TObject);
    procedure pnl_btn_pageClick(Sender: TObject);
    procedure pnl_titreClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_note_list: Tf_note_list;

implementation

{$R *.lfm}

uses u_feuille_style;

{ Tf_note_list }

procedure  Tf_note_list.Init (affi : boolean);
begin
   style.panel_travail(pnl_titre);
   style.panel_travail(pnl_btn);
   style.panel_travail(pnl_affi);
   style.grille (sg_liste);
   sg_liste.Columns[2].Alignment:=taRightJustify;
   pnl_btn_page.Hide;
   btn_line_detail.Hide;
   btn_line_edit.hide;
   pnl_btn_ligne.visible := NOT affi;
end;

procedure Tf_note_list.btn_line_deleteClick(Sender: TObject);
begin

end;

procedure Tf_note_list.btn_line_addClick(Sender: TObject);
begin
   pnl_btn_ligne.visible := false;
end;

procedure Tf_note_list.pnl_btnClick(Sender: TObject);
begin

end;

procedure Tf_note_list.pnl_btn_ligneClick(Sender: TObject);
begin

end;

procedure Tf_note_list.pnl_btn_pageClick(Sender: TObject);
begin

end;

procedure Tf_note_list.pnl_titreClick(Sender: TObject);
begin

end;

end.

