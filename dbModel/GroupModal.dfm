object GroupModal: TGroupModal
  Left = 0
  Top = 0
  Caption = #1043#1088#1091#1087#1087#1072
  ClientHeight = 293
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    423
    293)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 11
    Width = 70
    Height = 18
    Align = alCustom
    Alignment = taCenter
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 6
    Top = 71
    Width = 39
    Height = 18
    Align = alCustom
    Alignment = taCenter
    Caption = #1055#1083#1072#1085':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 6
    Top = 43
    Width = 77
    Height = 18
    Align = alCustom
    Alignment = taCenter
    Caption = #1040#1082#1090#1091#1072#1083#1100#1085#1086':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object StringGrid1: TStringGrid
    Left = 6
    Top = 96
    Width = 411
    Height = 156
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 2
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs]
    TabOrder = 0
    OnKeyUp = StringGrid1KeyUp
    ColWidths = (
      77
      81)
  end
  object Edit1: TEdit
    Left = 80
    Top = 8
    Width = 337
    Height = 27
    Align = alCustom
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Button1: TButton
    AlignWithMargins = True
    Left = 3
    Top = 260
    Width = 417
    Height = 30
    Align = alBottom
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 16
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
  end
  object CheckBox1: TCheckBox
    Left = 94
    Top = 46
    Width = 25
    Height = 17
    TabOrder = 3
  end
end
