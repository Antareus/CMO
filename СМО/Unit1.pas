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
    Edit9: TEdit;
    Edit10: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    RadioGroup2: TRadioGroup;
    GroupBox1: TGroupBox;
    RadioButton6: TRadioButton;
    Label14: TLabel;
    Edit11: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);

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
  procedure Cicle1n(H,a,b:Double);
  procedure Cicle2(S:Integer; a,b,p0:Double);
  procedure Cicle3(S,K:Integer; a,b,p0:Double);
  procedure Cicle4(S,K:Integer; a,b,p0:Double);
  procedure Cicle5(S:Integer;Zmas:TArr; a,b:Double);
  procedure Cicle_21(S:Integer; a,a2,b:Double; z:Boolean);
  procedure Cicle_2nm(S,K:Integer; a,a2,b:Double);
  procedure Cicle_31(S:Integer; a,b:Double);
  procedure Cicle_3n(S:Integer; a,b:Double);
  procedure Cicle_3nm(S,K:Integer; a,b:Double);
  procedure Cicle_321(S:Integer; a,a2,a3,b:Double);
  procedure Cicle_321n(S:Integer; a,a2,a3,b:Double);
  procedure Cicle_321nm(S,K:Integer; a,a2,a3,b:Double);
  
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
//type Mas = array of double;
var
 a,a2,a3,b,p0,H: double;
 S,K,j: integer;
 z: Boolean;
begin
  a:=strtofloat(Edit1.text);
  a2:=strtofloat(Edit9.text);
  a3:=strtofloat(Edit10.text);
  b:=strtofloat(Edit2.text);
  if Form1.RadioButton6.Checked=True then
  H:=strtofloat(Edit3.text) //��������
  else S:=strtoint(Edit3.text); // ���-�� �������
  K:=strtoint(Edit5.text); // �������
  p0:=0;
  z:=false;
   StringGrid1.Cells[0,0]:='���������';
   StringGrid1.Cells[1,0]:='�����������';
   StringGrid1.RowCount:=S+2;

//.............................................//������������ �� 2
 if Form1.RadioGroup2.ItemIndex=0 then begin
  if  RadioButton1.Checked = true then begin  //�������. � ��������
   Form1.StringGrid1.ColCount:=2;
   Form1.StringGrid1.ColWidths[0]:=150;
   Form1.StringGrid1.ColWidths[1]:=150;
   if S=2 then Cicle0(1,a,b,p0);
   if S>=3 then Cicle1(S,a,b,p0);
  end;

  if RadioButton2.Checked = true then begin  //��������, ��� ������������
    Form1.StringGrid1.ColCount:=2;
    Form1.StringGrid1.ColWidths[0]:=150;
    Form1.StringGrid1.ColWidths[1]:=150;
    if S=2 then Cicle0(2,a,b,p0);
    if S>=3 then Cicle2(S,a,b,p0);
  end;

  if RadioButton3.Checked = true then begin  //��������, � ��������
   //if (S>K) and (S>=3) then Cicle3(S,K,a,b,p0);
   StringGrid1.RowCount:=S+K+2;
   Form1.StringGrid1.ColCount:=2;
   Form1.StringGrid1.ColWidths[0]:=150;
   Form1.StringGrid1.ColWidths[1]:=150;
   if K=0 then Cicle2(S,a,b,p0);
   Cicle3(S,K,a,b,p0);
  end;

  if RadioButton4.Checked = true then begin  //��������. � ������������� (��� ��� ����)
    Form1.StringGrid1.ColCount:=2;
    Form1.StringGrid1.ColWidths[0]:=150;
    Form1.StringGrid1.ColWidths[1]:=150;
    Cicle4(S,K,a,b,p0);
  end;

  if RadioButton5.Checked = true then begin  //��������. ������ ������������� ������������
   Form1.StringGrid1.ColCount:=3;
   Form1.StringGrid1.ColWidths[0]:=50;
   Form1.StringGrid1.ColWidths[1]:=100;
   Form1.StringGrid1.ColWidths[2]:=100;
   Form1.StringGrid1.RowCount:=S+2;
   for j:=2 to S+1 do StringGrid1.Cells[0,j]:=inttostr(j-1);
      StringGrid1.Cells[0,0]:='�����';
      StringGrid1.Cells[1,0]:='�������������';
      StringGrid1.Cells[2,0]:='�����������';
     Form1.Button2.Visible:=true;
  end;

  if  RadioButton6.Checked = true then begin  //�������. � �������� ��������
   Form1.StringGrid1.ColCount:=2;
   Form1.StringGrid1.ColWidths[0]:=50;
   Form1.StringGrid1.ColWidths[1]:=150;
   if (2*a)/b<1 then Cicle1n(H,a,b)
   else showmessage('������! ������������� ����������� ������ ������(��� �����) ��� ������������� ������������');
  end;
 end;
 
//...........................................//������������ �� 3................
 if Form1.RadioGroup2.ItemIndex=1 then begin 
   if  RadioButton1.Checked = true then begin  //�������. � ��������
    Form1.StringGrid1.ColCount:=2;
    Form1.StringGrid1.ColWidths[0]:=150;
    Form1.StringGrid1.ColWidths[1]:=150;
    if S>=3 then Cicle_31(S,a,b)
    else showmessage('������, ������� �� ������ ���� ������ 3');
   end;

   if  RadioButton2.Checked = true then begin  //��������
    Form1.StringGrid1.ColCount:=2;
    Form1.StringGrid1.ColWidths[0]:=150;
    Form1.StringGrid1.ColWidths[1]:=150;
    if S>=3 then  Cicle_3n(S,a,b)
    else showmessage('������, ������� �� ������ ���� ������ 3');
   end;

   if  RadioButton3.Checked = true then begin  //�������� � ��������
    StringGrid1.RowCount:=S+K+2;
    Form1.StringGrid1.ColCount:=2;
    Form1.StringGrid1.ColWidths[0]:=150;
    Form1.StringGrid1.ColWidths[1]:=150;
    if (S>=2)and(K>=1) then  Cicle_3nm(S,K, a,b)
    else showmessage('������, ������� ������ ���� �� ����� 2, ������� �� ����� 1');
   end;
 end;

