HotKeySet("{END}", "quit")
HotKeySet("{Home}", "start")
HotKeySet("{TAB}", "pozitie")
HotKeySet("{F2}", "showChecks")
HotKeySet("{F3}", "pauseZ")
HotKeySet("{F5}", "restarters")
HotKeySet("{F6}", "restarterd")

Global $Xx = 1920
Global $Yy = 0
Global $side = 0
Global $nside = 0
Global $xMid = 960				;;;; 540
Global $yMid = 480				;;;; 340
Global $randBack = 0
Global $xmin = 300
Global $xmax = 540
Global $ymin = 70
Global $ymax = 170

While 1
   Sleep(1000)
WEnd

Func quit()
   Exit 0
EndFunc

Func pauseZ()
   Sleep(45000)
EndFunc

Func restarters()
   $side = -1
   $nside = -1

   Go_Attack()
EndFunc

Func restarterd()
   $side = 1
   $nside = 1

   Go_Attack()
EndFunc

Func pozitie()
	Local $aPos = MouseGetPos()
	ToolTip('X: ' & $aPos[0] - $Xx & ', Y: ' & $aPos[1] - $Yy)
EndFunc

Func showCheck()
   Local $aPos = MouseGetPos()
   Local $check = PixelGetColor($aPos[0], $aPos[1])
   ToolTip($check)
EndFunc

Func showChecks()
   Local $aPos = MouseGetPos()
   Local $check = PixelGetColor($Xx + 0000, $Yy + 0000)
   ToolTip($check)
EndFunc

Func SetDelay()
   ;;;; Set Delay
   AutoItSetOption("MouseClickDelay", Random(20, 75, 1))
   AutoItSetOption("MouseClickDownDelay", Random(20, 75, 1))
EndFunc

Func CallZ()
   Send("b")
   $randBack = 0
EndFunc

Func Click_Leave()
   MouseClick("left", $Xx + 125, $Yy + 975, 1, 0)
   Sleep(Sleep(Random(4000, 10000, 1)))
EndFunc

Func start()
   SetDelay()

   ;;; Click Play Button
   Click_Play()
EndFunc

Func Click_Play()
   MouseClick("left", $Xx + 960, $Yy + 975, 1, 0)
   Sleep(Sleep(Random(2000, 4000, 1)))

   Check_Map()
EndFunc

Func Check_Map()
   Local $check = 0
   Local $check1 = 0
   Local $check2 = 0

   ;;; verific daca sunt inca in meniul principal (loading game)
   $check = PixelGetColor($Xx + 40, $Yy + 50)
   While ($check = 11379454)
	  $check = PixelGetColor($Xx + 40, $Yy + 50)
	  Sleep(1000)
   WEnd

   ;;; mini delay
   Sleep(2000)

   ;;;; cat timp e ecranul negru de loading
   $check1 = PixelGetColor($Xx + 70, $Yy + 230)
   $check2 = PixelGetColor($Xx + 1870, $Yy + 230)
   While ($check1 <> 16312064) And ($check2 <> 16311296)
	  $check1 = PixelGetColor($Xx + 70, $Yy + 230)
	  $check2 = PixelGetColor($Xx + 1870, $Yy + 230)
	  Sleep(1000)
   WEnd

   ;;; mini delay
   Sleep(2000)

   ;;; determina side
   If $check1 = 16312064 Then
	  $side = 1
	  $nSide = 1
   EndIf
   If $check2 = 16311296 Then
	  $side = -1
	  $nSide = -1
   EndIf

   While ($check1 = 16312064) Or ($check2 = 16311296)
	  $check1 = PixelGetColor($Xx + 70, $Yy + 230)
	  $check2 = PixelGetColor($Xx + 1870, $Yy + 230)
	  Sleep(1000)
   WEnd

   ;;;; mini delay
   Sleep(2000)

   ;;; asteapta inceput
   MouseMove($Xx + $xMid, $Yy + $yMid, 0)
   Sleep(Random(10000, 20000, 1))

   Go_Attack()
EndFunc

