#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=speed_download.ico
#AutoIt3Wrapper_Outfile=Olaf.exe
#AutoIt3Wrapper_Outfile_x64=Olaf (x64).exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Comment=For not be the last there's Olaf !
#AutoIt3Wrapper_Res_Description=Little .exe of mine
#AutoIt3Wrapper_Res_Fileversion=1.4.0.6
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_LegalCopyright=l0
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;Lol always first (OLAF)
;By zeFresk
;In AutoIt

HotKeySet("!{ESC}", "Close")
HotKeySet("!v", "LolPaste")
HotKeySet("!c", "LolPhrase")
Global $Paused
HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("^!v", "LolAuto")
HotKeySet("^!b", "LolAutoWait")
HotKeySet("^!r", "LolAutoRage")

Dim $text[2] = [678, 859]
$text_color = 0xFFFFFF

Dim $rep[2] = [646, 274]
$rep_color = 0xAC480A

Dim $join1[3] = [429, 226, 0xFACC03]
Dim $join2[3] = [428, 327, 0xE4C900]
Dim $join3[3] = [428, 426, 0xFFD200]
Dim $join4[3] = [428, 528, 0xECCB16]
Dim $join5[3] = [430, 627, 0xECCB01]

Global $phrase = ClipGet()
;;;

If $phrase == "" Then
	LolPhrase()
EndIf

While True
	Sleep(100)
WEnd

;;;

Func LolAutoRage()
	ToolTip("Olaf : Mother fucking mode enabled", 0, 0)
	$nb = 0
	While True
		$ok = LolPasteAuto(400 - (100 * $nb), 600 - (100 * $nb))
		Sleep(200)
		If $ok Then
			$nb += 1
		EndIf
		If $nb == 3 Then ExitLoop
	WEnd
	ToolTip("Olaf : Mother fucking mode disabled", 0, 0)
	Sleep(1000)
	ToolTip("")
EndFunc   ;==>LolAutoRage

Func LolAutoWait()
	ToolTip("Olaf : Auto waiting mode enabled", 0, 0)
	$cpt = 0
	While True
		$cpt = 0
		If WinActive("Client PVP.net") Then
			If PixelGetColor($join1[0], $join1[1]) == $join1[2] Then $cpt += 1
			If PixelGetColor($join2[0], $join2[1]) == $join2[2] Then $cpt += 1
			If PixelGetColor($join3[0], $join3[1]) == $join3[2] Then $cpt += 1
			If PixelGetColor($join4[0], $join4[1]) == $join4[2] Then $cpt += 1
			If PixelGetColor($join5[0], $join5[1]) == $join5[2] Then $cpt += 1
			If $cpt < 2 Then
				Sleep(250)
				If LolPaste() Then ExitLoop
			EndIf
		EndIf
		Sleep(100)
	WEnd
	ToolTip("Olaf : Auto waiting mode disabled", 0, 0)
	Sleep(1000)
	ToolTip("")
EndFunc   ;==>LolAutoWait

Func Close()
	ToolTip("Olaf : exit", 0, 0)
	Sleep(1000)
	ToolTip("")
	Exit 0
EndFunc   ;==>Close

Func LolPasteAuto($a = 400, $b = 600)
	If PixelGetColor($rep[0], $rep[1]) == $rep_color Then
		If PixelGetColor($text[0], $text[1]) == $text_color Then
			MouseClick("left", $text[0], $text[1], 2, 0)
			Sleep(Random($a, $b))
			Send($phrase)
			Send("{ENTER}")
			Return True
		EndIf
	EndIf
EndFunc   ;==>LolPasteAuto

Func LolPaste()
	If PixelGetColor($rep[0], $rep[1]) == $rep_color Then
		If PixelGetColor($text[0], $text[1]) == $text_color Then
			MouseClick("left", $text[0], $text[1], 2, 0)
			Sleep(300)
			Send($phrase)
			Send("{ENTER}")
			Sleep(1500)
			Return True
		EndIf
	EndIf
EndFunc   ;==>LolPaste

Func LolAuto()
	ToolTip("Olaf : Auto mode enabled", 0, 0)
	While True
		$ok = LolPasteAuto()
		Sleep(100)
		If $ok Then
			ExitLoop
		EndIf
	WEnd
	ToolTip("Olaf : Auto mode disabled", 0, 0)
	Sleep(1000)
	ToolTip("")
EndFunc   ;==>LolAuto

Func TogglePause()
	ToolTip("Olaf : Pause enabled", 0, 0)
	$Paused = Not $Paused
	While $Paused
		Sleep(250)
	WEnd
	ToolTip("Olaf : Pause disabled", 0, 0)
	Sleep(1000)
	ToolTip("")
EndFunc   ;==>TogglePause

Func LolPhrase()
	$phrase = InputBox("Olaf : Nouvelle phrase", "Entrez la phrase à coller", "mid")
EndFunc   ;==>LolPhrase
