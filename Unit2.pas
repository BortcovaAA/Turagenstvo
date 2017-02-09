unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Data.DB,
  Data.Win.ADODB, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TListTours = class(TForm)
    Background: TImage;
    DB_ListTours: TDBGrid;
    L_TableName: TLabel;
    DB_Connect: TADOConnection;
    Query_ListTours: TADOQuery;
    DS_ListTours: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListTours: TListTours;

implementation
 uses Unit1;
{$R *.dfm}

procedure TListTours.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ListTours.Hide;
MainForm.show;
end;

end.