//...........................................//������������ �� 2 � �� 1.........
 if Form1.RadioGroup2.ItemIndex=2 then begin
   if  RadioButton1.Checked = true then begin  //�������. � ��������
    Form1.StringGrid1.ColCount:=2;
    Form1.StringGrid1.ColWidths[0]:=150;
    Form1.StringGrid1.ColWidths[1]:=150;
    z:=false;
    if S>=2 then Cicle_21(S,a,a2,b,z)
    else showmessage('������, ������� �� ������ ���� ������ 2');
   end;

   if  RadioButton2.Checked = true then begin  //�������������� ��� �������
    Form1.StringGrid1.ColCount:=2;
    Form1.StringGrid1.ColWidths[0]:=150;
    Form1.StringGrid1.ColWidths[1]:=150;
    z:=true;
    if S>=2 then Cicle_21(S,a,a2,b,z)
    else showmessage('������, ������� �� ������ ���� ������ 2');
   end;

   if  RadioButton3.Checked = true then begin  //�������������� � ��������
    StringGrid1.RowCount:=S+K+2;
    Form1.StringGrid1.ColCount:=2;
    Form1.StringGrid1.ColWidths[0]:=150;
    Form1.StringGrid1.ColWidths[1]:=150;
    if (S>=2)and(K>=1) then  Cicle_2nm(S,K, a,a2,b)
    else showmessage('������, ������� �� ������ ���� ������ 2, ������� ����� 1');
   end;
 end;

//............................................//������������ �� 3, 2 � 1........
  if Form1.RadioGroup2.ItemIndex=3 then begin
   if  RadioButton1.Checked = true then begin  //�������. � ��������
    Form1.StringGrid1.ColCount:=2;
    Form1.StringGrid1.ColWidths[0]:=150;
    Form1.StringGrid1.ColWidths[1]:=150;
    if S>=3 then Cicle_321(S, a,a2,a3,b)
    else showmessage('������, ������� �� ������ ���� ������ 3');
   end;

   if  RadioButton2.Checked = true then begin  //�������. � ��������
    Form1.StringGrid1.ColCount:=2;
    Form1.StringGrid1.ColWidths[0]:=150;
    Form1.StringGrid1.ColWidths[1]:=150;
    if S>=3 then Cicle_321n(S, a,a2,a3,b)
    else showmessage('������, ������� �� ������ ���� ������ 3');
   end;

   if  RadioButton3.Checked = true then begin  //�������������� � ��������
    StringGrid1.RowCount:=S+K+2;
    Form1.StringGrid1.ColCount:=2;
    Form1.StringGrid1.ColWidths[0]:=150;
    Form1.StringGrid1.ColWidths[1]:=150;
    if (S>=2)and(K>=1)  then Cicle_321nm(S,K, a,a2,a3,b)
    else showmessage('������, ������� �� ������ ���� ������ 2, ������� ����� 1');
   end;
 end;

end;
//-------------------------------------------------------------------------------
procedure Cicle0(n:Integer; a,b,p0:Double); //���� ������� ������ 2 ������
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
procedure Cicle1(S:Integer; a,b,p0:Double);  //�����������., � ��������
var
 c,pn1,pn2,pn3,summ,t,r: double;
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
   M[0]:=1/summ; //����������� �������� ���������
   //M[0]:=roundTo(1/summ,-7);
  for i:= 1 to S do begin
    M[i]:=M[0]*M[i];
    //M[i]:=roundTo(M[0]*M[i],-7);
    Form1.StringGrid1.Cells[1,i+1]:=floattostr(M[i]);
    Form1.StringGrid1.Cells[0,i+1]:=inttostr(i);
  end;
    Form1.StringGrid1.Cells[1,1]:=floattostr(M[0]);
    Form1.StringGrid1.Cells[0,1]:='0';

     for i:=0 to S do begin  //��������
      t:=t+M[i];
      Form1.Edit4.Text:=floattostr(t);
     end;
     Form1.Edit6.Text:=floattostr(M[S]+M[S-1]); //������ ������
     //for i:=0 to 1 do k:=i*M[i]+k;
     Form1.Edit7.Text:=floattostr(1-M[0]); //�� ����� ������� �������

     r:=0;
     for i:=1 to S-1 do r:=i*M[i+1]+r; //�� �  ������ � �������
     Form1.Edit11.Text:=floattostr(r);
     r:=(1-(M[S]+M[S-1]))*c+r;           //�� �  ������ � ��� !!!!���������
     Form1.Edit8.Text:=floattostr(r);
   M:=nil;
end;
//----------------------------------------------------------------------------
procedure Cicle2(S:Integer; a,b,p0:Double);//��������, ��� ������������
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


end;

//---------------------------------------------//�������������� � ��������, 2 ������
 procedure Cicle3(S,K:Integer; a,b,p0:Double); 
var
 c,pn1,pn2,pn3,summ,t,r: double;
 i, KS: integer;
 M:array of double;
begin
 summ:=1;
 t:=0;
 c:=a/b;
 KS:=K+S;
  pn1:= c;
  pn2:= c/2+(c*c)/2;
  pn3:=0;
  SetLength(M, K+S+1);
   M[0]:=0;
   M[1]:=pn1;
   M[2]:=pn2;
   if S>=3 then begin
    for i := 3 to S do  begin
       p0:=c*(pn1+pn2)/i;
       pn3:=pn1*c/i;
       pn1:=pn2;
       pn2:=p0;
       M[i]:=p0;
    end;
   end;
      for i := 1 to K do begin // �������
       p0:=c*(pn1+pn2)/S;
       pn3:=pn1*c/S;
       pn1:=pn2;
       pn2:=p0;
       M[S+i]:=p0;
      end;
   M[KS]:=pn3;
   for i := 1 to KS do summ:=summ + M[i];
    M[0]:=1/summ;
    //M[0]:=roundTo(1/summ,-7);
    for i:= 1 to KS do
    begin
     M[i]:=M[0]*M[i];
     //M[i]:=roundTo(M[0]*M[i],-7);
     Form1.StringGrid1.Cells[1,i+1]:=floattostr(M[i]);
     Form1.StringGrid1.Cells[0,i+1]:=inttostr(i);
    end;

     for i:=0 to KS do  //��������
     begin
      t:=t+M[i];
      Form1.Edit4.Text:=floattostr(t);
     end;
    Form1.StringGrid1.Cells[1,1]:=floattostr(M[0]);
    Form1.StringGrid1.Cells[0,1]:='0';

    Form1.Edit6.Text:=floattostr(M[S]+M[S-1]);
     r:=0;
     for i:=1 to S do r:=i*M[i]+r;
     for i:=S+1 to KS do r:=S*M[i]+r;
     Form1.Edit7.Text:=floattostr(r);
     Form1.Edit8.Text:=floattostr(r);
   M:=nil;
