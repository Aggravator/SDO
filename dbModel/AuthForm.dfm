object AuthForm: TAuthForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
  ClientHeight = 118
  ClientWidth = 296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 0
    Top = 93
    Width = 296
    Height = 25
    Align = alBottom
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
    ExplicitLeft = 82
    ExplicitTop = 111
    ExplicitWidth = 75
  end
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 296
    Height = 62
    Align = alClient
    Alignment = taLeftJustify
    BevelOuter = bvNone
    ColumnCollection = <
      item
        SizeStyle = ssAbsolute
        Value = 100.000000000000000000
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
      end
      item
        Column = 0
        Control = Label2
        Row = 1
      end
      item
        Column = 1
        Control = Edit2
        Row = 1
      end>
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    Padding.Bottom = 2
    RowCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 289
    ExplicitHeight = 97
    DesignSize = (
      296
      62)
    object Label1: TLabel
      Left = 26
      Top = 7
      Width = 51
      Height = 19
      Anchors = []
      Caption = #1051#1086#1075#1080#1085':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 27
      ExplicitTop = 16
    end
    object Edit1: TEdit
      Left = 104
      Top = 4
      Width = 188
      Height = 25
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 153
      ExplicitTop = 16
      ExplicitWidth = 160
      ExplicitHeight = 24
    end
    object Label2: TLabel
      Left = 22
      Top = 36
      Width = 60
      Height = 19
      Anchors = []
      Caption = #1055#1072#1088#1086#1083#1100':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 27
      ExplicitTop = 70
    end
    object Edit2: TEdit
      Left = 104
      Top = 33
      Width = 188
      Height = 25
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
      ExplicitLeft = 153
      ExplicitTop = 70
      ExplicitWidth = 160
      ExplicitHeight = 24
    end
  end
  object CheckBox1: TCheckBox
    AlignWithMargins = True
    Left = 7
    Top = 62
    Width = 289
    Height = 31
    Margins.Left = 7
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    Caption = #1047#1072#1087#1086#1084#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitLeft = 0
    ExplicitWidth = 405
  end
end
