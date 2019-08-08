#SingleInstance force
#NoEnv
#include function.ahk
#include MCI.ahk
#include Download_Manager.ahk
#IfWinActive ahk_class Warcraft III ;; 해당 프로그램에서만 작동   ;; 워크에서 실험시 수정요망
#KeyHistory 0
SetBatchLines, -1
SetWorkingDir, %A_WorkingDir%
CoordMode,Mouse,screen

;;;;;;;;; 자동 업데이트 기능 ;;;;;;;;;;;;;;;;;;;;;;;;;
global logfile
global version := 5.0 ;;현재 버전
dir = %A_WorkingDir%


리소스파일()


;;;;;;;;;;;; 자동 업데이트 기능 끝;;;;;;;;;;;;;;;;;;;;;;;;;;



;;----------------------- 변수--------------------------;;


; 초기화 변수 선언
초기화 := ""
global hMedia

global target_handle
global ch_target

; 핫키 변수 선언
global saveHK1 = 초기화		
global saveHK2 = 초기화
global saveHK3 = 초기화
global saveHK4 = 초기화
global saveHK5 = 초기화
global saveHK6 = 초기화
global saveHK7 = 초기화


;령주 관련 핫키 변수
global saveHK8 = 초기화
global saveHK9 = 초기화
global saveHK10 = 초기화
global saveHK11 = 초기화
global saveHK12 = 초기화		

;음악 재생 관련 핫키
global saveHK13 = 초기화		;오토마우스

global saveHK14 = 초기화		;1번bgm재생
global saveHK15 = 초기화		;2번bgm재생
global saveHK16 = 초기화     ;3번bgm재생
global saveHK17 = 초기화     ;정지 버튼
		
;그외 변수
global RG체커 := false
global 유틸체커 := true
global 령주체커 := false
global 체커 := false
global auto_mouse := false

global rule_nohan	;노핸룰 수정용
global room_name	;방제용
global room_name2	;방제용
global 워크경로		;워크 폴더 경로


#ctrls = 17		;; 저장된 핫키 불러오기
Loop, % #ctrls{
	IniRead saveHK%A_Index%, setting.ini, hotkeys, saveHK%A_Index%

	if saveHK%A_index%{
		if(saveHK%A_index% != "ERROR"){
			if(A_index<8){
				Hotkey, % saveHK%A_Index%, Label%A_index%, On	; 저장파일에서 불러온 핫키 초기 설정
			}
			if(A_index>12){
				Hotkey, % saveHK%A_Index%, Label%A_index%, On	; 저장파일에서 불러온 핫키 초기 설정
			}
		}
	}

}



Gui,Add,Picture,x0 y20 h400 w520,%A_ScriptDir%\Resourse\img\bg.png

Gui, Add, Tab2,x0 y0, 다운기능|키설정|로그 ; Tab1 과 Tab2를 추가


;;--------------------##################### BGM & 워크 유틸 파트 ############################-------------------------;;

Gui, tab, 다운기능
Gui,Add,Picture,x0 y20 h400 w520,%A_ScriptDir%\Resourse\img\bg2.jpg

Gui, Add, GroupBox, x182 y25 w315 h385 c003300 , [동작 로그]
Gui, Add, listBox, x190 y40 w300 h370 hwndID vl_b2

getlog2("New! 신규버전","5.0")
getlog2("항상! 관리자 권한으로 시작해주세요 ","")


