object ReportFirst: TReportFirst
  Left = 0
  Top = 0
  Caption = #1054#1090#1095#1077#1090
  ClientHeight = 92
  ClientWidth = 268
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 16
    Width = 50
    Height = 16
    Caption = #1044#1080#1072#1087#1079#1086#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 184
    Top = 18
    Width = 5
    Height = 16
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 0
    Top = 57
    Width = 268
    Height = 35
    Align = alBottom
    Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
    ExplicitTop = 208
    ExplicitWidth = 391
  end
  object ComboBox1: TComboBox
    Left = 131
    Top = 15
    Width = 41
    Height = 21
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 67
    Top = 15
    Width = 49
    Height = 21
    NumbersOnly = True
    TabOrder = 2
  end
  object ComboBox2: TComboBox
    Left = 209
    Top = 15
    Width = 41
    Height = 21
    TabOrder = 3
  end
end