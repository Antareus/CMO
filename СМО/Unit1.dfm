object Form1: TForm1
  Left = 192
  Top = 129
  HorzScrollBar.Color = clBlack
  HorzScrollBar.ParentColor = False
  VertScrollBar.Color = clHighlight
  VertScrollBar.ParentColor = False
  Caption = #1056#1072#1089#1095#1077#1090' '#1074#1077#1088#1086#1103#1090#1085#1086#1089#1090#1077#1081' '#1089#1086#1089#1090#1086#1103#1085#1080#1103' '#1057#1052#1054
  ClientHeight = 474
  ClientWidth = 642
  Color = clMenuBar
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
    Width = 49
    Height = 16
    Caption = #1051#1103#1084#1073#1076#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 168
    Top = 8
    Width = 17
    Height = 13
    Caption = #1052#1102
  end
  object Label3: TLabel
    Left = 168
    Top = 32
    Width = 79
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1082#1072#1085#1072#1083#1086#1074
  end
  object Label4: TLabel
    Left = 111
    Top = 443
    Width = 102
    Height = 13
    Caption = #1050#1086#1085#1090#1088#1086#1083#1100#1085#1072#1103' '#1089#1091#1084#1084#1072
  end
  object Label5: TLabel
    Left = 175
    Top = 61
    Width = 83
    Height = 13
    Caption = #1044#1083#1080#1085#1085#1072' '#1086#1095#1077#1088#1077#1076#1080
  end
  object Label6: TLabel
    Left = 34
    Top = 311
    Width = 179
    Height = 13
    Caption = #1042#1077#1088#1086#1103#1090#1085#1086#1089#1090#1100' '#1086#1090#1082#1072#1079#1072' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103
  end
  object Label7: TLabel
    Left = 96
    Top = 344
    Width = 117
    Height = 13
    Caption = #1057#1088'. '#1095'. '#1079#1072#1085#1103#1090#1099#1093' '#1082#1072#1085#1072#1083#1086#1074
  end
  object Label8: TLabel
    Left = 41
    Top = 379
    Width = 172
    Height = 13
    Caption = #1057#1088'. '#1095'. '#1079#1072#1103#1074#1086#1082' '#1085#1072#1093#1086#1076#1103#1097#1080#1093#1089#1103' '#1074' '#1057#1052#1054
  end
  object Label9: TLabel
    Left = 56
    Top = 8
    Width = 10
    Height = 24
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 56
    Top = 32
    Width = 10
    Height = 24
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 56
    Top = 56
    Width = 10
    Height = 24
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 0
    Top = 32
    Width = 49
    Height = 16
    Caption = #1051#1103#1084#1073#1076#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 0
    Top = 56
    Width = 49
    Height = 16
    Caption = #1051#1103#1084#1073#1076#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel
    Left = 90
    Top = 411
    Width = 119
    Height = 13
    Caption = #1057#1088'. '#1095'. '#1079#1072#1103#1074#1086#1082' '#1074' '#1086#1095#1077#1088#1077#1076#1080
  end
  object Edit1: TEdit
    Left = 72
    Top = 8
    Width = 81
    Height = 21
    TabOrder = 0
    Text = '2'
  end
  object Edit2: TEdit
    Left = 192
    Top = 8
    Width = 81
    Height = 21
    TabOrder = 1
    Text = '1'
  end
  object Button1: TButton
    Left = 240
    Top = 160
    Width = 81
    Height = 41
    Caption = #1056#1072#1089#1095#1077#1090
    TabOrder = 2
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 344
    Top = 0
    Width = 289
    Height = 465
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
    Left = 264
    Top = 32
    Width = 73
    Height = 21
    TabOrder = 4
    Text = '3'
  end
  object Edit4: TEdit
    Left = 232
    Top = 440
    Width = 81
    Height = 21
    TabOrder = 5
  end
  object Edit5: TEdit
    Left = 264
    Top = 56
    Width = 73
    Height = 21
    TabOrder = 6
    Text = '2'
  end
  object Edit6: TEdit
    Left = 232
    Top = 303
    Width = 81
    Height = 21
    TabOrder = 11
  end
  object Edit7: TEdit
    Left = 232
    Top = 336
    Width = 81
    Height = 21
    TabOrder = 12
  end
  object Edit8: TEdit
    Left = 232
    Top = 371
    Width = 81
    Height = 21
    TabOrder = 13
  end
  object Button2: TButton
    Left = 240
    Top = 208
    Width = 81
    Height = 41
    Caption = #1056#1072#1089#1095#1077#1090
    TabOrder = 15
    Visible = False
    OnClick = Button2Click
  end
  object Edit9: TEdit
    Left = 72
    Top = 32
    Width = 81
    Height = 21
    TabOrder = 16
    Text = '2'
  end
  object Edit10: TEdit
    Left = 72
    Top = 56
    Width = 81
    Height = 21
    TabOrder = 17
    Text = '2'
  end
  object RadioGroup2: TRadioGroup
    Left = 16
    Top = 80
    Width = 265
    Height = 73
    Caption = #1056#1072#1079#1084#1077#1088' '#1084#1091#1083#1100#1090#1080#1079#1072#1103#1074#1082#1080
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #1055#1086' 2 '#1079#1072#1103#1074#1082#1080
      #1055#1086' 3 '#1079#1072#1103#1074#1082#1080
      #1055#1086' 2 '#1080' 1 '#1079#1072#1103#1074#1082#1080
      #1055#1086' 3, 2 '#1080' 1 '#1079#1072#1103#1074#1082#1080)
    TabOrder = 18
    OnClick = RadioGroup2Click
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 152
    Width = 201
    Height = 153
    TabOrder = 19
  end
  object RadioButton1: TRadioButton
    Left = 24
    Top = 160
    Width = 145
    Height = 17
    Caption = '1 '#1082#1072#1085#1072#1083' '#1089' '#1086#1095#1077#1088#1077#1076#1100#1102
    Checked = True
    TabOrder = 7
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 24
    Top = 184
    Width = 169
    Height = 17
    Caption = #1052#1085#1086#1075#1086#1082'. '#1041#1077#1079' '#1074#1079#1072#1080#1084#1086#1087#1086#1084#1086#1097#1080
    TabOrder = 8
    OnClick = RadioButton2Click
  end
  object RadioButton3: TRadioButton
    Left = 24
    Top = 208
    Width = 145
    Height = 17
    Caption = #1052#1085#1086#1075#1086#1082'. '#1057' '#1086#1095#1077#1088#1077#1076#1100#1102
    TabOrder = 9
    OnClick = RadioButton3Click
  end
  object RadioButton4: TRadioButton
    Left = 24
    Top = 232
    Width = 169
    Height = 17
    Caption = #1052#1085#1086#1075#1086#1082'. '#1057' '#1074#1079#1072#1080#1084#1086#1087#1086#1084#1086#1097#1100#1102
    TabOrder = 10
    OnClick = RadioButton4Click
  end
  object RadioButton5: TRadioButton
    Left = 24
    Top = 256
    Width = 185
    Height = 17
    Caption = #1052#1085#1086#1075#1086#1082'. '#1056#1072#1079#1085#1072#1103' '#1080#1085#1090#1077#1085#1089#1080#1074#1085#1086#1089#1090#1100
    TabOrder = 14
    OnClick = RadioButton5Click
  end
  object RadioButton6: TRadioButton
    Left = 24
    Top = 280
    Width = 185
    Height = 17
    Caption = '1 '#1082#1072#1085#1072#1083', '#1073#1077#1089#1082#1086#1085#1077#1095#1085#1072#1103' '#1086#1095#1077#1088#1077#1076#1100
    TabOrder = 20
    OnClick = RadioButton6Click
  end
  object Edit11: TEdit
    Left = 232
    Top = 403
    Width = 81
    Height = 21
    TabOrder = 21
  end
end
