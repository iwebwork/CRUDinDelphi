unit UPaginaInicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls;

type
  TForm1 = class(TForm)
    FDConexaoMySql: TFDConnection;
    drvMySql: TFDPhysMySQLDriverLink;
    FdqListarUsuarios: TFDQuery;
    DsListarUsuarios: TDataSource;
    Label1: TLabel;
    DBEditNome: TDBEdit;
    DBEditSenha: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    BtnEditar: TButton;
    BtnExcluir: TButton;
    FdqSelecionarUsuario: TFDQuery;
    DsSelecionarUsuario: TDataSource;
    DBGrid1: TDBGrid;
    BtnInserir: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SalvarDados;
    procedure BtnInserirClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.SalvarDados;
var
  msg:string;
begin
  if DsSelecionarUsuario.DataSet.State in [dsEdit] then
    msg := 'Usuario editado com sucesso!'
  else
  if DsSelecionarUsuario.DataSet.State in [dsInsert] then
    msg := 'Usuario inserido com sucesso!';
  

  DsSelecionarUsuario.DataSet.Post;

  ShowMessage(msg);
  
  if FdqListarUsuarios.Active then
    FdqListarUsuarios.Close;

  FdqListarUsuarios.Open;

  FdqSelecionarUsuario.Close;
  FdqSelecionarUsuario.Params[0].Text := '';
  FdqSelecionarUsuario.Open;

end;

procedure TForm1.BtnEditarClick(Sender: TObject);
begin
  DsSelecionarUsuario.DataSet.Edit;
  SalvarDados;
end;

procedure TForm1.BtnInserirClick(Sender: TObject);
begin
  DsSelecionarUsuario.DataSet.Append;
  SalvarDados;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin

  FdqSelecionarUsuario.Close;

  if DBGrid1.SelectedRows.Count = 1 then
  begin
    FdqSelecionarUsuario.Close;
    FdqSelecionarUsuario.Params[0].Text := DsListarUsuarios.DataSet.FieldByName('ID').AsString;
    FdqSelecionarUsuario.Open;
    BtnInserir.Enabled := false;
    BtnEditar.Enabled := true;
  end
  else
  if DBGrid1.SelectedRows.Count = 0 then
  begin
    BtnEditar.Enabled := false;
    BtnInserir.Enabled := true;
  end;
  
  if DBGrid1.SelectedRows.Count > 0 then
  begin
    if DBGrid1.SelectedRows.Count > 1 then
    begin
      BtnInserir.Enabled := false;
      BtnEditar.Enabled := false;
    end;
    
    BtnExcluir.Enabled := true;
  end;

end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
  DBGrid1.SelectedRows.CurrentRowSelected := False;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FDConexaoMySql.Open;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if FdqListarUsuarios.Active then
    FdqListarUsuarios.Close;

  FdqListarUsuarios.Open;

  if FdqSelecionarUsuario.Active then
    FdqSelecionarUsuario.Close;

  FdqSelecionarUsuario.Params[0].Text := '';
  
  FdqSelecionarUsuario.Open;
  
  DsSelecionarUsuario.DataSet.Append;
  BtnEditar.Enabled := false;
end;

end.
