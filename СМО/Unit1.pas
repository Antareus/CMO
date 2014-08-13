unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Math, ExtCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit5: TEdit;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    Label8: TLabel;
    Edit8: TEdit;
    RadioButton5: TRadioButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;
type TArr = array of double;


var
  Form1: TForm1;
  procedure Cicle0(n:Integer; a,b,p0:Double);
  procedure Cicle1(S:Integer; a,b,p0:Double);
  procedure Cicle2(S:Integer; a,b,p0:Double);
  procedure Cicle3(S,K:Integer; a,b,p0:Double);
  procedure Cicle4(S,K:Integer; a,b,p0:Double);
  procedure Cicle5(S:Integer;Zmas:TArr; a,b:Double);
implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
//type Mas = array of double;
var
 a,b,p0: double;
 S,K,j: integer;

begin
  a:=strtofloat(Edit1.text);
  b:=strtofloat(Edit2.text);
  S:=strtoint(Edit3.text); // Кол-во каналов
  K:=strtoint(Edit5.text); // Очередь
  p0:=0;
   StringGrid1.Cells[0,0]:='Состояние';
   StringGrid1.Cells[1,0]:='Вероятность';
   StringGrid1.RowCount:=S+2;

 if  RadioButton1.Checked = true then begin  //однокан. с очередью
   Form1.StringGrid1.ColCount:=2;
   Form1.StringGrid1.ColWidths[0]:=150;
   Form1.StringGrid1.ColWidths[1]:=150;
   if S=2 then Cicle0(1,a,b,p0);
   if S>=3 then Cicle1(S,a,b,p0);
  end;

 if RadioButton2.Checked = true then begin  //многокан, без взаимопомощи
    Form1.StringGrid1.ColCount:=2;
    Form1.StringGrid1.ColWidths[0]:=150;
    Form1.StringGrid1.ColWidths[1]:=150;
    if S=2 then Cicle0(2,a,b,p0);
    if S>=3 then Cicle2(S,a,b,p0);
 end;

 if RadioButton3.Checked = true then begin  //многокан, с очередью
   //if (S>K) and (S>=3) then Cicle3(S,K,a,b,p0);
   Form1.StringGrid1.ColCount:=2;
   Form1.StringGrid1.ColWidths[0]:=150;
   Form1.StringGrid1.ColWidths[1]:=150;
   if K=0 then Cicle2(S,a,b,p0);
   Cicle3(S,K,a,b,p0);
 end;

 if RadioButton4.Checked = true then begin  //многокан. с взаимопомощью (все как один)
    Form1.StringGrid1.ColCount:=2;
    Form1.StringGrid1.ColWidths[0]:=150;
    Form1.StringGrid1.ColWidths[1]:=150;
    Cicle4(S,K,a,b,p0);
 end;

 if RadioButton5.Checked = true then begin  //многокан. разная интенсивность обслуживания
  Form1.StringGrid1.ColCount:=3;
  Form1.StringGrid1.ColWidths[0]:=50;
  Form1.StringGrid1.ColWidths[1]:=100;
  Form1.StringGrid1.ColWidths[2]:=100;
  Form1.StringGrid1.RowCount:=S+2;
   for j:=2 to S+1 do StringGrid1.Cells[0,j]:=inttostr(j-1);
      StringGrid1.Cells[0,0]:='Канал';
      StringGrid1.Cells[1,0]:='Интенсивность';
      StringGrid1.Cells[2,0]:='Вероятность';
     Form1.Button2.Visible:=true;
   // if (not Assigned(Form2)) then Form2:=TForm2.Create(Self);
   // Form2.Show;
    //Form2.a:=a;
    //Form2.b:=b;
    //Cicle5(S,a,b,p0);
 end;
end;
//-------------------------------------------------------------------------------
procedure Cicle0(n:Integer; a,b,p0:Double); //Если имеется только 2 канала
var
p1,p2: double;
begin
    p1:=a/b;
    p2:=(a/b)/n;
    p0:=1/(1+p1+p2);
    p1:=p1*p0;
    p2:=p2*p0;
    Form1.StringGrid1.Cells[1,1]:=floattostr(p0);
    Form1.StringGrid1.Cells[0,1]:='0';
    Form1.StringGrid1.Cells[1,2]:=floattostr(p1);
    Form1.StringGrid1.Cells[0,2]:='1';
    Form1.StringGrid1.Cells[1,3]:=floattostr(p2);
    Form1.StringGrid1.Cells[0,3]:='2';
