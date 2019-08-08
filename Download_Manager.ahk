#SingleInstance force
#NoEnv
#include function.ahk
FileEncoding, UTF-8 

/*
리소스 파일 정리
*/
;리소스 파일 집어넣기
리소스파일(){
	FileCreateDir, Resourse
	FileCreateDir, Resourse\bgm
	FileCreateDir, Resourse\img
	FileCreateDir, Resourse\util
	FileCreateDir, Resourse\bgm\effect

	FileInstall, Resourse\bgm\Emiya.mp3, Resourse\bgm\Emiya.mp3, 1
	FileInstall, Resourse\bgm\sop.mp3, Resourse\bgm\sop.mp3, 1
	FileInstall, Resourse\bgm\1000_years.mp3, Resourse\bgm\1000_years.mp3, 1

	FileInstall, Resourse\util\Updater.exe, Resourse\util\Updater.exe, 1

	FileInstall, Resourse\img\tama.jpg, Resourse\img\tama.jpg, 1
	FileInstall, Resourse\img\bg2.jpg, Resourse\img\bg2.jpg, 1
	FileInstall, Resourse\img\1.png, Resourse\img\1.png, 1
	FileInstall, Resourse\img\2.png, Resourse\img\2.png, 1
	FileInstall, Resourse\img\3.png, Resourse\img\3.png, 1
	FileInstall, Resourse\img\4.png, Resourse\img\4.png, 1
	FileInstall, Resourse\img\124.png, Resourse\img\124.png, 1

	FileInstall, Resourse\bgm\effect\1-Up.wav, Resourse\bgm\effect\1-Up.wav, 1
	FileInstall, Resourse\bgm\effect\Coin.wav, Resourse\bgm\effect\Coin.wav, 1
	FileInstall, Resourse\bgm\effect\Message Block.wav, Resourse\bgm\effect\Message Block.wav, 1
	FileInstall, Resourse\bgm\effect\Power up.wav, Resourse\bgm\effect\Power up.wav, 1
	FileInstall, Resourse\bgm\effect\smw_kick.wav, Resourse\bgm\effect\smw_kick.wav, 1
	FileInstall, Resourse\bgm\effect\Appear.wav, Resourse\bgm\effect\Appear.wav, 1
	FileInstall, Resourse\bgm\effect\Thunder.wav, Resourse\bgm\effect\Thunder.wav, 1


	FileSetAttrib, +H, Resourse
	FileSetAttrib, +H, %A_WorkingDir%\*.ini, ,1
}

/*
	war3 pakage download link
*/


war3_down(){
	FileCreateDir, As_faker
	
	getlog2("워크 다운 url로 이동합니다.", "브라우저를 통해 다운받아주세요.")
	run, https://drive.google.com/uc?export=download&confirm=RcAi&id=1mV1xjYsKSOU3bWnL4mzq-Eox-286x5SK
	
	getlog2("m16툴을 다운로드 하겠습니다", "")
	URLDownloadToFile, https://drive.google.com/uc?export=download&id=1E7Q9MLGmRhrSIf2esTisVadIpK5KA7E7, As_faker/m16tool.zip
	 
	if(ErrorLevel){
		getlog2("m16툴 다운 실패", "관리자 권한으로 실행하세요")
	}
	else{
		getlog2("m16툴 다운 완료","" )
		getlog2("m16툴 압축 해제","시작" )
		Zip := ComObjCreate("Shell.Application")  ;쉘 오브젝트 생성
		Folder := Zip.NameSpace(A_WorkingDir "\As_faker\m16tool.zip")   ; .ZIP 압축파일 지정, 여기서는 임시폴더(A_Temp)\리소스.zip
		FileCreateDir, As_faker\m16tool
		NewFolder := Zip.NameSpace(A_WorkingDir "\As_faker\m16tool")                ; 압축을 풀 경로 설정, 여기서는 임시폴더(A_Temp)
		NewFolder.CopyHere(Folder.items, 4|16)
		getlog2("m16툴 압축 해제 완료","")
		FileDelete, As_faker/m16tool.zip
		getlog2("m16툴 압축 파일","삭제")
		getlog2("클랜 룰 텍스트 파일 다운","시작")
		
		URLDownloadToFile, ftp://asfaker:antr@125.186.71.246/asfaker/util/클랜룰.txt, As_faker/클랜룰.txt
		getlog2("클랜 룰 텍스트 파일 다운","완료")
		
		getlog2("m16툴을 실행합니다.","")
		run, As_faker\m16tool\M16Tool.exe
		
		Sleep, 3000
		
		FileDelete, KeyMap
		FileDelete, Rooms
		FileDelete, SmartKeys
	}

}

