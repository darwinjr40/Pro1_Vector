unit UCVector;

interface
uses sysutils, UCNumero;
const MaxE= 3060;

 type
   vector=class
     private
         Dimension:word;
         elementos:array [1..MaxE] of real;
         //elementos:array [1..MaxE] of Cadena;
         //elementos->[] ;

     public
            procedure AddElement (e:real);
            procedure InsElement (p:word; e:real);
            procedure ModElement (p:word; e:real);
            procedure DelElement (p:word);
            function GetElement (p:word):real;
            function GetDimension :word;

            function PromedioElementos :real;
            function biggestElement: real;
            function smalllestElement :real;
            function CountElementE (e:real):word;

            procedure Dimensionar(D:word);
            procedure Intercambiar(i,j:word);

            //busquedas
            function SearchElement (e:real):word;  //Secuencial
            function orderedSequentialSearch (e:real):word; //secuencial ordenado
            function SearchBinary(e:real):word;  // Binaria
            //function SearchHash(e:real):word;       no Desarrollado

            //ordenamiento
            procedure classifyElements;
            procedure Seleccion;
            procedure Burbuja;
            procedure Shell;
            procedure MergeSort;
            procedure Quicksort;
            //procedure HeapSort;      No desarrollado

            procedure Mezcla(i,m,f:word);
            procedure MSort(i,f:word);
            procedure Qsort(i,f:word);

            //Modelos de examen
            procedure BubbleSortRango(a,b:word);
            function VerificarOrden (a,b:word):boolean;
            procedure SeleccionSaltos(saltos:word);
            procedure EliminarRango(a,b:word);
            //ejercicios_1-2021-----------------------------
            procedure DelNegativos();
            //(2,-4,5,8,-1) -->(2,5,8)
            procedure DelRepetidosDejarUnicos();
            //(2,3,7,9,2,7,8)--> (2,3,7,9,8)
            procedure DelRepetidos;
            //(2,3,7,9,2,7,8)--> (3, 9, 8)
            function ContarPrimos():byte;
            //(4,5,9,13,3,2,7,8)--> 4
            function cantidadDeRepetidos():Byte;
            //(4,6,3,3,3,8,6,5) -->2
            procedure redondear();
            //(0.1,3.6,7,9.2,4) --> (1,4,7,10,4)
            function frecuencia(a, b : byte; x :real): byte ;
   end;

implementation

{ Vector }
//ingresa un elemento al final del vector
//elementos->[1,2,3] dimension=3 ; (e = 10)
//elementos->[1, 2, 3, 10]
procedure Vector.AddElement(e: real);
begin
   inc(dimension);
   elementos[dimension]:=e;
end;
//ingresa un elemento en una posicion del vector
//elementos->[1, 2, 3] dimension=3 ; (p = 2; e = 10)
//elementos->[1, 10, 2, 3]   dimension=4
procedure Vector.InsElement(p: word; e: real);
var i:word;
begin
   if (p>0) and (p<= dimension) then
    begin
    inc(dimension);
       for I:= dimension downto p+1 do //4,3,2..3
          begin
            elementos[i]:= elementos[i-1];
          end;
        elementos[p]:=e;
    end
    Else raise Exception.Create('Error posición fuera de rango');

end;




//remplaza un elemento en una posicion del vector
//elementos->[1, 2, 3] dimension=3 ; (p = 2; e = 10)
//elementos->[1, 10, 3]
procedure Vector.ModElement(p: word; e: real);
begin
if (p>0) and (p<=dimension) then
    begin
       elementos[p]:=e;
    end
    else raise Exception.Create('Error posición fuera de rango');
end;




//elimina un elemento en una posicion del vector
//elementos->[10, 20, 30] dimension=3 ; (p = 2)
//elementos->[10, 30]   dimension=2
procedure Vector.DelElement(p: word);
var i:word;
begin
  if (p>0) and (p<=dimension) then
  begin
       for I := p to dimension-1 do//2, 3..2
        begin
         elementos[i]:= elementos[i+1];
        end;
         dec(dimension);
  end
  else raise Exception.Create('Posición fuera de rango');

end;




procedure vector.DelNegativos;
begin

end;

procedure vector.DelRepetidos;
var i, p :Byte;
begin
  p := 0;
  for i := 1 to Dimension do begin
    if frecuencia(1, Dimension,elementos[i]) = 1 then begin
      inc(p);
      Intercambiar(i, p);
    end;
  end;
  Dimension := p;
end;

procedure vector.DelRepetidosDejarUnicos;
var i, p :Byte;
begin
  p := 0;
  for i := 1 to Dimension do begin
    if frecuencia(1, i,elementos[i]) <= 1 then begin
      inc(p);
      Intercambiar(i, p);
    end;
  end;
  Dimension := p;
end;