Func Go_Attack()
   Local $exitBut = 0
   Local $damage = 0
   Local $checkDead1 = 2236717
   Local $checkDead2 = 2171181
   Local $checkDead3 = 2171181
   Local $forVal = 0
   Local $rValue = 27

   Pick_Talent()
   While $exitBut <> 11379454

	  SetDelay()

	  $checkDead1 = PixelGetColor($Xx + 215, $Yy + 970)
	  $checkDead2 = PixelGetColor($Xx + 280, $Yy + 970)
	  $checkDead3 = PixelGetColor($Xx + 350, $Yy + 970)
	  While $checkDead1 = 2236717 And $checkDead2 = 2171181 And $checkDead3 = 2171181
		 $checkDead1 = PixelGetColor($Xx + 215, $Yy + 970)
		 $checkDead2 = PixelGetColor($Xx + 280, $Yy + 970)
		 $checkDead3 = PixelGetColor($Xx + 350, $Yy + 970)
		 $randBack = 0
		 Sleep(1000)
	  WEnd

	  $randBack = $randBack + 1
	  If $randBack = $rValue Then
		 $rValue = Random(23, 30, 1)
		 $nside = $nside * (-1)
	  EndIf

	  If $randBack = 40 Then
		 $randBack = 0
		 $forVal = Random(8, 12, 1)
		 For $i = 1 To $forVal Step +1
			$checkDead1 = PixelGetColor($Xx + 215, $Yy + 970)
			$checkDead2 = PixelGetColor($Xx + 280, $Yy + 970)
			$checkDead3 = PixelGetColor($Xx + 350, $Yy + 970)
			If $checkDead1 = 2236717 And $checkDead2 = 2171181 And $checkDead3 = 2171181 Then
			   ExitLoop
			EndIf
			Run_Move()
			Sleep(Random(200, 300, 1))
		 Next
	  EndIf

	  $checkDead1 = PixelGetColor($Xx + 215, $Yy + 970)
	  $checkDead2 = PixelGetColor($Xx + 280, $Yy + 970)
	  $checkDead3 = PixelGetColor($Xx + 350, $Yy + 970)
	  While $checkDead1 = 2236717 And $checkDead2 = 2171181 And $checkDead3 = 2171181
		 $checkDead1 = PixelGetColor($Xx + 215, $Yy + 970)
		 $checkDead2 = PixelGetColor($Xx + 280, $Yy + 970)
		 $checkDead3 = PixelGetColor($Xx + 350, $Yy + 970)
		 $randBack = 0
		 Sleep(1000)
	  WEnd

	  A_Move()
	  Sleep(Random(100, 200, 1))
	  Use_Ability()
	  Sleep(Random(100, 200, 1))

	  $checkDead1 = PixelGetColor($Xx + 215, $Yy + 970)
	  $checkDead2 = PixelGetColor($Xx + 280, $Yy + 970)
	  $checkDead3 = PixelGetColor($Xx + 350, $Yy + 970)
	  While $checkDead1 = 2236717 And $checkDead2 = 2171181 And $checkDead3 = 2171181
		 $checkDead1 = PixelGetColor($Xx + 215, $Yy + 970)
		 $checkDead2 = PixelGetColor($Xx + 280, $Yy + 970)
		 $checkDead3 = PixelGetColor($Xx + 350, $Yy + 970)
		 $randBack = 0
		 Sleep(1000)
	  WEnd

	  $exitBut = PixelGetColor($Xx + 40, $Yy + 50)
	  Sleep(Random(100, 200, 1))
   WEnd

   Sleep(Sleep(Random(4000, 8000, 1)))
   Click_Leave()
   Click_Play()
EndFunc

Func Pick_Talent()
   Local $val = 0

   $val = Random(1, 3, 1)
   If $val = 1 Then
	  Send("n")
	  Sleep(Random(75, 150, 1))
	  Send("^1")
	  Sleep(Random(75, 150, 1))
   EndIf

   If $val = 2 Then
	  Send("n")
	  Sleep(Random(75, 150, 1))
	  Send("^2")
	  Sleep(Random(75, 150, 1))
   EndIf

   If $val = 3 Then
	  Send("n")
	  Sleep(Random(75, 150, 1))
	  Send("^3")
	  Sleep(Random(75, 150, 1))
   EndIf
EndFunc

Func Use_Ability()
   Local $abl = 0
   Local $hero = 0

   $hero = Random(1, 3, 1)

   If $hero = 1 Then
	  Send("1")
	  Send("{SPACE}")
	  Sleep(Random(60, 100, 1))
   EndIf

    If $hero = 2 Then
	  Send("2")
	  Send("{SPACE}")
	  Sleep(Random(60, 100, 1))
   EndIf

    If $hero = 3 Then
	  Send("3")
	  Send("{SPACE}")
	  Sleep(Random(60, 100, 1))
   EndIf

   $abl = Random(1, 100, 1)

   ;;; If 1 <= $abl And $abl <= 15 Then
   If 1 <= $abl And $abl <= 40 Then												;;; z
	  Send("z")
	  Return
   EndIf

   If 41 <= $abl And $abl <= 60 Then											;;; q
	  Send("q")
	  MouseClick("left", $Xx + $xMid + RandySide() * Random($xmin, $xmax, 1), $Yy + $yMid + RandySide() * Random($ymin, $ymax, 1), 1, 0)
	  Return
   EndIf

   If 61 <= $abl And $abl <= 80 Then											;;; w
	  Send("w")
	  MouseClick("left", $Xx + $xMid + RandySide() * Random($xmin, $xmax, 1), $Yy + $yMid + RandySide() * Random($ymin, $ymax, 1), 1, 0)
	  Return
   EndIf

   If 81 <= $abl And $abl <= 90 Then											;;; e
	  Send("e")
	  MouseClick("left", $Xx + $xMid + RandySide() * Random($xmin, $xmax, 1), $Yy + $yMid + RandySide() * Random($ymin, $ymax, 1), 1, 0)
	  Return
   EndIf

   If 91 <= $abl And $abl <= 95 Then											;;; r
	  Send("r")
	  MouseClick("left", $Xx + $xMid + RandySide() * Random($xmin, $xmax, 1), $Yy + $yMid + RandySide() * Random($ymin, $ymax, 1), 1, 0)
	  Return
   EndIf

   If 96 <= $abl And $abl <= 100 Then											;;; Talent
	  Pick_Talent()
	  Return
   EndIf
EndFunc

;;; +1 or -1
Func RandySide()
   Local $rValue = Random(0, 1, 1)

   If $rValue = 0 Then
	  Return -1
   EndIf
   If $rValue = 1 Then
	  Return 1
   EndIf
EndFunc

Func Run_Move()
   Send("{SPACE}")
   MouseClick("right", $Xx + $xMid + (-1) * $side * Random($xmin/2, $xmax/3, 1), $Yy + $yMid + (-1) * $nside * Random($ymin + $ymax, $ymax + $ymax, 1), 1, 0)
EndFunc

Func A_Move()
   Send("{SPACE}")
   Send("a")
   MouseClick("left", $Xx + $xMid + $side * Random($xmin, $xmax, 1), $Yy + $yMid + $nside * Random($ymin, $ymax, 1), 1, 0)
EndFunc