end;
//-------------------------------------------------------------------------------
procedure Cicle1(S:Integer; a,b,p0:Double);  //Одноканальн., с очередью
var
 c,pn1,pn2,pn3,summ,t: double;
 i: integer;
 M:array of double;
begin
 summ:=1;
 t:=0;
 c:=a/b;
  pn1:= c;
  pn2:= c+c*c;
  pn3:=0;
  SetLength(M, S+1);
   M[0]:=0;
   M[1]:=pn1;
   M[2]:=pn2;
    for i := 1 to S-2 do begin
       p0:=c*(pn1+pn2);
       pn3:=pn1*c;
       pn1:=pn2;
       pn2:=p0;
       M[i+2]:=p0;
    end;
   M[S]:=pn3;
   for i := 1 to S do summ:=summ + M[i];
   M[0]:=1/summ; //Вероятность нулевого состояния
   //M[0]:=roundTo(1/summ,-7);
  for i:= 1 to S do begin
    M[i]:=M[0]*M[i];
    //M[i]:=roundTo(M[0]*M[i],-7);
    Form1.StringGrid1.Cells[1,i+1]:=floattostr(M[i]);
    Form1.StringGrid1.Cells[0,i+1]:=inttostr(i);
  end;
    Form1.StringGrid1.Cells[1,1]:=floattostr(M[0]);
    Form1.StringGrid1.Cells[0,1]:='0';

     for i:=0 to S do begin  //контроль
      t:=t+M[i];
      Form1.Edit4.Text:=floattostr(t);
     end;
     Form1.Edit6.Text:=floattostr(M[S]+M[S-1]); //вероят отказа
     //for i:=0 to 1 do k:=i*M[i]+k;
     Form1.Edit7.Text:=floattostr(1-M[0]); //ср число занятых каналов
     //r:=0;
     //r:=M[0]*(c*c);
     //r:=r*(1-S*((S-1)*ln(c))+(S-1)*(S*ln(c)));
     //r:=r/((1-c)*(1-c));
     //Form1.Edit8.Text:=floattostr(r);  //ср ч обслуж заявок
   M:=nil;
end;
//----------------------------------------------------------------------------
procedure Cicle2(S:Integer; a,b,p0:Double);//Многокан, без взаимопомощи
var
 c,pn1,pn2,pn3,summ,t,k: double;
 i: integer;
 M:array of double;
begin
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
 procedure Cicle3(S,K:Integer; a,b,p0:Double); //Многоканальная с очередью
var
 c,pn1,pn2,pn3,summ,t: double;                // S и K поменять местами, K очередь
 i: integer;
 M:array of double;
begin
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
    for i := 3 to K do
    begin
       p0:=c*(pn1+pn2)/i;
       pn3:=pn1*c/i;
       pn1:=pn2;
       pn2:=p0;
       M[i]:=p0;
    end;
      for i := K+1 to S do // очередь
      begin
       p0:=c*(pn1+pn2); // делить на K?
       pn3:=pn1*c;
       pn1:=pn2;
       pn2:=p0;
       M[i]:=p0;
      end;
   M[S]:=pn3;
   for i := 1 to S do summ:=summ + M[i];
    M[0]:=1/summ;
    //M[0]:=roundTo(1/summ,-7);
    for i:= 1 to S do
    begin
     M[i]:=M[0]*M[i];
     //M[i]:=roundTo(M[0]*M[i],-7);
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
   M:=nil;
end;
//------------------------------------------------------------------------------
procedure Cicle4(S,K:Integer; a,b,p0:Double);//Многокан, c взаимопомощью
var
 c,pn1,pn2,pn3,summ,t,j: double;
 i: integer;
 M:array of double;
begin
 summ:=1;
 t:=0;
 b:=S*b;
 c:=a/b;
  pn1:= c;
  pn2:= c+c*c;
  pn3:=0;
  SetLength(M, S+1);
   M[0]:=0;
   M[1]:=pn1;
   M[2]:=pn2;
    for i := 1 to S-2 do
    begin
       p0:=c*(pn1+pn2);
       pn3:=pn1*c;
       pn1:=pn2;
       pn2:=p0;
       M[i+2]:=p0;
    end;
   M[S]:=pn3;
   for i := 1 to S do summ:=summ + M[i];
    M[0]:=1/summ; //Вероятность нулевого состояния
    //M[0]:=roundTo(1/summ,-7);
  for i:= 1 to S do
   begin
    M[i]:=M[0]*M[i];
    //M[i]:=roundTo(M[0]*M[i],-7);
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

    Form1.Edit6.Text:=floattostr(M[S]+M[S-1]);   //пока не учитывает очередь
     j:=0;
     for i:=1 to S do j:=i*M[i]+j;
     Form1.Edit7.Text:=floattostr((1-M[0])*S);
     Form1.Edit8.Text:=floattostr((1-(M[S]+M[S-1])*c));
   M:=nil;