end;
//------------------------------------------------------------------------------
procedure Cicle4(S,K:Integer; a,b,p0:Double);//��������, c �������������
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
    M[0]:=1/summ; //����������� �������� ���������
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

    Form1.Edit6.Text:=floattostr(M[S]+M[S-1]);   //���� �� ��������� �������
     j:=0;
     for i:=1 to S do j:=i*M[i]+j;
     Form1.Edit7.Text:=floattostr((1-M[0])*S);
     Form1.Edit8.Text:=floattostr((1-(M[S]+M[S-1])*c));
   M:=nil;
end;
//---------------------//��������, ������ �� 2, ������ ������������� ������������
procedure Cicle5(S:Integer; Zmas:TArr; a,b:Double);
var
 pn1,pn2,pn3,summ,t,k,p0: double;
 i: integer;
 M:array of double;
begin
p0:=0;
 summ:=1;
 t:=0;
  pn1:= a/Zmas[0];
  pn2:= a/(2*Zmas[1])+(a*a)/(2*Zmas[1]*Zmas[0]);
  pn3:=0;
  SetLength(M, S+1);
  M[0]:=0;
   if S=2 then begin
    M[1]:=pn1;
    M[2]:=a/(2*Zmas[1]);
   end;
    if S>=3 then begin
     M[1]:=pn1;
     M[2]:=pn2;
     for i := 3 to S do
     begin
       p0:=a*(pn1+pn2)/(i*Zmas[i-1]);
       pn3:=pn1*a/(i*Zmas[i-1]);
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

//------------------------------------------- //�����������., � ����������� ��������
procedure Cicle1n(H,a,b:Double);
var
 c,p0,pn1,pn2,pn3,summ,t,q,r: double;
 i,S: integer;
 n: boolean;
 M:array of double;
begin
 summ:=1;
 t:=0;
 q:=H;
 c:=a/b;
  pn1:= c;
  pn2:= c+c*c;
  pn3:=0;
   n:=true;
   i:=2;
   while n=true do begin
    p0:=c*(pn1+pn2);
    pn3:=pn1*c;
    pn1:=pn2;
    pn2:=p0;
    if pn3<=q then n:=false
    else i:=i+1;
    S:=i;
   end;
   Form1.StringGrid1.RowCount:=S+2;

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
   M[0]:=1/summ; //����������� �������� ���������
   //M[0]:=roundTo(1/summ,-7);
  for i:= 1 to S do begin
    M[i]:=M[0]*M[i];
    //M[i]:=roundTo(M[0]*M[i],-7);
    Form1.StringGrid1.Cells[1,i+1]:=floattostr(M[i]);
    Form1.StringGrid1.Cells[0,i+1]:=inttostr(i);
  end;
    Form1.StringGrid1.Cells[1,1]:=floattostr(M[0]);
    Form1.StringGrid1.Cells[0,1]:='0';

     for i:=0 to S do begin  //��������
      t:=t+M[i];
      Form1.Edit4.Text:=floattostr(t);
     end;
     Form1.Edit6.Text:=floattostr(M[S]+M[S-1]); //������ ������
     Form1.Edit7.Text:=floattostr(1-M[0]); //�� ����� ������� �������

     r:=0;
     for i:=1 to S-1 do r:=i*M[i+1]+r; //�� �  ������ � �������
     Form1.Edit11.Text:=floattostr(r);
     r:=(1-(M[S]+M[S-1]))*c+r;           //�� �  ������ � ��� !!!!���������
     Form1.Edit8.Text:=floattostr(r);

   M:=nil;
end;
//------------------------------------------------------------------------------

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
 Label5.Visible:= false;
 Edit5.Visible:= false;
 Form1.Button1.Caption:='������';
 Form1.Label3.Caption:='���-�� �������';
 Form1.Edit3.Text:='3';
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
 Label5.Visible:= false;
 Edit5.Visible:= false;
 Form1.Button1.Caption:='������';
 Form1.Label3.Caption:='���-�� �������';
 Form1.Edit3.Text:='3';
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
 Label5.Visible:= true;
 Edit5.Visible:= true;
 Form1.Button1.Caption:='������';
 Form1.Label3.Caption:='���-�� �������';
 Form1.Edit3.Text:='3';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Label5.Visible:= false;
 Edit5.Visible:= false;
 Form1.Button1.Caption:='������';
 Form1.Label3.Caption:='���-�� �������';
 Form1.Edit3.Text:='3';
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
 Label5.Visible:= false;
 Edit5.Visible:= false;
 Form1.Button1.Caption:='������';
 Form1.Label3.Caption:='���-�� �������';
 Form1.Edit3.Text:='3';
// Button2.Visible:=false;
end;

procedure TForm1.RadioButton5Click(Sender: TObject);
begin
 Label5.Visible:= false;
 Edit5.Visible:= false;
 Form1.Button1.Caption:='����������';
 Form1.Label3.Caption:='���-�� �������';
 Form1.Edit3.Text:='3';
end;


procedure TForm1.RadioButton6Click(Sender: TObject);
begin
 Label5.Visible:= false;
 Edit5.Visible:= false;
 Form1.Button1.Caption:='������';
 Form1.Label3.Caption:='��������';
 Form1.Edit3.Text:='0,00002';
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
 S:=strtoint(Edit3.text); // ���-�� �������
 o:= false;
  SetLength(Zmas, StringGrid1.RowCount-1);
  for i:=2 to StringGrid1.RowCount-1 do begin
    if StringGrid1.Cells[1,i]<>'' then o:=true;
    if StringGrid1.Cells[1,i]='' then o:=false;
  end;
  if o = true then
  for i:=2 to StringGrid1.RowCount-1 do Zmas[i-2]:=StrToFloat(StringGrid1.Cells[1,i])
  else ShowMessage('��������� ��� �������');
  Cicle5(S,Zmas, a,b);
end;

