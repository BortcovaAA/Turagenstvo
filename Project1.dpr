program Project1;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {ListTours},
  Unit1 in 'Unit1.pas' {MainForm},
  Unit3 in 'Unit3.pas' {SellTours},
  Unit4 in 'Unit4.pas' {Customers},
  Unit5 in 'Unit5.pas' {ListCustomer},
  Unit6 in 'Unit6.pas' {Employes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TListTours, ListTours);
  Application.CreateForm(TSellTours, SellTours);
  Application.CreateForm(TCustomers, Customers);
  Application.CreateForm(TListCustomer, ListCustomer);
  Application.CreateForm(TEmployes, Employes);
  Application.Run;
end.
