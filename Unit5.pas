unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TListCustomer = class(TForm)
    Background: TImage;
    DB_ListPass: TDBGrid;
    L_TableName: TLabel;
    CB_ListTours: TDBLookupComboBox;
    L_CBLT: TLabel;
    CB_Query: TADOQuery;
    DB_Connect: TADOConnection;
    Table_Query: TADOQuery;
    CB_Source: TDataSource;
    Table_Source: TDataSource;
    procedure CB_ListToursClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListCustomer: TListCustomer;
   st:string;
implementation

{$R *.dfm}

uses Unit1;

procedure TListCustomer.CB_ListToursClick(Sender: TObject);
begin
st:=CB_ListTours.Text;
Table_Query.Close;
Table_Query.SQL.Clear;
Table_Query.SQL.Add('SELECT Фамилия,Имя,Отчество,Дата');
Table_Query.SQL.Add('FROM (Журнал INNER JOIN Туры ON Туры.ИД_Тура=Журнал.ИД_Тура)INNER JOIN Клиенты ON Клиенты.ИД_Клиента=Журнал.ИД_Клиента ');
Table_Query.SQL.Add('WHERE Название=:a;');
Table_Query.Parameters.ParamByName('a').Value:=st;
Table_Query.Open;
end;

procedure TListCustomer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ListCustomer.hide;
MainForm.show;
end;

end.