//------------------//������������� � ��������������, ������ �� 2 � �� 1 -------
 procedure Cicle_21(S:Integer; a,a2,b:Double; z:Boolean);
var
 p0,pn1,pn2,pn3,summ,t,k,r: double;
 i: integer;
 M:array of double;
begin
 summ:=1;
 t:=0;
  pn1:= a/b+a2/b;
  pn2:= a2/b+(a/b)*(a/b)+2*(a*a2)/(b*b)+(a2*a2)/(b*b);
  pn3:=0;
  SetLength(M, S+1);
   M[0]:=0;

 if z= false then begin  //������������� ���
  if  S=2 then begin //���� ������ 2 ������
   M[1]:=a/b+a2/b;
   M[2]:=a*a/(b*b)+a2*a/(b*b)+a2/b;
  end;
      if S>=3 then begin  //3 � ����� �������
       M[1]:=pn1;
       M[2]:=pn2;
       for i := 3 to S do  begin
        p0:=pn1*a2/b+pn2*a2/b+pn2*a/b;
        pn3:=pn1*a2/b+pn2*a/b;
        pn1:=pn2;
        pn2:=p0;
        M[i]:=p0;
       end;
      M[S]:=pn3;
      end;
 end;

 if z= true then begin //��������������
  if  S=2 then begin //���� ������ 2 ������
   M[1]:=a/b+a2/b;
   M[2]:=(a*a/(b*b)+a2*a/(b*b)+a2/b)/S;
  end;
      if S>=3 then begin  //3 � ����� �������
        M[1]:=pn1;
        pn2:=pn2/2;
        M[2]:=pn2;
       for i := 3 to S do  begin
        p0:=(pn1*a2/b+pn2*a2/b+pn2*a/b)/i;
        pn3:=(pn1*a2/b+pn2*a/b)/i;
        pn1:=pn2;
        pn2:=p0;
        M[i]:=p0;
      end;
       M[S]:=pn3;
     end;
 end;

   for i := 1 to S do summ:=summ + M[i];   //����������� �������� ���������
    M[0]:=1/summ;
    //M[0]:=roundTo(1/summ,-7);
    for i:= 1 to S do begin             //��������� �������� �����������
     M[i]:=M[0]*M[i];
     //M[i]:=roundTo(M[0]*M[i],-7);
     Form1.StringGrid1.Cells[1,i+1]:=floattostr(M[i]);
     Form1.StringGrid1.Cells[0,i+1]:=inttostr(i);
    end;

     for i:=0 to S do begin //����������� �����
      t:=t+M[i];
      Form1.Edit4.Text:=floattostr(t);
     end;
    Form1.StringGrid1.Cells[1,1]:=floattostr(M[0]);
    Form1.StringGrid1.Cells[0,1]:='0';

    Form1.Edit6.Text:=floattostr(M[S]+M[S-1]); //������ ������
   if z= false then begin  //�������� ��� ������������� ���
    Form1.Edit7.Text:=floattostr(1-M[0]); //�� ����� ������� �������
     r:=0;
     for i:=1 to S-1 do r:=i*M[i+1]+r; //�� �  ������ � �������
     Form1.Edit11.Text:=floattostr(r);
     r:=(1-(M[S]+M[S-1]))*(a+a2/(2*b))+r;           //�� �  ������ � ��� !!!!���������
     Form1.Edit8.Text:=floattostr(r);
   end;
   if z= true then begin  //�������� ��� �������������� ���
    k:=0;
     for i:=1 to S do k:=i*M[i]+k;
     Form1.Edit7.Text:=floattostr(k);  //�� ����� ������� �������
     Form1.Edit8.Text:=floattostr(k);  //�� � ������ ������
     Form1.Edit11.Text:='';
   end;

   M:=nil;

end;

//------------------//�������������� � ��������, ������ �� 2 � �� 1 -------
 procedure Cicle_2nm(S,K:Integer; a,a2,b:Double);
var
 p0,pn1,pn2,pn3,summ,t,r: double;
 i,KS: integer;
 M:array of double;
begin
 summ:=1;
 t:=0;
 KS:=S+K;
  pn1:= a/b+a2/b;
  pn2:= (a2/b+(a/b)*(a/b)+2*(a*a2)/(b*b)+(a2*a2)/(b*b))/2;
  pn3:=0;
  SetLength(M, KS+1);
   M[0]:=0;
   M[1]:=pn1;
   M[2]:=pn2;
      if S>=3 then begin  //3 � ����� �������
       for i := 3 to S do  begin
        p0:=(pn1*a2/b+pn2*a2/b+pn2*a/b)/i;
        pn3:=(pn1*a2/b+pn2*a/b)/i;
        pn1:=pn2;
        pn2:=p0;
        M[i]:=p0;
       end;
      end;

      for i := 1 to K do  begin    //�������
        p0:=(pn1*a2/b+pn2*a2/b+pn2*a/b)/S;
        pn3:=(pn1*a2/b+pn2*a/b)/S;
        pn1:=pn2;
        pn2:=p0;
        M[S+i]:=p0;
       end;
       M[KS]:=pn3;

   for i := 1 to KS do summ:=summ + M[i];   //����������� �������� ���������
    M[0]:=1/summ;
    //M[0]:=roundTo(1/summ,-7);
    for i:= 1 to KS do begin             //��������� �������� �����������
     M[i]:=M[0]*M[i];
     //M[i]:=roundTo(M[0]*M[i],-7);
     Form1.StringGrid1.Cells[1,i+1]:=floattostr(M[i]);
     Form1.StringGrid1.Cells[0,i+1]:=inttostr(i);
    end;
    Form1.StringGrid1.Cells[1,1]:=floattostr(M[0]);
    Form1.StringGrid1.Cells[0,1]:='0';

     for i:=0 to KS do begin //����������� �����
      t:=t+M[i];
      Form1.Edit4.Text:=floattostr(t);
     end;

    Form1.Edit6.Text:=floattostr(M[KS]+M[KS-1]); //������ ������
     r:=0;
     for i:=1 to S do r:=i*M[i]+r; //�� ����� ������� �������
     for i:=S+1 to KS do r:=M[i]*S+r;
     Form1.Edit7.Text:=floattostr(r);

     r:=0;
     for i:=S+1 to KS-1 do r:=i*M[i+1]+r; //�� �  ������ � �������
     Form1.Edit11.Text:=floattostr(r);
     r:=(1-(M[S]+M[S-1]))*(a+a2/(2*b))+r;           //�� �  ������ � ��� !!!!���������
     Form1.Edit8.Text:=floattostr(r);
   M:=nil;

