#SingleInstance force
#NoEnv
#include function.ahk
#include MCI.ahk
#include Download_Manager.ahk
#IfWinActive ahk_class Warcraft III ;; �ش� ���α׷������� �۵�   ;; ��ũ���� ����� �������
#KeyHistory 0
SetBatchLines, -1
SetWorkingDir, %A_WorkingDir%
CoordMode,Mouse,screen

;;;;;;;;; �ڵ� ������Ʈ ��� ;;;;;;;;;;;;;;;;;;;;;;;;;
global logfile
global version := 5.0 ;;���� ����
dir = %A_WorkingDir%


���ҽ�����()


;;;;;;;;;;;; �ڵ� ������Ʈ ��� ��;;;;;;;;;;;;;;;;;;;;;;;;;;



;;----------------------- ����--------------------------;;


; �ʱ�ȭ ���� ����
�ʱ�ȭ := ""
global hMedia

global target_handle
global ch_target

; ��Ű ���� ����
global saveHK1 = �ʱ�ȭ		
global saveHK2 = �ʱ�ȭ
global saveHK3 = �ʱ�ȭ
global saveHK4 = �ʱ�ȭ
global saveHK5 = �ʱ�ȭ
global saveHK6 = �ʱ�ȭ
global saveHK7 = �ʱ�ȭ


;���� ���� ��Ű ����
global saveHK8 = �ʱ�ȭ
global saveHK9 = �ʱ�ȭ
global saveHK10 = �ʱ�ȭ
global saveHK11 = �ʱ�ȭ
global saveHK12 = �ʱ�ȭ		

;���� ��� ���� ��Ű
global saveHK13 = �ʱ�ȭ		;���丶�콺

global saveHK14 = �ʱ�ȭ		;1��bgm���
global saveHK15 = �ʱ�ȭ		;2��bgm���
global saveHK16 = �ʱ�ȭ     ;3��bgm���
global saveHK17 = �ʱ�ȭ     ;���� ��ư
		
;�׿� ����
global RGüĿ := false
global ��ƿüĿ := true
global ����üĿ := false
global üĿ := false
global auto_mouse := false

global rule_nohan	;���ڷ� ������
global room_name	;������
global room_name2	;������
global ��ũ���		;��ũ ���� ���


#ctrls = 17		;; ����� ��Ű �ҷ�����
Loop, % #ctrls{
	IniRead saveHK%A_Index%, setting.ini, hotkeys, saveHK%A_Index%

	if saveHK%A_index%{
		if(saveHK%A_index% != "ERROR"){
			if(A_index<8){
				Hotkey, % saveHK%A_Index%, Label%A_index%, On	; �������Ͽ��� �ҷ��� ��Ű �ʱ� ����
			}
			if(A_index>12){
				Hotkey, % saveHK%A_Index%, Label%A_index%, On	; �������Ͽ��� �ҷ��� ��Ű �ʱ� ����
			}
		}
	}

}



Gui,Add,Picture,x0 y20 h400 w520,%A_ScriptDir%\Resourse\img\bg.png

Gui, Add, Tab2,x0 y0, �ٿ���|Ű����|�α� ; Tab1 �� Tab2�� �߰�


;;--------------------##################### BGM & ��ũ ��ƿ ��Ʈ ############################-------------------------;;

Gui, tab, �ٿ���
Gui,Add,Picture,x0 y20 h400 w520,%A_ScriptDir%\Resourse\img\bg2.jpg

Gui, Add, GroupBox, x182 y25 w315 h385 c003300 , [���� �α�]
Gui, Add, listBox, x190 y40 w300 h370 hwndID vl_b2

getlog2("New! �űԹ���","5.0")
getlog2("�׻�! ������ �������� �������ּ��� ","")


