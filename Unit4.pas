unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Tabs, Vcl.DockTabSet, Data.DB, Data.Win.ADODB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TCustomers = class(TForm)
    Background: TImage;
    DB_ListPass: TDBGrid;
    L_TableName: TLabel;
    L_AddCustomer: TLabel;
    FirstName: TEdit;
    MiddleName: TEdit;
    LastName: TEdit;
    L_FirstName: TLabel;
    L_LastName: TLabel;
    L_MiddleName: TLabel;
    L_Discount: TLabel;
    Discount: TEdit;
    B_AddCustomer: TButton;
    Query_Customers: TADOQuery;
    Table_Source: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_AddCustomerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Customers: TCustomers;

implementation

{$R *.dfm}

uses Unit1;

procedure TCustomers.B_AddCustomerClick(Sender: TObject);
begin
if ((FirstName.Text='') AND (LastName.Text='') AND (MiddleName.Text='')) then
  begin
  showmessage('Обнаружено незаполненное поле');
  end
  else
  try
  Query_Customers.Close;
  Query_Customers.SQL.Clear;
  Query_Customers.SQL.Add('INSERT INTO Клиенты(Фамилия,Имя,Отчество,Скидка)');
  Query_Customers.SQL.Add('VALUES (:a,:b,:c,:d);');
  Query_Customers.Parameters.ParamByName('a').Value:=FirstName.text;
  Query_Customers.Parameters.ParamByName('b').Value:=LastName.text;
  Query_Customers.Parameters.ParamByName('c').Value:=MiddleName.text;
  Query_Customers.Parameters.ParamByName('d').Value:=Discount.text;
  Query_Customers.ExecSQL;
  Query_Customers.Close;
  Query_Customers.SQL.Clear;
  Query_Customers.SQL.Add('SELECT * FROM Клиенты;');
  Query_Customers.Open;
  finally
  FirstName.text:='';
  LastName.text:='';
  MiddleName.text:='';
  Discount.text:='';
  end;
end;

procedure TCustomers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Customers.hide;
MainForm.show;
end;

end.