x_gamma_down(){
	FileCreateDir, As_faker
	URLDownloadToFile, https://drive.google.com/uc?export=download&id=1xBq6hVmoTWST0n5AVfl1rqjosFTAEfLA, As_faker/xgamma.exe
	Sleep, 1000
	URLDownloadToFile, https://drive.google.com/uc?export=download&id=1a8THf4_oBy-5Iqu1vX8VaJagEy_oaR-P, As_faker/XMouseButtonControl.zip
}


get_war_path(){
	war_path := 0
	
	if(!war_path){
		RegRead,war_path,HKEY_LOCAL_MACHINE,SOFTWARE\WOW6432Node\Blizzard Entertainment\Warcraft III,InstallPath
	}
	if(!war_path){
		RegRead,war_path,HKEY_LOCAL_MACHINE,SOFTWARE\Blizzard Entertainment\Warcraft III,InstallPath
	}
	if(!war_path){
		RegRead,war_path,HKEY_CURRENT_USER,SOFTWARE\Blizzard Entertainment\Warcraft III,InstallPath
	}
	
	if(!war_path){
		getlog2("war3 미설치 혹은 미실행 상태입니다.","")
		getlog2("워크를 다운받으셨으면 실행해주세요","")
	}
	
	getlog("경로 : ",war_path)
	
	return war_path
}




m16tool_down(){
	FileCreateDir, As_faker
	
	getlog2("m16툴을 다운로드 하겠습니다", "")
	URLDownloadToFile, https://drive.google.com/uc?export=download&id=1E7Q9MLGmRhrSIf2esTisVadIpK5KA7E7, As_faker/m16tool.zip
	 
	if(ErrorLevel){
		getlog2("m16툴 다운 실패", "관리자 권한으로 실행하세요")
	}
	else{
		getlog2("m16툴 다운 완료","" )
		getlog2("m16툴 압축 해제","시작" )
		Zip := ComObjCreate("Shell.Application")  ;쉘 오브젝트 생성
		Folder := Zip.NameSpace(A_WorkingDir "\As_faker\m16tool.zip")   ; .ZIP 압축파일 지정, 여기서는 임시폴더(A_Temp)\리소스.zip
		FileCreateDir, As_faker\m16tool
		NewFolder := Zip.NameSpace(A_WorkingDir "\As_faker\m16tool")                ; 압축을 풀 경로 설정, 여기서는 임시폴더(A_Temp)
		NewFolder.CopyHere(Folder.items, 4|16)
		getlog2("m16툴 압축 해제 완료","")
		FileDelete, As_faker/m16tool.zip
		getlog2("m16툴 압축 파일","삭제")
		getlog2("클랜 룰 텍스트 파일 다운","시작")
		
		URLDownloadToFile, ftp://asfaker:antr@125.186.71.246/asfaker/util/클랜룰.txt, As_faker/클랜룰.txt
		getlog2("클랜 룰 텍스트 파일 다운","완료")
		
		getlog2("m16툴을 실행합니다.","")
		run, As_faker\m16tool\M16Tool.exe
		
		Sleep, 3000
		
		FileDelete, KeyMap
		FileDelete, Rooms
		FileDelete, SmartKeys
	}
}



/*
	코드 업로드 기능
*/

코드업로드(code){
	msgBox, , 알림, cmd기능이 막혀있을경우 안될수도 있습니다., 1
	
	if(code=Error){
		MsgBox, 코드를 입력하세요.
		return
	}else{
		FileCopy, setting.ini, %code%.ini
		FileDelete, upload.txt

	; 다음 예제는 계속 섹션을 사용해 가독성과 유지관리성을 향상시킵니다:
	FileAppend,
	(
open 125.186.71.246
asfaker
antr
cd /asfaker/user
delete %code%.ini
put %code%.ini
quit
	), %A_WorkingDir%\upload.txt
	FileSetAttrib, +H, upload.txt
	Run, %ComSpec% /c ftp -s:upload.txt,,Hide
	}
	msgBox, , 알림, 설정 저장 완료., 1
	sleep, 2000
	FileDelete, upload.txt
	FileDelete, %code%.ini
}


