unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Menus,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.Buttons,
  Controller.Interfaces;

type
  TViewMain = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    TreeView1: TTreeView;
    PopupMenuTreeView: TPopupMenu;
    Editar1: TMenuItem;
    Deletar1: TMenuItem;
    NovoBanco1: TMenuItem;
    ImageListTreeView: TImageList;
    SpeedButton1: TSpeedButton;
    ActionListAcoes: TActionList;
    ImageListActionList: TImageList;
    acnServerRegister: TAction;
    acnCallLayoutManager: TAction;
    SpeedButton2: TSpeedButton;
    acnPopupMenuServerEditar: TAction;
    acnPopupMenuExcluir: TAction;
    acnPopupMenuDataBaseRegister: TAction;
    acnPopupMenuExport: TAction;
    acnPopupMenuDefinirAtual1: TMenuItem;
    acnPopupMenuShowData: TAction;
    Conectar1: TMenuItem;
    acnPopupMenuBackup: TAction;
    Backup1: TMenuItem;
    SpeedButton3: TSpeedButton;
    acnCallParamManager: TAction;
    acnPopUpMenuDataBaseEdit: TAction;
    Editar2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure PopupMenuTreeViewPopup(Sender: TObject);
    procedure acnServerRegisterExecute(Sender: TObject);
    procedure acnCallLayoutManagerExecute(Sender: TObject);
    procedure acnPopupMenuExcluirExecute(Sender: TObject);
    procedure acnPopupMenuDataBaseRegisterExecute(Sender: TObject);
    procedure acnPopupMenuShowDataExecute(Sender: TObject);
    procedure acnPopupMenuExportExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acnPopupMenuServerEditarExecute(Sender: TObject);
    procedure acnPopupMenuBackupExecute(Sender: TObject);
    procedure acnCallParamManagerExecute(Sender: TObject);
    procedure acnPopUpMenuDataBaseEditExecute(Sender: TObject);
  private
    { Private declarations }
    FControllerMain: IControllerMain;
    FControllerWindow: IControllerWindow;
  public
    { Public declarations }
  end;

var
  ViewMain: TViewMain;

implementation

uses
  Controller.Factory;

{$R *.dfm}

procedure TViewMain.acnCallLayoutManagerExecute(Sender: TObject);
begin
  FControllerMain.CallLayoutManager;
end;

procedure TViewMain.acnPopupMenuShowDataExecute(Sender: TObject);
begin
  FControllerMain.ShowDataBase;
end;

procedure TViewMain.acnCallParamManagerExecute(Sender: TObject);
begin
  FControllerMain.CallParamManager;
end;

procedure TViewMain.acnPopupMenuBackupExecute(Sender: TObject);
begin
  FControllerMain.CallBackupManager;
end;

procedure TViewMain.acnPopUpMenuDataBaseEditExecute(Sender: TObject);
begin
  FControllerMain.EditDataBase;
  FControllerMain.FillList;
end;

procedure TViewMain.acnPopupMenuServerEditarExecute(Sender: TObject);
begin
  FControllerMain.EditServer;
  FControllerMain.FillList;
end;

procedure TViewMain.acnPopupMenuExcluirExecute(Sender: TObject);
begin
  FControllerMain.CallUnregister;
end;

procedure TViewMain.acnPopupMenuExportExecute(Sender: TObject);
begin
  FControllerMain.ExportToDrive;
end;

procedure TViewMain.acnPopupMenuDataBaseRegisterExecute(Sender: TObject);
begin
  FControllerMain.RegisterDatabase;
  FControllerMain.FillList;
end;

procedure TViewMain.acnServerRegisterExecute(Sender: TObject);
begin
  FControllerMain.RegisterServer;
  FControllerMain.FillList;
end;

procedure TViewMain.FormActivate(Sender: TObject);
begin
  FControllerMain.FindInUse;
end;

procedure TViewMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FControllerWindow.SavePosition;
end;

procedure TViewMain.FormCreate(Sender: TObject);
begin
  FControllerMain := TControllerFactory.Main(Self);
  FControllerMain.FillList;
  FControllerWindow := TControllerFactory.Window(Self);
end;

procedure TViewMain.FormShow(Sender: TObject);
begin
  FControllerWindow.RestorePosition;
end;

procedure TViewMain.PopupMenuTreeViewPopup(Sender: TObject);
begin
  FControllerMain.PreparePopUp;
end;

procedure TViewMain.TreeView1DblClick(Sender: TObject);
begin
  FControllerMain.ShowDataBase;
end;

end.
