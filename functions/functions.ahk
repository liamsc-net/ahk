#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force
#WinActivateForce
GroupAdd, ExplorerGroup, ahk_class #32770 ;This is for all the Explorer-based "save" and "load" boxes, from any program!

; tippytool is like tooltip, but it ends (Gist: https://gist.github.com/Liam-s-c/d1de6a8df7369eaed4f13e2967b76bac)

; tippytool needs 1 argument, info and can accept 1 more, wait. the wait argument/variable is set to a default value of 333ms (ms from the built in AHK function Sleep)
tippytool(info, wait:=333){
    ; ToolTipFont and Color from: https://www.autohotkey.com/boards/viewtopic.php?t=4777
    ToolTipFont("s12.5", "Comic Sans MS")
    ToolTipColor("Black", "FECB00")
    ; The Above 2 lines were not written by me, check out the code here: https://liamsc.net/76
    ; make a tooltip, with the arg. info we passed in earlier, then the key then [-★-> 2nd Keyboard <-★-] for noticability
    ; NOTE!!!!! (the stars wont work if you don't save this file as UTF-8 with BOM) !!!!NOTE
	tooltip, %info% %A_thishotKey% [-★-> 2nd Keyboard <-★-]
    ; switch icon in tray to a gold star
    Menu, Tray, Icon, shell32.dll, 318
    ; Pause for default: 333, or user defined when passing the arg wait into the function
	Sleep, %wait%
	tooltip,
    ; switch icon in tray back to a keyboard 
    Menu, Tray, Icon, shell32.dll, 174 
	return
}

; openApp AutoHotKey Function (Gist: https://gist.github.com/Liam-s-c/6887263c6f06b19f9950a3b9bd6ab804)
  
; openApp needs 2 Arguments (theID & theEXE)
openApp(theID,theEXE){
    ; if the Process ID's window doesn't exist then run the exe to open the Process ID's window
    if not WinExist("ahk_pid" theID)
        run, %theEXE%
    ; if the Process Id's window does exist then Activate said window
    if WinExist("ahk_pid" theID)
        WinActivate, ahk_pid %theID%
    ; return
    return
}

; Strip Quotes from variable
StripQuotes(haystack){
    return RegexReplace(haystack, "(\D)[""|']", "$1")
}

; THE BELOW FUNCTIONS ARE SPECIFIC TO AN APPLICATION WHILST THE ABOVE ONES CAN BE USED FOR ANYTHING


; Below functions are specifically for spotify

Spotify_Pause()
{
    DetectHiddenWindows, On
    WinActivate, ahk_exe C:\Users\thega\AppData\Roaming\Spotify\Spotify.exe
    SendEvent, {Space}
    return
}

Spotify_Previous_Track(){
    DetectHiddenWindows, On
    WinActivate, ahk_exe C:\Users\thega\AppData\Roaming\Spotify\Spotify.exe
    Sleep, 500
    SendEvent, {Media_Prev}
    SendEvent, {Media_Prev}
    return
}

Spotify_Skip_Track(){
    DetectHiddenWindows, On
    WinActivate, ahk_exe C:\Users\thega\AppData\Roaming\Spotify\Spotify.exe
    SendEvent, {Media_Next}
    return
}

Spotify_Repeat(){
    DetectHiddenWindows, On
    WinActivate, ahk_exe C:\Users\thega\AppData\Roaming\Spotify\Spotify.exe
    SendEvent, ^{r}
    return
}


Spotify_Repeat_1(){
    DetectHiddenWindows, On
    WinActivate, ahk_exe C:\Users\thega\AppData\Roaming\Spotify\Spotify.exe
    PixelGetColor, color, 565, 983
    if (color == "0x36681A")
    {
        SendEvent, ^{r}
        sleep 100
        SendEvent, ^{r}
        return
    }
    else if (color == "0x181818")
    {
        WinActivate, ahk_exe C:\Users\thega\AppData\Roaming\Spotify\Spotify.exe
        PixelGetColor, color2, 560, 1004
        if (color2 == "0x54B91D"){
            SendEvent, ^{r}
        }
        else if (color2 == "0x181818") {
            SendEvent, ^{r}
            sleep 100
            SendEvent, ^{r}
        }
    }
    return
}

Spotify_Shuffle(){
    DetectHiddenWindows, On
    WinActivate, ahk_exe C:\Users\thega\AppData\Roaming\Spotify\Spotify.exe
    SendEvent, ^{s}
    return
}

Spotify_VolDown(){
    DetectHiddenWindows, On
    WinActivate, ahk_exe C:\Users\thega\AppData\Roaming\Spotify\Spotify.exe
    SendEvent, ^{Down}
    SendEvent, ^{Down}
    return
}

Spotify_VolUp(){
    DetectHiddenWindows, On
    WinActivate, ahk_exe C:\Users\thega\AppData\Roaming\Spotify\Spotify.exe
    SendEvent, ^{Up}
    SendEvent, ^{Up}
    return
}

; end of the spotify functions
; the below functions are specific to windows (In the case of first row, multimedia)

Windows_VolDown(){
    SendEvent, {Volume_Down}
    SendEvent, {Volume_Down}
    return
}

Windows_VolUp(){
    SendEvent, {Volume_Up}
    SendEvent, {Volume_Up}
    return
}

; end of windows multimedia functions
; the below functions are specific to discord (not just exclusive to first row)

Discord_Mute(){
    Send, ^!+m
}

Discord_Deafen(){
    Send, ^!+d
}

Discord_Show_Call(){
    WinActivate, ahk_exe Discord.exe
    Send, ^!+v
}

; the below function(s) ar specific to chrome (not just exclusive to the second row)

; urlShortener AutoHotKey Function, shortener the copied link using my database, it'll copy the shortened link to your clipboard and close the webpage right after
; (Gist: https://gist.github.com/Liam-s-c/d7292aca415635e992418e948383ea20)

; urlShortener needs 0 passed arguemnts.

urlShortener(){
    run, https://www.liamsc.net/60
    sleep, 2000
    Send, ^a
    Send, ^v
    Send, {tab}
    Send, {tab}
    Send, {tab}
    Send, {tab}
    Send, {tab}
    Send, {tab}
    Send, {tab}
    Send, {enter}
    sleep, 300
    Send, ^l
    sleep, 1000
    Send, {Right}
    Send, ^+{Left}
    Send, ^c
    Send, ^a
    Send, https://liamsc.net/
    Send, ^v
    Send, ^a
    Send, ^c 
    Send, {escape}
    Send, {Right}
    Send, {enter}
    sleep, 300
    Send, ^w
    return
}

loopChrome(){
WinGet, list, List, ahk_exe Chrome.exe
Loop %list% {
	hwnd := list%A_Index%	; handles are in variables list1, list2, list3 etc. up to list%list%
   	WinActivate, ahk_id %hwnd%
	WinGetTitle, WLName, ahk_id %hwnd%;
	if(!InStr(WLName, "Hangouts")>0)
	Loop, 20 { ; max number of tabs
		SetTitleMatchMode, 2
		WinGetTitle, WLName, ahk_id %hwnd% ;
   		if(InStr(WLName, "break")>0 || InStr(WLName, "world") || InStr(WLName, "craigslist")){
      			send ^w
      		}
   	Send {Ctrl Down}{Tab}{Ctrl Up}
   	Sleep, 150
	}
}
}

; these functions are specific to vscode

stageAndPublish(){
    openApp(15504, "C:\Users\thega\AppData\Local\Programs\Microsoft VS Code\Code.exe")
    send, ^+p
    send, Stage all changes
    send, {enter}
    sleep, 350
    send, ^+p
    send, commit staged 
    send, {enter}
}

addCursorsToEndOfLines(){
    openApp(15504, "C:\Users\thega\AppData\Local\Programs\Microsoft VS Code\Code.exe")
    send, ^+p 
    send, add cursors to line ends
    send, {enter}
}

showGitGraph(){
    openApp(15504, "C:\Users\thega\AppData\Local\Programs\Microsoft VS Code\Code.exe")
    send, ^+p 
    send, view git graph
    send, {enter}
}

showChanges(){
    openApp(15504, "C:\Users\thega\AppData\Local\Programs\Microsoft VS Code\Code.exe")
    send, ^k 
    sleep, 100
    send, ^+o
}

; end of vscode functions 

; these functions are expessially about sublime text









; 
; Most of the scripts below are not written by me
;; Most of them are stolen from the internet, but are edited by me
;;; i'll try my best to link it inside or above the function.
;; Most of them are taken from https://autohotkey.com/boards
; So please be wary, these might be broken, or never used
;

; this has been modified from https://www.autohotkey.com/board/topic/598-google-the-clipboard-content/
clipboardSearch(){
AutoTrim, On
   searchTerm = %clipboard%
   If searchTerm =
   {
      MsgBox, 48, Search Internet, No text in clipboard to search., 2
      Return
   }
   C_BROWSER="C:\Program Files\Google\Chrome\Application\chrome.exe" ;replace that with the browser of your choice
   linkStart=http://www.google.com/search?complete=1&hl=en&q=
   linkEnd=&btnG=Google+Search
   searchTerm := RegExReplace(searchTerm, "[\s&]+", "+")
   searchTerm = %linkStart%%searchTerm%%linkEnd%
   SetTitleMatchMode,2 ;A window's title can contain WinTitle anywhere inside it to be a match.
   ; These are the four options of windows - add your own and copy&paste accordingly
   wintitle1 := "Google - Google Chrome ahk_class Chrome_WidgetWin_1"
   wintitle2 := "Google Search - Google Chrome ahk_class Chrome_WidgetWin_1"
   wintitle3 := "Google - Google Chrome ahk_class Chrome_WidgetWin_1"
   wintitle4 := "Google Search - Google Chrome ahk_class Chrome_WidgetWin_1"
   Loop, 4 {
      wintitle := wintitle%a_index%
      ifWinExist, %wintitle%
      {
         SetKeyDelay, -1
         WinActivate
         BlockInput, On
         SendInput, !d
         SendRaw, %searchTerm%
         SendInput, {enter}
         BlockInput, Off
         Return
      }
   }
Run, %C_BROWSER% "%searchTerm%"
}



InstantExplorer(f_path,pleasePrepend := 0)
{
;this has been heavily modified from https://autohotkey.com/docs/scripts/FavoriteFolders.htm

;I feel ambivilant about this line. It'll be more stable, but it'll be a bit sloooowerrrr!
keywait, %A_priorhotkey% ;should there be a timeout clause? this still works even when launched with no hotkey, hmm.

sendinput, {blind}{SC0E8} ;scan code of an unassigned key. This is needed to prevent the item from merely FLASHING on the task bar, rather than opening the folder. Don't ask me why, but this works. Also, this is helpful for debugging.

instantExplorerTryAgain:

if !FileExist(f_path)
{
	;MsgBox,,, %f_path%`nNo such path exists`, but we will go down in folders until it does.,1.0
	
	if InStr(f_path, "\"){
	
		FoundPos := InStr(f_path, "\", , StartingPos := 0, Occurrence := 1)
		;msgbox % FoundPos
		
		Length := StrLen(f_path)
		
		;StringLeft, OutputVar, InputVar, Count
		
		trimThis := Length - FoundPos
		
		;msgbox % trimThis
		
		NewString := SubStr(f_path, 1, FoundPos-1)
		;msgbox, NewString is %NewString%
		f_path := NewString
		GOTO, instantExplorerTryAgain
		;oh my god this code is so sloppy, it's great. And this is like, one of my best ever functions. I'm not even kidding. I use it like 20x an hour.
	}
	else
	{
		MsgBox,,, %f_path%`n`nNo such path exists.,1.0
		GOTO, instantExplorerEnd
		
	}
}

f_path = %f_path%\ ;;THIS ADDS A \ AT THE VERY END OF THE FILE PATH, FOR THE SAKE OF OLD-STYLE SAVE AS DIALOUGE BOXES WHICH REQUIRE THEM IN ORDER TO UPDATE THE FOLDER PATH WHEN IT IS INSERTED INTO Edit1.

;msgbox, f_path is currently %f_path% ;just debugging as usual

f_path := """" . f_path . """" ;this adds quotation marks around everything so that it works as a string, not a variable. 

;but also, the old style still dopesn't like the quotation marks, and I'm not sure how to detect it since i know almost nothing about it. ho hum. But it does have ClassNN:	SysListView321 which MAYBE i could use with this code https://autohotkey.com/board/topic/9362-detect-opensave-dialog/ but i dont know. saving this for later.

;msgbox, f_path is now finally %f_path%

;SoundBeep, 900, 400 ;this is dumb because you cant change the volume, or tell it NOT to wait while the sound plays...

; These first few variables are set here and used by f_OpenFavorite:
WinGet, f_window_id, ID, A
WinGetClass, f_class, ahk_id %f_window_id%
WinGetTitle, f_title, ahk_id %f_window_id% ;to be used later to see if this is the export dialouge window in Premiere...
if f_class in #32770,ExploreWClass,CabinetWClass  ; if the window class is a save/load dialog, or an Explorer window of either kind.
	ControlGetPos, f_Edit1Pos, f_Edit1PosY,,, Edit1, ahk_id %f_window_id%


	;edit2
/*
if f_AlwaysShowMenu = n  ; The menu should be shown only selectively.
{
	if f_class in #32770,ExploreWClass,CabinetWClass  ; Dialog or Explorer.
	{
		if f_Edit1Pos =  ; The control doesn't exist, so don't display the menu
			return
	}
	else if f_class <> ConsoleWindowClass
		return ; Since it's some other window type, don't display menu.
}
; Otherwise, the menu should be presented for this type of window:
;Menu, Favorites, show
*/

;msgbox, A_ThisMenuItemPos %A_ThisMenuItemPos%
;msgbox, A_ThisMenuItem %A_ThisMenuItem%
;msgbox, A_ThisMenu %A_ThisMenu%

;;StringTrimLeft, f_path, f_path%A_ThisMenuItemPos%, 0
; msgbox, f_path: %f_path%`n f_class:  %f_class%`n f_Edit1Pos:  %f_Edit1Pos%

; f_OpenFavorite:
;msgbox, BEFORE:`n f_path: %f_path%`n f_class:  %f_class%`n f_Edit1Pos:  %f_Edit1Pos%

; Fetch the array element that corresponds to the selected menu item:
;;StringTrimLeft, f_path, f_path%A_ThisMenuItemPos%, 0
if f_path =
	return

if f_class = EVERYTHING    ; It's Everything search. I want to put the fodler name in quotes in the main field, because that's how you search a subdirectory.
{
ControlGetPos, f_Edit1Pos, f_Edit1PosY,,, Edit1, ahk_id %f_window_id%
;msgbox, this is Everything search`nf_Edit1Pos = %f_Edit1Pos%

if f_Edit1Pos <>   ; we know it should have an Edit1 control.
	{
	ControlFocus, Edit1, ahk_id %f_window_id%
	
	WinActivate ahk_id %f_window_id%
	
	f_path := f_path . " " ;this adds a space to the end, so i can type the actual thing to search for afterwards.

	ControlSetText, Edit1, %f_path%, ahk_id %f_window_id%
	;(it adds a space to the end too.)
	sleep 2
	ControlFocus, DirectUIHWND2, ahk_id %f_window_id% ;to try to get the focus back into the center area, so you can now type letters and have it go to a file or fodler, rather than try to SEARCH or try to change the FILE NAME by default.
	send, {end} ;to get to the end of the search box. best place to search for the actual thing i want to find.
	return
	}

GOTO, instantExplorerEnd 
}



if f_class = #32770    ; It's a dialog.
	{

	if WinActive("ahk_exe waifu2x-caffe.exe")
		{
		tooltip, you are inside of Waifu2x
		
		GOTO, ending2
		;this will open an explorer window rather than trying to change waifu2x's input path as it otherwise would.
		}
	
	if WinActive("ahk_exe Adobe Premiere Pro.exe")
		{
		tooltip, you are inside of premiere
		
		if (f_title = "Export Settings") or if (f_title = "Link Media")
			{
			msgbox,,,you are in Premiere's export window or link media window, but NOT in the "Save as" inside of THAT window. no bueno, 1
			GOTO, instantExplorerEnd 
			;return ;no, I don't want to return because i still want to open an explorer window.
			}
		
		
		If InStr(f_title, "Link Media to") ;Note that you must have "use media browser to locate files" UNCHECKED because it is GARBAGE.
			{
			tooltip, you are inside Premieres relinker.
			; This requires custom code, because the EditX boxes are different:
			; last path   = Edit1
			; filename    = Edit2
			; address bar = Edit3

			ControlFocus, Edit2, ahk_id %f_window_id% 

			tooltip, you are inside the link media thingy
			sleep 1
			
			WinActivate ahk_id %f_window_id%
			sleep 1
			ControlGetText, f_text, Edit2, ahk_id %f_window_id%
			sleep 1
			ControlSetText, Edit2, %f_path%, ahk_id %f_window_id%
			ControlSend, Edit2, +{Enter}, ahk_id %f_window_id%
			Sleep, 100  ; It needs extra time on some dialogs or in some cases.
			ControlSetText, Edit2, %f_text%, ahk_id %f_window_id%
			;msgbox, AFTER:`n f_path: %f_path%`n f_class:  %f_class%`n f_Edit1Pos:  %f_Edit1Pos%
			
			tooltip,
			return		
			}

		if (f_title = "Save As") or if (f_title = "Save Project")
			{
			;;;ControlGetPos, f_Edit1Pos, f_Edit1PosY,,, Edit1, ahk_id %f_window_id%
			;ControlFocus, Edit2, ahk_id %f_window_id% ;we know that Edit2 is the address bar in this case. So there's no need to use Edit1 and then swap back in the filename.
			
			ControlFocus, Edit1, ahk_id %f_window_id% 
			;msgbox,,,you are hereee,0.5
			tooltip, you are here
			sleep 1
			;tippy2("DIALOUGE WITH PREMIERE'S Edit1`n`nLE controlfocus of Edit1 for f_window_id was just engaged.", 2000)
			; msgbox, is it in focus?
			; MouseMove, f_Edit1Pos, f_Edit1PosY, 0
			; sleep 10
			; click
			; sleep 10
			; msgbox, how about now? x%f_Edit1Pos% y%f_Edit1PosY%
			;msgbox, Edit1 has been clicked maybe
			
			; Activate the window so that if the user is middle-clicking
			; outside the dialog, subsequent clicks will also work:
			WinActivate ahk_id %f_window_id%
			; Retrieve any filename that might already be in the field so
			; that it can be restored after the switch to the new folder:
			ControlGetText, f_text, Edit1, ahk_id %f_window_id%
			sleep 1
			ControlSetText, Edit1, %f_path%, ahk_id %f_window_id%
			ControlSend, Edit1, +{Enter}, ahk_id %f_window_id%
			Sleep, 100  ; It needs extra time on some dialogs or in some cases.
			ControlSetText, Edit1, %f_text%, ahk_id %f_window_id%
			;msgbox, AFTER:`n f_path: %f_path%`n f_class:  %f_class%`n f_Edit1Pos:  %f_Edit1Pos%
			
			tooltip,
			return
			tooltip, do you make it this far
			tooltip, the answer is no. the RETURN ends it properly
			GOTO, instantExplorerEnd 
			;But i have the GOTO just in case, hahahaha
			}
		}

	; stuff beyond here is NOT in premiere
	if f_Edit1Pos <>   ; And it has an Edit1 control.
		{

		ControlFocus, Edit1, ahk_id %f_window_id% ;this is really important.... it doesn't work if you don't do this...
		;tippy2("DIALOUGE WITH EDIT1`n`nwait really?`n`nLE controlfocus of edit1 for f_window_id was just engaged.", 1000)
		; msgbox, is it in focus?
		; MouseMove, f_Edit1Pos, f_Edit1PosY, 0
		; sleep 10
		; click
		; sleep 10
		; msgbox, how about now? x%f_Edit1Pos% y%f_Edit1PosY%
		;msgbox, edit1 has been clicked maybe
		
		; Activate the window so that if the user is middle-clicking
		; outside the dialog, subsequent clicks will also work:
		WinActivate ahk_id %f_window_id%
		
		; Retrieve any filename that might already be in the field so
		; that it can be restored after the switch to the new folder:
		ControlGetText, f_text, Edit1, ahk_id %f_window_id%
		sleep 2
		ControlSetText, Edit1, %f_path%, ahk_id %f_window_id%
		sleep 3
		ControlSend, Edit1, {Enter}, ahk_id %f_window_id%
		Sleep, 100  ; It needs extra time on some dialogs or in some cases.
		
		;now RESTORE the filename in that text field. I don't like doing it this way...
		ControlSetText, Edit1, %f_text%, ahk_id %f_window_id%
		;msgbox, AFTER:`n f_path: %f_path%`n f_class:  %f_class%`n f_Edit1Pos:  %f_Edit1Pos%
		sleep 2
		ControlFocus, DirectUIHWND2, ahk_id %f_window_id% ;to try to get the focus back into the center area, so you can now type letters and have it go to a file or fodler, rather than try to SEARCH or try to change the FILE NAME by default.
		return
		}
	; else fall through to the bottom of the subroutine to take standard action.
	}

;for some reason, the following code just doesn't work well at all.
/*
else if f_class in ExploreWClass,CabinetWClass  ; In Explorer, switch folders.
{
	tooltip, f_class is %f_class% and f_window_ID is %f_window_id%
	if f_Edit1Pos <>   ; And it has an Edit1 control.
	{
		Tippy2("EXPLORER WITH EDIT1 only 2 lines of code here....", 1000)
		ControlSetText, Edit1, %f_path%, ahk_id %f_window_id%
		msgbox, ControlSetText happened. `nf_class is %f_class% and f_window_ID is %f_window_id%`nAND f_Edit1Pos is %f_Edit1Pos%
		; Tekl reported the following: "If I want to change to Folder L:\folder
		; then the addressbar shows http://www.L:\folder.com. To solve this,
		; I added a {right} before {Enter}":
		ControlSend, Edit1, {Right}{Enter}, ahk_id %f_window_id%
		return
	}
	; else fall through to the bottom of the subroutine to take standard action.
}
*/

else if f_class = ConsoleWindowClass ; In a console window, CD to that directory
	{
	WinActivate, ahk_id %f_window_id% ; Because sometimes the mclick deactivates it.
	SetKeyDelay, 0  ; This will be in effect only for the duration of this thread.
	IfInString, f_path, :  ; It contains a drive letter
		{
		StringLeft, f_path_drive, f_path, 1
		Send %f_path_drive%:{enter}
		}
	Send, cd %f_path%{Enter}
	return
	}
ending2:
; Since the above didn't return, one of the following is true:
; 1) It's an unsupported window type but f_AlwaysShowMenu is y (yes).
; 2) It's a supported type but it lacks an Edit1 control to facilitate the custom
;    action, so instead do the default action below.
;Tippy2("end was reached.",333)
;SoundBeep, 800, 300 ;this is nice but the whole damn script WAITS for the sound to finish before it continues...
; Run, Explorer %f_path%  ; Might work on more systems without double quotes.

;msgbox, f_path is %f_path%

; SplitPath, f_path, , OutDir, , ,
; var := InStr(FileExist(OutDir), "D")

; if (var = 0)
	; msgbox, directory does not exist
; else if var = 1
	Run, %f_path%  ; I got rid of the "Explorer" part because it caused redundant windows to be opened, rather than just switching to the existing window
;else
;	msgbox,,,Directory does not exist,1

instantExplorerEnd:
tooltip,
}
;end of instantexplorer()

JEE_ExpWinGetObj(hWnd)
{
	for oWin in ComObjCreate("Shell.Application").Windows
		if (oWin.HWND == hWnd)
			break
	return oWin
}

;========== I, liam, DID NOT WRITE THIS CODE, AND POSSIBLY DON'T USE IT ============

;e.g. JEE_ExpGetInterfaces(oWin, isp, isb, isv, ifv2, icm)
;e.g. isp := isb := isv := ifv2 := icm := ""
JEE_ExpGetInterfaces(oWin, ByRef isp="", ByRef isb="", ByRef isv="", ByRef ifv2="", ByRef icm="")
{
	isp := ComObjQuery(oWin, "{6d5140c1-7436-11ce-8034-00aa006009fa}")
	, isb := ComObjQuery(isp, "{4C96BE40-915C-11CF-99D3-00AA004AE837}", "{000214E2-0000-0000-C000-000000000046}")
	if (DllCall(NumGet(NumGet(isb+0)+15*A_PtrSize), Ptr,isb, PtrP,isv) < 0) ;QueryActiveShellView
		return
	ifv2 := ComObjQuery(isv, "{1af3a467-214f-4298-908e-06b03e0b39f9}")
	icm := ComObjQuery(ifv2, "{d8ec27bb-3f3b-4042-b10a-4acfd924d453}")
}

;========== I, liam, DID NOT WRITE THIS CODE, AND POSSIBLY DON'T USE IT ============

;custom abbreviation to canonical property name
JEE_ExpColAbbrevToName(vList, vDelim="`n")
{
	oArray := {nam:"System.ItemNameDisplay"
	,siz:"System.Size"
	,typ:"System.ItemTypeText"
	,mod:"System.DateModified"
	,cre:"System.DateCreated"
	,acc:"System.DateAccessed"
	,dat:"System.ItemDate"
	,dur:"System.Calendar.Duration"
	,dim:"System.Image.Dimensions"
	,len:"System.Media.Duration"}

	vOutput := ""
	Loop, Parse, vList, % vDelim
		vOutput .= ((A_Index = 1) ? "" : vDelim) oArray[A_LoopField]
	return vOutput
}

;==================================================

;IColumnManager interface (Windows)
;https://msdn.microsoft.com/en-us/library/windows/desktop/bb776149(v=vs.85).aspx
;methods (8): C:\Program Files (x86)\Windows Kits\8.1\Include\um\ShObjIdl.h

;========== I, liam, DID NOT WRITE THIS CODE, AND POSSIBLY DON'T USE IT ============

JEE_ICMGetColumnCount(icm, vMode="")
{
	vFlags := InStr(vMode, "a") ? 0x1 : 0x2
	;CM_ENUM_VISIBLE := 0x2 ;CM_ENUM_ALL := 0x1
	DllCall(NumGet(NumGet(icm+0)+5*A_PtrSize), Ptr,icm, UInt,vFlags, UIntP,vCountCol) ;GetColumnCount
	return vCountCol
}

;========== I, liam, DID NOT WRITE THIS CODE, AND POSSIBLY DON'T USE IT ============

;mode: n (get name), c (get CLSID and property identifier), a (get all)
JEE_ICMGetColumns(icm, vSep="`n", vMode="n")
{
	vFlags := InStr(vMode, "a") ? 0x1 : 0x2
	DllCall(NumGet(NumGet(icm+0)+5*A_PtrSize), Ptr,icm, UInt,vFlags, UIntP,vCountCol) ;GetColumnCount
	vOutput := ""
	VarSetCapacity(vOutput, vCountCol*100*2)
	vOutput := ""
	;CM_ENUM_VISIBLE := 0x2 ;CM_ENUM_ALL := 0x1
	vArrayPROPERTYKEY := ""
	VarSetCapacity(vArrayPROPERTYKEY, vCountCol*20, 0)
	DllCall(NumGet(NumGet(icm+0)+6*A_PtrSize), Ptr,icm, UInt,vFlags, Ptr,&vArrayPROPERTYKEY, UInt,vCountCol) ;GetColumns
	Loop, % vCountCol
	{
		vOffset := (A_Index-1)*20
		if InStr(vMode, "c")
		{
			DllCall("ole32\StringFromCLSID", Ptr,&vArrayPROPERTYKEY+vOffset, PtrP,vAddrCLSID)
			vCLSID := StrGet(vAddrCLSID, "UTF-16")
			vNum := NumGet(vArrayPROPERTYKEY, vOffset+16, "UInt")
			vOutput .= vCLSID " " vNum
		}
		if InStr(vMode, "n")
		{
			if InStr(vMode, "c")
				vOutput .= "`t"
			DllCall("propsys\PSGetNameFromPropertyKey", Ptr,&vArrayPROPERTYKEY+vOffset, PtrP,vAddrName)
			vName := StrGet(vAddrName, "UTF-16")
			vOutput .= vName
		}
		vOutput .= vSep
	}
	vOutput := SubStr(vOutput, 1, -StrLen(vSep))
	return vOutput
}

;========== I, liam, DID NOT WRITE THIS CODE, AND POSSIBLY DON'T USE IT ============

JEE_ICMSetColumns(icm, vList, vSep="`n")
{
	DllCall(NumGet(NumGet(icm+0)+5*A_PtrSize), Ptr,icm, UInt,vFlags, UIntP,vCountCol) ;GetColumnCount
	vList := StrReplace(vList, vSep, vSep, vCountCol)
	vCountCol++
	vArrayPROPERTYKEY := ""
	VarSetCapacity(vArrayPROPERTYKEY, vCountCol*20, 0)
	Loop, Parse, vList, % vSep
	{
		vOffset := (A_Index-1)*20
		DllCall("propsys\PSGetPropertyKeyFromName", Str,A_LoopField, Ptr,&vArrayPROPERTYKEY+vOffset)
	}
	DllCall(NumGet(NumGet(icm+0)+7*A_PtrSize), Ptr,icm, Ptr,&vArrayPROPERTYKEY, UInt,vCountCol) ;SetColumns
	return
}

;========== I, liam, DID NOT WRITE THIS CODE, AND POSSIBLY DON'T USE IT ============

;not working (error 0x8000FFFF)
;is 'ideal' width, the autosize width?
JEE_ICMGetColumnWidth(icm, vName, ByRef vWidthIdeal="")
{
	VarSetCapacity(PROPERTYKEY, 20, 0)
	DllCall("propsys\PSGetPropertyKeyFromName", Ptr,&vName, Ptr,&PROPERTYKEY)
	VarSetCapacity(CM_COLUMNINFO, 184, 0)
	NumPut(184, CM_COLUMNINFO, 0, "UInt") ;cbSize
	;CM_MASK_WIDTH := 0x1 ;CM_MASK_IDEALWIDTH := 0x4
	NumPut(0x5, CM_COLUMNINFO, 4, "UInt") ;dwMask
	DllCall(NumGet(NumGet(icm+0)+4*A_PtrSize), Ptr,icm, Ptr,&PROPERTYKEY, Ptr,&CM_COLUMNINFO) ;GetColumnInfo
	vWidthIdeal := NumGet(CM_COLUMNINFO, 20, "UInt") ;uIdealWidth
	return NumGet(CM_COLUMNINFO, 12, "UInt") ;uWidth
}

;========== I, liam, DID NOT WRITE THIS CODE, AND POSSIBLY DON'T USE IT ============

JEE_ICMSetColumnWidth(icm, vName, vWidth)
{
	VarSetCapacity(PROPERTYKEY, 20, 0)
	DllCall("propsys\PSGetPropertyKeyFromName", Ptr,&vName, Ptr,&PROPERTYKEY)
	VarSetCapacity(CM_COLUMNINFO, 184, 0)
	NumPut(184, CM_COLUMNINFO, 0, "UInt") ;cbSize
	;CM_MASK_WIDTH := 0x1
	NumPut(0x1, CM_COLUMNINFO, 4, "UInt") ;dwMask
	NumPut(vWidth, CM_COLUMNINFO, 12, "UInt") ;dwMask
	DllCall(NumGet(NumGet(icm+0)+3*A_PtrSize), Ptr,icm, Ptr,&PROPERTYKEY, Ptr,&CM_COLUMNINFO) ;SetColumnInfo
}

;==================================================

;IFolderView2 interface (Windows)
;https://msdn.microsoft.com/en-us/library/windows/desktop/bb775541(v=vs.85).aspx
;methods (42): C:\Program Files (x86)\Windows Kits\8.1\Include\um\ShObjIdl.h

;========== I, liam, DID NOT WRITE THIS CODE, AND POSSIBLY DON'T USE IT ============

JEE_IFV2GetSortColumnCount(ifv2)
{
	DllCall(NumGet(NumGet(ifv2+0)+26*A_PtrSize), Ptr,ifv2, IntP,vCountCol) ;GetSortColumnCount
	return vCountCol
}

;========== I, liam, DID NOT WRITE THIS CODE, AND POSSIBLY DON'T USE IT ============

JEE_IFV2GetSortColumns(ifv2, vSep="`n", vMode="n")
{
	DllCall(NumGet(NumGet(ifv2+0)+26*A_PtrSize), Ptr,ifv2, IntP,vCountCol) ;GetSortColumnCount
	vOutput := ""
	vArraySORTCOLUMN := ""
	VarSetCapacity(vArraySORTCOLUMN, vCountCol*24, 0)
	DllCall(NumGet(NumGet(ifv2+0)+28*A_PtrSize), Ptr,ifv2, Ptr,&vArraySORTCOLUMN, Int,vCountCol) ;GetSortColumns
	Loop, % vCountCol
	{
		vOffset := (A_Index-1)*24
		if (vMode = "n")
		{
			DllCall("propsys\PSGetNameFromPropertyKey", Ptr,&vArraySORTCOLUMN+vOffset, PtrP,vAddrName)
			vName := StrGet(vAddrName, "UTF-16")
			;SORT_ASCENDING := 1 ;SORT_DESCENDING := -1
			vDirection := NumGet(vArraySORTCOLUMN, vOffset+20, "Int")
			vOutput .= vName " " vDirection vSep
		}
		else if (vMode = "c")
		{
			DllCall("ole32\StringFromCLSID", Ptr,&vArraySORTCOLUMN+vOffset, PtrP,vAddrCLSID)
			vCLSID := StrGet(vAddrCLSID, "UTF-16")
			vNum := NumGet(vArraySORTCOLUMN, vOffset+16, "UInt")
			vDirection := NumGet(vArraySORTCOLUMN, vOffset+20, "Int")
			vOutput .= vCLSID " " vNum " " vDirection vSep
		}
	}
	vOutput := SubStr(vOutput, 1, -StrLen(vSep))
	return vOutput
}

 

JEE_IFV2SetSortColumns(ifv2, vList, vSep="`n")
{
	vList := StrReplace(vList, vSep, vSep, vCountCol)
	vCountCol++
	vArraySORTCOLUMN := ""
	VarSetCapacity(vArraySORTCOLUMN, vCountCol*24, 0)
	Loop, Parse, vList, % vSep
	{
		vOffset := (A_Index-1)*24
		vPos := InStr(A_LoopField, " ", 0, -1)
		vName := SubStr(A_LoopField, 1, vPos-1)
		vDirection := SubStr(A_LoopField, vPos+1)
		DllCall("propsys\PSGetPropertyKeyFromName", Str,vName, Ptr,&vArraySORTCOLUMN+vOffset)
		;SORT_ASCENDING := 1 ;SORT_DESCENDING := -1
		NumPut(vDirection, vArraySORTCOLUMN, vOffset+20, "Int")
	}
	DllCall(NumGet(NumGet(ifv2+0)+27*A_PtrSize), Ptr,ifv2, Ptr,&vArraySORTCOLUMN, Int,vCountCol) ;SetSortColumns
}


sortByDate()
{
	WinGet, hWnd, ID, A
	oWin := JEE_ExpWinGetObj(hWnd)
	JEE_ExpGetInterfaces(oWin, isp, isb, isv, ifv2, icm)
	;above must load up the complex structures with black magic
	;clipboard:=JEE_IFV2GetSortColumns(ifv2)
	;System.DateModified -1
	;System.DateModified 1
	;;if RegExMatch(JEE_IFV2GetSortColumns(ifv2),"System.DateModified ?:-1")
	;regexesllwork but not straightforward
	curCol:=JEE_IFV2GetSortColumns(ifv2)
	;dont call it twice - maybe you wouldnt need to but im not seeing a superb way to avoid it below
	if InStr(curCol,"System.DateModified")
	{
		;test if it is ascending or descending and let's flip 'em
		If InStr(curCol,"-")
		{
			vList := "System.DateModified 1" 
		}
		;no alternate cases right?
		else {
			vList := "System.DateModified 1" 
		}
	}
	;no alternate cases right?
	else {
		vList := "System.DateModified 1"
	}
	JEE_IFV2SetSortColumns(ifv2, vList)
	isp := isb := isv := ifv2 := icm := ""
}

sortByDateOLD()
{
	WinGet, hWnd, ID, A
	oWin := JEE_ExpWinGetObj(hWnd)
	JEE_ExpGetInterfaces(oWin, isp, isb, isv, ifv2, icm)
	;above must load up the complex structures with black magic
	;clipboard:=JEE_IFV2GetSortColumns(ifv2)
	;System.DateModified -1
	;System.DateModified 1
	;;if RegExMatch(JEE_IFV2GetSortColumns(ifv2),"System.DateModified ?:-1")
	;regexesllwork but not straightforward
	curCol:=JEE_IFV2GetSortColumns(ifv2)
	;dont call it twice - maybe you wouldnt need to but im not seeing a superb way to avoid it below
	if InStr(curCol,"System.DateModified")
	{
		;test if it is ascending or descending and let's flip 'em
		If InStr(curCol,"-")
		{
			vList := "System.DateModified 1" ;Date modified ascending
		}
		;no alternate cases right?
		else {
			vList := "System.DateModified -1" ;Date modified descending
		}
	}
	;no alternate cases right?
	else {
		vList := "System.DateModified -1" ;Date modified descending should be default in my humble
	}
	JEE_IFV2SetSortColumns(ifv2, vList)
	isp := isb := isv := ifv2 := icm := ""
}

sortByDateDescending()
{
	WinGet, hWnd, ID, A
	oWin := JEE_ExpWinGetObj(hWnd)
	JEE_ExpGetInterfaces(oWin, isp, isb, isv, ifv2, icm)
	;above must load up the complex structures with black magic
	;clipboard:=JEE_IFV2GetSortColumns(ifv2)
	;System.DateModified -1
	;System.DateModified 1
	;;if RegExMatch(JEE_IFV2GetSortColumns(ifv2),"System.DateModified ?:-1")
	;regexesllwork but not straightforward
	curCol:=JEE_IFV2GetSortColumns(ifv2)
	;dont call it twice - maybe you wouldnt need to but im not seeing a superb way to avoid it below
	
	vList := "System.DateModified -1" ;Date modified descending 
	
	JEE_IFV2SetSortColumns(ifv2, vList)
	isp := isb := isv := ifv2 := icm := ""
}

sortByType()
{
	WinGet, hWnd, ID, A
	oWin := JEE_ExpWinGetObj(hWnd)
	JEE_ExpGetInterfaces(oWin, isp, isb, isv, ifv2, icm)
	curCol:=JEE_IFV2GetSortColumns(ifv2)
	if InStr(curCol,"System.ItemTypeText")
	{
		If InStr(curCol,"-")
		{
			vList := "System.ItemTypeText 1" ;Ascending
		}
		else {
			vList := "System.ItemTypeText -1" ;Descending
		}
	}
	else {
		vList := "System.ItemTypeText -1" ;Ascending default
	}
	JEE_IFV2SetSortColumns(ifv2, vList)
	isp := isb := isv := ifv2 := icm := ""
}

sortBySize()
{
	WinGet, hWnd, ID, A
	oWin := JEE_ExpWinGetObj(hWnd)
	JEE_ExpGetInterfaces(oWin, isp, isb, isv, ifv2, icm)
	curCol:=JEE_IFV2GetSortColumns(ifv2)
	if InStr(curCol,"System.Size")
	{
		If InStr(curCol,"-")
		{
			vList := "System.Size 1" ;Ascending
		}
		else {
			vList := "System.Size -1" ;Descending
		}
	}
	else {
		vList := "System.Size -1" ;Ascending default?  i may pick something else here in practice
	}
	JEE_IFV2SetSortColumns(ifv2, vList)
	isp := isb := isv := ifv2 := icm := ""
}

sortByName()
{
	WinGet, hWnd, ID, A
	oWin := JEE_ExpWinGetObj(hWnd)
	JEE_ExpGetInterfaces(oWin, isp, isb, isv, ifv2, icm)
	curCol:=JEE_IFV2GetSortColumns(ifv2)
	if InStr(curCol,"System.Name")
	{
		If InStr(curCol,"-")
		{
			vList := "System.Name 1" ;Ascending
			tooltip, ascending
		}
		else {
			vList := "System.Name -1" ;Descending
			tooltip, descending
		}
	}
	else {
		vList := "System.Name -1" ;Ascending default
		;tooltip, wahatever
	}
	JEE_IFV2SetSortColumns(ifv2, vList)
	isp := isb := isv := ifv2 := icm := ""
}

switchToExplorer()
{
	sleep 11 ;this is to avoid the stuck modifiers bug
	IfWinNotExist, ahk_class CabinetWClass
		Run, explorer.exe
		GroupAdd, liamexplorers, ahk_class CabinetWClass
	if WinActive("ahk_exe explorer.exe")
		GroupActivate, liamexplorers, r
	else
		WinActivate ahk_class CabinetWClass
}

closeAllExplorers()
{
GroupAdd, liamexplorers, ahk_class CabinetWClass
WinClose, ahk_group liamexplorers
; i want to improve this so that the bottom (most recently active) explorer window does NOT close. IDK how to do that yet though.
; https://stackoverflow.com/questions/39601787/close-windows-explorer-window-with-auto-hotkey
; https://autohotkey.com/board/topic/88648-close-all-explorer-windows/
}


; I LIAM DID NOT CODE THIS
; https://www.autohotkey.com/boards/viewtopic.php?t=4777 <-Check- It out 
; ToolTipOpt v1.004
; Changes:
;  v1.001 - Pass "Default" to restore a setting to default
;  v1.002 - ANSI compatibility
;  v1.003 - Added workarounds for ToolTip's parameter being overwritten
;           by code within the message hook.
;  v1.004 - Fixed text colour.
 
ToolTipFont(Options := "", Name := "", hwnd := "") {
    static hfont := 0
    if (hwnd = "")
        hfont := Options="Default" ? 0 : _TTG("Font", Options, Name), _TTHook()
    else
        DllCall("SendMessage", "ptr", hwnd, "uint", 0x30, "ptr", hfont, "ptr", 0)
}
 
ToolTipColor(Background := "", Text := "", hwnd := "") {
    static bc := "", tc := ""
    if (hwnd = "") {
        if (Background != "")
            bc := Background="Default" ? "" : _TTG("Color", Background)
        if (Text != "")
            tc := Text="Default" ? "" : _TTG("Color", Text)
        _TTHook()
    }
    else {
        VarSetCapacity(empty, 2, 0)
        DllCall("UxTheme.dll\SetWindowTheme", "ptr", hwnd, "ptr", 0
            , "ptr", (bc != "" && tc != "") ? &empty : 0)
        if (bc != "")
            DllCall("SendMessage", "ptr", hwnd, "uint", 1043, "ptr", bc, "ptr", 0)
        if (tc != "")
            DllCall("SendMessage", "ptr", hwnd, "uint", 1044, "ptr", tc, "ptr", 0)
    }
}
 
_TTHook() {
    static hook := 0
    if !hook
        hook := DllCall("SetWindowsHookExW", "int", 4
            , "ptr", RegisterCallback("_TTWndProc"), "ptr", 0
            , "uint", DllCall("GetCurrentThreadId"), "ptr")
}
 
_TTWndProc(nCode, _wp, _lp) {
    Critical 999
   ;lParam  := NumGet(_lp+0*A_PtrSize)
   ;wParam  := NumGet(_lp+1*A_PtrSize)
    uMsg    := NumGet(_lp+2*A_PtrSize, "uint")
    hwnd    := NumGet(_lp+3*A_PtrSize)
    if (nCode >= 0 && (uMsg = 1081 || uMsg = 1036)) {
        _hack_ = ahk_id %hwnd%
        WinGetClass wclass, %_hack_%
        if (wclass = "tooltips_class32") {
            ToolTipColor(,, hwnd)
            ToolTipFont(,, hwnd)
        }
    }
    return DllCall("CallNextHookEx", "ptr", 0, "int", nCode, "ptr", _wp, "ptr", _lp, "ptr")
}
 
_TTG(Cmd, Arg1, Arg2 := "") {
    static htext := 0, hgui := 0
    if !htext {
        Gui _TTG: Add, Text, +hwndhtext
        Gui _TTG: +hwndhgui +0x40000000
    }
    Gui _TTG: %Cmd%, %Arg1%, %Arg2%
    if (Cmd = "Font") {
        GuiControl _TTG: Font, %htext%
        SendMessage 0x31, 0, 0,, ahk_id %htext%
        return ErrorLevel
    }
    if (Cmd = "Color") {
        hdc := DllCall("GetDC", "ptr", htext, "ptr")
        SendMessage 0x138, hdc, htext,, ahk_id %hgui%
        clr := DllCall("GetBkColor", "ptr", hdc, "uint")
        DllCall("ReleaseDC", "ptr", htext, "ptr", hdc)
        return clr
    }
}

; i liam did not write switch to chrome, but i did edit it.

switchToChrome()
{
;Even getting rid of the "sleep" commands, there's still a noticable delay when I switch to chrome for the first time. this is... annoying. It makes itself the window on top, but is not actaully ACTIVATED for about 300 milliseconds... meaning my next command or two will not work, until chrome is ACTUALLY active. AGH i might need to talk directly to the AHK forums about this. find out if there really is a difference between on top and active, because I sure as hell am noticing one.

;sleep 11 ;this is to avoid the stuck modifiers bug?
IfWinNotExist, ahk_exe chrome.exe
	Run, chrome.exe

if WinActive("ahk_exe chrome.exe")
	{
	;Sendinput {blind}^{tab} ;idk why i had it this way, but it sometimes wouldn't wor, 
	Sendinput  ^{tab}
	}
else
	WinActivate ahk_exe chrome.exe
	
;maybe need to unstick modifiers, im not sure
;sleep 2
sendinput {Rctrl up}{Lctrl up}
;idk if it helps or not.
;sendinput, {RAW}{SC0EA} ;scan code of an unassigned key. used for debugging.
}


switchToOtherChromeWindow(){
sendinput, {blind}{SC0E8} ;scan code of an unassigned key

Process, Exist, chrome.exe
;msgbox errorLevel `n%errorLevel%
	If errorLevel = 0
		Run, chrome.exe
	else
	{
	GroupAdd, liamChromes, ahk_exe chrome.exe
	if WinActive("ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe")
		GroupActivate, liamChromes, r
	else
		WinActivate, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe,, Microsoft Teams ;the last one is explicitly telling it NOT to open Microsoft Teams.
	}
}

switchToOtherCodeWindow(){
    sendinput, {blind}{SC0E8} ;scan code of an unassigned key

Process, Exist, code.exe
;msgbox errorLevel `n%errorLevel%
	If errorLevel = 0
		Run, code.exe
	else
	{
	GroupAdd, liamCodes, ahk_exe code.exe
	if WinActive("ahk_class Chrome_WidgetWin_1 ahk_exe code.exe")
		GroupActivate, liamCodes, r
	else
		WinActivate, ahk_class Chrome_WidgetWin_1 ahk_exe code.exe,, Microsoft Teams ;the last one is explicitly telling it NOT to open Microsoft Teams.
	}
}

switchToOtherSublimeWindow(){
    sendinput, {blind}{SC0E8} ;scan code of an unassigned key

Process, Exist, sublime_text.exe
;msgbox errorLevel `n%errorLevel%
	If errorLevel = 0
		Run, sublime_text.exe
	else
	{
	GroupAdd, liamSubs, ahk_exe sublime_text.exe
	if WinActive("ahk_class PX_WINDOW_CLASS ahk_exe sublime_text.exe")
		GroupActivate, liamSubs, r
	else
		WinActivate, ahk_class PX_WINDOW_CLASS ahk_exe sublime_text.exe,, Microsoft Teams ;the last one is explicitly telling it NOT to open Microsoft Teams.
	}
}


;;;; SCRIPT TO ALWAYS OPEN THE MOST RECENTLY SAVED OR AUTOSAVED FILE OF A GIVEN FILETYPE, IN ANY GIVEN FOLDER (AND ALL SUBFOLDERS.);;;;
;;script partially obtained from https://autohotkey.com/board/topic/57475-open-most-recent-file-date-created-in-a-folder/
openlatestfile(directory, filetype)
{
if directory = 1
	{
	FileRead, SavedExplorerAddress, C:\Users\thega\Desktop\Code\Github - Main\ahk-1\SavedExplorerAddress.txt
	;msgbox, current directory is`n%directory%
	directory = %SavedExplorerAddress%
	;msgbox, new directory is`n%directory%
	}
;filetype := """" . filetype . """" ;this ADDS quotation marks around a string in case you need that.
StringReplace, directory,directory,", , All ;" ; this REMOVES the quotation marks around the a string if they are present.

;Keyshower(directory,"openlatestfile")
if IsFunc("Keyshower") {
	Func := Func("Keyshower")
	RetVal := Func.Call(directory,"openlatestfile") 
}

;I need some method of excluding ~$ files, since those clutter everything up (MS Word .docx ...)

;msgbox, directory is %directory%`n and filetype is %filetype%
Loop, Files,%directory%\*%filetype%, FR
{

If (A_LoopFileTimeModified>Rec)
  {
  IfNotInString, A_LoopFileFullPath, ~$
	FPath=%A_LoopFileFullPath%
  Rec=%A_LoopFileTimeModified%
  }
}
tempstring = Opening ... %Fpath%
tippytool(tempstring, 800)
Run %Fpath%

; ; USING THE SCRIPT
; !n::
; examplePath = "Z:\Linus\6. Channel Super Fun\Flicking football"
; openlatestfile(examplePath, ".prproj") ;<--- notice how i INCLUDE the period in the parameters. IDK if it might be better to add the period later.
; return
}
; end of openlatestfile()

checkFullness()
{
; DriveSpaceFree, OutputVar, Z:\
DriveSpaceFree, OutputVar, C:\
If (OutputVar < 1000000)
	{
	OutputVar := OutputVar / 1024 
	OutputVar := Round(OutputVar, 2)
	msgbox, C: Drive has only %OutputVar% Gigabytes remaining
	
	}

}

ctrlRCode(){
    if WinActive("ahk_pid 15504")
        send, ^r 
    else if WinActive("ahk_pid 12396")
        send, ^r 
        sleep, 10
        send, {backspace}
    return
}