Gui, Add, Button, x10 y30 w100 h30 , PC�� ����
Gui, Add, Button, x10 y65 w100 h30 , ��ũ�ٿ�
Gui, Add, Button, x10 y100 w100 h30 , �ƽ�����Ŀ`n ���� ����


Gui, Add, Button, x120 y30 w50 h30 , ����`n���
Gui, Add, Button, x120 y65 w50 h30 , M16`nTool
Gui, Add, Button, x120 y100 w50 h30 , X-Gamma


Gui, Add, Button, x80 y220 w90 h20 , ���� ���ε�
Gui, Add, Button, x80 y245 w90 h20 , ���� ��������
Gui, Add, edit, x10 y220 w65 h20 +ReadOnly, Code �Է�
Gui, Add, edit, x10 y245 w65 h20 vcode






Gui, Show, x200 y126 h420 w500, AS_Fakerver %version%


;;-----------------!!!!!!!!!!!!!!!!!!!!!!!! ��ƿ&���� ��Ʈ !!!!!!!!!!!!!!!!!!!!!!!!!!!-------------------------;;
Gui, tab, Ű���� 
Gui,Add,Picture,x0 y20 h400 w520,%A_ScriptDir%\Resourse\img\tama.jpg


Gui, Add, Hotkey, x10 y60 w80 h35 vHK14 gLabel ,%saveHK14%	
Gui, Add, Hotkey, x95 y60 w80 h35  vHK15 gLabel, %saveHK15%	
Gui, Add, Hotkey, x180 y60 w80 h35  vHK16 gLabel, %saveHK16%		
Gui, Add, Hotkey, x265 y60 w80 h35  vHK17 gLabel, %saveHK17%		

Gui, Add, Button, x440 y40 w45 h50 , ����  ����



Gui, Add, Button, x315 y345 w50 h20 , ���α�
Gui, Add, Button, x370 y345 w50 h20 , ����
Gui, Add, Button, x430 y345 w50 h20 , Auto_M

Gui,Add,Picture,x10 y110 h35 w60 g����1,%A_ScriptDir%\Resourse\img\1.png
Gui,Add,Picture,x10 y150 h35 w60 g����2,%A_ScriptDir%\Resourse\img\2.png
Gui,Add,Picture,x10 y190 h35 w60 g����3,%A_ScriptDir%\Resourse\img\3.png
Gui,Add,Picture,x10 y230 h35 w60 g����4,%A_ScriptDir%\Resourse\img\4.png
Gui,Add,Picture,x10 y270 h35 w60 g����5,%A_ScriptDir%\Resourse\img\124.png


Gui, Add, Hotkey, x315 y370 w50 h30 vHK1 gLabel ,%saveHK1%		;; ���콺���α�
Gui, Add, Hotkey, x370 y370 w50 h30  vHK7 gLabel ,%saveHK7%		;; ����

Gui, Add, Hotkey, x80 y110 w60 h35 vHK8 gLabel ,%saveHK8%		;; 1����
Gui, Add, Hotkey, x80 y150 w60 h35 vHK9 gLabel ,%saveHK9%		;; 2����
Gui, Add, Hotkey, x80 y190 w60 h35 vHK10 gLabel ,%saveHK10%		;; 3����
Gui, Add, Hotkey, x80 y230 w60 h35 vHK11 gLabel ,%saveHK11%		;; 4����
Gui, Add, Hotkey, x80 y270 w60 h35 vHK12 gLabel ,%saveHK12%		;; 124����

Gui, Add, Hotkey, x430 y370 w50 h30 vHK13 gLabel ,%saveHK13%		;; ���丶�콺 �ѱ�

Gui, Add, Text, x0 y320 w65 h18 , ä�ø�ũ��
IniRead rule_nohan, setting.ini, hotkeys, rule_nohan
Gui, Add, Edit,  x70 y320 w360 h20 vNohan, %rule_nohan%
Gui, Add, Button, x435 y320 w45 h20 , ����1

Gui, Add, Text, x0 y350 w65 h18 , ���� ����1
IniRead room_name, setting.ini, hotkeys, room_name
Gui, Add, Edit,  x70 y350 w180 h20 vXero1, %room_name%
Gui, Add, Button, x255 y350 w45 h20 , ����2

Gui, Add, Text, x0 y380 w65 h18 , ���� ����2
IniRead room_name2, setting.ini, hotkeys, room_name2
Gui, Add, Edit,  x70 y380 w180 h20 vXero2, %room_name2%
Gui, Add, Button, x255 y380 w45 h20 , ����3

Gui, Add, Checkbox, x360 y42 w70 h20 vüũ6, ���� ���
Gui, Add, Checkbox, x360 y72 w70 h20 vüũ7, ���� ��� 

Gui, Add, Button, x10 y40 w80 h20, 1��BGM 
Gui, Add, Button, x95 y40 w80 h20, 2��BGM
Gui, Add, Button, x180 y40 w80 h20, 3��BGM
Gui, Add, Button, x265 y40 w80 h20, ����



;;--------------------##################### ������Ʈ ���� ��Ʈ ############################-------------------------;;

Gui, tab, �α�

Gui, Add, GroupBox, x2 y25 w430 h385 c003300 , [�ƽ�����Ŀ �α� ���]
Gui, Add, listBox, x6 y40 w410 h370 hwndID vl_b
Gui, Add, Button, x440 y25 w55 h40 , �α�`n����
Gui, Add, Button, x440 y80 w55 h40 , �α�`n���ε�


new_map_check()
;log_Set()
As_ver_config(version)

Return

GuiClose:
	Gosub, CaptureOff
ExitApp

;; GUI ���� ��

ButtonPC�漼��:
{
	getlog2("PC�� ������ �����մϴ�.","��ø� ��ٷ��ּ���")
	war3_down()
}
return


Button��ũ�ٿ�:
{
	run, https://drive.google.com/uc?export=download&confirm=RcAi&id=1mV1xjYsKSOU3bWnL4mzq-Eox-286x5SK
}
return

Button�ƽ�����Ŀ��������:
{
	FileCreateDir, As_faker
	run, As_faker
}
return

Button�������:
{
	getlog2("������� �������� �̵��մϴ�.","")
	run, "https://manamoa3.net/" 
}
return

ButtonX-Gamma:
{
	IfNotExist, As_faker\xgamma.exe
	{	
		getlog2("ȭ�������� ���α׷��� �޽��ϴ�.","")
		x_gamma_down()
	}
		
	getlog2("ȭ�������� ���α׷� ����","")
	run, "As_faker\xgamma.exe"
}
return

ButtonM16Tool:
{
	getlog2("M16Tool�� �����մϴ�.","")
	m16 := "As_faker\m16tool\M16Tool.exe"
	
	
	IfNotExist, %m16%
	{
		m16:=""
		getlog2("M16TooL�� �ٿ�ε� �մϴ�","")
		sleep, 2000
		MsgBox,68,M16Tool �ٿ� �ȳ�, M16 Tool�� ��ġ �Ͻðڽ��ϱ�?
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






Button�α�����:
{
	formattime , nowtime,,HH_mm_ss
	controlget,var,list,,,ahk_id %ID%
	logfile = %nowtime%_logs.txt
	try{
		FileAppend,%var%, %nowtime%_logs.txt
		getlog("�α����� : ", logfile)
	}catch e{
		getlog("�α����� ����", throw A_ThisFunc)
	}
	
}
return

Button�α׾��ε�:
{
	try{
		�α׾��ε�(logfile)
		getlog("�α׾��ε� �Ϸ� ", "�����ּż� �����մϴ�.")
	}catch e{
		getlog("�α׾��ε� ����", throw A_ThisFunc)
	}
	
}
return


Button�������ε�:
{
	Gui, Submit, NoHide
	�ڵ���ε�(code)
}
return

Button������������:
{
	Gui, Submit, NoHide
	�ڵ�ٿ�ε�(code)
}
return

Button��������:
{
	MsgBox, , �˸�, üũ�ڽ� ������ �����Ͽ����ϴ�., 1
	Gui, Submit, NoHide		;; gui�� ���� ����
	;IniWrite, %üũ1%, setting.ini, Checkboxs, üũ1
	;IniWrite, %üũ2%, setting.ini, Checkboxs, üũ2	
	;IniWrite, %üũ3%, setting.ini, Checkboxs, üũ3	
	;IniWrite, %üũ4%, setting.ini, Checkboxs, üũ4	
	;IniWrite, %üũ5%, setting.ini, Checkboxs, üũ5	
	IniWrite, %üũ6%, setting.ini, Checkboxs, üũ6
	IniWrite, %üũ7%, setting.ini, Checkboxs, üũ7
	SoundPlay, %A_ScriptDir%\Resourse\bgm\effect\Coin.wav
	
}
return

Button����1:			; ���ڷ�
{
	Gui, Submit, NoHide
	IniWrite, %nohan%, setting.ini, hotkeys, rule_nohan
	
	IniRead rule_nohan, setting.ini, hotkeys, rule_nohan
	
}
return

Button����2:			; ����1
{
	Gui, Submit, NoHide
	IniWrite, %Xero1%, setting.ini, hotkeys, room_name
	
	IniRead room_name, setting.ini, hotkeys, room_name
	
}
return

Button����3:			; ����2
{
	Gui, Submit, NoHide
	IniWrite, %Xero2%, setting.ini, hotkeys, room_name2
	
	IniRead room_name2, setting.ini, hotkeys, room_name2
	
}
return

Label:							; ��Ű ui�� �����ϴ� ��
IF(true){
	If (%A_GuiControl% in +,^,!,+^,+!,^!,+^!)    ;If the hotkey contains only modifiers, return to wait for a key. 
			return   
	��Ű����(A_GuiControl)
}	
return

;Set_Hotkey(A_GuiControl)





��Ű����(hot){
		
	num := SubStr(hot,3)	;��Ű ��ȣ ����
	
	; 1. ���� ��Ű ó��
	; 2. �ߺ� ��Ű ó�� ->��Ű�� �����ϸ� ������Ű �����ϰ� �����Ѵ�.
	; 3. ��Ű�� ���� �ȵǾ� ������ ����
	; 4. �����̽��ٴ� Ư����Ű�� ����
	; 5. ��Ű�� �����Ѵ�.


	Gui, Submit, NoHide		;; gui�� ���� ����
	;1. ���� ��Ű ó��
	if( HK%num% = "q" || HK%num% = "F1" || HK%num% = "F2" || HK%num% = "F3" || HK%num% = "q" || HK%num% = "w" || HK%num% = "e" || HK%num% = "r" || HK%num% = "a"){	; ���� �� ��ų ���� Ű�� ���
		MsgBox, , ���, Ű���� �Ұ����� Ű�Դϴ�., 1
		GuiControl, ,HK%num% , % saveHK%num%  ;  show the hotkey
		Gui, Submit, NoHide		;; gui�� ���� ����
		return
	}else{

		if( HK%num% = �ʱ�ȭ){		;5. ��Ű �����
	
			;��Ű ���� üũ
			Hotkey, % saveHK%num%,, UseErrorLevel	;; ��Ű ���� �˻�
			if( ErrorLevel != 5){
				Hotkey, % saveHK%num%, Label%num%, Off	;;���� ��Ű ����
				
			}
			saveHK%num% := HK%num%
			IniWrite, % saveHK%num%,setting.ini, hotkeys, saveHK%num%	;;���� �Է�
		}else{
			; 2.�ߺ� ��Ű ó��
			cnt := 1
			Loop, 16{
				if(saveHK%cnt% = HK%num% ){	; �ߺ��� Ű�� ������, 
					Hotkey, % saveHK%cnt%,, UseErrorLevel	;; ��Ű ���� �˻�
					if( ErrorLevel != 5){
						Hotkey, % saveHK%cnt%, Label%cnt%, Off	;;���� ��Ű ����
					}
					saveHK%cnt% := �ʱ�ȭ
					IniWrite, % saveHK%cnt%,setting.ini, hotkeys, saveHK%cnt%	; ���Ͽ����� �����
					HK%cnt% := �ʱ�ȭ
					
					
					saveHK%num% := HK%num%
					Hotkey, % saveHK%num%, Label%num%, On		;; �ű� ��Ű ���
					IniWrite, % saveHK%num%,setting.ini, hotkeys, saveHK%num%	;;���� �Է�
					GuiControl, ,HK%cnt% , % saveHK%cnt%  ;  show the hotkey
					Gui, Submit, NoHide		;; gui�� ���� ����
					return
				}
				cnt++
			}
			
			; ��Ű ����
			
			if(saveHK%num%){		;����� ��Ű�� ������ �ٸ�Ű�� ����
				;��Ű ���� üũ
				Hotkey, % saveHK%num%,, UseErrorLevel	;; ��Ű ���� �˻�
				if( ErrorLevel != 5){
					Hotkey, % saveHK%num%, Label%num%, Off	;;���� ��Ű ����
				}
				saveHK%num% := HK%num%
				Hotkey, % saveHK%num%, Label%num%, On		;; �ű� ��Ű ���
				IniWrite, % saveHK%num%,setting.ini, hotkeys, saveHK%num%	;;���� �Է�
			}else{
				saveHK%num% := HK%num%
				Hotkey, % saveHK%num%, Label%num%, On		;; �ű� ��Ű ���
				IniWrite, % saveHK%num%,setting.ini, hotkeys, saveHK%num%	;;���� �Է�
			}
			
			Gui, Submit, NoHide		;; gui�� ���� ����
			if(����üĿ=false){
				off_k()
			}
		}
	
	}
	
}

/* 
 �� ��Ʈ�� ���� 
*/


#MaxThreadsPerHotkey 5	;2�������� ���ͷ�Ʈ ����
/*
::!rg::
	if(RGüĿ){	;�̹� ���������� ����.
		Send, {enter}
		sleep, 100
		SendRaw, /c m wkehd dkfwnl whdfy! -dktmtvpdlzj %newver%
		sleep, 100
		Send, {enter}
		sleep, 100
		RGüĿ := false
	}else{		;���������� �Ҵ�.
		Send, {enter}
		sleep, 100
		SendRaw, /c m wkehd dkfwnlfmf tlwkrgkqslek! -dktmtvpdlzj %newver%
		sleep, 100
		Send, {enter}
		sleep, 100
		RGüĿ := true
		�ڵ�rg()
	}
return
*/


::!qkd::	;�� �θ���
	send,{enter}
	���ڷ�(rule_nohan)	
return

::!qkd1::	;����1����
	SendRaw, %room_name%
	sleep,250
	send, ^+{Left 4}
	sleep,250
	send, ^c
return

::!qkd2::	;����2����
	SendRaw, %room_name2%
	sleep,250
	send, ^+{Left 4}
	sleep,250
	send, ^c
return

::!audfuddj::	; ��ɾ� ����
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


Label2:		;�������
	
return

Label3:		;�������

return

Label4:		;����1��
	
return

Label5:		;���� 2��
	
return

Label6:

return


Label7:
	if(����üĿ = true){			
		����üĿ := false
		off_k() ;;�ٲ���.
		SoundPlay, %A_ScriptDir%\Resourse\bgm\effect\Power up.wav
	}
	else{
		����üĿ := true
		on_k()	;;��Ų��.
		SoundPlay, %A_ScriptDir%\Resourse\bgm\effect\smw_kick.wav
	}
return

Label8:
	if(����üĿ = true){
		1����()
	}
return

Label9:
	if(����üĿ = true){
		2����()
	}
return
Label10:
	if(����üĿ = true){
		3����()
	}
return

Label11:
	if(����üĿ = true){
		4����()
	}
return

Label12:
	if(����üĿ = true){
		124����()
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
	if(üũ6=1){
		random_bgm("1")
	}else{
		play_bgm("1")	
	}
return

Label15:
	if(üũ6=1){
		random_bgm("2")
	}else{
		play_bgm("2")	
	}	
return

Label16:
	if(üũ6=1){
		random_bgm("3")
	}else{
		play_bgm("3")	
	}	
return

Label17:
	stop_bgm()
return


�ڵ�rg(){
	sleep, 1100
	Loop{
	PostMessage, 0x100, 0xBF, 0x350001,, Warcraft III
	PostMessage, 0x100, 0x52, 0x130001,, Warcraft III
	PostMessage, 0x100, 0x47, 0x220001,, Warcraft III
	sleep, 500
	PostMessage, 0x100, 0xD, 0x1C0001,, Warcraft III
	PostMessage, 0x101, 0xD, 0x1C0001,, Warcraft III
	sleep, 10000
	if(RGüĿ = false){
		break
	 }
	}
}


~Enter::		; ���ͷ� ����Ų��.
	if(����üĿ = true){
		on_off()
	}
return

~+Enter::		; ���ͷ� ����Ų��.
	if(����üĿ = true){
		on_off()
	}
return

~Esc::			; ������������ Ű��, ���������� �۵� ����.
	if(����üĿ = true){
		on_k()
	}
return




on_k(){			;������ ��Ų��.
	cnt := 8
	Loop, 5{
		if( saveHK%cnt% != �ʱ�ȭ){
			Hotkey, % saveHK%cnt%, Label%cnt%, On	;;���� ��Ű ����
		}
		cnt++
	}
	üĿ := true
}

off_k(){
	cnt := 8
	Loop, 5{
		Hotkey, % saveHK%cnt%,, UseErrorLevel	;; ��Ű ���� �˻�
		if( ErrorLevel != 5){
			Hotkey, % saveHK%cnt%, Label%cnt%, off	;;���� ��Ű ����
		}
		cnt++
	}
	üĿ := false
		
}

on_off(){
	if(üĿ = true){
		off_k()
	}else if(üĿ = false){
		on_k()
	}
}


+z::
	if(üĿ = true){
		SoundPlay, %A_ScriptDir%\Resourse\bgm\effect\1-Up.wav
	}else if(üĿ = false){
		SoundPlay, %A_ScriptDir%\Resourse\bgm\effect\Appear.wav
	}
return

����1:
	space_set("8")
return

����2:
	space_set("9")
return

����3:
	space_set("10")
return

����4:
	space_set("11")
return

����5:
	space_set("12")
return


space_set(num){
	HK%num% := "space"
	cnt := 8
	Loop, 5{	;�ߺ�����
		if(saveHK%cnt% ="space"){
			Hotkey, % saveHK%cnt%,, UseErrorLevel	;; ��Ű ���� �˻�
			if( ErrorLevel != 5){
				Hotkey, % saveHK%cnt%, Label%cnt%, off	;;��Ű ����
			}
			saveHK%cnt% := ""	
			GuiControl, ,HK%cnt% , % saveHK%cnt%  ;  GUI�κ� ����
			IniWrite, % saveHK%cnt%, setting.ini, hotkeys, saveHK%cnt%		;�������� ����
		}
		cnt++
	}
			
	saveHK%num% := HK%num%
	IniWrite, % saveHK%num%, setting.ini, hotkeys, saveHK%num%	
    GuiControl, ,HK%num% , % saveHK%num%  ;  show the hotkey
	Hotkey, % saveHK%num%, Label%num%, On		;; �ű� ��Ű ���
	Gui, Submit, NoHide		;; gui�� ���� ����
	if(����üĿ=false){
		off_k()
	}
}


