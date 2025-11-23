#SingleInstance Force
#Include ..\CbAutoComplete.ahk

Loop, Files, C:\Windows\System32\*.*
	List .= A_LoopFileName "|"
Gui, Add, Combobox, W300 gAutoComplete, %List%
Gui, Show,, CbAutoComplete Demo
return

AutoComplete:
CbAutoComplete()
return

