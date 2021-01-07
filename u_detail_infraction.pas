unit u_detail_infraction;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls, Grids, Buttons, Menus;

type

  { Tf_detail_inscription }

  Tf_detail_inscription = class(TForm)
    btn_validerajout: TButton;
    btn_annuler: TButton;
    btn_validermodif: TButton;
    cb_sexe: TComboBox;
    cb_code: TComboBox;
    edt_filiere: TEdit;
    lbl_filiere: TLabel;
    lbl_mail: TLabel;
    edt_mail: TEdit;
    edt_portable: TEdit;
    edt_tel: TEdit;
    lbl_nom_erreur: TLabel;
    lbl_adresse_erreur: TLabel;
    lbl_codepostal_erreur: TLabel;
    lbl_tel_erreur: TLabel;
    lbl_mail_erreur: TLabel;
    lbl_code_erreur: TLabel;
    lbl_ville_erreur: TLabel;
    lbl_prenom_erreur: TLabel;
    lbl_portable: TLabel;
    lbl_tel: TLabel;
    edt_ville: TEdit;
    edt_codepostal: TEdit;
    edt_adresse: TEdit;
    edt_prenom: TEdit;
    edt_nom: TEdit;
    lbl_prenom: TLabel;
    lbl_nom: TLabel;
    lbl_num_erreur: TLabel;
    lbl_note: TLabel;
    mmo_filiere: TMemo;
    pnl_note_ajout: TPanel;
    pnl_note_list: TPanel;
    pnl_note: TPanel;
    pnl_note_titre: TPanel;
    lbl_ident: TLabel;
    pnl_filiere: TPanel;
    pnl_ident: TPanel;
    pnl_adresse: TPanel;
    edt_num: TEdit;
    lbl_num: TLabel;
    lbl_adresse: TLabel;
    pnl_contact: TPanel;
    btn_retour: TButton;
    lbl_contact: TLabel;
    pnl_detail: TPanel;
    pnl_btn: TPanel;
    pnl_titre: TPanel;
    sg_liste: TStringGrid;
    procedure btn_retourClick(Sender: TObject);
    procedure btn_validerajoutClick(Sender: TObject);
    procedure btn_validermodifClick(Sender: TObject);
    procedure cb_codeChange(Sender: TObject);
    procedure edt_numExit(Sender: TObject);
    procedure init   ( idinf : string; affi : boolean);
    procedure detail ( idinf : string);
    procedure edit   ( idinf : string);
    procedure add;
    procedure delete (num: string);
    procedure affi_page;
    function  affi_erreur_saisie (erreur : string; lbl : TLabel; edt : TEdit) : boolean;
    procedure affi_filiere (num : string);
    procedure edt_Enter(Sender : TObject);

      private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_detail_inscription: Tf_detail_inscription;

implementation


{$R *.lfm}

uses	u_feuille_style, u_list_infraction, u_amende_list, u_modele, u_loaddataset;

{ Tf_detail_inscription }

var
   oldvaleur : string;
   id  : string;

procedure	Tf_detail_inscription.Init   ( idinf : string;	affi : boolean);
begin
    style.panel_travail (pnl_titre);
   style.panel_travail (pnl_btn);
   style.panel_travail (pnl_detail);
   style.panel_travail (pnl_ident);
	style.label_titre  (lbl_ident);
        style.label_erreur (lbl_num_erreur);     lbl_num_erreur.caption := ' ';
        style.label_erreur (lbl_nom_erreur);     lbl_nom_erreur.caption := ' ';
        style.label_erreur (lbl_prenom_erreur);     lbl_prenom_erreur.caption := ' ';
   style.panel_travail (pnl_adresse);
	style.label_titre  (lbl_adresse);
	style.label_erreur (lbl_adresse_erreur);   lbl_adresse_erreur.caption := ' ';
        style.label_erreur (lbl_codepostal_erreur);   lbl_codepostal_erreur.caption := ' ';
        style.label_erreur (lbl_ville_erreur);   lbl_ville_erreur.caption := ' ';
   style.panel_travail (pnl_contact);
	style.label_titre  (lbl_contact);
	style.label_erreur (lbl_tel_erreur);  lbl_tel_erreur.caption := ' ';
        style.label_erreur (lbl_mail_erreur);  lbl_mail_erreur.caption := ' ';
        style.label_erreur (lbl_code_erreur);  lbl_code_erreur.caption := ' ';
   style.panel_travail (pnl_filiere);
	style.label_titre  (lbl_filiere);        style.memo_info(mmo_filiere);
   style.panel_travail (pnl_note);
	style.panel_travail (pnl_note_titre);
		style.label_titre  (lbl_note);
	style.panel_travail (pnl_note_list);
	style.panel_travail (pnl_note_ajout);
   edt_num.ReadOnly	:=affi;


   lbl_adresse_erreur.caption	:='';
   edt_adresse.clear;
   edt_adresse.ReadOnly	:=affi;
   lbl_codepostal_erreur.caption	:='';
   edt_codepostal.clear;
   edt_codepostal.ReadOnly	:=affi;
   lbl_ville_erreur.caption	:='';
   edt_ville.clear;
   edt_ville.ReadOnly	:=affi;


   lbl_tel_erreur.caption	:='';
   edt_tel.clear;
   edt_portable.clear;
   edt_tel.ReadOnly		:=affi;
   lbl_mail_erreur.caption	:='';
   edt_mail.clear;
   edt_mail.ReadOnly	:=affi;


   lbl_code_erreur.caption	:='';
   edt_filiere.clear;
   edt_filiere.ReadOnly		:=affi;
   mmo_filiere.clear;
   mmo_filiere.ReadOnly	:=true;
   btn_retour.visible	:=affi;
   btn_validerajout.visible	:=NOT  affi;
   btn_annuler.visible	:=NOT  affi;

   show;

   id  := idinf;
   IF  NOT  ( id = '')
   THEN  affi_page;