end;
//-------------------__�����������., � ��������, ������ �� 3__------------------
procedure Cicle_31(S:Integer; a,b:Double);
var
 c,p0,pn1,pn2,pn3,pn4,pn5,summ,t,r: double;
 i: integer;
 M:array of double;
begin
 summ:=1;
 t:=0;
 c:=a/b;
  p0:=0;
  pn1:= c;  //����������� ������� ���������
  pn2:= c+c*c; //����������� 2�� ���������
  pn3:= c+c*c+c*c+c*c*c;
  pn4:=0;
  SetLength(M, S+1);
   M[0]:=0;
  if  S=3 then begin //���� ������ 3 ������
   M[1]:=pn1;
   M[2]:=c;
   M[3]:=c;
   M[0]:=1/(1+M[3]+M[2]+M[1]);
  end;
  if  S=4 then begin  //���� ������ 4 ������
   M[1]:=pn1;
   M[2]:=pn2;
   M[3]:=pn2;
   M[4]:=c*c;
   M[0]:=1/(1+M[4]+M[3]+M[2]+M[1]);
  end;
  if S>=5 then begin  //����� 5 �������
   M[1]:=pn1;
   M[2]:=pn2;
   M[3]:=pn3;
    for i := 4 to S-1 do begin
       p0:=c*(pn1+pn2+pn3);
       pn4:=(pn1+pn2)*c;
       pn5:=pn2*c;
       pn1:=pn2;
       pn2:=pn3;
       pn3:=p0;
       M[i]:=p0;
    end;
   M[S-1]:=pn4;
   M[S]:=pn5;
  end;
   for i := 1 to S do summ:=summ + M[i];
   M[0]:=1/summ; //����������� �������� ���������
   //M[0]:=roundTo(1/summ,-7);
  for i:= 1 to S do begin  //�������� �����������
    M[i]:=M[0]*M[i];
    //M[i]:=roundTo(M[0]*M[i],-7);
    Form1.StringGrid1.Cells[1,i+1]:=floattostr(M[i]);
    Form1.StringGrid1.Cells[0,i+1]:=inttostr(i);
  end;
    Form1.StringGrid1.Cells[1,1]:=floattostr(M[0]);
    Form1.StringGrid1.Cells[0,1]:='0';

     for i:=0 to S do begin  //��������
      t:=t+M[i];
      Form1.Edit4.Text:=floattostr(t);
     end;

     Form1.Edit6.Text:=floattostr(M[S]+M[S-1]+M[S-2]); //������ ������
     Form1.Edit7.Text:=floattostr(1-M[0]); //�� ����� ������� �������

     r:=0;
     for i:=1 to S-1 do r:=i*M[i+1]+r; //�� �  ������ � �������
     Form1.Edit11.Text:=floattostr(r);
     r:=(1-(M[S]+M[S-1]+M[S-2]))*(a/b)+r;           //�� �  ������ � ��� !!!!���������
     Form1.Edit8.Text:=floattostr(r);

   M:=nil;

end;

//-------------------__��������������, ������ �� 3__----------------------------
procedure Cicle_3n(S:Integer; a,b:Double);
var
 c,p0,pn1,pn2,pn3,pn4,pn5,summ,t,k: double;
 i: integer;
 M:array of double;
begin
 summ:=1;
 t:=0;
 c:=a/b;
  p0:=0;
  pn1:= c;  //����������� ������� ���������
  pn2:= (c+c*c)/2; //����������� 2�� ���������
  pn4:=0;
  SetLength(M, S+1);
   M[0]:=0;
  if  S=3 then begin //���� ������ 3 ������
   M[1]:=pn1;
   M[2]:=c/2;
   M[3]:=c/3;
   M[0]:=1/(1+M[3]+M[2]+M[1]);
  end;
  if  S=4 then begin  //���� ������ 4 ������
   M[1]:=pn1;
   M[2]:=pn2;
   M[3]:=(c+c*c)/3;
   M[4]:=c*c/4;
   M[0]:=1/(1+M[4]+M[3]+M[2]+M[1]);
  end;
  if S>=5 then begin  //����� 5 �������
   M[1]:=pn1;
   M[2]:=pn2;
   pn3:= (c+c*c+pn2*c)/3;
   M[3]:=pn3;
    for i := 4 to S-1 do begin
       p0:=c*(pn1+pn2+pn3)/i;
       pn4:=(pn1+pn2)*c/i;
       pn5:=pn2*c/(i+1);
       pn1:=pn2;
       pn2:=pn3;
       pn3:=p0;
       M[i]:=p0;
    end;
   M[S-1]:=pn4;
   M[S]:=pn5;
  end;
   for i := 1 to S do summ:=summ + M[i];
   M[0]:=1/summ; //����������� �������� ���������
   //M[0]:=roundTo(1/summ,-7);
  for i:= 1 to S do begin  //�������� �����������
    M[i]:=M[0]*M[i];
    //M[i]:=roundTo(M[0]*M[i],-7);
    Form1.StringGrid1.Cells[1,i+1]:=floattostr(M[i]);
    Form1.StringGrid1.Cells[0,i+1]:=inttostr(i);
  end;
    Form1.StringGrid1.Cells[1,1]:=floattostr(M[0]);
    Form1.StringGrid1.Cells[0,1]:='0';

     for i:=0 to S do begin  //��������
      t:=t+M[i];
      Form1.Edit4.Text:=floattostr(t);
     end;
     Form1.Edit6.Text:=floattostr(M[S]+M[S-1]+M[S-2]); //������ ������

     k:=0;
     for i:=1 to S do k:=i*M[i]+k;
     Form1.Edit7.Text:=floattostr(k);  //�� ����� ������� �������
     Form1.Edit8.Text:=floattostr(k);  //�� � ������ ������
     Form1.Edit11.Text:='';
   M:=nil;

end;

//-------------------__�������������� � ��������, ������ �� 3__----------------------------
procedure Cicle_3nm(S,K:Integer; a,b:Double);
var
 c,p0,pn1,pn2,pn3,pn4,pn5,summ,t,r: double;
 i,KS: integer;
 M:array of double;