end;
//------------------------------------------------------------------------------
procedure Cicle5(S:Integer; Zmas:TArr; a,b:Double);//Многокан, разная интенсивность обслуживания
var
 pn1,pn2,pn3,summ,t,k,p0: double;
 i: integer;
 M:array of double;
begin
p0:=0;
 summ:=1;
 t:=0;
  pn1:= a/Zmas[0];
  pn2:= a/Zmas[1]+(a*a)/(Zmas[1]*Zmas[0]);
  pn3:=0;
  SetLength(M, S+1);
  M[0]:=0;
   if S=2 then begin
    M[1]:=pn1;
    M[2]:=a/Zmas[1];
   end;
    if S>=3 then begin
     M[1]:=pn1;
     M[2]:=pn2;
     for i := 3 to S do
     begin
       p0:=a*(pn1+pn2)/Zmas[i-1];
       pn3:=pn1*a/Zmas[i-1];
       pn1:=pn2;
       pn2:=p0;
       M[i]:=p0;
     end;
    end;
   M[S]:=pn3;
   for i := 1 to S do summ:=summ + M[i];
    M[0]:=1/summ;
    //M[0]:=roundTo(1/summ,-8);
    for i:= 1 to S do
    begin
     M[i]:=M[0]*M[i];
     //M[i]:=roundTo(M[0]*M[i],-8);
     Form1.StringGrid1.Cells[2,i+1]:=floattostr(M[i]);
    end;
     for i:=0 to S do
     begin
      t:=t+M[i];
      Form1.Edit4.Text:=floattostr(t);
     end;
    Form1.StringGrid1.Cells[2,1]:=floattostr(M[0]);
    Form1.StringGrid1.Cells[0,1]:='0';

    Form1.Edit6.Text:=floattostr(M[S]+M[S-1]);
     k:=0;
     for i:=1 to S do k:=i*M[i]+k;
     Form1.Edit7.Text:=floattostr(k);
     Form1.Edit8.Text:=floattostr(k);
   M:=nil; Zmas:=nil;
end;
//------------------------------------------------------------------------------
procedure TForm1.RadioButton1Click(Sender: TObject);
begin
 Label5.Visible:= false;
 Edit5.Visible:= false;
 Form1.Button1.Caption:='Расчет'
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
 Label5.Visible:= false;
 Edit5.Visible:= false;
 Form1.Button1.Caption:='Расчет'
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
 Label5.Visible:= true;
 Edit5.Visible:= true;
 Form1.Button1.Caption:='Расчет'
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Label5.Visible:= false;
 Edit5.Visible:= false;
 Form1.Button1.Caption:='Расчет'
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
 Label5.Visible:= false;
 Edit5.Visible:= false;
 Form1.Button1.Caption:='Расчет'
// Button2.Visible:=false;
end;
//------------------------------------------------------------------------------

procedure TForm1.Button2Click(Sender: TObject);
var
o: boolean;
Zmas: TArr;
i,S: integer;
a,b: double;
begin
 a:=strtofloat(Edit1.text);
 b:=strtofloat(Edit2.text);
 S:=strtoint(Edit3.text); // Кол-во каналов
 o:= false;
  SetLength(Zmas, StringGrid1.RowCount-1);
  for i:=2 to StringGrid1.RowCount-1 do begin
    if StringGrid1.Cells[1,i]<>'' then o:=true;
    if StringGrid1.Cells[1,i]='' then o:=false;
  end;
  if o = true then
  for i:=2 to StringGrid1.RowCount-1 do Zmas[i-2]:=StrToFloat(StringGrid1.Cells[1,i])
  else ShowMessage('Заполните всю таблицу');
  Cicle5(S,Zmas, a,b);
end;
//------------------------------------------------------------------------------
procedure TForm1.RadioButton5Click(Sender: TObject);
begin
 Label5.Visible:= false;
 Edit5.Visible:= false;
 Form1.Button1.Caption:='Заполнение'
end;

end.


