#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetControlDelay, 300

;;;;;;;;;;;;; Constants ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
TexWindowName := "ahk_exe texmod.exe"
ExeSelectButton := "Button2"
ExplorerExeOpenButton := "Button2"
ExplorerFileView := "SysListView321"
TpfFileChooserButton := "Button12"
ExplorerTpfOpenButton := "Button1"
RunButton := "Button11"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Open texmod
Run, ".\Textures [OPTIONAL]\texmod.exe"
Sleep, 250

; Choose exe to modify textures
ControlClick, %ExeSelectButton%, %TexWindowName%

; Scroll to end of list, to choose speed.exe
ControlSend, %ExplorerFileView%, {PgDn}, %TexWindowName%
ControlSend, %ExplorerFileView%, {PgDn}, %TexWindowName%
ControlClick, %ExplorerExeOpenButton%, %TexWindowName%

; Browse... for textures to replace (.tpf files)
ControlClick, %TpfFileChooserButton%, %TexWindowName%
Send, B

; Setup textures. The delays are required to leave the explorer Window open up
; And type the text into the window
Sleep, 250
Send, "NFS MW (2005) - X360 stuff [Main part].tpf" "NFS MW (2005) - X360 stuff [Bonus part].tpf"
Sleep, 250
ControlClick, %ExplorerTpfOpenButton%, %TexWindowName%
Send, O



; Click Run to start the game
SetControlDelay, -1
; For some reason, this click requires the class, instead of the exe
; Just refused to work using the exe...
ControlClick, %RunButton%, ahk_class tmlwndcls ; %TexWindowName%
