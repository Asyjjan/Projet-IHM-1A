unit u_select_infraction;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, EditBtn, DateTimePicker;

type

  { Tf_select_etu }

  Tf_select_etu = class(TForm)
    btn_ok: TButton;
    edt_fil_code: TEdit;
    edt_etu_nom: TEdit;
    edt_etu_num: TEdit;
    lbl_fil_code: TLabel;
    lbl_etu_nom: TLabel;
    lbl_etu_num: TLabel;
    pnl_titre: TPanel;
    pnl_ok: TPanel;
    pnl_tous_edit: TPanel;
    pnl_fil_btn: TPanel;
    pnl_tous_btn: TPanel;
    pnl_etu_btn: TPanel;
    pnl_etu_edit: TPanel;
    pnl_fil_edit: TPanel;
    pnl_tous: TPanel;
    pnl_fil: TPanel;
    pnl_etu: TPanel;
    pnl_choix: TPanel;

    procedure btn_okClick(Sender: TObject);
    procedure edt_fil_codeChange(Sender: TObject);
    procedure edt_etu_numChange(Sender: TObject);
    procedure init;
    procedure NonSelectionPanel (pnl : TPanel);
    procedure AucuneSelection;
    procedure pnl_choixClick(Sender: TObject);
    procedure pnl_choix_btnClick (Sender: TObject);
    procedure pnl_immatClick(Sender: TObject);
    procedure pnl_tous_editClick(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_select_etu: Tf_select_etu;


implementation

{$R *.lfm}

uses u_feuille_style, u_list_infraction, u_modele;

{ Tf_select_etu }
var
   pnl_actif : TPanel;

procedure Tf_select_etu.Init;
begin
    style.panel_defaut (pnl_choix);
    style.panel_selection (pnl_titre);
    style.panel_defaut(pnl_ok);
    pnl_choix_btnClick(pnl_tous_btn);
end;

procedure Tf_select_etu.btn_okClick(Sender: TObject);
begin
   btn_ok.visible := false;
   pnl_actif.enabled := false;
   if pnl_tous_edit.Visible then
   f_list_inscrit.affi_data(modele.inscrit_liste_tous)
   else if pnl_etu_edit.visible then
   f_list_inscrit.affi_data(modele.inscrit_liste_etudiant(edt_etu_nom.text,edt_etu_num.text))
   else if pnl_fil_edit.visible then
   f_list_inscrit.affi_data(modele.inscrit_liste_filiere(edt_fil_code.text));
end;

procedure Tf_select_etu.edt_fil_codeChange(Sender: TObject);
begin

end;

procedure Tf_select_etu.edt_etu_numChange(Sender: TObject);
begin

end;

procedure   Tf_select_etu.pnl_choix_btnClick (Sender : TObject);
var
   pnl : TPanel;
begin
   AucuneSelection;
   pnl := TPanel(Sender);
   style.panel_selection (pnl);
   pnl	:= TPanel(pnl.Parent);	style.panel_selection (pnl);
   pnl	:= TPanel(f_select_etu.FindComponent(pnl.name +'_edit'));
   style.panel_selection (pnl);
   pnl.show;
   pnl_actif := pnl;     pnl_actif.enabled := true;
   btn_ok.visible := true;
end;

procedure Tf_select_etu.pnl_immatClick(Sender: TObject);
begin

end;

procedure Tf_select_etu.pnl_tous_editClick(Sender: TObject);
begin

end;

procedure   Tf_select_etu.AucuneSelection;
begin
   NonSelectionPanel (pnl_tous);	NonSelectionPanel (pnl_etu);
   NonSelectionPanel (pnl_fil);
end;

procedure Tf_select_etu.pnl_choixClick(Sender: TObject);
begin

end;

procedure  Tf_select_etu.NonSelectionPanel (pnl : TPanel);
var
   pnl_enfant : TPanel;
begin
   style.panel_defaut(pnl);
   pnl_enfant	:= TPanel(f_select_etu.FindComponent(pnl.name +'_btn'));
   style.panel_bouton(pnl_enfant);
   pnl_enfant	:= TPanel(f_select_etu.FindComponent(pnl.name +'_edit'));
   pnl_enfant.Hide;
end;

end.