begin
 summ:=1;
 c:=a/b;
  p0:=0;
  pn1:= c;  //����������� ������� ���������
  pn2:= (c+c*c)/2; //����������� 2�� ���������
  pn4:=0;
  pn5:=0;
   KS:=K+S;
   SetLength(M, KS+1);
   M[0]:=0;
  if  (S=2) and (K=1) then begin //���� ������ 2 ������ � 1 �������
   M[1]:=pn1;
   M[2]:=c/2;
   M[3]:=c/2;
   M[0]:=1/(1+M[3]+M[2]+M[1]);
  end;
  if  (S=2) and (K=2) then begin  //���� ������ 2 ������ � 2 �������
   M[1]:=pn1;
   M[2]:=pn2;
   M[3]:=(c+c*c)/2;
   M[4]:=c*c/2;
   M[0]:=1/(1+M[4]+M[3]+M[2]+M[1]);
  end;
  if  (S=3) and (K=1) then begin  //���� ������ 2 ������ � 2 �������
   M[1]:=pn1;
   M[2]:=pn2;
   M[3]:=(c+c*c)/3;
   M[4]:=c*c/3;
   M[0]:=1/(1+M[4]+M[3]+M[2]+M[1]);
  end;

  if (S=2)and(K>=3) then begin  // 2 ������ � ����� �������
   M[1]:=pn1;
   M[2]:=pn2;
   pn3:=(c+pn1*c+pn2*c)/S;
   M[3]:=pn3;
   for i := 2 to K-1 do begin // �������
       p0:=c*(pn1+pn2+pn3)/S;
       pn4:=(pn1+pn2)*c/S;
       pn5:=pn2*c/S;
       pn1:=pn2;
       pn2:=pn3;
       pn3:=p0;
       M[S+i]:=p0;
      end;
   M[KS-1]:=pn4;
   M[KS]:=pn5;
  end;

  if (S>=3)and(K>=2) then begin  //����� 2 ������� � �������
   M[1]:=pn1;
   M[2]:=pn2;
   pn3:= (c+c*c+pn2*c)/3;
   M[3]:=pn3;
    if  S>=4 then begin
     for i := 4 to S do begin
       p0:=c*(pn1+pn2+pn3)/i;
      // pn4:=(pn1+pn2)*c/i;
      // pn5:=pn2*c/(i+1);
       pn1:=pn2;
       pn2:=pn3;
       pn3:=p0;
       M[i]:=p0;
     end;
    end;
      for i := 1 to K-1 do begin // �������
       p0:=c*(pn1+pn2+pn3)/S;
       pn4:=(pn1+pn2)*c/S;
       pn5:=pn2*c/(S);
       pn1:=pn2;
       pn2:=pn3;
       pn3:=p0;
       M[S+i]:=p0;
      end;
   M[KS-1]:=pn4;
   M[KS]:=pn5;
  end;

   for i := 1 to KS do summ:=summ + M[i];
   M[0]:=1/summ; //����������� �������� ���������
   //M[0]:=roundTo(1/summ,-7);
  for i:= 1 to KS do begin  //�������� �����������
    M[i]:=M[0]*M[i];
    //M[i]:=roundTo(M[0]*M[i],-7);
    Form1.StringGrid1.Cells[1,i+1]:=floattostr(M[i]);
    Form1.StringGrid1.Cells[0,i+1]:=inttostr(i);
  end;
    Form1.StringGrid1.Cells[1,1]:=floattostr(M[0]);
    Form1.StringGrid1.Cells[0,1]:='0';

    t:=0;
     for i:=0 to KS do begin  //��������
      t:=t+M[i];
      Form1.Edit4.Text:=floattostr(t);
     end;
     Form1.Edit6.Text:=floattostr(M[KS]+M[KS-1]+M[KS-2]); //������ ������

     r:=0;
     for i:=1 to S do r:=i*M[i]+r;
     for i:=S+1 to KS do r:=M[i]*S+r;
     Form1.Edit7.Text:=floattostr(r);  //�� ����� ������� �������

     r:=0;
     for i:=S+1 to KS-1 do r:=i*M[i+1]+r; //�� �  ������ � �������
     Form1.Edit11.Text:=floattostr(r);
     r:=(1-(M[S]+M[S-1]))*(a/b)+r;   //�� �  ������ � ��� !!!!���������
     Form1.Edit8.Text:=floattostr(r);
   M:=nil;

end;

//------------------- �����������., � ��������, ������ �� 3, 2 � 1 -------------
procedure Cicle_321(S:Integer; a,a2,a3,b:Double);
var
 p0,pn1,pn2,pn3,pn4,pn5,summ,t,r: double;
 i: integer;
 M:array of double;
