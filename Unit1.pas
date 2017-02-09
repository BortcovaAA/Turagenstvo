unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.Samples.Calendar;

type
  TMainForm = class(TForm)
    Background: TImage;
    MainMenu1: TMainMenu;
    M_Tours: TMenuItem;
    M_Customers: TMenuItem;
    M_Employes: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    L_ProgramName: TLabel;
    N4: TMenuItem;
    Calendar1: TCalendar;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure M_CustomersClick(Sender: TObject);
    procedure M_EmployesClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses Unit2, Unit3, Unit4, Unit5, Unit6;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TMainForm.M_CustomersClick(Sender: TObject);
begin
MainForm.Hide;
Customers.show;
end;

procedure TMainForm.M_EmployesClick(Sender: TObject);
begin
MainForm.Hide;
Employes.show;
end;

procedure TMainForm.N1Click(Sender: TObject);
begin
MainForm.Hide;
ListTours.show;
end;

procedure TMainForm.N2Click(Sender: TObject);
begin
MainForm.Hide;
SellTours.show;
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TMainForm.N4Click(Sender: TObject);
begin
MainForm.Hide;
ListCustomer.show;
end;

end.
