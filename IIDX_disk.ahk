﻿isSpaceDown := False
rRotate := False
lRotate := False
;Debug Window

;Gui, Add, Text, x6 y0 w100 h150 ,%isSpaceDown%
;Gui, Show, w100 h20, New GUI Window

;==========================================
;status Window
Gui, 93:+AlwaysOnTop +ToolWindow
Sensitivity = 10 ; lower = more sensitives
  LCtrl:: ; the left control key is the hotkey
Gui, 93:Show, NoActivate  w200 h0 x-1 y-1,  % (Toggle := !Toggle) 	? "Mouse to Keys On" : "Mouse to Keys Off"
;============================================
SetTimer, WatchMouse, % Toggle ? 5 : "off"
MouseGetPos, ox, oy
oldx := ox
oldy := oy

Keywait, %A_ThisHotkey%
 return


  WatchMouse:
MouseGetPos, nx, ny
If(Abs( nx - oldx ) > Sensitivity)
{
	if(( nx - oldx ) > 0 && lRotate = False)
	{
		rRotate := False
		Send, % "{blind}" ( "{Space Up}" )
		Send, % "{blind}" ( "{Space Down}" )
		lRotate := True
			
	}
	if(( nx - oldx ) < 0 && rRotate = False)
	{
		lRotate := False
		Send, % "{blind}" ( "{Space Up}" )
		Send, % "{blind}" ( "{Space Down}" )
		rRotate := True
	
	}
	isSpaceDown := True
	MouseMove, ox, ny+1-2*(ny > oy), 0
}

;If mouse stop
If(Abs( nx - oldx ) <=  Sensitivity && isSpaceDown == True)
{

	Send, % "{blind}" ( "{Space Up}" )
	isSpaceDown := False
	rRotate := False
	lRotate := False
		
}


  return

F8:: ExitApp