begin
 summ:=1;
 t:=0;
  p0:=0;
  pn1:= a/b+a2/b+a3/b;  //����������� ������� ���������
  pn2:= 0;
  pn3:= 0;
  pn4:=0;
  SetLength(M, S+1);
   M[0]:=0;
  if  S=3 then begin //���� ������ 3 ������
   M[1]:=pn1;
   M[2]:=a3/b+a2/b+(a2+a)*pn1/b;
   M[3]:=a3/b+M[1]*a2/b+M[2]*a/b;
   M[0]:=1/(1+M[3]+M[2]+M[1]);
  end;
  if  S=4 then begin  //���� ������ 4 ������
   M[1]:=pn1;
   M[2]:=a3/b+a2/b+(a3+a2+a)*pn1/b;
   M[3]:=a3/b+(a3+a2)*M[1]/b+(a2+a)*M[2]/b;
   M[4]:=M[1]*a3/b+M[2]*a2/b+M[3]*a/b;
   M[0]:=1/(1+M[4]+M[3]+M[2]+M[1]);
  end;
  if S>=5 then begin  //����� 5 �������
   M[1]:=pn1;
   pn2:=a3/b+a2/b+(a3+a2+a)*pn1/b;
   M[2]:= pn2;
   pn3:= a3/b+(a3+a2)*M[1]/b+(a3+a2+a)*M[2]/b;
   M[3]:= pn3;
    for i := 4 to S-1 do begin
       p0:=(pn1*a3+pn2*a3+pn2*a2+pn3*a3+pn3*a2+pn3*a)/b;
       pn4:=(pn1*a3+pn2*a3+pn2*a2+pn3*a2+pn3*a)/b;
       pn5:=(pn2*a3+pn3*a2+pn4*a)/b;
       pn1:=pn2;
       pn2:=pn3;
       pn3:=p0;
       M[i]:=p0;
    end;
   M[S-1]:=pn4;
   M[S]:=pn5;
  end;
   for i := 1 to S do summ:=summ + M[i];
   M[0]:=1/summ; //����������� �������� ���������
   //M[0]:=roundTo(1/summ,-7);
  for i:= 1 to S do begin  //�������� �����������
    M[i]:=M[0]*M[i];
    //M[i]:=roundTo(M[0]*M[i],-7);
    Form1.StringGrid1.Cells[1,i+1]:=floattostr(M[i]);
    Form1.StringGrid1.Cells[0,i+1]:=inttostr(i);
  end;
    Form1.StringGrid1.Cells[1,1]:=floattostr(M[0]);
    Form1.StringGrid1.Cells[0,1]:='0';

     for i:=0 to S do t:=t+M[i]; //��������
     Form1.Edit4.Text:=floattostr(t);

     Form1.Edit6.Text:=floattostr(M[S]+M[S-1]+M[S-2]); //������ ������
     Form1.Edit7.Text:=floattostr(1-M[0]); //�� ����� ������� �������

     r:=0;
     for i:=1 to S-1 do r:=i*M[i+1]+r; //�� �  ������ � �������
     Form1.Edit11.Text:=floattostr(r);
     r:=(1-(M[S]+M[S-1]+M[S-2]))*(a/b+a2/b+a3/b)+r;           //�� �  ������ � ��� !!!!���������
     Form1.Edit8.Text:=floattostr(r);
   M:=nil;

end;

//------------------- ��������������, ������ �� 3, 2 � 1 -----------------------
procedure Cicle_321n(S:Integer; a,a2,a3,b:Double);
var
 p0,pn1,pn2,pn3,pn4,pn5,summ,t,k: double;
 i: integer;
 M:array of double;
begin
 summ:=1;
 t:=0;
  p0:=0;
  pn1:= a/b+a2/b+a3/b;  //����������� ������� ���������
  pn2:= 0;
  pn3:= 0;
  pn4:=0;
  SetLength(M, S+1);
   M[0]:=0;
  if  S=3 then begin //���� ������ 3 ������
   M[1]:=pn1;
   M[2]:=(a3/b+a2/b+(a2+a)*pn1/b)/2;
   M[3]:=(a3/b+M[1]*a2/b+M[2]*a/b)/3;
   M[0]:=1/(1+M[3]+M[2]+M[1]);
  end;
  if  S=4 then begin  //���� ������ 4 ������
   M[1]:=pn1;
   M[2]:=(a3/b+a2/b+(a3+a2+a)*pn1/b)/2;
   M[3]:=(a3/b+(a3+a2)*M[1]/b+(a2+a)*M[2]/b)/3;
   M[4]:=(M[1]*a3/b+M[2]*a2/b+M[3]*a/b)/4;
   M[0]:=1/(1+M[4]+M[3]+M[2]+M[1]);
  end;
  if S>=5 then begin  //����� 5 �������
   M[1]:=pn1;
   pn2:=(a3/b+a2/b+(a3+a2+a)*pn1/b)/2;
   M[2]:= pn2;
   pn3:= (a3/b+(a3+a2)*M[1]/b+(a3+a2+a)*M[2]/b)/3;
   M[3]:= pn3;
    for i := 4 to S-1 do begin
       p0:=((pn1*a3+pn2*a3+pn2*a2+pn3*a3+pn3*a2+pn3*a)/b)/i;
       pn4:=((pn1*a3+pn2*a3+pn2*a2+pn3*a2+pn3*a)/b)/i;
       pn5:=((pn2*a3+pn3*a2+pn4*a)/b)/(i+1);
       pn1:=pn2;
       pn2:=pn3;
       pn3:=p0;
       M[i]:=p0;
    end;
   M[S-1]:=pn4;
   M[S]:=pn5;
  end;
   for i := 1 to S do summ:=summ + M[i];
   M[0]:=1/summ; //����������� �������� ���������
   //M[0]:=roundTo(1/summ,-7);
  for i:= 1 to S do begin  //�������� �����������
    M[i]:=M[0]*M[i];
    //M[i]:=roundTo(M[0]*M[i],-7);
    Form1.StringGrid1.Cells[1,i+1]:=floattostr(M[i]);
    Form1.StringGrid1.Cells[0,i+1]:=inttostr(i);
  end;
    Form1.StringGrid1.Cells[1,1]:=floattostr(M[0]);
    Form1.StringGrid1.Cells[0,1]:='0';

     for i:=0 to S do t:=t+M[i]; //��������
     Form1.Edit4.Text:=floattostr(t);

     Form1.Edit6.Text:=floattostr(M[S]+M[S-1]+M[S-2]); //������ ������
     k:=0;
     for i:=1 to S do k:=i*M[i]+k;
     Form1.Edit7.Text:=floattostr(k);  //�� ����� ������� �������
     Form1.Edit8.Text:=floattostr(k);  //�� � ������ ������
   M:=nil;

end;

//-------------------__�������������� � ��������, ������ �� 3, 2 � 1 -----------
procedure Cicle_321nm(S,K:Integer; a,a2,a3,b:Double);
var
 p0,pn1,pn2,pn3,pn4,pn5,summ,t,r: double;
 i,KS: integer;
 M:array of double;