//retrona un elemento en una posicion del vector
//elementos->[10, 20, 30] dimension=3 ; (p = 2)
//obj.elementos[2] --> 20
function Vector.GetElement(p: word): real;
begin
 if (p>0) and (p<=dimension) then
  begin
     result:=elementos[p];
  end
  else raise Exception.Create('Posición fuera de rango');
end;


function Vector.GetDimension: word;
begin
  result:=dimension;
end;

function Vector.PromedioElementos: real;
var I:word;  total:real;
begin
if dimension > 0 then  begin
 total:=0;
for I := 1 to Dimension do
  total:=total+elementos[i];
result:=total / dimension;
end else raise Exception.Create('Error vector vacío');
end;




function Vector.biggestElement: real;
var i:word;    mayor:real;
begin
if dimension>0 then begin
 mayor:=elementos[1];
 for I := 2 to dimension do
      if elementos[i] > mayor then  mayor:=elementos[i];
   result:=mayor;
end else raise Exception.Create('Error vector vacío');
end;






function Vector.smalllestElement: real;
var i:word;   menor:real;
begin
if dimension > 0 then  begin
 menor:=elementos[1];
 for I := 2 to dimension do
      if elementos[i] < menor then  menor:=elementos[i];
   result:=menor;
end else raise Exception.Create('Error vector vacío');

end;


//moda <=> frecuencia <=> cantidadDeElementos
//retrona la cantidad de veces que se repite un elemento
//elementos->[10, 20, 30, 20, 20, 30] dimension=6 ; (e = 20)
//obj.CountElementE(20) --> 3
function Vector.CountElementE(e: real): word;       //cantidad de veces que esta E
var i,cantidad:word;
begin
  if dimension >0  then  begin
    cantidad:=0;
     for I := 1 to Dimension do begin
      if elementos[i]=e then
        inc(cantidad);
     end;
    result:=cantidad
  end else begin
    raise Exception.Create('Error vector vacío');
  end;

end;

function vector.ContarPrimos: byte;
var i, c:Byte;
    nro: Numero;
begin
  nro := Numero.crear();
  c := 0;
  for I := 1 to Dimension do begin
    nro.setValor(Trunc(elementos[i]));// valor = Trunc(elementos[i])
    //nro.valor := Trunc(elementos[i]);
    if  nro.verifPrimo then
      c := c + 1;
  end;
  result := c;
end;



//elementos->[10, 20, 30, 20, 20, 30] dimension=6 ; (D = 2)
//elementos->[10, 20]              30, 20, 20, 30]
 procedure vector.Dimensionar(D: word);
begin
        Dimension:=D;
end;



//intercambia dos posiciones del vector
//elementos->[10, 20, 30, 50, 20, 30] dimension=6 ; (i=2; j=4)
//elementos->[10, 50, 30, 20, 20, 30]     copia=20
procedure vector.Intercambiar(i, j: word);
var copia:real;
begin
    copia:=elementos[i];
    elementos[i]:= elementos[j];
    elementos[j]:= copia;
end;



//retorna la posicion del elemento que voy a buscar,
//si no encuentra elemento retorna --> 0
//elementos->[10, 20, 30, 50, 20, 30] dimension=6 ; (e=20)
//obj.SearchElement(20) --> 2         7
function Vector.SearchElement(e: real): word;
var i,posicion:word;   B:boolean;
begin
  i:=1;
 while ((i<=dimension) and (elementos[i] <> e )) do begin
  inc(i);
 end;

 if (i<=dimension) then begin
  result:=i;
 end else begin
  result:=0;
 end;
end;




function vector.orderedSequentialSearch(e: real): word;
var i,posicion:word;   B:boolean;
begin
i:=1;
 while ((i<=dimension) and (elementos[i]<>e ))and (elementos[i]<e)do  inc(i);
   if (elementos[i]=e) then begin result:=i;
   end else begin result:=0;
   end;
end;

function vector.SearchBinary(e: real): word;
var i,f,m,pos:word;
begin
 i:=1; f:= dimension;
  pos:=0;
  while (i<=f) and (pos=0) do
    begin
       m:=(i+f) div 2;
        if elementos[m]=e then
           begin
              pos:=m;
           end
           else if elementos[m]>e then f:=m-1
                else i:=m+1;


    end;
    result:=pos;
end;

function vector.cantidadDeRepetidos: Byte;
begin

end;

procedure Vector.classifyElements;      //ordena numeros
var i,j:word;   bandera:real;
begin
if dimension > 0 then
   begin
 for I := 1 to dimension-1 do
        for j := i+1 to dimension do
          begin
              if elementos[i]> elementos[j] then
              begin
                  intercambiar(i,j);
              end;

          end;
   end else raise Exception.Create('Error vector vacío');

end;


procedure vector.Seleccion;
var
  I: Integer;
  j,k: Integer;
begin
   if dimension >0  then begin
     for I := 1 to dimension-1 do
     begin
         k:=i;
         for j := i+1 to dimension do
            begin
              if elementos[k]> elementos[j] then k:=j;
            end;
       if k>i then  intercambiar(i,k);
     end;

   end else raise Exception.Create('Error vector vacío');
