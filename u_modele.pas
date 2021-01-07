unit u_modele;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_loaddataset;

type
Tmodele = class(TMySQL)
 private
 { private declarations }
 public
 { public declarations }
 procedure open;
 function inscrit_liste_tous : TLoadDataSet;
 function inscrit_liste_etudiant (nom, num : string) : TLoadDataSet;
 function inscrit_liste_filiere (code : string) : TLoadDataSet;
 function inscrit_num (num : string) : TLoadDataSet;
 function inscrit_filiere (num : string) : string;
 function  inscrit_note (num : string) : TLoadDataSet;
 procedure inscrit_delete (num: string);
 procedure inscrit_insert (num,civ,nom,prenom,adresse,cp,ville,portable,telephone,mel,id_fil : string);
 procedure inscrit_update (num,civ,nom,prenom,adresse,cp,ville,portable,telephone,mel,id_fil : string);
 procedure close;
 function moy_etudiant (num : string) : string;
 function moy_filiere (num : string) : string;
end;

var
 modele: Tmodele;

implementation

procedure Tmodele.open;
begin
 Bd_open ('devbdd.iutmetz.univ-lorraine.fr', 0, 'gisonni2u_tpprojet', 'gisonni2u_appli',
 'Huntercraft57,', 'mysqld-5', 'libmysql64.dll');
end;

procedure Tmodele.close;
begin
 Bd_close;
end;

procedure Tmodele.inscrit_delete (num : string);
 begin
  exec('sp_inscrit_delete',[num]);
 end;

procedure Tmodele.inscrit_insert (num,civ,nom,prenom,adresse,cp,ville,portable,telephone,mel,id_fil : string);
 begin
exec('sp_inscrit_insert',[num,civ,nom,prenom,adresse,cp,ville,portable,telephone,mel,id_fil]);
 end;

procedure Tmodele.inscrit_update (num,civ,nom,prenom,adresse,cp,ville,portable,telephone,mel,id_fil : string);
 begin
exec('sp_inscrit_update',[num], [civ,nom,prenom,adresse,cp,ville,portable,telephone,mel,id_fil]);
 end;

function Tmodele.moy_etudiant (num : string) : string;
begin
     load('sp_moy_etudiant',[num], result);
end;

function Tmodele.moy_filiere (num : string) : string;
begin
     load('sp_moy_filiere',[num], result);
end;

function Tmodele.inscrit_filiere (num : string) : string;
begin
 load('sp_inscrit_filiere',[num], result);
end;

function Tmodele.inscrit_num (num : string) : TLoadDataSet;
begin
 result := load('sp_inscrit_num',[num]);
end;

// tous les inscrits
function Tmodele.inscrit_liste_tous : TLoadDataSet;
begin
 result := load('sp_inscrit_liste_tous',[]);
end;

// etudiant nom et num
function Tmodele.inscrit_liste_etudiant (nom, num : string) : TLoadDataSet;
begin
 result := load('sp_inscrit_liste_etudiant',[nom, num]);
end;

// filiere par code
function Tmodele.inscrit_liste_filiere (code : string) : TLoadDataSet;
begin
 result := load('sp_inscrit_liste_filiere',[code]);
end;

function Tmodele.inscrit_note (num : string) : TLoadDataSet;
begin
 result := load('sp_inscrit_note',[num]);
end;

begin
 modele := TModele.Create;
end.

