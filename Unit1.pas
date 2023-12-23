unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, math,
  Vcl.ExtCtrls, Vcl.ExtDlgs;

type
  Tform1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Image1: TImage;
    Button1: TButton;
    SD1: TSavePictureDialog;
    procedure Button2Click(Sender: TObject);
    procedure track(x1,y1:integer);
    function canmove(x1,y1:integer):bool;
    procedure del(x1,x2:integer);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type
  cell = record
   group:integer;
   r,d:integer;
  end;

var
  form1: Tform1;
  count:integer; //счетчик групп
  cel:array of array of cell; //массив ячеек
  x,y:integer;

implementation

{$R *.dfm}

procedure Tform1.Button1Click(Sender: TObject);
begin
if sd1.Execute then image1.Picture.SaveToFile(sd1.FileName);
end;

procedure Tform1.Button2Click(Sender: TObject);
var
i,j:integer;
 begin
 x:=strtoint(edit1.Text);
 y:=strtoint(edit2.Text);
 //Инициализация и заполнение массивов
 setlength(cel,x+1,y+1);
 for j := 1 to y do
   for i := 1 to x do
    begin
     cel[i,j].group:=0;
     cel[i,j].r:=1;
     cel[i,j].d:=1;
    end;
//Запускаем трактор по циклу
 count:=1;
 for j := 1 to y do
   for I := 1 to x do
     if cel[i,j].group=0 then
     begin
     track(i,j);
     inc(count);
     end;
//Объединяем группы по очереди
 for i:= 1 to x do
  for j:= 1 to y do
   begin
   if i<x then if cel[i+1,j].group<>1 then
    begin
    cel[i,j].r:=0;
    del(cel[i+1,j].group,i+1);
    end;
   if j<y then if cel[i,j+1].group<>1 then
    begin
    cel[i,j].d:=0;
    del(cel[i,j+1].group,i);
    end;
   end;
 //Отрисовка лабиринта
 image1.width:=x*20;
 image1.Height:=y*20;
 image1.Picture.Bitmap.Width:=x*20;
 image1.Picture.Bitmap.Height:=y*20;
 with image1.Canvas do
 begin
 brush.Color:=clwhite;
 fillrect(rect(0,0,width,height));
 pen.Color:=clblack;
 pen.Style:=psSolid;
 pen.Width:=2;
 Rectangle(1,1,x*20,y*20);
 for j := 1 to y do
  for i := 1 to x do
    begin
    moveto(i*20,(j-1)*20);
    if cel[i,j].r=1 then lineto(i*20,j*20);
    moveto((i-1)*20,j*20);
    if cel[i,j].d=1 then lineto(i*20,j*20);
    //form1.canvas.TextOut(200+(i-1)*20,200+(j-1)*20,inttostr(cel[i,j].group));
    end;
  font.Style:=[fsBold];
  font.Color:=clgreen;
  TextOut((strtoint(edit3.Text)-1)*20+7,(strtoint(edit4.Text)-1)*20+3,'S');
  font.Color:=clred;
  TextOut((strtoint(edit5.Text)-1)*20+7,(strtoint(edit6.Text)-1)*20+3,'F');
 end;
end;

procedure tform1.track(x1: Integer; y1: Integer);
var
k,mx,my:integer;
label start;
begin
//Процедура прохода и построения трактором лабиринта
mx:=x1;my:=y1;
cel[mx,my].group:=count;
start:
k:=random(4)+1;
 case k of
 1:
 if (mx>1) then
  if (cel[mx-1,my].group=0) then
  begin
    cel[mx-1,my].r:=0;
    cel[mx-1,my].group:=count;
    mx:=mx-1;
    goto start;
  end;
 2:
 if (mx<x) then
  if (cel[mx+1,my].group=0) then
  begin
    cel[mx,my].r:=0;
    cel[mx+1,my].group:=count;
    mx:=mx+1;
    goto start;
  end;
 3:
 if (my>1) then
  if (cel[mx,my-1].group=0) then
  begin
    cel[mx,my-1].d:=0;
    cel[mx,my-1].group:=count;
    my:=my-1;
    goto start;
  end;
 4:
 if (my<y) then
  if (cel[mx,my+1].group=0) then
  begin
    cel[mx,my].d:=0;
    cel[mx,my+1].group:=count;
    my:=my+1;
    goto start;
  end;
 end;
 //Проверяем не тупик ли
 if canmove(mx,my) then goto start;
 end;

function tform1.canmove(x1: Integer; y1: Integer): LongBool;
begin
//Проверка на возможность хода
result:=false;
if x1>1 then if cel[x1-1,y1].group=0 then
 begin
 result:=true;exit;
 end;
if x1<x then if cel[x1+1,y1].group=0 then
 begin
 result:=true;exit;
 end;
if y1>1 then if cel[x1,y1-1].group=0 then
 begin
 result:=true;exit;
 end;
if y1<y then if cel[x1,y1+1].group=0 then
 begin
 result:=true;exit;
 end;
end;

procedure tform1.del(x1,x2: Integer);
var
i,j,f:integer;
begin
for i:= x2 to x do
 begin
 f:=0;
 for j:= 1 to y do
  if cel[i,j].group=x1 then
   begin
   cel[i,j].group:=1;
   f:=1;
   end;
  if f=0 then exit;
 end;
end;


end.
