object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Vectores'
  ClientHeight = 360
  ClientWidth = 717
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 88
    Width = 101
    Height = 23
    Caption = 'Dimensi'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Left = 36
    Top = 47
    Width = 657
    Height = 35
    ColCount = 2
    DefaultColWidth = 55
    DefaultRowHeight = 30
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 120
    Width = 105
    Height = 25
    Caption = 'cargar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 115
    Top = 93
    Width = 30
    Height = 21
    TabOrder = 2
  end
  object Button2: TButton
    Left = 8
    Top = 168
    Width = 101
    Height = 25
    Caption = 'Reset Vector'
    TabOrder = 3
    OnClick = Button2Click
  end
  object MainMenu1: TMainMenu
    object Mtodos1: TMenuItem
      Caption = 'M'#233'todos'
      object CargarVector1: TMenuItem
        Caption = 'Cargar Vector'
        OnClick = CargarVector1Click
      end
      object MostrarVector1: TMenuItem
        Caption = 'Mostrar Vector'
        OnClick = MostrarVector1Click
      end
      object Promedio1: TMenuItem
        Caption = 'Promedio '
        OnClick = Promedio1Click
      end
      object DelTodosRepetidos1: TMenuItem
        Caption = 'DelTodosRepetidos'
        OnClick = DelTodosRepetidos1Click
      end
      object delRepetidos1: TMenuItem
        Caption = 'delRepetidos'
        OnClick = delRepetidos1Click
      end
      object cantidadDePrimos1: TMenuItem
        Caption = 'cantidadDePrimos'
        OnClick = cantidadDePrimos1Click
      end
    end
    object Busqueda1: TMenuItem
      Caption = 'Busqueda'
      object BusquedaSecuencial1: TMenuItem
        Caption = 'Busqueda Secuencial'
        OnClick = BusquedaSecuencial1Click
      end
      object BusquedaSecuencialOrdenada1: TMenuItem
        Caption = 'Busqueda Secuencial Ordenada'
        OnClick = BusquedaSecuencialOrdenada1Click
      end
      object BusquedaBinaria1: TMenuItem
        Caption = 'Busqueda Binaria'
        OnClick = BusquedaBinaria1Click
      end
    end
    object Ordenamiento1: TMenuItem
      Caption = 'Ordenamiento'
      object OrdenamientoporIntercambio1: TMenuItem
        Caption = 'Ordenamiento por Intercambio'
        OnClick = OrdenamientoporIntercambio1Click
      end
      object O1: TMenuItem
        Caption = 'O'
      end
      object OrdenamientoBurbuja1: TMenuItem
        Caption = 'Ordenamiento Burbuja'
        OnClick = OrdenamientoBurbuja1Click
      end
      object OrdenamientoSell1: TMenuItem
        Caption = 'Ordenamiento Sell'
        OnClick = OrdenamientoSell1Click
      end
      object OrdenamientoMergeSort1: TMenuItem
        Caption = 'Ordenamiento MergeSort'
        OnClick = OrdenamientoMergeSort1Click
      end
      object OrdenamientoQuicksort1: TMenuItem
        Caption = 'Ordenamiento Quicksort'
        OnClick = OrdenamientoQuicksort1Click
      end
    end
    object ModExamen1: TMenuItem
      Caption = 'Mod. Examen'
      object BubbleSortRango1: TMenuItem
        Caption = 'BubbleSort Rango'
        OnClick = BubbleSortRango1Click
      end
      object VerificarOrden1: TMenuItem
        Caption = 'Verificar Orden'
        OnClick = VerificarOrden1Click
      end
      object SeleccinSalto1: TMenuItem
        Caption = 'Selecci'#243'n Salto'
        OnClick = SeleccinSalto1Click
      end
      object EliminarRango1: TMenuItem
        Caption = 'Eliminar Rango'
        OnClick = EliminarRango1Click
      end
    end
  end
end
