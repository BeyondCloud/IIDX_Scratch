isSpaceDown := False

;Debug Window

;Gui, Add, Text, x6 y0 w100 h150 ,%isSpaceDown%
;Gui, Show, w100 h20, New GUI Window

;==========================================
;status Window
Gui, 93:+AlwaysOnTop +ToolWindow
Sensitivity = 100 ; lower = more sensitive
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
If(Abs( nx - oldx ) >= Sensitivity)
{
	if( isSpaceDown = False)
	{
		Send, % "{blind}" ( "{Space down}" )
		isSpaceDown := True
	}
	MouseMove, ox, ny+1-2*(ny > oy), 0
}

If(Abs( ny - oldy ) >= Sensitivity)
{
	if( isSpaceDown = False)
	{
		Send, % "{blind}" ( "{Space down}" )
		isSpaceDown := True
	}
	MouseMove, nx+1-2*(nx > ox), oy, 0
}

;If mouse stop
If(Abs( nx - oldx ) == 0  && Abs( ny - oldy ) == 0 && isSpaceDown == True)
{

	Send, % "{blind}" ( "{Space Up}" )
	isSpaceDown := False
		
}
	oldx := nx
	oldy := ny



  return



#IfWinExist, Mouse to Keys On

	LButton::z

	MButton::x

	RButton::c

	XButton1::space

	XButton2::LAlt

#IfWinExist


F8:: ExitApp
