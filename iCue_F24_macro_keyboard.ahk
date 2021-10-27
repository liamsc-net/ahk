#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;SetWorkingDir, C:\AHK\2nd-keyboard\ ;Or you could put the directory here. Whatevs.
Menu, Tray, Icon, shell32.dll, 174 ;if commented in, this line changes the taskbar icon to a gold star. Beware that if you don't have shell32.dll, it'll be a blank icon!
;SetKeyDelay, 0 ;IDK exactly what this does.
;Below this line i'm including my functions (check out my functions @ https://liamsc.net/61)
#Include, ./functions/functions.ahk
;Above this line i'm including my functions
;;Location for where to put a shortcut to this script, so that it will start with Windows:
;;  Here for just yourself:
;;  C:\Users\YOUR_USERNAME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
;;  Or here for all users:
;;  C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp

#NoEnv
SendMode Input
#InstallKeybdHook
;#InstallMouseHook ;<--You'll want to use this if you have scripts that use the mouse.
#UseHook On
#SingleInstance force ;only one instance of this script may run at a time!
#MaxHotkeysPerInterval 2000

;;The lines below are optional. Delete them if you need to.
#HotkeyModifierTimeout 60 ; https://autohotkey.com/docs/commands/_HotkeyModifierTimeout.htm
#KeyHistory 200 ; https://autohotkey.com/docs/commands/_KeyHistory.htm ; useful for debugging.
#MenuMaskKey vk07 ;https://autohotkey.com/boards/viewtopic.php?f=76&t=57683
#WinActivateForce ;https://autohotkey.com/docs/commands/_WinActivateForce.htm ;prevent taskbar flashing.
;;The lines above are optional. Delete them if you need to.


#if (getKeyState("F24", "P")) ;<--Everything after this line will only happen on the secondary keyboard that uses F24.
F24::return ;this line is mandatory for proper functionality

; escape::tooltip, "[F24] You might wish to not give a command to escape. Could cause problems. IDK."
escape::
tippytool("Open / Show Spotify", 166)
openApp(12780, "C:\Users\thega\Downloads\BlockTheSpot.bat")
return

F1::
tippytool("Play/Pause Spotify", 166)
Spotify_Pause()
return

F2::
tippytool("Previous Song spotify", 166)
Spotify_Previous_Track()
return

F3::
tippytool("Next Song spotify", 166)
Spotify_Skip_Track()
return

F4::
tippytool("Repeat(1) Song spotify", 166)
Spotify_Repeat_1()
return

F5::
tippytool("Turn down spotify", 130)
Spotify_VolDown()
return

F6::
tippytool("Turn up spotify", 130)
Spotify_VolUp()
return

F7::
tippytool("Turn Down Windows", 130)
loop, 5{
	Windows_VolDown()
}
return

F8::
tippytool("Turn Up Windows", 130)
loop, 5{
	Windows_VolUp()
}
return

F9::
tippytool("Mute in Discord", 250)
Discord_Mute()
return

F10::
tippytool("Deafen in Discord", 250)
Discord_Deafen()
return

F11::
tippytool("Show Current Call in Disocrd", 250)
Discord_Show_Call()
return


F12::
tippytool("Open / Show Discord", 250)
openApp(9436, "C:\Users\thega\AppData\Local\Discord\app-1.0.9003\Discord.exe")
return

;;------------------------NEXT ROW--------------------------;;

