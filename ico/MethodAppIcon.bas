Attribute VB_Name = "MethodAppIcon"
Option Explicit

'============================== Presented by UE Project Team ==============================

' 본 모듈은 IR Creator.exe에 의해 작성되었습니다. 적용할 프로젝트에 포함하여 사용하십시요.
'본 모듈은 반드시 IR Creator.exe로 생성된 IconResource.res 리소스를 포함해야합니다.

'모듈의 사용법 : 아이콘을 적용할 폼에 아래와 같이 적어주십시요.
'Call ApplyIcon(me.hWnd)


'       ※사용시 주의사항※
' 컴파일 하기 전에는 효과를 보실 수 없습니다. 컴파일 후에 동작합니다.
'가능하면 프로젝트에도 아이콘을 적용해주세요.
'그래야 Alt + Tab 전환시 보이는 이미지가 함께 적용됩니다.

'========================== http://cafe.naver.com/uesounder.cafe ==========================

Private Declare Function LoadImageAsString Lib "user32" Alias "LoadImageA" (ByVal hInst As Long, ByVal lpsz As String, ByVal uType As Long, ByVal cxDesired As Long, ByVal cyDesired As Long, ByVal fuLoad As Long) As Long
Private Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByRef lParam As Any) As Long

'아이콘을 적용해주는 서브입니다.
Public Sub ApplyIcon(ByVal hWnd As Long)

Const WM_SETICON As Long = &H80 'WindowMessage:아이콘 변경

Const ICON_BIG As Long = 1 '아이콘 정의:큰 아이콘
Const ICON_SMALL As Long = 0 '아이콘 정의:작은 아이콘

Const LR_SHARED As Long = &H8000 '리소스 정의

Const IMAGE_ICON As Long = 1 '리소스 정의:아이콘 이미지

Dim IAS As Long
IAS = LoadImageAsString(App.hInstance, "APPICON", IMAGE_ICON, 32&, 32&, LR_SHARED)
'리소스로부터 "APPICON"의 큰 이미지를 가져옵니다.
    If IAS Then SendMessage hWnd, WM_SETICON, ICON_BIG, ByVal IAS
    '성공적으로 가져왔다면 폼에 큰 이미지 적용
IAS = LoadImageAsString(App.hInstance, "APPICON", IMAGE_ICON, 16&, 16&, LR_SHARED)
'리소스로부터 "APPICON"의 작은 이미지를 가져옵니다.
    If IAS Then SendMessage hWnd, WM_SETICON, ICON_SMALL, ByVal IAS
    '성공적으로 가져왔다면 폼에 작은 이미지 적용

End Sub
   