Gui, Add, Button, x10 y30 w100 h30 , PC방 세팅
Gui, Add, Button, x10 y65 w100 h30 , 워크다운
Gui, Add, Button, x10 y100 w100 h30 , 아슷페이커`n 폴더 열기


Gui, Add, Button, x120 y30 w50 h30 , 마나`n모아
Gui, Add, Button, x120 y65 w50 h30 , M16`nTool
Gui, Add, Button, x120 y100 w50 h30 , X-Gamma


Gui, Add, Button, x80 y220 w90 h20 , 설정 업로드
Gui, Add, Button, x80 y245 w90 h20 , 설정 가져오기
Gui, Add, edit, x10 y220 w65 h20 +ReadOnly, Code 입력
Gui, Add, edit, x10 y245 w65 h20 vcode






Gui, Show, x200 y126 h420 w500, AS_Fakerver %version%


;;-----------------!!!!!!!!!!!!!!!!!!!!!!!! 유틸&령주 파트 !!!!!!!!!!!!!!!!!!!!!!!!!!!-------------------------;;
Gui, tab, 키설정 
Gui,Add,Picture,x0 y20 h400 w520,%A_ScriptDir%\Resourse\img\tama.jpg


Gui, Add, Hotkey, x10 y60 w80 h35 vHK14 gLabel ,%saveHK14%	
Gui, Add, Hotkey, x95 y60 w80 h35  vHK15 gLabel, %saveHK15%	
Gui, Add, Hotkey, x180 y60 w80 h35  vHK16 gLabel, %saveHK16%		
Gui, Add, Hotkey, x265 y60 w80 h35  vHK17 gLabel, %saveHK17%		

Gui, Add, Button, x440 y40 w45 h50 , 설정  저장



Gui, Add, Button, x315 y345 w50 h20 , 가두기
Gui, Add, Button, x370 y345 w50 h20 , 령주
Gui, Add, Button, x430 y345 w50 h20 , Auto_M

Gui,Add,Picture,x10 y110 h35 w60 g사진1,%A_ScriptDir%\Resourse\img\1.png
Gui,Add,Picture,x10 y150 h35 w60 g사진2,%A_ScriptDir%\Resourse\img\2.png
Gui,Add,Picture,x10 y190 h35 w60 g사진3,%A_ScriptDir%\Resourse\img\3.png
Gui,Add,Picture,x10 y230 h35 w60 g사진4,%A_ScriptDir%\Resourse\img\4.png
Gui,Add,Picture,x10 y270 h35 w60 g사진5,%A_ScriptDir%\Resourse\img\124.png


Gui, Add, Hotkey, x315 y370 w50 h30 vHK1 gLabel ,%saveHK1%		;; 마우스가두기
Gui, Add, Hotkey, x370 y370 w50 h30  vHK7 gLabel ,%saveHK7%		;; 령주

Gui, Add, Hotkey, x80 y110 w60 h35 vHK8 gLabel ,%saveHK8%		;; 1령주
Gui, Add, Hotkey, x80 y150 w60 h35 vHK9 gLabel ,%saveHK9%		;; 2령주
Gui, Add, Hotkey, x80 y190 w60 h35 vHK10 gLabel ,%saveHK10%		;; 3령주
Gui, Add, Hotkey, x80 y230 w60 h35 vHK11 gLabel ,%saveHK11%		;; 4령주
Gui, Add, Hotkey, x80 y270 w60 h35 vHK12 gLabel ,%saveHK12%		;; 124령주

Gui, Add, Hotkey, x430 y370 w50 h30 vHK13 gLabel ,%saveHK13%		;; 오토마우스 켜기

Gui, Add, Text, x0 y320 w65 h18 , 채팅매크로
IniRead rule_nohan, setting.ini, hotkeys, rule_nohan
Gui, Add, Edit,  x70 y320 w360 h20 vNohan, %rule_nohan%
Gui, Add, Button, x435 y320 w45 h20 , 저장1

Gui, Add, Text, x0 y350 w65 h18 , 방제 설정1
IniRead room_name, setting.ini, hotkeys, room_name
Gui, Add, Edit,  x70 y350 w180 h20 vXero1, %room_name%
Gui, Add, Button, x255 y350 w45 h20 , 저장2

Gui, Add, Text, x0 y380 w65 h18 , 방제 설정2
IniRead room_name2, setting.ini, hotkeys, room_name2
Gui, Add, Edit,  x70 y380 w180 h20 vXero2, %room_name2%
Gui, Add, Button, x255 y380 w45 h20 , 저장3

Gui, Add, Checkbox, x360 y42 w70 h20 v체크6, 랜덤 재생
Gui, Add, Checkbox, x360 y72 w70 h20 v체크7, 폴더 재생 

Gui, Add, Button, x10 y40 w80 h20, 1번BGM 
Gui, Add, Button, x95 y40 w80 h20, 2번BGM
Gui, Add, Button, x180 y40 w80 h20, 3번BGM
Gui, Add, Button, x265 y40 w80 h20, 정지



;;--------------------##################### 업데이트 내역 파트 ############################-------------------------;;

Gui, tab, 로그

Gui, Add, GroupBox, x2 y25 w430 h385 c003300 , [아슷페이커 로그 기록]
Gui, Add, listBox, x6 y40 w410 h370 hwndID vl_b
Gui, Add, Button, x440 y25 w55 h40 , 로그`n저장
Gui, Add, Button, x440 y80 w55 h40 , 로그`n업로드


new_map_check()
;log_Set()
As_ver_config(version)

Return

GuiClose:
	Gosub, CaptureOff
ExitApp

;; GUI 설정 끝

ButtonPC방세팅:
{
	getlog2("PC방 셋팅을 시작합니다.","잠시만 기다려주세요")
	war3_down()
}
return


Button워크다운:
{
	run, https://drive.google.com/uc?export=download&confirm=RcAi&id=1mV1xjYsKSOU3bWnL4mzq-Eox-286x5SK
}
return

Button아슷페이커폴더열기:
{
	FileCreateDir, As_faker
	run, As_faker
}
return

Button마나모아:
{
	getlog2("마나모아 페이지로 이동합니다.","")
	run, "https://manamoa3.net/" 
}
return

ButtonX-Gamma:
{
	IfNotExist, As_faker\xgamma.exe
	{	
		getlog2("화면밝기조정 프로그램을 받습니다.","")
		x_gamma_down()
	}
		
	getlog2("화면밝기조정 프로그램 실행","")
	run, "As_faker\xgamma.exe"
}
return

ButtonM16Tool:
{
	getlog2("M16Tool을 실행합니다.","")
	m16 := "As_faker\m16tool\M16Tool.exe"
	
	
	IfNotExist, %m16%
	{
		m16:=""
		getlog2("M16TooL을 다운로드 합니다","")
		sleep, 2000
		MsgBox,68,M16Tool 다운 안내, M16 Tool을 설치 하시겠습니까?
		IfMsgBox, Yes
			m16tool_down()
	}
	
	run, %m16%
	
	Sleep, 2000
			
	FileDelete, KeyMap
	FileDelete, Rooms
	FileDelete, SmartKeys
}
return






Button로그저장:
{
	formattime , nowtime,,HH_mm_ss
	controlget,var,list,,,ahk_id %ID%
	logfile = %nowtime%_logs.txt
	try{
		FileAppend,%var%, %nowtime%_logs.txt
		getlog("로그저장 : ", logfile)
	}catch e{
		getlog("로그저장 실패", throw A_ThisFunc)
	}
	
}
return

Button로그업로드:
{
	try{
		로그업로드(logfile)
		getlog("로그업로드 완료 ", "도와주셔서 감사합니다.")
	}catch e{
		getlog("로그업로드 실패", throw A_ThisFunc)
	}
	
}
return


Button설정업로드:
{
	Gui, Submit, NoHide
	코드업로드(code)
}
return

Button설정가져오기:
{
	Gui, Submit, NoHide
	코드다운로드(code)
}
return

Button설정저장:
{
	MsgBox, , 알림, 체크박스 설정을 저장하였습니다., 1
	Gui, Submit, NoHide		;; gui값 변수 변경
	;IniWrite, %체크1%, setting.ini, Checkboxs, 체크1
	;IniWrite, %체크2%, setting.ini, Checkboxs, 체크2	
	;IniWrite, %체크3%, setting.ini, Checkboxs, 체크3	
	;IniWrite, %체크4%, setting.ini, Checkboxs, 체크4	
	;IniWrite, %체크5%, setting.ini, Checkboxs, 체크5	
	IniWrite, %체크6%, setting.ini, Checkboxs, 체크6
	IniWrite, %체크7%, setting.ini, Checkboxs, 체크7
	SoundPlay, %A_ScriptDir%\Resourse\bgm\effect\Coin.wav
	
}
return

Button저장1:			; 노핸룰
{
	Gui, Submit, NoHide
	IniWrite, %nohan%, setting.ini, hotkeys, rule_nohan
	
	IniRead rule_nohan, setting.ini, hotkeys, rule_nohan
	
}
return

Button저장2:			; 방제1
{
	Gui, Submit, NoHide
	IniWrite, %Xero1%, setting.ini, hotkeys, room_name
	
	IniRead room_name, setting.ini, hotkeys, room_name
	
}
return

Button저장3:			; 방제2
{
	Gui, Submit, NoHide
	IniWrite, %Xero2%, setting.ini, hotkeys, room_name2
	
	IniRead room_name2, setting.ini, hotkeys, room_name2
	
}
return

Label:							; 핫키 ui를 통제하는 라벨
IF(true){
	If (%A_GuiControl% in +,^,!,+^,+!,^!,+^!)    ;If the hotkey contains only modifiers, return to wait for a key. 
			return   
	핫키설정(A_GuiControl)
}	
return

;Set_Hotkey(A_GuiControl)





핫키설정(hot){
		
	num := SubStr(hot,3)	;핫키 번호 저장
	
	; 1. 금지 핫키 처리
	; 2. 중복 핫키 처리 ->핫키를 변경하면 기존핫키 제거하고 변경한다.
	; 3. 핫키가 저장 안되어 있으면 저장
	; 4. 스페이스바는 특수핫키로 지정
	; 5. 핫키를 제거한다.


	Gui, Submit, NoHide		;; gui값 변수 변경
	;1. 금지 핫키 처리
	if( HK%num% = "q" || HK%num% = "F1" || HK%num% = "F2" || HK%num% = "F3" || HK%num% = "q" || HK%num% = "w" || HK%num% = "e" || HK%num% = "r" || HK%num% = "a"){	; 령주 및 스킬 관련 키일 경우
		MsgBox, , 경고, 키셋팅 불가능한 키입니다., 1
		GuiControl, ,HK%num% , % saveHK%num%  ;  show the hotkey
		Gui, Submit, NoHide		;; gui값 변수 변경
		return
	}else{

		if( HK%num% = 초기화){		;5. 핫키 지우기
	
			;핫키 에러 체크
			Hotkey, % saveHK%num%,, UseErrorLevel	;; 핫키 설정 검사
			if( ErrorLevel != 5){
				Hotkey, % saveHK%num%, Label%num%, Off	;;기존 핫키 해제
				
			}
			saveHK%num% := HK%num%
			IniWrite, % saveHK%num%,setting.ini, hotkeys, saveHK%num%	;;파일 입력
		}else{
			; 2.중복 핫키 처리
			cnt := 1
			Loop, 16{
				if(saveHK%cnt% = HK%num% ){	; 중복된 키가 있으면, 
					Hotkey, % saveHK%cnt%,, UseErrorLevel	;; 핫키 설정 검사
					if( ErrorLevel != 5){
						Hotkey, % saveHK%cnt%, Label%cnt%, Off	;;기존 핫키 해제
					}
					saveHK%cnt% := 초기화
					IniWrite, % saveHK%cnt%,setting.ini, hotkeys, saveHK%cnt%	; 파일에서도 지우고
					HK%cnt% := 초기화
					
					
					saveHK%num% := HK%num%
					Hotkey, % saveHK%num%, Label%num%, On		;; 신규 핫키 등록
					IniWrite, % saveHK%num%,setting.ini, hotkeys, saveHK%num%	;;파일 입력
					GuiControl, ,HK%cnt% , % saveHK%cnt%  ;  show the hotkey
					Gui, Submit, NoHide		;; gui값 변수 변경
					return
				}
				cnt++
			}
			
			; 핫키 설정
			
			if(saveHK%num%){		;저장된 핫키가 있으면 다른키로 변경
				;핫키 에러 체크
				Hotkey, % saveHK%num%,, UseErrorLevel	;; 핫키 설정 검사
				if( ErrorLevel != 5){
					Hotkey, % saveHK%num%, Label%num%, Off	;;기존 핫키 해제
				}
				saveHK%num% := HK%num%
				Hotkey, % saveHK%num%, Label%num%, On		;; 신규 핫키 등록
				IniWrite, % saveHK%num%,setting.ini, hotkeys, saveHK%num%	;;파일 입력
			}else{
				saveHK%num% := HK%num%
				Hotkey, % saveHK%num%, Label%num%, On		;; 신규 핫키 등록
				IniWrite, % saveHK%num%,setting.ini, hotkeys, saveHK%num%	;;파일 입력
			}
			
			Gui, Submit, NoHide		;; gui값 변수 변경
			if(령주체커=false){
				off_k()
			}
		}
	
	}
	
}

/* 
 핫 스트링 영역 
*/


#MaxThreadsPerHotkey 5	;2개까지의 인터럽트 가능
/*
::!rg::
	if(RG체커){	;이미 켜져있으면 끈다.
		Send, {enter}
		sleep, 100
		SendRaw, /c m wkehd dkfwnl whdfy! -dktmtvpdlzj %newver%
		sleep, 100
		Send, {enter}
		sleep, 100
		RG체커 := false
	}else{		;꺼져있으면 켠다.
		Send, {enter}
		sleep, 100
		SendRaw, /c m wkehd dkfwnlfmf tlwkrgkqslek! -dktmtvpdlzj %newver%
		sleep, 100
		Send, {enter}
		sleep, 100
		RG체커 := true
		자동rg()
	}
return
*/


::!qkd::	;룰 부르기
	send,{enter}
	노핸룰(rule_nohan)	
return

::!qkd1::	;방제1복사
	SendRaw, %room_name%
	sleep,250
	send, ^+{Left 4}
	sleep,250
	send, ^c
return

::!qkd2::	;방제2복사
	SendRaw, %room_name2%
	sleep,250
	send, ^+{Left 4}
	sleep,250
	send, ^c
return

::!audfuddj::	; 명령어 보기
	send,{enter}
	SendRaw, !rgsms wkehddkfwnl, !fnf dms tjfwjdgks fnf qnfmrl
	send,{enter}
	send,{enter}
	SendRaw,!qkd1 dms tjfwjdgks qkdwp1qjs qhrtk, !qkd2 sms tjfwjdgks qkdwp2qjs
	send,{enter}
return


Label1:	
	WinGet, hwnd, ID, Warcraft III
	if (hwnd=gui_handle)
	return
	target_handle := hwnd

	if(ch_target){
		ch_target = 
	}else{
		ch_target = true
	}
	
	WinGetTitle, title, ahk_id %target_handle%
	Critical
	
	if( target_handle and ch_target){
	    Gosub, CaptureOn
	}
	else{
		Gosub, CaptureOff
	}
	return


CaptureOn:
	SetTimer, Capture, on
return


Capture:
	IfWinNotExist, ahk_id %target_handle%
	Goto, CaptureOff
	
	WinGetPos, x,y, w,h, ahk_id %target_handle%
	gab = 2
	
	IfWinActive,ahk_id %target_handle%
		ClipCursor(0,0, 3830 ,2200)
return


CaptureOff:

  settimer, Capture, off
  DllCall("ClipCursor", "int", 0)

return


Label2:		;비어잇음
	
return

Label3:		;비어잇음

return

Label4:		;방제1번
	
return

Label5:		;방제 2번
	
return

Label6:

return


Label7:
	if(령주체커 = true){			
		령주체커 := false
		off_k() ;;다끈다.
		SoundPlay, %A_ScriptDir%\Resourse\bgm\effect\Power up.wav
	}
	else{
		령주체커 := true
		on_k()	;;다킨다.
		SoundPlay, %A_ScriptDir%\Resourse\bgm\effect\smw_kick.wav
	}
return

Label8:
	if(령주체커 = true){
		1령주()
	}
return

Label9:
	if(령주체커 = true){
		2령주()
	}
return
Label10:
	if(령주체커 = true){
		3령주()
	}
return

Label11:
	if(령주체커 = true){
		4령주()
	}
return

Label12:
	if(령주체커 = true){
		124령주()
	}
return

Label13:
	if(auto_mouse=false){
		auto_mouse:=true
	}else{
		auto_mouse:=false
	}
	
	while(1){
	if(auto_mouse=true){
		MouseClick, L, 180, 1237
		sleep, 1
	}else{
		break
	}
	
	}
	
return


Label14:
	if(체크6=1){
		random_bgm("1")
	}else{
		play_bgm("1")	
	}
return

Label15:
	if(체크6=1){
		random_bgm("2")
	}else{
		play_bgm("2")	
	}	
return

Label16:
	if(체크6=1){
		random_bgm("3")
	}else{
		play_bgm("3")	
	}	
return

Label17:
	stop_bgm()
return


자동rg(){
	sleep, 1100
	Loop{
	PostMessage, 0x100, 0xBF, 0x350001,, Warcraft III
	PostMessage, 0x100, 0x52, 0x130001,, Warcraft III
	PostMessage, 0x100, 0x47, 0x220001,, Warcraft III
	sleep, 500
	PostMessage, 0x100, 0xD, 0x1C0001,, Warcraft III
	PostMessage, 0x101, 0xD, 0x1C0001,, Warcraft III
	sleep, 10000
	if(RG체커 = false){
		break
	 }
	}
}


~Enter::		; 엔터로 끄고킨다.
	if(령주체커 = true){
		on_off()
	}
return

~+Enter::		; 엔터로 끄고킨다.
	if(령주체커 = true){
		on_off()
	}
return

~Esc::			; 꺼져있을때만 키고, 켜져있을땐 작동 안함.
	if(령주체커 = true){
		on_k()
	}
return




on_k(){			;무조건 다킨다.
	cnt := 8
	Loop, 5{
		if( saveHK%cnt% != 초기화){
			Hotkey, % saveHK%cnt%, Label%cnt%, On	;;기존 핫키 설정
		}
		cnt++
	}
	체커 := true
}

off_k(){
	cnt := 8
	Loop, 5{
		Hotkey, % saveHK%cnt%,, UseErrorLevel	;; 핫키 설정 검사
		if( ErrorLevel != 5){
			Hotkey, % saveHK%cnt%, Label%cnt%, off	;;기존 핫키 설정
		}
		cnt++
	}
	체커 := false
		
}

on_off(){
	if(체커 = true){
		off_k()
	}else if(체커 = false){
		on_k()
	}
}


+z::
	if(체커 = true){
		SoundPlay, %A_ScriptDir%\Resourse\bgm\effect\1-Up.wav
	}else if(체커 = false){
		SoundPlay, %A_ScriptDir%\Resourse\bgm\effect\Appear.wav
	}
return

사진1:
	space_set("8")
return

사진2:
	space_set("9")
return

사진3:
	space_set("10")
return

사진4:
	space_set("11")
return

사진5:
	space_set("12")
return


space_set(num){
	HK%num% := "space"
	cnt := 8
	Loop, 5{	;중복제거
		if(saveHK%cnt% ="space"){
			Hotkey, % saveHK%cnt%,, UseErrorLevel	;; 핫키 설정 검사
			if( ErrorLevel != 5){
				Hotkey, % saveHK%cnt%, Label%cnt%, off	;;핫키 해제
			}
			saveHK%cnt% := ""	
			GuiControl, ,HK%cnt% , % saveHK%cnt%  ;  GUI부분 수정
			IniWrite, % saveHK%cnt%, setting.ini, hotkeys, saveHK%cnt%		;세팅파일 수정
		}
		cnt++
	}
			
	saveHK%num% := HK%num%
	IniWrite, % saveHK%num%, setting.ini, hotkeys, saveHK%num%	
    GuiControl, ,HK%num% , % saveHK%num%  ;  show the hotkey
	Hotkey, % saveHK%num%, Label%num%, On		;; 신규 핫키 등록
	Gui, Submit, NoHide		;; gui값 변수 변경
	if(령주체커=false){
		off_k()
	}
}