begin
 summ:=1;
  p0:=0;
  pn1:= a/b+a2/b+a3/b;  //����������� ������� ���������
  pn2:=0;
  pn3:=0;
  pn4:=0;
  pn5:=0;
   KS:=K+S;
   SetLength(M, KS+1);
   M[0]:=0;
  if  (S=2) and (K=1) then begin //���� ������ 2 ������ � 1 �������
   M[1]:=pn1;
   M[2]:=(a3/b+a2/b+(a2+a)*pn1/b)/2;
   M[3]:=(a3/b+M[1]*a2/b+M[2]*a/b)/2;
   M[0]:=1/(1+M[3]+M[2]+M[1]);
  end;
  if  (S=2) and (K=2) then begin  //���� ������ 2 ������ � 2 �������
   M[1]:=pn1;
   M[2]:=(a3/b+a2/b+(a3+a2+a)*pn1/b)/2;
   M[3]:=(a3/b+(a3+a2)*M[1]/b+(a2+a)*M[2]/b)/2;
   M[4]:=(M[1]*a3/b+M[2]*a2/b+M[3]*a/b)/2;
   M[0]:=1/(1+M[4]+M[3]+M[2]+M[1]);
  end;
  if  (S=3) and (K=1) then begin  //���� ������ 2 ������ � 2 �������
   M[1]:=pn1;
   M[2]:=(a3/b+a2/b+(a3+a2+a)*pn1/b)/2;
   M[3]:=(a3/b+(a3+a2)*M[1]/b+(a2+a)*M[2]/b)/3;
   M[4]:=(M[1]*a3/b+M[2]*a2/b+M[3]*a/b)/3;
   M[0]:=1/(1+M[4]+M[3]+M[2]+M[1]);
  end;

  if (S=2)and(K>=3) then begin  // 2 ������ � ����� �������
   M[1]:=pn1;
   pn2:=(a3/b+a2/b+(a3+a2+a)*pn1/b)/2;
   M[2]:= pn2;
   pn3:= (a3/b+(a3+a2)*M[1]/b+(a3+a2+a)*M[2]/b)/2;
   M[3]:= pn3;
   for i := 2 to K-1 do begin // �������
       p0:=((pn1*a3+pn2*a3+pn2*a2+pn3*a3+pn3*a2+pn3*a)/b)/S;
       pn4:=((pn1*a3+pn2*a3+pn2*a2+pn3*a2+pn3*a)/b)/S;
       pn5:=((pn2*a3+pn3*a2+pn4*a)/b)/S;
       pn1:=pn2;
       pn2:=pn3;
       pn3:=p0;
       M[S+i]:=p0;
      end;
   M[KS-1]:=pn4;
   M[KS]:=pn5;
  end;

  if (S>=3)and(K>=2) then begin  //����� 2 ������� � �������
   M[1]:=pn1;
   pn2:=(a3/b+a2/b+(a3+a2+a)*pn1/b)/2;
   M[2]:= pn2;
   pn3:= (a3/b+(a3+a2)*M[1]/b+(a3+a2+a)*M[2]/b)/3;
   M[3]:= pn3;
    if  S>=4 then begin
     for i := 4 to S do begin
       p0:=((pn1*a3+pn2*a3+pn2*a2+pn3*a3+pn3*a2+pn3*a)/b)/i;
       pn1:=pn2;
       pn2:=pn3;
       pn3:=p0;
       M[i]:=p0;
     end;
    end;
      for i := 1 to K-1 do begin // �������
       p0:=((pn1*a3+pn2*a3+pn2*a2+pn3*a3+pn3*a2+pn3*a)/b)/S;
       pn4:=((pn1*a3+pn2*a3+pn2*a2+pn3*a2+pn3*a)/b)/S;
       pn5:=((pn2*a3+pn3*a2+pn4*a)/b)/S;
       pn1:=pn2;
       pn2:=pn3;
       pn3:=p0;
       M[S+i]:=p0;
      end;
   M[KS-1]:=pn4;
   M[KS]:=pn5;
  end;

   for i := 1 to KS do summ:=summ + M[i];
   M[0]:=1/summ; //����������� �������� ���������
   //M[0]:=roundTo(1/summ,-7);
  for i:= 1 to KS do begin  //�������� �����������
    M[i]:=M[0]*M[i];
    //M[i]:=roundTo(M[0]*M[i],-7);
    Form1.StringGrid1.Cells[1,i+1]:=floattostr(M[i]);
    Form1.StringGrid1.Cells[0,i+1]:=inttostr(i);
  end;
    Form1.StringGrid1.Cells[1,1]:=floattostr(M[0]);
    Form1.StringGrid1.Cells[0,1]:='0';

    t:=0;
     for i:=0 to KS do begin  //��������
      t:=t+M[i];
      Form1.Edit4.Text:=floattostr(t);
     end;

     Form1.Edit6.Text:=floattostr(M[KS]+M[KS-1]+M[KS-2]); //������ ������

     r:=0;
     for i:=1 to S do r:=i*M[i]+r;
     for i:=S+1 to K do r:=S*M[i]+r;
     Form1.Edit7.Text:=floattostr(r);  //�� ����� ������� �������

      r:=0;
     for i:=1 to S-1 do r:=i*M[i+1]+r; //�� �  ������ � �������
     Form1.Edit11.Text:=floattostr(r);
     r:=(1-(M[S]+M[S-1]+M[KS-2]))*(a/b+a2/b+a3/b)+r;    //�� �  ������ � ��� !!!!���������
     Form1.Edit8.Text:=floattostr(r);
   M:=nil;

end;

//------------------------------------------------------------------------------
procedure TForm1.RadioGroup2Click(Sender: TObject);
begin
 if RadioGroup2.ItemIndex=1 then begin
  RadioButton4.Enabled:= false;
  RadioButton5.Enabled:= false;
  RadioButton6.Enabled:= false;
  Edit9.Enabled := false;
  Edit10.Enabled:= false;
  Edit1.Enabled:=  true;
 end;
 if RadioGroup2.ItemIndex=0 then begin
  RadioButton4.Enabled:= true;
  RadioButton5.Enabled:= true;
  RadioButton6.Enabled:= true;
  Edit9.Enabled:=  false;
  Edit10.Enabled:=  false;
  Edit1.Enabled:=  true;
 end;
 if RadioGroup2.ItemIndex=2 then begin
  RadioButton4.Enabled:= false;
  RadioButton5.Enabled:= false;
  RadioButton6.Enabled:= false;
  Edit9.Enabled:=  true;
  Edit10.Enabled:=  false;
  Edit1.Enabled:=  true;
 end;
 if RadioGroup2.ItemIndex=3 then begin
  RadioButton4.Enabled:= false;
  RadioButton5.Enabled:= false;
  RadioButton6.Enabled:= false;
  Edit9.Enabled:=  true;
  Edit10.Enabled:=  true;
  Edit1.Enabled:=  true;
 end;
end;

//------------------------------------------------------------------------------
end.


