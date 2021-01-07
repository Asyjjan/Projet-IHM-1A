unit u_gabarit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls;

type

  { Tf_gabarit }

  Tf_gabarit = class(TForm)
    item_accueil: TMenuItem;
    item_quitter: TMenuItem;
    item_inscrit: TMenuItem;
    item_fil: TMenuItem;
    item_listefil: TMenuItem;
    item_stat: TMenuItem;
    item_listeinscrit: TMenuItem;
    item_archive: TMenuItem;
    item_archiven1: TMenuItem;
    item_archiven2: TMenuItem;
    lbl_acceuil: TLabel;
    mnu_main: TMainMenu;
    pnl_ariane: TPanel;
    pnl_selection: TPanel;
    pnl_travail: TPanel;
    pnl_info: TPanel;
    procedure FormShow(Sender: TObject);
    procedure item_listeinscritClick(Sender: TObject);
    procedure item_quitterClick(Sender: TObject);
    procedure item_inscritClick(Sender: TObject);
    procedure item_filClick(Sender: TObject);
    procedure mnu_item_Click(Sender: TObject);
    procedure choix_item_listeinscrit;
    procedure pnl_selectionClick(Sender: TObject);
    procedure pnl_travailClick(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_gabarit: Tf_gabarit;

implementation

{$R *.lfm}

{ Tf_gabarit }

uses u_feuille_style, u_list_infraction, u_select_infraction, u_detail_infraction, u_modele;


procedure Tf_gabarit.mnu_item_Click(Sender: TObject);
var
   item : TMenuItem;
begin
   pnl_selection.show;

   pnl_ariane.Caption := '';
   item := TmenuItem(Sender);
   repeat
         pnl_ariane.Caption := ' >' + item.caption +pnl_ariane.Caption;
         item := item.parent;
   until item.parent = nil;
   item := TmenuItem(Sender);
   if item=item_listeinscrit then
   begin
   choix_item_listeinscrit;
   end
   else if item = item_accueil then
   begin
   f_list_inscrit.hide ;
   f_select_etu.hide;
   lbl_acceuil.Visible := true;
   end;
end;

procedure Tf_gabarit.choix_item_listeinscrit;
begin
   f_list_inscrit.borderstyle	:= bsNone;
   f_list_inscrit.parent		:= pnl_travail;
   f_list_inscrit.align		:= alClient;
   f_list_inscrit.init;
   f_list_inscrit.show ;

   f_select_etu.borderstyle := bsNone;
   f_select_etu.parent          := pnl_selection;
   f_select_etu.align            := alClient;
   f_select_etu.init;
   f_select_etu.show;

   f_detail_inscription.borderstyle := bsNone;
   f_detail_inscription.parent      := pnl_travail;
   f_detail_inscription.align       := alClient;

end;

procedure Tf_gabarit.pnl_selectionClick(Sender: TObject);
begin

end;

procedure Tf_gabarit.pnl_travailClick(Sender: TObject);
begin

end;

procedure Tf_gabarit.FormShow(Sender: TObject);
begin
   style.panel_selection (pnl_ariane);
   style.panel_defaut    (pnl_selection);
   style.panel_travail   (pnl_travail);
   style.panel_defaut    (pnl_info);
   f_gabarit.width := 1200;
   f_gabarit.height :=  800;
   modele.open;
end;

procedure Tf_gabarit.item_listeinscritClick(Sender: TObject);
begin

end;

procedure Tf_gabarit.item_quitterClick(Sender: TObject);
begin
   modele.close;
   close;
end;

procedure Tf_gabarit.item_inscritClick(Sender: TObject);
begin

end;

procedure Tf_gabarit.item_filClick(Sender: TObject);
begin

end;


end.

