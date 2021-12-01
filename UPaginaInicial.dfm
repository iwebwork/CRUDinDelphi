object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 589
  ClientWidth = 817
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 368
    Top = 8
    Width = 71
    Height = 13
    Caption = 'Pagina de crud'
  end
  object Label2: TLabel
    Left = 224
    Top = 41
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label3: TLabel
    Left = 224
    Top = 104
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object DBEditNome: TDBEdit
    Left = 224
    Top = 64
    Width = 249
    Height = 21
    DataField = 'NOME'
    DataSource = DsSelecionarUsuario
    TabOrder = 0
  end
  object DBEditSenha: TDBEdit
    Left = 224
    Top = 123
    Width = 249
    Height = 21
    DataField = 'SENHA'
    DataSource = DsSelecionarUsuario
    TabOrder = 1
  end
  object BtnEditar: TButton
    Left = 368
    Top = 150
    Width = 105
    Height = 25
    Caption = 'Editar'
    TabOrder = 2
    OnClick = BtnEditarClick
  end
  object BtnExcluir: TButton
    Left = 656
    Top = 185
    Width = 105
    Height = 25
    Caption = 'Excluir'
    Enabled = False
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 232
    Width = 817
    Height = 357
    Align = alBottom
    DataSource = DsListarUsuarios
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDblClick = DBGrid1DblClick
  end
  object BtnInserir: TButton
    Left = 257
    Top = 150
    Width = 105
    Height = 25
    Caption = 'Inserir'
    TabOrder = 5
    OnClick = BtnInserirClick
  end
  object FDConexaoMySql: TFDConnection
    ConnectionName = 'Conexao'
    Params.Strings = (
      'Database=crud'
      'User_Name=root'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 48
    Top = 24
  end
  object drvMySql: TFDPhysMySQLDriverLink
    Left = 56
    Top = 96
  end
  object FdqListarUsuarios: TFDQuery
    ConnectionName = 'Conexao'
    SQL.Strings = (
      'select * from usuario')
    Left = 656
    Top = 24
  end
  object DsListarUsuarios: TDataSource
    DataSet = FdqListarUsuarios
    Left = 760
    Top = 24
  end
  object FdqSelecionarUsuario: TFDQuery
    ConnectionName = 'Conexao'
    SQL.Strings = (
      'select * from usuario where ID = :ID')
    Left = 664
    Top = 96
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object DsSelecionarUsuario: TDataSource
    DataSet = FdqSelecionarUsuario
    Left = 768
    Top = 96
  end
end
