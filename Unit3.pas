unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls,ComObj;

type
  TSellTours = class(TForm)
    Background: TImage;
    CB_ListTours: TDBLookupComboBox;
    L_CBLC: TLabel;
    CB_ListCustomers: TDBLookupComboBox;
    L_CBLT: TLabel;
    L_Price: TLabel;
    Price: TEdit;
    L_Discount: TLabel;
    Discount: TEdit;
    B_TotalPrice: TButton;
    L_TotalPrice: TLabel;
    TotalPrice: TEdit;
    PrintTicket: TButton;
    Query_Customers: TADOQuery;
    DS_Customers: TDataSource;
    L_Employes: TLabel;
    СВ_ListEmployes: TDBLookupComboBox;
    Query_Employes: TADOQuery;
    DS_Employes: TDataSource;
    Query_Insert: TADOQuery;
    DB_Connect: TADOConnection;
    SaveDialog1: TSaveDialog;
    procedure CB_ListToursClick(Sender: TObject);
    procedure CB_ListCustomersClick(Sender: TObject);
    procedure B_TotalPriceClick(Sender: TObject);
    procedure PrintTicketClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SellTours: TSellTours;
  a,b:real;
  c:real;
  e:integer;
  str:string;
  Range1: variant;
  wdApp, wdDoc, wdRng : Variant;
  Res : Integer;
  Sd : TSaveDialog;

implementation

{$R *.dfm}

uses Unit2, Unit1;

procedure TSellTours.PrintTicketClick(Sender: TObject);
 const
  wdAlignParagraphCenter = 1;
  wdAlignParagraphLeft = 0;
  wdAlignParagraphRight = 2;
begin
  try
  e:=ListTours.DS_ListTours.DataSet.FieldByName('Остаток').AsInteger;
  Query_Insert.Close;
  Query_Insert.SQL.Clear;
  Query_Insert.SQL.Add('INSERT INTO Журнал(ИД_клиента,ИД_тура,[Итоговая цена],[Дата покупки],ИД_сотрудника) VALUES(:a,:b,:c,:d,:e);');
  Query_Insert.Parameters.ParamByName('a').Value:=DS_Customers.DataSet.FieldByName('ИД_клиента').value;
  Query_Insert.Parameters.ParamByName('b').Value:=ListTours.DS_ListTours.DataSet.FieldByName('Номер тура').value;
  Query_Insert.Parameters.ParamByName('c').Value:=TotalPrice.Text;
  Query_Insert.Parameters.ParamByName('d').Value:=MainForm.Calendar1.CalendarDate;
  Query_Insert.Parameters.ParamByName('e').Value:=DS_Employes.DataSet.FieldByName('ИД_сотрудника').value;
  Query_insert.ExecSQL;
  Query_insert.Close;
  Query_Insert.SQL.Clear;
  Query_insert.SQL.Add('UPDATE Туры SET Остаток=:e WHERE ИД_тура='+ListTours.DS_ListTours.DataSet.FieldByName('Номер тура').asstring+';');
  Query_Insert.Parameters.ParamByName('e').Value:=e-1;
  Query_insert.ExecSQL;
  showmessage('Оформление прошло успешно!');
  except
  showmessage('Оформление не произведено, проверьте данные');
  end;
SellTours.hide;
MainForm.Show;
end;


procedure TSellTours.B_TotalPriceClick(Sender: TObject);
begin
a:=strtoint(Price.Text);
b:=strtoint(Discount.text);
c:=(a-((a/100)*b));
TotalPrice.Text:=FloatToStr(c);
end;

procedure TSellTours.CB_ListCustomersClick(Sender: TObject);
begin
Discount.Text:=DS_Customers.DataSet.FieldByName('Скидка').Asstring;
end;

procedure TSellTours.CB_ListToursClick(Sender: TObject);
begin
Price.Text:=ListTours.DS_ListTours.DataSet.FieldByName('Цена').Asstring;
end;

procedure TSellTours.FormClose(Sender: TObject; var Action: TCloseAction);
begin
SellTours.Hide;
MainForm.show;
end;

end.
