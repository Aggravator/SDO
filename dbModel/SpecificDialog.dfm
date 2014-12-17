object SpecificDialog: TSpecificDialog
  Left = 0
  Top = 0
  Caption = #1057#1087#1077#1094#1080#1092#1080#1082#1072
  ClientHeight = 62
  ClientWidth = 398
  Color = clBtnFace
  Constraints.MaxHeight = 100
  Constraints.MinHeight = 100
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    AlignWithMargins = True
    Left = 3
    Top = 32
    Width = 392
    Height = 30
    Margins.Bottom = 0
    Align = alBottom
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
    ExplicitLeft = 0
    ExplicitTop = 48
    ExplicitWidth = 265
  end
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 398
    Height = 29
    Align = alClient
    BevelOuter = bvNone
    ColumnCollection = <
      item
        SizeStyle = ssAbsolute
        Value = 70.000000000000000000
      end
      item
        Value = 100.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = Label1
        Row = 0
      end
      item
        Column = 1
        Control = Edit1
        Row = 0
      end>
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    TabOrder = 1
    ExplicitLeft = 72
    ExplicitTop = 8
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 29
      Align = alClient
      Alignment = taCenter
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 18
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 65
      ExplicitHeight = 18
    end
    object Edit1: TEdit
      Left = 70
      Top = 0
      Width = 328
      Height = 29
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 76
      ExplicitTop = -3
    end
  end
end
