unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TEmployes = class(TForm)
    Background: TImage;
    L_TableName: TLabel;
    DB_ListPass: TDBGrid;
    L_AddCustomer: TLabel;
    L_MiddleName: TLabel;
    L_FirstName: TLabel;
    L_LastName: TLabel;
    L_Discount: TLabel;
    FirstName: TEdit;
    LastName: TEdit;
    MiddleName: TEdit;
    Discount: TEdit;
    B_AddCustomer: TButton;
    Table_Source: TDataSource;
    Query_Employes: TADOQuery;
    procedure B_AddCustomerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Employes: TEmployes;

implementation

{$R *.dfm}

uses Unit1;

procedure TEmployes.B_AddCustomerClick(Sender: TObject);
begin
if ((FirstName.Text='') AND (LastName.Text='') AND (MiddleName.Text='')) then
  begin
  showmessage('Обнаружено незаполненное поле');
  end
  else
  try
  Query_Employes.Close;
  Query_Employes.SQL.Clear;
  Query_Employes.SQL.Add('INSERT INTO Сотрудники(Фамилия,Имя,Отчество,Должность)');
  Query_Employes.SQL.Add('VALUES (:a,:b,:c,:d);');
  Query_Employes.Parameters.ParamByName('a').Value:=FirstName.text;
  Query_Employes.Parameters.ParamByName('b').Value:=LastName.text;
  Query_Employes.Parameters.ParamByName('c').Value:=MiddleName.text;
  Query_Employes.Parameters.ParamByName('d').Value:=Discount.text;
  Query_Employes.ExecSQL;
  Query_Employes.Close;
  Query_Employes.SQL.Clear;
  Query_Employes.SQL.Add('SELECT * FROM Сотрудники;');
  Query_Employes.Open;
  FirstName.text:='';
  LastName.text:='';
  MiddleName.text:='';
  Discount.text:='';
  except
  end;
end;

procedure TEmployes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Employes.Hide;
MainForm.Show;
end;

end.