end;

function  Tf_detail_inscription.affi_erreur_saisie (erreur : string; lbl : TLabel; edt : TEdit) : boolean;
begin
   lbl.caption := erreur;
   if  NOT (erreur = '')
   then begin
	edt.setFocus;
	result := false;
   end
   else result := true;
end;

procedure Tf_detail_inscription.detail (idinf : string);
begin
   init (idinf, true);    // mode affichage
   pnl_titre.caption	:= 'Détail d''une inscription';
   btn_retour.setFocus;
   edt_nom.ReadOnly:= true;
   edt_prenom.ReadOnly := true;
   edt_adresse.ReadOnly := true;
   edt_codepostal.ReadOnly:= true;
   edt_ville.ReadOnly:= true;
   edt_tel.ReadOnly:= true;
   edt_portable.ReadOnly:= true;
   edt_mail.ReadOnly:= true;
   edt_filiere.Visible := true;
   edt_filiere.ReadOnly := true;
   cb_code.Visible := false;
end;

procedure Tf_detail_inscription.edit (idinf : string);
begin
   init (idinf, false);
   pnl_titre.caption	:= 'Modification d''une inscription';
   edt_num.ReadOnly	 := true;
   f_note_list.pnl_btn_ligne.Visible := false;
   edt_nom.ReadOnly:= false;
   edt_prenom.ReadOnly := false;
   edt_adresse.ReadOnly := false;
   edt_codepostal.ReadOnly:= false;
   edt_ville.ReadOnly:= false;
   edt_tel.ReadOnly:= false;
   edt_portable.ReadOnly:= false;
   edt_mail.ReadOnly:= false;
   edt_filiere.Visible := true;
   edt_filiere.ReadOnly := true;
   cb_sexe.ReadOnly := true;
     cb_code.Visible := false;
          btn_validerajout.Visible:= false;
     btn_validermodif.Visible:=true;
end;

procedure Tf_detail_inscription.add;
begin
   init ('',false);
   pnl_titre.caption   := 'Nouvelle inscription';
   edt_num.setFocus;
   f_note_list.pnl_btn_ligne.Visible := false;
   edt_filiere.Visible := true;
   edt_filiere.ReadOnly := false;
   sg_liste.rowcount := 0;
     cb_code.Visible := true;
     lbl_note.Caption := 'Relevé de Notes';
     btn_validerajout.Visible:= true;
     btn_validermodif.Visible:=false;
end;

procedure Tf_detail_inscription.delete (num : string);
begin
   IF   messagedlg ('Demande de confirmation'
	,'Confirmez-vous la suppression de l''étudiant' +' '+num
	,mtConfirmation, [mbYes,mbNo], 0, mbNo) = mrYes
   THEN BEGIN
        modele.inscrit_delete (num);
        f_list_inscrit.line_delete;
   END;
end;

procedure Tf_detail_inscription.btn_retourClick(Sender: TObject);
begin
      edt_num.clear;
      edt_nom.clear;
      edt_prenom.clear;
      edt_adresse.clear;
      edt_ville.clear;
      edt_codepostal.clear;
      edt_tel.clear;
      edt_portable.clear;
      edt_mail.clear;
      close;
