#SingleInstance force
#NoEnv
#include function.ahk
FileEncoding, UTF-8 

/*
���ҽ� ���� ����
*/
;���ҽ� ���� ����ֱ�
���ҽ�����(){
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
	
	getlog2("��ũ �ٿ� url�� �̵��մϴ�.", "�������� ���� �ٿ�޾��ּ���.")
	run, https://drive.google.com/uc?export=download&confirm=RcAi&id=1mV1xjYsKSOU3bWnL4mzq-Eox-286x5SK
	
	getlog2("m16���� �ٿ�ε� �ϰڽ��ϴ�", "")
	URLDownloadToFile, https://drive.google.com/uc?export=download&id=1E7Q9MLGmRhrSIf2esTisVadIpK5KA7E7, As_faker/m16tool.zip
	 
	if(ErrorLevel){
		getlog2("m16�� �ٿ� ����", "������ �������� �����ϼ���")
	}
	else{
		getlog2("m16�� �ٿ� �Ϸ�","" )
		getlog2("m16�� ���� ����","����" )
		Zip := ComObjCreate("Shell.Application")  ;�� ������Ʈ ����
		Folder := Zip.NameSpace(A_WorkingDir "\As_faker\m16tool.zip")   ; .ZIP �������� ����, ���⼭�� �ӽ�����(A_Temp)\���ҽ�.zip
		FileCreateDir, As_faker\m16tool
		NewFolder := Zip.NameSpace(A_WorkingDir "\As_faker\m16tool")                ; ������ Ǯ ��� ����, ���⼭�� �ӽ�����(A_Temp)
		NewFolder.CopyHere(Folder.items, 4|16)
		getlog2("m16�� ���� ���� �Ϸ�","")
		FileDelete, As_faker/m16tool.zip
		getlog2("m16�� ���� ����","����")
		getlog2("Ŭ�� �� �ؽ�Ʈ ���� �ٿ�","����")
		
		URLDownloadToFile, ftp://asfaker:antr@125.186.71.246/asfaker/util/Ŭ����.txt, As_faker/Ŭ����.txt
		getlog2("Ŭ�� �� �ؽ�Ʈ ���� �ٿ�","�Ϸ�")
		
		getlog2("m16���� �����մϴ�.","")
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
		getlog2("war3 �̼�ġ Ȥ�� �̽��� �����Դϴ�.","")
		getlog2("��ũ�� �ٿ���������� �������ּ���","")
	}
	
	getlog("��� : ",war_path)
	
	return war_path
}




m16tool_down(){
	FileCreateDir, As_faker
	
	getlog2("m16���� �ٿ�ε� �ϰڽ��ϴ�", "")
	URLDownloadToFile, https://drive.google.com/uc?export=download&id=1E7Q9MLGmRhrSIf2esTisVadIpK5KA7E7, As_faker/m16tool.zip
	 
	if(ErrorLevel){
		getlog2("m16�� �ٿ� ����", "������ �������� �����ϼ���")
	}
	else{
		getlog2("m16�� �ٿ� �Ϸ�","" )
		getlog2("m16�� ���� ����","����" )
		Zip := ComObjCreate("Shell.Application")  ;�� ������Ʈ ����
		Folder := Zip.NameSpace(A_WorkingDir "\As_faker\m16tool.zip")   ; .ZIP �������� ����, ���⼭�� �ӽ�����(A_Temp)\���ҽ�.zip
		FileCreateDir, As_faker\m16tool
		NewFolder := Zip.NameSpace(A_WorkingDir "\As_faker\m16tool")                ; ������ Ǯ ��� ����, ���⼭�� �ӽ�����(A_Temp)
		NewFolder.CopyHere(Folder.items, 4|16)
		getlog2("m16�� ���� ���� �Ϸ�","")
		FileDelete, As_faker/m16tool.zip
		getlog2("m16�� ���� ����","����")
		getlog2("Ŭ�� �� �ؽ�Ʈ ���� �ٿ�","����")
		
		URLDownloadToFile, ftp://asfaker:antr@125.186.71.246/asfaker/util/Ŭ����.txt, As_faker/Ŭ����.txt
		getlog2("Ŭ�� �� �ؽ�Ʈ ���� �ٿ�","�Ϸ�")
		
		getlog2("m16���� �����մϴ�.","")
		run, As_faker\m16tool\M16Tool.exe
		
		Sleep, 3000
		
		FileDelete, KeyMap
		FileDelete, Rooms
		FileDelete, SmartKeys
	}
}



