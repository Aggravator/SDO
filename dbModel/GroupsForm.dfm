object GroupsForm: TGroupsForm
  Left = 0
  Top = 0
  Caption = 'Form5'
  ClientHeight = 243
  ClientWidth = 527
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
  object Button5: TButton
    AlignWithMargins = True
    Left = 0
    Top = 210
    Width = 527
    Height = 33
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button5Click
  end
  object Button1: TButton
    Left = 0
    Top = 174
    Width = 527
    Height = 33
    Align = alBottom
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 527
    Height = 174
    Align = alClient
    TabOrder = 2
    object GridPanel1: TGridPanel
      Left = 0
      Top = 0
      Width = 523
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      ColumnCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 35.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          Value = 100.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 35.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 1
          Control = Label2
          Row = 0
        end
        item
          Column = 2
          Control = Label1
          Row = 0
        end>
      RowCollection = <
        item
          Value = 100.000000000000000000
        end>
      TabOrder = 0
      DesignSize = (
        523
        25)
      object Label2: TLabel
        Left = 35
        Top = 0
        Width = 50
        Height = 25
        Align = alClient
        Alignment = taCenter
        Caption = ' '#1040#1082#1090#1080#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 38
        ExplicitHeight = 16
      end
      object Label1: TLabel
        Left = 258
        Top = 4
        Width = 56
        Height = 16
        Anchors = []
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 212
        ExplicitTop = 42
      end
    end
  end
  object ImageList1: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 25
    ImageType = itMask
    Width = 25
    Left = 312
    Top = 136
    Bitmap = {
      494C010102001400400019001900FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000640000001900000001002000000000001027
      00000000000000000000000000000000000000000000000000000E0E0E952020
      20E2050505600000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000009090974242424E72D2D2DFF141414DA010101440000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A0A38AB131383DD0000
      0017000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000001E2C2C92DC0D0D30A3000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000030303511717
      17C70E0E0EFF000000FF969696FFA8A8A8D30C0C0C4000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000909299B0E0EE5FF0808E5FF181886E30000001500000000000000000000
      0000000000000000000000000000000000000000000000000000000000183535
      C1F14747FFFF5252FFFF0B0B2393000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010101360B0B0BAC3B3B3BFFB4B4B4FFFFFFFFFFFFFF
      FFFFF3F3F3FF848484C70706062F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000009092A9D0D0DDFFF0000B8FF0404B3FF0D0D
      E1FF19198BE50000001700000000000000000000000000000000000000000000
      0000000000000000001C2F2FB4EC3C3CFFFF3535EFFF4040FEFF5555FFFF0B0B
      2394000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000202021C4242
      428FFAFAFAFFFFFFFFFFFBFBFBFFF5F5F5FFF9F8FAFFFFFFFCFFFFFFEAFF2C3F
      4C96000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000150A0A32A50303
      DEFF0000B6FF0606B6FF0808B9FF0505B7FF0E0EE3FF1C1C94EA000000160000
      000000000000000000000000000000000000000000192F2FBFF13535FFFF2F2F
      E6FF3737EEFF3A3AF2FF3F3FFDFF5050FFFF0D0D2EA100000002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000533333373FFFFFFFFFBFBFBFFF7F8F8FFF8F7
      F6FFFFFFF6FFFEFBF4FF77C4F5FF0896EFFF03131E5D00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000021303083DA2323E6FF0000ABFF0606B7FF0707B9FF0909
      BBFF0707B9FF1111E6FF1B1B8EE5000000160000000000000000000000000000
      001B2828B1EC2D2DFFFF2929DEFF3030E6FF3333EAFF3737EDFF3434EEFF4949
      FFFF1E1E6ECD0000000200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001A1A
      1A53FCFCFCFFF9F9FAFFFEFCF9FFFFFFF7FFCDE3F1FF37AAF3FF0091F2FF1B9C
      ECFF1E98E6FE0001021900000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000D3D3D
      8BD92323DFFF0000ADFF0707B9FF0808BAFF0B0BBCFF0909BBFF1414E9FF1C1C
      8BE40000001700000000000000172626AEEC2727FCFF2323D6FF2929DEFF2C2C
      E2FF3030E5FF2F2FE7FF3F3FFFFF1E1E70CC0000000600000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000009090932FDFDFCFFFFFFFCFFFFFFFDFF94D1
      F7FF0190EBFF018FEBFF2BA7F5FF23A0EEFF1E9BEAFF0E5481BF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000005393981D32424E0FF0000AEFF0909
      BAFF0A0ABCFF0C0CBEFF0A0ABCFF1616ECFF171775DC010103481D1D96E62020
      F5FF1C1CD0FF2323D7FF2626DBFF2929DEFF2828DFFF3939FFFF1C1C67C70000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      0217FFFFFFFFDFEDF6FF3FA7E9FF0097F8FF1A9EF2FF1E9AE8FF219EEDFF27A4
      F3FF1F9DECFF1C99E8FF051F2F75000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000441418FDB2424E2FF0000B0FF0A0ABBFF0B0BBDFF0D0DBFFF0C0C
      BEFF1515D6FF2828DAFF1919DCFF1717C9FF1D1DD1FF2020D5FF2323D7FF2121
      D8FF3131FFFF1C1C70CD00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000087AEC7E40C91E8FF007CDBFF1F9E
      ECFF2DAAF9FF209DECFF1896E5FF24A1F0FF24A1F0FF1D9BEAFF1996E5FF0004
      062B000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000539397FD22525
      E2FF0000B1FF0B0BBCFF0C0CBEFF0F0FC1FF1010C4FF0F0FCBFF1515C8FF1818
      CBFF1A1ACEFF1D1DD1FF1B1BD1FF2B2BFFFF191967C800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000F1852149AEFFF1F9BE8FF128FDEFF25A2F1FF26A4F3FF1A98E7FF1895
      E4FF25A2F1FF209DECFF1B99E8FF10679ED50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000241418FDB2626E3FF0000B2FF0C0CBDFF0D0D
      C0FF0F0FC2FF1111C4FF1313C7FF1515C9FF1818CBFF1616CBFF2424FCFF1818
      65C8000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010405F9F22A0EFFF1895
      E4FF1693E2FF27A5F4FF219EEDFF1692E1FF1B98E7FF24A2F1FF1C9AE9FF1996
      E5FF062B428B0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00082E2E64C02A2AD2FF0202BAFF0B0BBEFF0D0DC0FF0F0FC2FF1111C4FF1414
      C6FF1414CAFF1C1CDEFF11114DB7000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000011781C4E5219EEDFF1693E2FF1B98E7FF25A3F2FF1B98
      E7FF1390DFFF1F9DECFF219FEEFF1A98E7FF1694E3FF01090E40000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000213535DDFE0000BCFF0A0A
      BCFF0C0CBEFF0D0DC0FF0F0FC2FF1111C4FF0F0FCEFF2A2AD4FD000000190000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000040A0E3D21A2
      F3FF1D9CEBFF1692E1FF1F9CEBFF209EEDFF1592E1FF1491E0FF229FEEFF1D9A
      E9FF1896E5FF1177B8E700000002000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      001E181884DD0000C1FF0000B6FF0707BAFF0A0ABCFF0C0CBEFF0D0DC0FF0F0F
      C2FF0F0FC3FF1414D7FF18187AD9000000150000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000E31478920A1F1FF1C9AE9FF1794E3FF209E
      EDFF1B98E7FF128FDEFF1895E4FF219EEDFF1A97E6FF1693E2FF083959A10000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000183434AFF03E3EE7FF2525BCFF1313BCFF0707
      B9FF0202B9FF0202BAFF0606BCFF0A0ABEFF0D0DC0FF0A0ABDFF1515EBFF1B1B
      8BE4000000150000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002072A5D11E9FF0FF1B97E6FF1997E6FF1E9CEBFF1693E2FF118EDDFF1C9A
      E9FF209CEAFF1495E5FF0079DFFF08141C5C0000000000000000000000000000
      000000000000000000000000000000000000000000000000001D3131A5EB3F3F
      E5FF3131BFFF3939C6FF3838C7FF2E2EC4FF2323C3FF1717C6FF0D0DBDFF0F0F
      BEFF0D0DBFFF0C0CBFFF0808BBFF1111E8FF19198CE500000019000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000204062A19A1F6FF209FEEFF1996
      E5FF1B98E7FF1A97E6FF138FDEFF1792E0FF0D95ECFF0084E3FF4CA1D7FFECF0
      E5FF090908300000000000000000000000000000000000000000000000000000
      0000000000193838B1F14444E6FF3434BFFF3434C4FF3434C4FF3232C4FF3030
      C2FF3636D6FF5757D6FF4F4FDFFF2020BFFF2C2CC6FF2929C6FF2828C6FF2424
      C2FF2F2FEEFF2A2A97E900000016000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000D2230711DA1F5FF219EECFF1996E5FF1B98E6FF1394E3FF007D
      DCFF0886DCFFA5CFE2FFFFFFEFFFECE8F7FF3C3D7EBB00000000000000000000
      00000000000000000000000000000000001A3636A7EC4848E6FF3737C0FF3939
      C4FF3636C4FF3535C4FF3131C1FF4141F0FF161651C0000000263A3A77D04F4F
      F2FF2222BEFF3232C7FF3030C7FF3030C8FF2C2CC4FF3737EEFF282890E50000
      0015000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000020618CBF1EA1
      F3FF229DEBFF0E93E7FF007DDEFF3A9DDDFFE5F0E7FFFFFFF3FFBDB9F0FF3435
      DFFF1C1CDCFF07072265000000030000000000000000000000000000001F3636
      A7ED4E4EE9FF3B3BC1FF3B3BC5FF3939C4FF3838C4FF3434C1FF4242EEFF1E1E
      68CB00000001000000000000000743438DD84D4DEFFF2121BDFF2F2FC6FF2E2E
      C6FF2E2EC5FF2A2AC2FF3838EDFF27278AE50000001D00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000001011521A0F1FB0094F1FF008CE5FF96CBE8FFFFFF
      F1FFFAF4F1FF7170E5FF1A1BDCFF3434E0FF4949E5FF4646E0FC171749900000
      000000000000000000244747AAEF5757F5FF3B3BBFFF4040C6FF3E3EC6FF3C3C
      C5FF3737C1FF4848EFFF1D1D62C8000000000000000000000000000000000000
      00043E3E83D34F4FEFFF2222BDFF3030C5FF2F2FC5FF2F2FC5FF2B2BBFFF3F3F
      FDFF242487E70000000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000315
      205C3FAEF6FFDDF0F3FFFFFFF1FFC6C1E7FF3B3DDFFF1E1EDEFF4343E3FF4848
      E5FF4848E6FF4444D6F515154087000000000000000000000011111123897C7C
      FFFF4141CAFF3D3DC3FF4040C6FF3C3CC2FF4B4BEFFF212169CC000000000000
      0000000000000000000000000000000000000000000645458FDA4F4FEEFF2323
      BDFF3232C5FF2F2FC2FF3232CFFF4141EEFF0606167D00000001000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1A19CCBFFF8E8FF7C7ADFFF1F1F
      DEFF2F2FE1FF4949E4FF4747E5FF4949E7FF32329CD000000115000000000000
      00000000000000000000000000000D0D1A7C7B7BFFFF4040CAFF3B3BC0FF5151
      F1FF1F1F61C70000000000000000000000000000000000000000000000000000
      000000000000000000053E3E80D25151EEFF2525BAFF3535CFFF4141EAFF0404
      0E6D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000303031E4849D0F81B1BE0FF4141E3FF4848E5FF4848E6FF4A4AE8FF1313
      3B81000000000000000000000000000000000000000000000000000000000000
      00000D0D1B7D8181FFFF5C5CFFFF202062C80000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000034646
      92DB5C5CFFFF4141F0FF04040F6F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000030312484747E4FF4747
      E5FF4949E7FF3C3CBAE401010528000000000000000000000000000000000000
      000000000000000000000000000000000000000000000F0F2288212151B40000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000627275AB605051378000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000013133D844A4AE8FF1D1D5A9E00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000800000022000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000240000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424D3E000000000000003E00000028000000640000001900000001000100
      00000000900100000000000000000000000000000000000000000000FFFFFF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