end;

procedure Tf_detail_inscription.btn_validerajoutClick(Sender: TObject);
  var
    saisie, erreur: string;
    id_fil : string;
    valide: boolean;
begin
    valide := true;

    erreur := '';
    saisie := edt_nom.text;
    if  saisie = ''  then
    begin
    erreur := 'Le nom doit être rempli.';
    lbl_nom_erreur.Caption := erreur;
    valide := false;
    end;

    erreur := '';
    saisie := edt_prenom.text;
    if  saisie = ''  then  begin erreur := 'Le prenom doit être rempli.';
    lbl_prenom_erreur.Caption := erreur;
    valide := false;
    end;

    erreur := '';
    saisie := edt_adresse.text;
    if  saisie = ''  then begin erreur := 'L`adresse doit être remplie.';
    lbl_adresse_erreur.Caption := erreur;
    valide := false;
    end;

    erreur := '';
    saisie := edt_codepostal.text;
    if  saisie = ''  then begin erreur := 'Le CP doit être rempli.';
    lbl_codepostal_erreur.Caption := erreur;
    valide := false;
    end;

    erreur := '';
    saisie := edt_ville.text;
    if  saisie = ''  then begin erreur := 'La ville doit être remplie.';
    lbl_ville_erreur.Caption := erreur;
    valide := false;
    end;

    erreur := '';
    saisie := edt_tel.text;
    if  saisie = ''  then begin erreur := 'Le téléphone doit être rempli.';
    lbl_tel_erreur.Caption := erreur;
    valide := false;
    end;

    erreur := '';
    saisie := edt_mail.text;
    if  saisie = ''  then begin erreur := 'Le mail doit être rempli.';
    lbl_mail_erreur.Caption := erreur;
    valide := false;
    end;

    erreur := '';
    saisie := cb_code.text;
    if  saisie = ''  then begin erreur := 'Le code filière doit être rempli.';
    lbl_code_erreur.Caption := erreur;
    valide := false;
    end;

    erreur := '';
    saisie := edt_num.text;
    if  saisie = ''  then begin erreur := 'Le numero doit être rempli.';
    lbl_num_erreur.Caption := erreur;
    valide := false;
    end;

    if valide
    then
    begin
    if cb_code.text ='302-5KTMJ1' then
    begin
    id_fil := '1';
    end
    else if cb_code.text = '302-5KTMI7' then
    begin
    id_fil :='2';
    end;
    modele.inscrit_insert (edt_num.text,cb_sexe.Text,edt_nom.text,edt_prenom.text,edt_adresse.text,edt_codepostal.text,edt_ville.text,edt_portable.text,edt_tel.text,edt_mail.text,id_fil);
    close;
    f_list_inscrit.affi_data(modele.inscrit_liste_tous)
    end
    else
    begin
        messagedlg ('Erreur enregistrement Inscription', 'La saisie est incorrecte.' +#13 +'Corrigez la saisie et validez à nouveau.', mtWarning, [mbOk], 0)
    end

end;

procedure Tf_detail_inscription.btn_validermodifClick(Sender: TObject);
  var
    saisie, erreur: string;
    id_fil : string;
    valide: boolean;
begin
    valide := true;

    erreur := '';
    saisie := edt_nom.text;
    if  saisie = ''  then
    begin
    erreur := 'Le nom doit être rempli.';
    lbl_nom_erreur.Caption := erreur;
    valide := false;
    end;

    erreur := '';
    saisie := edt_prenom.text;
    if  saisie = ''  then  begin erreur := 'Le prenom doit être rempli.';
    lbl_prenom_erreur.Caption := erreur;
    valide := false;
    end;

    erreur := '';
    saisie := edt_adresse.text;
    if  saisie = ''  then begin erreur := 'L`adresse doit être remplie.';
    lbl_adresse_erreur.Caption := erreur;
    valide := false;
    end;

    erreur := '';
    saisie := edt_codepostal.text;
    if  saisie = ''  then begin erreur := 'Le CP doit être rempli.';
    lbl_codepostal_erreur.Caption := erreur;
    valide := false;
    end;

    erreur := '';
    saisie := edt_ville.text;
    if  saisie = ''  then begin erreur := 'La ville doit être remplie.';
    lbl_ville_erreur.Caption := erreur;
    valide := false;
    end;

    erreur := '';
    saisie := edt_tel.text;
    if  saisie = ''  then begin erreur := 'Le téléphone doit être rempli.';
    lbl_tel_erreur.Caption := erreur;
    valide := false;
    end;

    erreur := '';
    saisie := edt_mail.text;
    if  saisie = ''  then begin erreur := 'Le mail doit être rempli.';
    lbl_mail_erreur.Caption := erreur;
    valide := false;
    end;

    erreur := '';
    saisie := edt_filiere.text;
    if  saisie = ''  then begin erreur := 'Le code filière doit être rempli.';
    lbl_code_erreur.Caption := erreur;
    valide := false;
    end;

    erreur := '';
    saisie := edt_num.text;
    if  saisie = ''  then begin erreur := 'Le numero doit être rempli.';
    lbl_num_erreur.Caption := erreur;
    valide := false;
    end;

    if valide
    then
    begin
    if edt_filiere.text ='302-5KTMJ1' then
    begin
    id_fil := '1';
    end
    else if edt_filiere.text = '302-5KTMI7' then
    begin
    id_fil :='2';
    end;
    modele.inscrit_update (edt_num.text,cb_sexe.Text,edt_nom.text,edt_prenom.text,edt_adresse.text,edt_codepostal.text,edt_ville.text,edt_portable.text,edt_tel.text,edt_mail.text,id_fil);
    close;
    f_list_inscrit.affi_data(modele.inscrit_liste_tous)
    end
    else
    begin
        messagedlg ('Erreur enregistrement Inscription', 'La saisie est incorrecte.' +#13 +'Corrigez la saisie et validez à nouveau.', mtWarning, [mbOk], 0)
    end
end;

procedure Tf_detail_inscription.cb_codeChange(Sender: TObject);
begin
  affi_filiere(cb_code.text);
end;

procedure Tf_detail_inscription.edt_numExit(Sender: TObject);
begin
   edt_num.text := TRIM(edt_num.text);
end;


procedure Tf_detail_inscription.edt_Enter(Sender : TObject);
begin
   oldvaleur := TEdit(Sender).text;
end;

procedure Tf_detail_inscription.affi_filiere (num : string);
var
   ch, ch2 : string;
   i : Byte;
begin
   mmo_filiere.clear;
   if  num = ''
   then  mmo_filiere.lines.add('Filière non identifiée.')
   else
     begin
        i := Pos(',',modele.inscrit_filiere(num));
        ch := Copy(modele.inscrit_filiere(num),0,i-1);
        ch2 := Copy(modele.inscrit_filiere(num),i+1,Length(modele.inscrit_filiere(num))-i);
       if ch='' then mmo_filiere.lines.add('Filière inconnue')
       else begin
              mmo_filiere.Lines.text := ch + #13#10 + ch2;
         end;
     end;
end;

procedure Tf_detail_inscription.affi_page;
var
   flux : TLoadDataSet;
   i : integer;
   ch: string;
begin
   flux := modele.inscrit_num(id);
   flux.read;
   edt_num.text := flux.Get('id');
   cb_sexe.Items.Add(flux.Get('civ'));
   edt_nom.text := flux.Get('nom');
   edt_prenom.text := flux.Get('prenom');
   edt_adresse.text := flux.Get('adresse');
   edt_codepostal.text := flux.Get('cp');
   edt_ville.text := flux.Get('ville');
   edt_tel.text := flux.Get('telephone');
   edt_portable.text := flux.Get('portable');
   edt_mail.text := flux.Get('mel');
   edt_filiere.text := flux.Get('code');
   flux.destroy;

   affi_filiere(edt_filiere.text);
      lbl_note.Caption := 'Relevé de Notes - Moyenne étudiant : ' + modele.moy_etudiant(edt_num.text) + ' - Moyenne fillière : ' + modele.moy_filiere(edt_filiere.text);

   i:=0;
   flux := modele.inscrit_note(edt_num.text);
   sg_liste.rowCount := flux.count;
   while (i < sg_liste.RowCount) do
   begin
       flux.read;
       sg_liste.Cells[0,i] := flux.Get('UE');

       if (Pos(',', flux.Get('coef')) = 0) then
          sg_liste.Cells[1,i] := 'x ' + flux.Get('coef') + ',00'
       else
          sg_liste.Cells[1,i] := 'x ' + flux.Get('coef') +  '0' ;

       if (flux.Get('note') = '-1') then
           sg_liste.Cells[2,i] := 'Non noté'
       else
          begin
               sg_liste.Cells[2,i] := flux.Get('note') + ',00';
          end;

       i := i +1;
   end;
   flux.destroy;

   btn_retour.caption := 'Retour liste';
end;

end.

