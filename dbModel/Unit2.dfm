object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 143
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 232
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 80
    Top = 88
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=root;Persist Security Info=True;User' +
      ' ID=root;Data Source=mysql;Initial Catalog=sdo'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 144
    Top = 64
  end
end