/*
	�ڵ� ���ε� ���
*/

�ڵ���ε�(code){
	msgBox, , �˸�, cmd����� ����������� �ȵɼ��� �ֽ��ϴ�., 1
	
	if(code=Error){
		MsgBox, �ڵ带 �Է��ϼ���.
		return
	}else{
		FileCopy, setting.ini, %code%.ini
		FileDelete, upload.txt

	; ���� ������ ��� ������ ����� �������� ������������ ����ŵ�ϴ�:
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
	msgBox, , �˸�, ���� ���� �Ϸ�., 1
	sleep, 2000
	FileDelete, upload.txt
	FileDelete, %code%.ini
}


�α׾��ε�(code){
	msgBox, , �˸�, cmd����� ����������� �ȵɼ��� �ֽ��ϴ�., 1

	; ���� ������ ��� ������ ����� �������� ������������ ����ŵ�ϴ�:
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
	
	msgBox, , �˸�, ���� ���� �Ϸ�., 1
	sleep, 2000
	FileDelete, upload.txt
	FileDelete, %code%
}

�ڵ�ٿ�ε�(code){
	msgBox, , �˸�, cmd����� ����������� �ȵɼ��� �ֽ��ϴ�., 1
	if(code=Error){
		MsgBox, �ڵ带 �Է��ϼ���.
		return
	}else{
		if(FileExist("setting.ini")){
			FileDelete, setting.ini
		}
		URLDownloadToFile, ftp://asfaker:antr@125.186.71.246/asfaker/user/%code%.ini, setting.ini
		if (ErrorLevel){
			MsgBox, �ٿ�ε� ����. `n �ڵ带 ��Ȯ�� �Է��ϼ���.
		}else{
			FileSetAttrib, +H, setting.ini
			msgBox, , �˸�, ���� �������� �Ϸ�, 1
			reload
		}
	}
}

/*
 ftp �������� �ٿ�޴� �ڵ�
*/
As_ver_config(this_version){

	URLDownloadToFile, https://drive.google.com/uc?export=download&id=17NNTSXpeVN6O3uoTLyOfDtlKQbq1y_oH, ver.txt
	getlog("���� ���� Ȯ�� : ",this_version)
	FileReadLine, get_version, ver.txt, 1
	getlog("���� ���� Ȯ�� : ",get_version)
	
	if(this_version < get_version){
		getlog("������Ʈ �ʿ� : ","")
		FileDelete, ver.txt
		getlog("������Ʈ ���� Ȯ�� : ","")
		as_down(this_version, get_version)
	}else{
		FileDelete, ver.txt
	}
}

as_down(this_version, get_version){
	if(this_version < get_version){
		getlog("������Ʈ �˸� : ","")
		MsgBox,68,������Ʈ �˸�, %get_version% ������ ���Խ��ϴ�. `n ������Ʈ �Ͻðڽ��ϱ�?
		IfMsgBox, Yes
			updater(get_version)
	}
}

updater(get_version){
	getlog("�ֽ� ���� :", get_version)
	URLDownloadToFile, ftp://asfaker:antr@125.186.71.246/asfaker/AS/AS_Faker%get_version%.exe, AS_Faker%get_version%.exe
	if (ErrorLevel){
			MsgBox, �ٿ�ε� ����. `n ������ �������� �����ϼ���.
	}else{
		MsgBox, , �˸�, ������Ʈ �Ϸ�,1
		run, AS_Faker%get_version%.exe
		ExitApp
	}
}	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


/* 
 map download
 new_map_check fun�� �ҷ����� �ȴ�.
 
 */
 
 new_map_check(){
	war_map_path := get_MapPath()  ; map folder search
	getlog("�Ÿ�üũ"," �� ����")
	new_map_name := GetMapVersion() 
	getlog("�Ź��� �̸� = ",new_map_name)
	
	if(war_map_path != ERROR){	; war3/download ���� ����
		map = %war_map_path%\%new_map_name% ; map = ������\Warcraft III\Maps\download\fate..... 
		
		IfExist, %map%
			getlog2("���� ���� ���� �ֽŹ����Դϴ�.","")
			getlog2("-----------------------------","")
		
		IfNotExist, %map%
			MsgBox,68,��� �Ź��� �˸�, %new_map_name% ������ ���Խ��ϴ�. `n ������Ʈ �Ͻðڽ��ϱ�?
		IfMsgBox, Yes
			DownLoadMap(war_map_path , new_map_name)	
	}
}
 
 get_MapPath(){ ; return doc\map\download
	RegRead, war_map_path, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders, Personal
	getlog("������ ��ġ �б� ",war_map_path)
	war_map_path = %war_map_path%\Warcraft III ; var : war3 map path 
	
	IfNotExist, %war_map_path%	; if not exist war3 doc, m16 is not exist 
	{
		getlog("��ũ ���� ����", "�����õ�")
		FileCreateDir, %war_map_path%
		getlog("��ũ ���� ����", war_map_path)
	}
	
	war_map_path = %war_map_path%\Maps ; var : war3 map path 
	
	
	IfNotExist, %war_map_path%	; if not exist war3 doc, m16 is not exist 
	{
		getlog("Maps ���� ����", "�����õ�")
		FileCreateDir, %war_map_path%
		getlog("Maps ���� ����", war_map_path)
	}
	
	IfExist, %war_map_path%
	{
		IfNotExist, %war_map_path%\download
		{
			getlog("download ���� ���� ","�����õ�")
			FileCreateDir, %war_map_path%\download
		}
		war_map_path  = %war_map_path%\download	
		getlog("�� ���� ��� ",war_map_path)
		return %war_map_path%
	}
}

GetMapVersion(){
	
	URL := "https://cafe.naver.com/ArticleList.nhn?search.clubid=24233361&search.menuid=22&search.boardtype=L" ; ����Ʈ �Ź� �� ī��	
	http_el:=ReadURL(URL)
	;getlog("ī�� url : ",URL)
	
	;getlog("Ǯhtml",http_el)
	
	RegExMatch(http_el,"inner_number(.*?)Fate / Another V Real",regx)
	getlog("html : ",regx)
	RegExMatch(regx,"articleid=(.*?)&referrerAllArticles=false",reg)
	;getlog("html : ",reg)
	articlid = %reg1%
	getlog("��ƼŬ id : ",articlid)
	
	MapAddress1 := "https://cafe.naver.com/ArticleRead.nhn?clubid=24233361&articleid="
	MapAddress2 := "&boardtype=L&menuid=22"
	Address = %MapAddress1%%articlid%%MapAddress2%
	
	URL = %Address%
	getlog("�� �Խñ� url : ",URL)
	
	http_el:=ReadURL(URL)
	RegExMatch(http_el,"file_name\C>(.*?)</span",regx)  ; \C�� " �� ����
	mapname = %regx1%

	getlog2("�ֽ� �� ���� :",mapname)
	return mapname
	
}

DownLoadMap(war_map_path , mapname){
	
	URL := "https://cafe.naver.com/ArticleList.nhn?search.clubid=24233361&search.menuid=22&search.boardtype=L" ; ����Ʈ �Ź� �� ī��	
	http_el:=ReadURL(URL)
	getlog("ī�� url : ",URL)
	
	;getlog("Ǯhtml",http_el)
	
	RegExMatch(http_el,"inner_number(.*?)Fate / Another V Real",regx)
	RegExMatch(regx,"articleid=(.*?)&referrerAllArticles=false",reg)
	;getlog("html : ",regx)
	;getlog("html : ",reg)
	articlid = %reg1%
	getlog("��ƼŬ id : ",articlid)
	
	MapAddress1 := "https://cafe.naver.com/ArticleRead.nhn?clubid=24233361&articleid="
	MapAddress2 := "&boardtype=L&menuid=22"
	Address = %MapAddress1%%articlid%%MapAddress2%
	
	URL = %Address%
	getlog("�� �Խñ� url : ",URL)
	
	http_el:=ReadURL(URL)
	RegExMatch(http_el,"file_name\C>(.*?)</span",regx)  ; \C�� " �� ����
	mapname = %regx1%
	
	http_el:=ReadURL(URL)
	
	RegExMatch(http_el,"https://cafeattach.naver.net(.*?)attachment",regx)
	map_url = %regx1%
	MapAddress1 := "https://cafeattach.naver.net"
	MapAddress2 := "attachment"
	Address = %MapAddress1%%map_url%%MapAddress2%
	
	URLDownloadToFile, %Address%, %war_map_path%\%mapname%
	;getlog("�� �ٿ� : ",s)
	
	if (ErrorLevel){
		MsgBox, �ٿ�ε� ����. `n ������ �������� �����ϼ���.
		getlog2("�ֽ� �� �ٿ� : ","Fail")
	}else{
		MsgBox, %mapname% �ٿ� �Ϸ�
		getlog2("�ֽ� �� �ٿ� : ","Success")
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