로그업로드(code){
	msgBox, , 알림, cmd기능이 막혀있을경우 안될수도 있습니다., 1

	; 다음 예제는 계속 섹션을 사용해 가독성과 유지관리성을 향상시킵니다:
	FileAppend,
	(
open 125.186.71.246
asfaker
antr
cd /asfaker/user
delete %code%
put %code%
quit
	), %A_WorkingDir%\upload.txt
	FileSetAttrib, +H, upload.txt
	Run, %ComSpec% /c ftp -s:upload.txt,,Hide
	
	msgBox, , 알림, 설정 저장 완료., 1
	sleep, 2000
	FileDelete, upload.txt
	FileDelete, %code%
}

코드다운로드(code){
	msgBox, , 알림, cmd기능이 막혀있을경우 안될수도 있습니다., 1
	if(code=Error){
		MsgBox, 코드를 입력하세요.
		return
	}else{
		if(FileExist("setting.ini")){
			FileDelete, setting.ini
		}
		URLDownloadToFile, ftp://asfaker:antr@125.186.71.246/asfaker/user/%code%.ini, setting.ini
		if (ErrorLevel){
			MsgBox, 다운로드 실패. `n 코드를 정확히 입력하세요.
		}else{
			FileSetAttrib, +H, setting.ini
			msgBox, , 알림, 설정 가져오기 완료, 1
			reload
		}
	}
}

/*
 ftp 서버에서 다운받는 코드
*/
As_ver_config(this_version){

	URLDownloadToFile, https://drive.google.com/uc?export=download&id=17NNTSXpeVN6O3uoTLyOfDtlKQbq1y_oH, ver.txt
	getlog("현재 버전 확인 : ",this_version)
	FileReadLine, get_version, ver.txt, 1
	getlog("서버 버전 확인 : ",get_version)
	
	if(this_version < get_version){
		getlog("업데이트 필요 : ","")
		FileDelete, ver.txt
		getlog("업데이트 여부 확인 : ","")
		as_down(this_version, get_version)
	}else{
		FileDelete, ver.txt
	}
}

as_down(this_version, get_version){
	if(this_version < get_version){
		getlog("업데이트 알림 : ","")
		MsgBox,68,업데이트 알림, %get_version% 버전이 나왔습니다. `n 업데이트 하시겠습니까?
		IfMsgBox, Yes
			updater(get_version)
	}
}

updater(get_version){
	getlog("최신 버전 :", get_version)
	URLDownloadToFile, ftp://asfaker:antr@125.186.71.246/asfaker/AS/AS_Faker%get_version%.exe, AS_Faker%get_version%.exe
	if (ErrorLevel){
			MsgBox, 다운로드 실패. `n 관리자 권한으로 실행하세요.
	}else{
		MsgBox, , 알림, 업데이트 완료,1
		run, AS_Faker%get_version%.exe
		ExitApp
	}
}	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


/* 
 map download
 new_map_check fun만 불러오면 된다.
 
 */
 
 new_map_check(){
	war_map_path := get_MapPath()  ; map folder search
	getlog("신맵체크"," 맵 폴더")
	new_map_name := GetMapVersion() 
	getlog("신버전 이름 = ",new_map_name)
	
	if(war_map_path != ERROR){	; war3/download 폴더 존재
		map = %war_map_path%\%new_map_name% ; map = 내문서\Warcraft III\Maps\download\fate..... 
		
		IfExist, %map%
			getlog2("현재 보유 맵이 최신버전입니다.","")
			getlog2("-----------------------------","")
		
		IfNotExist, %map%
			MsgBox,68,페어 신버전 알림, %new_map_name% 버전이 나왔습니다. `n 업데이트 하시겠습니까?
		IfMsgBox, Yes
			DownLoadMap(war_map_path , new_map_name)	
	}
}
 
 get_MapPath(){ ; return doc\map\download
	RegRead, war_map_path, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders, Personal
	getlog("내문서 위치 읽기 ",war_map_path)
	war_map_path = %war_map_path%\Warcraft III ; var : war3 map path 
	
	IfNotExist, %war_map_path%	; if not exist war3 doc, m16 is not exist 
	{
		getlog("워크 폴더 없음", "생성시도")
		FileCreateDir, %war_map_path%
		getlog("워크 폴더 생성", war_map_path)
	}
	
	war_map_path = %war_map_path%\Maps ; var : war3 map path 
	
	
	IfNotExist, %war_map_path%	; if not exist war3 doc, m16 is not exist 
	{
		getlog("Maps 폴더 없음", "생성시도")
		FileCreateDir, %war_map_path%
		getlog("Maps 폴더 생성", war_map_path)
	}
	
	IfExist, %war_map_path%
	{
		IfNotExist, %war_map_path%\download
		{
			getlog("download 폴더 없음 ","생성시도")
			FileCreateDir, %war_map_path%\download
		}
		war_map_path  = %war_map_path%\download	
		getlog("맵 폴더 경로 ",war_map_path)
		return %war_map_path%
	}
}

GetMapVersion(){
	
	URL := "https://cafe.naver.com/ArticleList.nhn?search.clubid=24233361&search.menuid=22&search.boardtype=L" ; 페이트 신버 맵 카페	
	http_el:=ReadURL(URL)
	;getlog("카페 url : ",URL)
	
	;getlog("풀html",http_el)
	
	RegExMatch(http_el,"inner_number(.*?)Fate / Another V Real",regx)
	getlog("html : ",regx)
	RegExMatch(regx,"articleid=(.*?)&referrerAllArticles=false",reg)
	;getlog("html : ",reg)
	articlid = %reg1%
	getlog("아티클 id : ",articlid)
	
	MapAddress1 := "https://cafe.naver.com/ArticleRead.nhn?clubid=24233361&articleid="
	MapAddress2 := "&boardtype=L&menuid=22"
	Address = %MapAddress1%%articlid%%MapAddress2%
	
	URL = %Address%
	getlog("맵 게시글 url : ",URL)
	
	http_el:=ReadURL(URL)
	RegExMatch(http_el,"file_name\C>(.*?)</span",regx)  ; \C는 " 를 뜻함
	mapname = %regx1%

	getlog2("최신 맵 버전 :",mapname)
	return mapname
	
}

DownLoadMap(war_map_path , mapname){
	
	URL := "https://cafe.naver.com/ArticleList.nhn?search.clubid=24233361&search.menuid=22&search.boardtype=L" ; 페이트 신버 맵 카페	
	http_el:=ReadURL(URL)
	getlog("카페 url : ",URL)
	
	;getlog("풀html",http_el)
	
	RegExMatch(http_el,"inner_number(.*?)Fate / Another V Real",regx)
	RegExMatch(regx,"articleid=(.*?)&referrerAllArticles=false",reg)
	;getlog("html : ",regx)
	;getlog("html : ",reg)
	articlid = %reg1%
	getlog("아티클 id : ",articlid)
	
	MapAddress1 := "https://cafe.naver.com/ArticleRead.nhn?clubid=24233361&articleid="
	MapAddress2 := "&boardtype=L&menuid=22"
	Address = %MapAddress1%%articlid%%MapAddress2%
	
	URL = %Address%
	getlog("맵 게시글 url : ",URL)
	
	http_el:=ReadURL(URL)
	RegExMatch(http_el,"file_name\C>(.*?)</span",regx)  ; \C는 " 를 뜻함
	mapname = %regx1%
	
	http_el:=ReadURL(URL)
	
	RegExMatch(http_el,"https://cafeattach.naver.net(.*?)attachment",regx)
	map_url = %regx1%
	MapAddress1 := "https://cafeattach.naver.net"
	MapAddress2 := "attachment"
	Address = %MapAddress1%%map_url%%MapAddress2%
	
	URLDownloadToFile, %Address%, %war_map_path%\%mapname%
	;getlog("맵 다운 : ",s)
	
	if (ErrorLevel){
		MsgBox, 다운로드 실패. `n 관리자 권한으로 실행하세요.
		getlog2("최신 맵 다운 : ","Fail")
	}else{
		MsgBox, %mapname% 다운 완료
		getlog2("최신 맵 다운 : ","Success")
	}
}

ReadURL(URL, encoding = "utf-8") {
	static a := "AutoHotkey/" A_AhkVersion
	if (!DllCall("LoadLibrary", "str", "wininet") || !(h := DllCall("wininet\InternetOpen", "str", a, "uint", 1, "ptr", 0, "ptr", 0, "uint", 0, "ptr")))
		return 0
	c := s := 0, o := ""
	if (f := DllCall("wininet\InternetOpenUrl", "ptr", h, "str", url, "ptr", 0, "uint", 0, "uint", 0x80003000, "ptr", 0, "ptr"))
	{
		while (DllCall("wininet\InternetQueryDataAvailable", "ptr", f, "uint*", s, "uint", 0, "ptr", 0) && s > 0)
		{
			VarSetCapacity(b, s, 0)
			DllCall("wininet\InternetReadFile", "ptr", f, "ptr", &b, "uint", s, "uint*", r)
			o .= StrGet(&b, r >> (encoding = "utf-16" || encoding = "cp1200"), encoding)
		}
		DllCall("wininet\InternetCloseHandle", "ptr", f)
	}
	DllCall("wininet\InternetCloseHandle", "ptr", h)
	return o
}