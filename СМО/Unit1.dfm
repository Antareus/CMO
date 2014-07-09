object Form1: TForm1
  Left = 192
  Top = 129
  Width = 496
  Height = 540
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 8
    Width = 40
    Height = 13
    Caption = #1051#1103#1084#1073#1076#1072
  end
  object Label2: TLabel
    Left = 0
    Top = 40
    Width = 17
    Height = 13
    Caption = #1052#1102
  end
  object Label3: TLabel
    Left = 16
    Top = 200
    Width = 79
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1082#1072#1085#1072#1083#1086#1074
  end
  object Label4: TLabel
    Left = 8
    Top = 456
    Width = 102
    Height = 13
    Caption = #1050#1086#1085#1090#1088#1086#1083#1100#1085#1072#1103' '#1089#1091#1084#1084#1072
  end
  object Label5: TLabel
    Left = 16
    Top = 240
    Width = 83
    Height = 13
    Caption = #1044#1083#1080#1085#1085#1072' '#1086#1095#1077#1088#1077#1076#1080
  end
  object Label6: TLabel
    Left = 0
    Top = 336
    Width = 179
    Height = 13
    Caption = #1042#1077#1088#1086#1103#1090#1085#1086#1089#1090#1100' '#1086#1090#1082#1072#1079#1072' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103
  end
  object Label7: TLabel
    Left = 0
    Top = 376
    Width = 117
    Height = 13
    Caption = #1057#1088'. '#1095'. '#1079#1072#1085#1103#1090#1099#1093' '#1082#1072#1085#1072#1083#1086#1074
  end
  object Label8: TLabel
    Left = 0
    Top = 416
    Width = 173
    Height = 13
    Caption = #1057#1088'. '#1095'. '#1086#1073#1089#1083#1091#1078#1077#1085#1085#1099#1093' '#1084#1091#1083#1100#1090#1080#1079#1072#1103#1074#1086#1082
  end
  object Edit1: TEdit
    Left = 48
    Top = 8
    Width = 81
    Height = 21
    TabOrder = 0
    Text = '2'
  end
  object Edit2: TEdit
    Left = 48
    Top = 40
    Width = 81
    Height = 21
    TabOrder = 1
    Text = '1'
  end
  object Button1: TButton
    Left = 8
    Top = 288
    Width = 81
    Height = 41
    Caption = #1056#1072#1089#1095#1077#1090
    TabOrder = 2
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 184
    Top = 8
    Width = 289
    Height = 489
    ColCount = 2
    DefaultColWidth = 150
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goTabs, goAlwaysShowEditor, goThumbTracking]
    TabOrder = 3
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object Edit3: TEdit
    Left = 16
    Top = 216
    Width = 113
    Height = 21
    TabOrder = 4
    Text = '3'
  end
  object Edit4: TEdit
    Left = 24
    Top = 472
    Width = 81
    Height = 21
    TabOrder = 5
  end
  object Edit5: TEdit
    Left = 16
    Top = 256
    Width = 113
    Height = 21
    TabOrder = 6
    Text = '0'
  end
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 72
    Width = 185
    Height = 121
    TabOrder = 7
  end
  object RadioButton1: TRadioButton
    Left = 8
    Top = 80
    Width = 145
    Height = 17
    Caption = '1 '#1082#1072#1085#1072#1083' '#1089' '#1086#1095#1077#1088#1077#1076#1100#1102
    Checked = True
    TabOrder = 8
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 8
    Top = 104
    Width = 169
    Height = 17
    Caption = #1052#1085#1086#1075#1086#1082'. '#1041#1077#1079' '#1074#1079#1072#1080#1084#1086#1087#1086#1084#1086#1097#1080
    TabOrder = 9
    OnClick = RadioButton2Click
  end
  object RadioButton3: TRadioButton
    Left = 8
    Top = 128
    Width = 145
    Height = 17
    Caption = #1052#1085#1086#1075#1086#1082'. '#1057' '#1086#1095#1077#1088#1077#1076#1100#1102
    TabOrder = 10
    OnClick = RadioButton3Click
  end
  object RadioButton4: TRadioButton
    Left = 8
    Top = 152
    Width = 169
    Height = 17
    Caption = #1052#1085#1086#1075#1086#1082'. '#1057' '#1074#1079#1072#1080#1084#1086#1087#1086#1084#1086#1097#1100#1102
    TabOrder = 11
    OnClick = RadioButton4Click
  end
  object Edit6: TEdit
    Left = 24
    Top = 352
    Width = 81
    Height = 21
    TabOrder = 12
  end
  object Edit7: TEdit
    Left = 24
    Top = 392
    Width = 81
    Height = 21
    TabOrder = 13
  end
  object Edit8: TEdit
    Left = 24
    Top = 432
    Width = 81
    Height = 21
    TabOrder = 14
  end
  object RadioButton5: TRadioButton
    Left = 8
    Top = 176
    Width = 169
    Height = 17
    Caption = #1052#1085#1086#1075#1086#1082'. '#1056#1072#1079#1085#1072#1103' '#1080#1085#1090#1077#1085#1089#1080#1074#1085#1086#1089#1090#1100
    TabOrder = 15
    OnClick = RadioButton5Click
  end
  object Button2: TButton
    Left = 96
    Top = 288
    Width = 81
    Height = 41
    Caption = #1056#1072#1089#1095#1077#1090
    TabOrder = 16
    Visible = False
    OnClick = Button2Click
  end
end