`::
tippytool("Open / Show Chrome", 200)
openApp(21036, "C:\Program Files\Google\Chrome\Application\chrome.exe")
return

1::
tippytool("Ctrl Tab", 100)
openApp(21036, "C:\Program Files\Google\Chrome\Application\chrome.exe")
SendInput {blind}^{tab}
return 

2::
tippytool("Open github", 200)
run, https://www.github.com/liam-s-c
return

3::
tippytool("Open github - Org", 200)
run, https://www.github.com/liamsc-net
return

4::
tippytool("Open liamsc.net", 200)
run, https://liamsc.net/
return

5::
tippytool("Shorten Copied URL", 200)
urlShortener()
return

6::
tippytool("Clipboard search")
clipboardSearch()
return

7::
tippytool("Open tiktok")
run, https://tiktok.com
return

8::
tippytool("Open twitter")
run, https://twitter.com
return

9::
tippytool("Open Netflix")
run, https://netflix.com
return

0::
tippytool("Open Youtube")
run, https://youtube.com
return

-::
tippytool("Switch to netflix (or left most media)")
openApp(21036, "C:\Program Files\Google\Chrome\Application\chrome.exe")
send, {F10}
send, {left}
send, {left}
sleep, 20
send, {enter}
sleep, 30
send, {tab}
send, {enter}
sleep, 50
send, {escape}
return

=::
tippytool("Turn on zoom")
openApp(21036, "C:\Program Files\Google\Chrome\Application\chrome.exe")
send, {F10}
sleep, 20
send, {left}
sleep, 20
send, {left}
sleep, 20
send, {left}
sleep, 20
send, {left}
sleep, 20
send, {left}
sleep, 20
send, {enter}
sleep, 50
send, {escape}
return

backspace::
tippytool("Take page screenshot")
openApp(21036, "C:\Program Files\Google\Chrome\Application\chrome.exe")
send, {F10}
sleep, 20
send, {left}
sleep, 20
send, {left}
sleep, 20
send, {left}
sleep, 20
send, {left}
sleep, 20
send, {enter}
sleep, 50
send, {escape}
return

;;------------------------NEXT ROW--------------------------;;

tab::  
tippytool("Open / Show VSCode", 266)     
switchToOtherCodeWindow()     
return     

q:: 
tippytool("Stage and Commit", 266)     
stageAndPublish()     
return     

w::     
tippytool("Add cursos to highlighted line ends", 166)     
addCursorsToEndOfLines()
return     

e::     
tippytool("Show git graph", 166)     
showGitGraph()
return     

r::     
tippytool("Show git changes", 166)     
showChanges()
return     

t::     
tippytool("Ctrl Tab Through Files", 166)     
openApp(15504, "C:\Users\thega\AppData\Local\Programs\Microsoft VS Code\Code.exe")
send, ^{tab}
return     

y::
tippytool("Open / Show Sublime", 266)
switchToOtherSublimeWindow()
return

u::
tippytool("Open / Show Git Kraken", 188)
openApp(16168, "C:\Users\thega\AppData\Local\gitkraken\update.exe")
return

i::
tippytool("Open / Show GitHub Desktop", 188)
openApp(10404, "C:\Users\thega\AppData\Local\GitHubDesktop\GitHubDesktop.exe")
return

o::
tippytool("Open / Show Notepad++", 188)
openApp(35316, "C:\Program Files (x86)\Notepad++\notepad++.exe")
return

p::
tippytool("Open / Show Visual Studio", 188)
openApp(34820, "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\devend.exe")
return

[::
tippytool("Open Repositories - Website", 188)
run, https://github.com/Liam-s-c?tab=repositories
return 

]::
tippytool("Open Repositories - Local", 188)
instantexplorer("C:\Users\thega\Desktop\Code\Github - Main")
return
;;capslock::tooltip, [F24] capslock - this should have been remapped to F20. Keep this line commented out.

;;------------------------NEXT ROW--------------------------;;

a::
tippytool("Open Github Folder", 233)
instantexplorer("C:\Users\thega\Desktop\Code\Github - Main")
return

s::
tippytool("Open Downloads Folder", 233)
instantexplorer("C:\Users\thega\Downloads")
return

d::
tippytool("Open Desktop Folder", 233)
instantexplorer("C:\Users\thega\Downloads")
return

f::
tippytool("Open Code Folder", 233)
instantexplorer("C:\Users\thega\Desktop\Code")
return

g::
tippytool("Open Latest file in folder", 233)
Path = "C:\Users\thega\Desktop\Code\Github - Main"
InputBox, FileExt, File Extension, Please input a file extension 
openlatestfile(Path, FileExt)
return

h::
tippytool("Check C:\ drive space", 233)
checkFullness()
return

j::
tippytool("Sort file explorer by date", 233)
sortByDate()
return

K::
tippytool("Sort file explorer by date descending", 233)
sortByDateDescending()
return

l:
tippytool("Sort file explorer by type", 233)
sortByType()
return

`;::
tippytool("Sort file explorer by size", 233)
sortBySize()
return ;for the above line, (semicolon) note that the ` is necessary as an escape character

'::
tippytool("Close All Explorers", 233)
closeAllExplorers()
return

enter::
tippytool("Press Ctrl + R", 233) 
ctrlRCode()
return

;;------------------------NEXT ROW--------------------------;;
\::
tippytool("")

return

z::
tippytool("")

return

x::
tippytool("")

return

c::
tippytool("")

return

v::
tippytool("")

return

b::
tippytool("")

return

n::
tippytool("")

return

m::
tippytool("")

return

,::
tippytool("")

return

.::
tippytool("")

return

/::
tippytool("")

return

space::
tippytool("")

return

;;===================== MODIFIERS =========================;;

;;Keep these commented out, as they are!
;Lshift::tooltip, do not use
;Lctrl::tooltip, do not use
;Lwin::tooltip, do not use
;Lalt::tooltip, do not use
;Ralt::tooltip, do not use
;Rwin::tooltip, do not use
;appskey::tooltip, This is not a modifier, but I replaced it with INTERNATIONAL4 (SC079) anyway, because it was able to misbehave.
;Rctrl::tooltip, do not use
;Rshift::tooltip, do not use


;;If you delete a modifier's key assignment in iCue, it'll act like a normal modifier.
;;that means you can use it in conjuction with the other keys, to achieve a different result, like so:
;+z::tooltip, you pressed SHIFT Z on the F24 keyboard.
;^z::tooltip, you pressed CTRL Z on the F24 keyboard.
;!z::tooltip, you pressed ALT Z on the F24 keyboard. I don't recommend this... ALT is dangerous because of menu acceleration, even if you try to disable it like I have
;^!z::tooltip, you pressed CTRL SHIFT Z on the F24 keyboard.
;;Etc.
;;However, I use few to no modifiers on my secondary keyboards... I prefer tap dance instead. The decision is up to you.
;;Note that any keys that do NOT have a modifier assignment, WILL behave normally. It's a trade off.
;;If none of that made sense, well look, you're just gonna have to experiment with it, ok?


;;================= MODIFIERS REMAPPED ======================;;


SC070::tippytool("[LShift] -to->")
; tooltip, [F24] LShift -to-> SC070:International 2
;the following MUST use the UP stroke - the down stroke doesn't work.
SC071 up::tippytool("[LCtrl] -to->")
; tooltip, [F24] LCtrl -to-> SC071:Language 2
SC072 up::tippytool("[LWin] -to->")
; tooltip, [F24] LWin -to-> SC072:Language 1
SC073 up::tippytool("[LAlt] -to->")
; tooltip, [F24] LAlt -to-> SC073:International 1
;the above MUST up the UP stroke

SC077::tippytool("[RAlt] -to->")
; tooltip, [F24] RAlt -to-> SC077:Language 4
SC078::tippytool("[RWin] -to->")
; tooltip, [F24] RWin -to-> SC078:Language 3
SC079::tippytool("[AppsKey] -to->")
; tooltip, [F24] AppsKey -to-> SC079:International 4
SC07B::tippytool("[RCtrl] -to->")
; tooltip, [F24] RCtrl -to-> SC07B:International 5
SC07D::tippytool("[RShift] -to->")
; tooltip, [F24] RShift -to-> SC07D:International 3

;;================= LOCKING KEYS ======================;;

F20::
tippytool("Open / Show File Explorer [CapsLock] -to->", 166)
switchToExplorer()
return

; tooltip, [F24] CapsLock -to-> SC06B:F20
SC05C::tippytool("[NumLock] -to->")
; tooltip, [F24] NumLock -to-> SC05C:International 6
;Numlock is an AWFUL key. I prefer to leave it permanently on.
;It's been changed to International 6, so you can use it with no fear that it'll mess up your numpad.
;; ScrollLock is in the next section. iCue has no more extra keys that I could have used to swap it out with.

;;================= NEXT SECTION ======================;;

PrintScreen::tippytool("")
ScrollLock::tippytool("")
SC07E::tippytool("[Pause] -to->")
; tooltip, [F24] Pause -to-> SC07E:Brazillian comma

;;Don't use the 3 keys below for your 2nd keyboard!
;Pause::msgbox, The Pause/Break key is a huge PITA. That's why I remapped it to SC07E
;Break::msgbox, Or is it THIS key? WHO KNOWS!
;CtrlBreak::msgbox, I have no idea what Ctrlbreak is. But it shows up sometimes.
;;Don't use the 3 keys above for your 2nd keyboard! Just don't!!

insert::
delete::tippytool("")

home::
end::tippytool("")

pgup::
pgdn::tippytool("")

;;================= NEXT SECTION ======================;;

up::
down::
left::
right::tippytool("")

;;=========== THE NUMPAD WITH NUMLOCK ON ==============;;
;;Please note that SHIFT will make numlock act like it's off...
;;or is it the other way around? AGH! Just don't use shift with the numpad!
numpad0::
tippytool("[NumLock On]")

return

numpad1::
tippytool("[NumLock On]")

return

numpad2::
tippytool("[NumLock On]")

return

numpad3::
tippytool("[NumLock On]")

return

numpad4::
tippytool("[NumLock On]")

return

numpad5::
tippytool("[NumLock On]")

return

numpad6::
tippytool("[NumLock On]")

return

numpad7::
tippytool("[NumLock On]")

return

numpad8::
tippytool("[NumLock On]")

return

numpad9::
tippytool("[NumLock On]")

return

;;============ THE NUMPAD WITH NUMLOCK OFF ============;;
numpadins::
tippytool("[NumLock Off]")

return

numpadend::
tippytool("[NumLock Off]")

return

numpaddown::
tippytool("[NumLock Off]")

return

numpadpgdn::
tippytool("[NumLock Off]")

return

numpadleft::
tippytool("[NumLock Off]")

return

numpadclear::
tippytool("[NumLock Off]")

return

numpadright::
tippytool("[NumLock Off]")

return

numpadhome::
tippytool("[NumLock Off]")

return

numpadup::
tippytool("[NumLock Off]")

return

numpadpgup::
tippytool("[NumLock Off]")

return

;;If you want a function to be called no matter what the status of numlock, do it like so:
;numpad0::
;numpadins::coolFunction("hello")

;;====== NUMPAD KEYS THAT DON'T CARE ABOUT NUMLOCK =====;;
;;NumLock::tooltip, DO NOT USE THE NUMLOCK KEY IN YOUR 2ND KEYBOARD! I have replaced it with SC05C-International 6
numpadDiv::
tippytool("")

return

numpadMult::
tippytool("")

return

numpadSub::
tippytool("")

return

numpadAdd::
tippytool("")

return

numpadEnter::
tippytool("")

return

numpadDot::tippytool("")

#if ;this line will end the F24 secondary keyboard assignments.


;;================= NEXT SECTION ======================;;
;; The K55 has 6 macro keys. I assigned them to F13-F18.
;; These keys are NOT WRAPPED. But you can do it that way (in iCue) if you like. 
;; I personally don't because idk, i got lazy, leave me alone

F13::
tippytool("Open / Show Discord | G1 mapped -to->", 230)
openApp(9436, "C:\Users\thega\AppData\Local\Discord\app-1.0.9003\Discord.exe")
return

F14::
tippytool("Open / Show Chrome | G2 mapped -to->", 230)
; openApp(21036, "C:\Program Files\Google\Chrome\Application\chrome.exe")
switchToOtherChromeWindow()
return

F15::
tippytool("Open / Show Explorer | G3 mapped -to->", 230)
; openApp(6388, "C:\Windows\explorer.exe")
switchToExplorer()
return

F16::
tippytool("Open / Show VSCode | G4 mapped -to->", 230)
; openApp(15504, "C:\Users\thega\AppData\Local\Programs\Microsoft VS Code\Code.exe")
switchToOtherCodeWindow()
return

F17::
tippytool("Open / Show Spotify | G5 mapped -to->", 230)
openApp(12780, "C:\Users\thega\Downloads\BlockTheSpot.bat") ; i might change what app this opens 
return

F18::
tippytool("Open / Show Calculator | G6 mapped -to->", 230)
openApp(12208, "calc.exe") ; There is a bug with this, if i have settings open, it'll open settings not calculator
return



;;====== MEDIA KEYS CANNOT BE USED IN AN iCUE MACRO =====;;
;;==== BUT WE CAN REMAP THEM TO THE SUPER FUNCTION KEYS==;;

F19::tippytool("media_stop mapped -to->")
;;F20 was already used as capslock
F21::tippytool("media_prev mapped -to->")
F22::tippytool("media_play_pause mapped -to->")
F23::tippytool("media_next mapped -to->")
;;F24 is already used as this keyboard's wrapping key.
+F21::tippytool("Volume up mapped -to->")
+F22::tippytool("Volume Mute mapped -to->")
+F23::tippytool("Volume Down mapped -to->")

#if





;;*******************************************************************************
;;*******************************************************************************
;;~~~~~~~~~~~~~DEFINE YOUR NORMAL KEY ASSIGNMENTS BELOW THIS LINE~~~~~~~~~~~~~~~~
;;If you assign them BEFORE the second keyboard, they'll overrule it. That's bad!
;;*******************************************************************************
;;*******************************************************************************



