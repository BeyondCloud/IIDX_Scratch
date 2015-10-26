﻿isSpaceDown := False
rRotate := False
lRotate := False
;Debug Window

;Gui, Add, Text, x6 y0 w100 h150 ,%isSpaceDown%
;Gui, Show, w100 h20, New GUI Window

;==========================================
;status Window
Gui, 93:+AlwaysOnTop +ToolWindow
Sensitivity = 100 ; lower = more sensitives
  LCtrl:: ; the left control key is the hotkey
Gui, 93:Show, NoActivate  w200 h0 x-1 y-1,  % (Toggle := !Toggle) 	? "Mouse to Keys On" : "Mouse to Keys Off"
;============================================
SetTimer, WatchMouse, % Toggle ? 5 : "off"
MouseGetPos, ox, oy
oldy := oy
counter :=0
oldCounter :=0

Keywait, %A_ThisHotkey%
 return


  WatchMouse:
MouseGetPos, nx, ny
/*
If(Abs( nx - oldx ) > Sensitivity)
{

	MouseMove, ox, ny+1-2*(ny > oy), 0
}
*/
error := ny - oldy
counter += error
error := counter - oldCounter
If(Abs(error)  >= Sensitivity)
{
	if(( error ) > 0 && lRotate = False)
	{
		Send, % "{blind}" ( "{Space Up}" )
		Send, % "{blind}" ( "{Space Down}" )
		lRotate := True
		rRotate := False
			
	}
	if(( error ) < 0 && rRotate = False)
	{
		Send, % "{blind}" ( "{Space Up}" )
		Send, % "{blind}" ( "{Space Down}" )
		rRotate := True
		lRotate := False
	}
;	isSpaceDown := True
}

;If mouse stop
else
{

	Send, % "{blind}" ( "{Space Up}" )
;	isSpaceDown := False
	rRotate := False
	lRotate := False
		
}
	MouseMove, 0, oy, 0

oldCounter := counter

  return

F8:: ExitApp
