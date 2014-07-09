unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    StringGrid1: TStringGrid;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form2: TForm2;

  
implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.Button2Click(Sender: TObject);
begin
Form2.Close;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
A: TArr;
i: integer;
o: boolean;
begin
o:= false;
 SetLength(A, StringGrid1.RowCount-1);
  for i:=1 to StringGrid1.RowCount-1 do begin
  if StringGrid1.Cells[1,i]<>'' then o:=true;
  if StringGrid1.Cells[1,i]='' then o:=false;
  end;
   if o = true then
   for i:=1 to StringGrid1.RowCount-1 do A[i-1]:=StrToFloat(StringGrid1.Cells[1,i])
   else ShowMessage('Заполните всю таблицу');
  //Cicle5(S, a,b,p0);
 //Form2.Close;
end;
//------------------------------------------------------------------------------
procedure Cicle5(var S:Integer; var a,b:Double);//Многокан, разная интенсивность обслуживания
var
 c,pn1,pn2,pn3,summ,t,k,p0: double;
 i: integer;
 M:array of double;
begin
p0:=0;
 summ:=1;
 t:=0;
 c:=a/b;
  pn1:= c;
  pn2:= c/2+(c*c)/2;
  pn3:=0;
  SetLength(M, S+1);
   M[0]:=0;
   M[1]:=pn1;
   M[2]:=pn2;
    for i := 3 to S do
    begin
       p0:=c*(pn1+pn2)/i;
       pn3:=pn1*c/i;
       pn1:=pn2;
       pn2:=p0;
       M[i]:=p0;
    end;
   M[S]:=pn3;
   for i := 1 to S do summ:=summ + M[i];
    M[0]:=1/summ;
    //M[0]:=roundTo(1/summ,-8);
    for i:= 1 to S do
    begin
     M[i]:=M[0]*M[i];
     //M[i]:=roundTo(M[0]*M[i],-8);
     Form1.StringGrid1.Cells[1,i+1]:=floattostr(M[i]);
     Form1.StringGrid1.Cells[0,i+1]:=inttostr(i);
    end;
     for i:=0 to S do
     begin
      t:=t+M[i];
      Form1.Edit4.Text:=floattostr(t);
     end;
    Form1.StringGrid1.Cells[1,1]:=floattostr(M[0]);
    Form1.StringGrid1.Cells[0,1]:='0';

    Form1.Edit6.Text:=floattostr(M[S]+M[S-1]);
     k:=0;
     for i:=1 to S do k:=i*M[i]+k;
     Form1.Edit7.Text:=floattostr(k);
     Form1.Edit8.Text:=floattostr(k);
   M:=nil;
end;
//------------------------------------------------------------------------------

procedure TForm2.FormCreate(Sender: TObject);
begin
   StringGrid1.Cells[0,0]:='Канал';
   StringGrid1.Cells[1,0]:='Интенсивность';
end;

end.
