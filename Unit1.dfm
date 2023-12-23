object form1: Tform1
  Left = 0
  Top = 0
  Caption = 'MazeGenerator'
  ClientHeight = 489
  ClientWidth = 669
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 7
    Height = 15
    Caption = 'X'
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 7
    Height = 15
    Caption = 'Y'
  end
  object Label3: TLabel
    Left = 20
    Top = 74
    Width = 70
    Height = 15
    Caption = 'Start Position'
  end
  object Label4: TLabel
    Left = 20
    Top = 151
    Width = 77
    Height = 15
    Caption = 'Finish Position'
  end
  object Image1: TImage
    Left = 103
    Top = 16
    Width = 561
    Height = 489
  end
  object Edit1: TEdit
    Left = 20
    Top = 16
    Width = 55
    Height = 23
    TabOrder = 0
    Text = '5'
  end
  object Edit2: TEdit
    Left = 20
    Top = 45
    Width = 55
    Height = 23
    TabOrder = 1
    Text = '5'
  end
  object Button2: TButton
    Left = 8
    Top = 249
    Width = 75
    Height = 25
    Caption = 'Generate'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit3: TEdit
    Left = 20
    Top = 93
    Width = 55
    Height = 23
    TabOrder = 3
    Text = '1'
  end
  object Edit4: TEdit
    Left = 20
    Top = 122
    Width = 55
    Height = 23
    TabOrder = 4
    Text = '1'
  end
  object Edit5: TEdit
    Left = 20
    Top = 172
    Width = 55
    Height = 23
    TabOrder = 5
    Text = '5'
  end
  object Edit6: TEdit
    Left = 20
    Top = 201
    Width = 55
    Height = 23
    TabOrder = 6
    Text = '5'
  end
  object Button1: TButton
    Left = 8
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 7
    OnClick = Button1Click
  end
  object SD1: TSavePictureDialog
    DefaultExt = '.bmp'
    Left = 16
    Top = 360
  end
end