end;


procedure vector.Burbuja;
var  I,k: Integer;
begin
   if dimension >0  then begin
  for k := dimension downto 2 do
    begin
       for I := 1 to k-1 do
         begin
            if elementos[i] > elementos[i+1] then intercambiar(i,i+1);
         end;
    end;
   end else raise Exception.Create('Error vector vacío');
end;


procedure vector.Shell;
var f,i:word;    intercambio:boolean;
begin
 f:=dimension div 2;
  while f>0 do
  begin
    intercambio:=false;
      for I := 1 to dimension - f do
         if elementos[i] > elementos[i+f] then
          begin
            intercambiar(i,i+f);
            intercambio:= true;
          end;
   if not intercambio then f:=f div 2;
  end;
end;

procedure vector.MergeSort;
begin
  Msort(1,dimension);
end;

procedure vector.MSort(i, f: word);
var m:word;
begin
   if i<f then
   begin
      m:=(i+f) div 2;
      MSort(i,m);
      MSort(m+1,f);
      Mezcla(i,m,f);
   end;
end;

procedure vector.Mezcla(i, m, f: word);
 var Vt:array[1..maxE] of real;
  Y,t,k,L: Word;
begin
t:=1;
k:=i; L:=m+1;
 while (k<=m) and (L<=f) do
    begin
       if elementos[k] < elementos[L] then
         begin
            Vt[t]:=elementos[k];
            inc(k);
         end else begin
             Vt[t]:=elementos[L];
             inc(L);
         end;
        inc(t);
    end;
    while k<=m do
    begin
      Vt[t]:=elementos[k];
      inc(k);  inc(t);
    end;
    while L<=f do
    begin
      Vt[t]:=elementos[L];
      inc(L);  inc(t);
    end;
    t:=1;
    for Y := I to F do
     begin
       elementos[Y]:=Vt[t];
       inc(t);
     end;
end;



procedure vector.Quicksort;
begin
  Qsort(1,dimension);
end;

procedure vector.redondear;
begin

end;

procedure vector.Qsort(i, f: word);
var
izq,der,x,y:word;
m:word;
begin
 izq:=i;
 der:=f;
 m:=((trunc(elementos[i]) + trunc(elementos[f])) div 2);
 repeat
   while (elementos[i]<m) do
          i:=i+1;
   while (elementos[i]>m) do
          f:=f+1;
   if (i<=f) then
   begin
     intercambiar(i,f);
     i:=i+1;
     f:=f-1;
   end;
 until (i>f);
 if izq<f then
   QSort(izq,f);
 if (i<der) then
   QSort(i,der);

end;

//modelos de examen

//ordenar elementos de un segmento entre a y b por la tecnica burbuja
// V {4,7, 3,8,8,6,5, 9,1,3,4} y sea a=3 y b=7
procedure vector.BubbleSortRango(a, b: word);
var  I,k: Integer;
begin
   if dimension >0  then begin
  for k := b downto a+1 do
    begin
       for I := a to k-1 do
         begin
            if elementos[i] > elementos[i+1] then intercambiar(i,i+1);
         end;
    end;
   end else raise Exception.Create('Error vector vacío');

end;

//pregunta si los elemetos dado un rango estan ordenados
function vector.VerificarOrden(a, b: word): boolean;
var h:boolean;
  i: Word;
begin
h:=true;
if dimension > 0 then
begin
  for i := a to b-1 do
   begin
     if elementos[i] > elementos[i+1] then   h:=false;

   end;

end else raise Exception.Create('Error vector vacío');
    result:=h;
end;

//Ordenar elementos de un vector segun un intervalo por la tecnica de seleccion
// V {4, 7 ,3, 8 ,8, 6 ,5, 9 ,1, 3 ,4}    y sea salto=2
procedure vector.SeleccionSaltos(saltos: word);
var
  I: Integer;
  j,k: Integer;
begin
 i:=saltos;


   if dimension >0  then begin
   while i<dimension do   //for I := 1 to dimension-1 do
     begin
         k:=i;
         j := i+saltos;
         while j  <= dimension do
            begin
              if elementos[k]> elementos[j] then k:=j;
              j:=j+saltos;
            end;
       if k>i then  intercambiar(i,k);

       i:=i+saltos;
     end;

   end else raise Exception.Create('Error vector vacío');
end;

//eliminar los elementos en las posiciones a y b
procedure vector.EliminarRango(a, b: word);
var veces:word;
  I: Integer;
begin
veces:=b-a;
for I := 0 to veces do
begin
   delelement(a);
end;

end;


function vector.frecuencia(a, b: byte; x: real): byte;
var
  I, c: byte ;
begin
  if (a > 0)and(b <= Dimension) then begin
    c := 0;
    for I := a to b do begin
      if elementos[i] = x then
       c := c + 1;
    end;
    Result := c;
  end else begin
    Result := 255;
  end;
end;
end.


