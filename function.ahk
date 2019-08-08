#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#include MCI.ahk

global stop_var := true 


;; 로그 얻는 함수

getlog(대상, message){
		formattime , nowtime,,HH:mm:ss
		guicontrol,,l_b, %nowtime% - %대상% %message%

		sendmessage,0x18B,,,listbox1,a
		sendmessage,0x186,errorlevel-1,,listbox1,a 
		return logs	
}

getlog2(대상, message){
		formattime , nowtime,,HH:mm:ss
		guicontrol,,l_b2, %nowtime% - %대상% %message%

		sendmessage,0x18B,,,listbox1,a
		sendmessage,0x186,errorlevel-1,,listbox1,a 
}


log_set(){
	getlog2("---------------------------------","")
	getlog2("123코드로 가져오기시 default 설정 가져옴","")
	getlog2("---------------------------------","")
	getlog2("피방일 경우 다음 순서대로 해주세요 ","")
	getlog2("1. PC방 세팅 버튼 ","")
	getlog2("---------------------------------","")
}



;; bgm재생기능

stop_bgm(){
	if (hMedia)
    {
    MCI_Stop(hMedia)
    MCI_Close(hMedia)
    Open:=False
	stop_var := true
    }
}

random_bgm(numbers){
	stop_var := false
	if (hMedia)
	{
		MCI_Stop(hMedia)
		MCI_Close(hMedia)
		Open:=False
	}
		
	While(stop_var=false)
	{
		if(numbers=1){
			path = Resourse\bgm\Emiya.mp3
		}else if(numbers=2){
			path = Resourse\bgm\sop.mp3
		}else{
			path = Resourse\bgm\1000_years.mp3
		}

	t:= Play(path)
	sleep, %t%
	sleep, 100
	
	Random,numbers,1,3
	}
}


play_bgm(numbers){
	stop_var := false
	if (hMedia)
	{
		MCI_Stop(hMedia)
		MCI_Close(hMedia)
		Open:=False
	}
	
	if(numbers=1){
		path = Resourse\bgm\Emiya.mp3
	}else if(numbers=2){
		path = Resourse\bgm\sop.mp3
	}else{
		path = Resourse\bgm\1000_years.mp3
	}
	
	t:= Play(path)
	sleep, %t%
	sleep, 100

	While(stop_var=false)
	{
		Play(path)
		sleep, %t%
		sleep, 100
	}


}


Play(path){
hMedia:=MCI_Open(path)

if not hMedia
    {
    MsgBox Error opening media file
    return
    }

Open:=True
MediaLength:=MCI_Length(hMedia)

MCI_Stop(hMedia)
if Open
    {
    Status:=MCI_Status(hMedia)
    if (Status="Stopped")
        MCI_Play(hMedia,"","NotifyEndOfPlay")  ;-- Notify is set here
     else
        if (Status="Paused")
            MCI_Resume(hMedia)
    }

return MediaLength
}

1령주(){			;F3 -> f -> q -> F1
	Controlsend, ,{f3}, Warcraft III
	sleep, 7
	Controlsend, ,ff, Warcraft III
	sleep, 7
	Controlsend, ,q, Warcraft III
	sleep, 7
	Controlsend, ,{f1}, Warcraft III
	sleep, 7	
}

2령주(){			;F3 -> f -> w -> F1
	Controlsend, ,{f3}, Warcraft III
	sleep, 7
	Controlsend, ,ff, Warcraft III
	sleep, 7
	Controlsend, ,w, Warcraft III
	sleep, 7
	Controlsend, ,{f1}, Warcraft III
	sleep, 7
}


3령주(){			;F3 -> f -> e -> F1
	Controlsend, ,{f3}, Warcraft III
	sleep, 7
	Controlsend, ,ff, Warcraft III
	sleep, 7
	Controlsend, ,e, Warcraft III
	sleep, 7
	Controlsend, ,{f1}, Warcraft III
	sleep, 7
}

4령주(){			;F3 -> f -> r -> F1
	Controlsend, ,{f3}, Warcraft III
	sleep, 7
	Controlsend, ,ff, Warcraft III
	sleep, 7
	Controlsend, ,r, Warcraft III
	sleep, 7
	Controlsend, ,{f1}, Warcraft III
	sleep, 7	
}

124령주(){			;F3 -> f -> w -> F1
	Controlsend, ,{f3}, Warcraft III
	sleep, 10
	Controlsend, ,ff, Warcraft III
	sleep, 10
	Controlsend, ,q, Warcraft III
	sleep, 10
	Controlsend, ,w, Warcraft III
	sleep, 10
	Controlsend, ,r, Warcraft III
	sleep, 10
	Controlsend, ,{f1}, Warcraft III
	sleep, 10
}

로아(){
	Controlsend, ,{f3}, Warcraft III
	sleep, 10
	Controlsend, ,vv, Warcraft III
	sleep, 10
	Controlsend, ,{f1}, Warcraft III
	sleep, 10
}




노핸룰(rule_nohan){

Send, {enter}
sleep, 10

SendRaw, !ch %rule_nohan%
sleep, 100

Send, {enter}
sleep, 100



}

ClipCursor(x1,y1,x2,y2){  ; x, y coordinates        
    VarSetCapacity(Rect,16,0)                                            
    coords:= x1 "|" y1 "|" x2 "|" y2 
    Loop Parse,coords,| 
        NumPut(A_LoopField, &Rect+Off:= a_index>1 ?  Off+=4 : 0) 
    DllCall("ClipCursor", "str", Rect) 
}


IME_CHECK(WinTitle)
{
    WinGet,hWnd,ID,%WinTitle%
    Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x005,"")
}
Send_ImeControl(DefaultIMEWnd, wParam, lParam)
{
    DetectSave := A_DetectHiddenWindows       
    DetectHiddenWindows,ON                          
     SendMessage 0x283, wParam,lParam,,ahk_id %DefaultIMEWnd%
    if (DetectSave <> A_DetectHiddenWindows)
        DetectHiddenWindows,%DetectSave%
    return ErrorLevel
}
ImmGetDefaultIMEWnd(hWnd)
{
    return DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)
}



