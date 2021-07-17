unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UCVector, Vcl.StdCtrls, Vcl.Grids,
  Vcl.Menus ;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    Mtodos1: TMenuItem;
    CargarVector1: TMenuItem;
    MostrarVector1: TMenuItem;
    Promedio1: TMenuItem;
    Busqueda1: TMenuItem;
    BusquedaSecuencial1: TMenuItem;
    Ordenamiento1: TMenuItem;
    OrdenamientoporIntercambio1: TMenuItem;
    BusquedaSecuencialOrdenada1: TMenuItem;
    O1: TMenuItem;
    OrdenamientoBurbuja1: TMenuItem;
    Button2: TButton;
    OrdenamientoSell1: TMenuItem;
    BusquedaBinaria1: TMenuItem;
    OrdenamientoMergeSort1: TMenuItem;
    ModExamen1: TMenuItem;
    BubbleSortRango1: TMenuItem;
    VerificarOrden1: TMenuItem;
    SeleccinSalto1: TMenuItem;
    EliminarRango1: TMenuItem;
    OrdenamientoQuicksort1: TMenuItem;
    DelTodosRepetidos1: TMenuItem;
    delRepetidos1: TMenuItem;
    cantidadDePrimos1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CargarVector1Click(Sender: TObject);
    procedure MostrarVector1Click(Sender: TObject);
    procedure OrdenamientoporIntercambio1Click(Sender: TObject);
    procedure Promedio1Click(Sender: TObject);
    procedure BusquedaSecuencial1Click(Sender: TObject);
    procedure BusquedaSecuencialOrdenada1Click(Sender: TObject);
    procedure OrdenamientoBurbuja1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure OrdenamientoSell1Click(Sender: TObject);
    procedure BusquedaBinaria1Click(Sender: TObject);
    procedure OrdenamientoMergeSort1Click(Sender: TObject);
    procedure BubbleSortRango1Click(Sender: TObject);
    procedure VerificarOrden1Click(Sender: TObject);
    procedure SeleccinSalto1Click(Sender: TObject);
    procedure EliminarRango1Click(Sender: TObject);
    procedure OrdenamientoQuicksort1Click(Sender: TObject);
    procedure DelTodosRepetidos1Click(Sender: TObject);
    procedure delRepetidos1Click(Sender: TObject);
    procedure cantidadDePrimos1Click(Sender: TObject);
  private
    { Private declarations }
    v:vector;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
var
  i: Integer;
begin
v.dimensionar(StringGrid1.ColCount);
   for i := 1 to v.GetDimension do
       StringGrid1.Cells[I-1,0]:=FloatToStr(0);;
end;

procedure TForm1.cantidadDePrimos1Click(Sender: TObject);
begin
  ShowMessage(IntToStr(v.ContarPrimos));
end;

procedure TForm1.Button1Click(Sender: TObject);    //acomoda la matriz según las columnas
begin
    stringGrid1.colcount:= StrtoInt(edit1.text);
     case StrToInt(edit1.text) of
       10..14: (form1.width:= 900);
       15..20: (form1.width:= 1180);
     end;
     case StrToInt(edit1.text) of           //matriz
       1:stringGrid1.Width:=60;
       2:stringGrid1.Width:=117;
       3:stringGrid1.Width:=171;
       4:stringGrid1.Width:=228;
       5:stringGrid1.Width:=285;
       6:stringGrid1.Width:=340;
       7:stringGrid1.Width:=398;
       8:stringGrid1.Width:=453;
       9:stringGrid1.Width:=508;
       10:stringGrid1.Width:=564;
       11:stringGrid1.Width:=620;
       12:stringGrid1.Width:=676;
       13:stringGrid1.Width:=732;
       14:stringGrid1.Width:=788;
       15:stringGrid1.Width:=844;
       16:stringGrid1.Width:=900;
       17:stringGrid1.Width:=956;
       18:stringGrid1.Width:=1012;
       19:stringGrid1.Width:=1088;
       20:stringGrid1.Width:=1124;
     end;

end;



procedure TForm1.CargarVector1Click(Sender: TObject);
Var
      I : Word;
begin
v.dimensionar(StringGrid1.ColCount);
     for I := 1 to v.getdimension  do
     Begin
           v.ModElement(I,StrToFloat(StringGrid1.Cells[I-1,0]));
     End;
end;



procedure TForm1.delRepetidos1Click(Sender: TObject);
begin
v.DelRepetidosDejarUnicos;
end;

procedure TForm1.DelTodosRepetidos1Click(Sender: TObject);
begin
  v.DelRepetidos;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  v:=vector.Create;
end;



procedure TForm1.MostrarVector1Click(Sender: TObject);
Var
      I : Word;
begin
     StringGrid1.ColCount:=v.getdimension;
     for I := 1 to v.getdimension do
     Begin
          StringGrid1.Cells[I-1,0]:=FloatTostr(v.getElement(I));
     End;


end;

procedure TForm1.Promedio1Click(Sender: TObject);
begin
    showMessage('El promedio de los elementos es['+FloatToStr(v.PromedioElementos)+']') ;
end;





//Busqueda

procedure TForm1.BusquedaSecuencial1Click(Sender: TObject);
Var
    Valor : Real;
    p  : Word;
begin
     Valor :=StrToFloat( InputBox('Busqueda','Digite valor a buscar','0'));
     P:=v.SearchElement(Valor);
     if P>0 then showMessage('Se encuentra en la posicion['+IntToStr(P)+']')
     Else showMessage('No se encuentra');
end;

procedure TForm1.BusquedaSecuencialOrdenada1Click(Sender: TObject);
Var
    Valor : Real;
    p  : Word;
begin
     Valor :=StrToFloat( InputBox('Busqueda','Digite valor a buscar','0'));
     P:=v.orderedSequentialSearch(Valor);
     if P>0 then showMessage('Se encuentra en la posicion['+IntToStr(P)+']')
     Else showMessage('No se encuentra');
end;


procedure TForm1.BusquedaBinaria1Click(Sender: TObject);
Var
    Valor : Real;
    p  : Word;
begin
     Valor :=StrToFloat( InputBox('Busqueda','Digite valor a buscar','0'));
     P:=v.SearchBinary(Valor);
     if P>0 then showMessage('Se encuentra en la posicion['+IntToStr(P)+']')
     Else showMessage('No se encuentra');

end;

//Ordenamiento

procedure TForm1.OrdenamientoporIntercambio1Click(Sender: TObject);
begin
     v.classifyElements;
end;


procedure TForm1.OrdenamientoBurbuja1Click(Sender: TObject);
begin
    v.Burbuja;
end;


procedure TForm1.OrdenamientoSell1Click(Sender: TObject);
begin
    v.Shell;
end;

procedure TForm1.OrdenamientoMergeSort1Click(Sender: TObject);
begin
   v.MergeSort;
end;

procedure TForm1.OrdenamientoQuicksort1Click(Sender: TObject);
begin
   v.Quicksort;
end;



 //modelos de examen
procedure TForm1.BubbleSortRango1Click(Sender: TObject);
var a,b:word;
begin
 a:=StrToInt(inputBox('Introduzca A','',''));
 b:=StrToInt(inputBox('Introduzca B','',''));
  v.BubbleSortRango(a,b);
end;

procedure TForm1.VerificarOrden1Click(Sender: TObject);
var a,b:word;
begin
 a:=StrToInt(inputBox('Introduzca A','',''));
 b:=StrToInt(inputBox('Introduzca B','',''));
  showMessage(boolToStr(v.VerificarOrden(a,b)));
end;

procedure TForm1.SeleccinSalto1Click(Sender: TObject);
var a:word;
begin
  a:=StrToInt(inputBox('Introduzca Salto','',''));
  v.SeleccionSaltos(a);
end;

procedure TForm1.EliminarRango1Click(Sender: TObject);
var a,b:word;
begin
  a:=StrToInt(inputBox('Introduzca A','',''));
  b:=StrToInt(inputBox('Introduzca B','',''));
  v.EliminarRango(a,b);
end;

end.
