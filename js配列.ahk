#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; 無変換を押したときは、半角(IME off)
vk1C::
imeoff:
  Gosub, IMEGetstate
  If (vimestate=0) {
    Send, {vkf3}
  }
  return

; 変換を押したときは、全角(IME on)
vk1D::
imeon:
  Gosub, IMEGetstate
  If (vimestate=1) {
    Send, {vkf3}
  }
  return

; 左 Alt 空打ちで IME を OFF
LAlt up::
    Gosub, IMEGetstate
  If (vimestate= 1) {
    Send, {vkf3}
  }
  return

; 右 Alt 空打ちで IME を ON
RAlt up::
    Gosub, IMEGetstate
  If (vimestate=0) {
    Send, {vkf3}
  }
  return

IMEGetstate:
  WinGet, vcurrentwindow, ID, A
  vimestate := DllCall("user32.dll\SendMessageA", "UInt", DllCall("imm32.dll\ImmGetDefaultIMEWnd", "Uint", vcurrentwindow), "UInt", 0x0283, "Int", 0x0005, "Int", 0)
  return

F13 & f::Right     ; forward char
F13 & p::Up        ; previous line
F13 & n::Down      ; next line
F13 & b::Left      ; backward char
F13 & a::HOME      ; move beginning of line
F13 & e::END       ; move end of line
F13 & d::Del       ; delete char
F13 & h::BS        ; delete backward char
F13 & m::Enter     ; newline

vkE2::_


F13 & k::F7     ; Control-Kでカタカナに変換
F13 & j::F6     ; Control-Jでひらがなに変換
F13 & l::F10	; CapsLook+lで半角ローマ字に変換
F13 & c::click	; CapsLokk+cでクリック
F13 & v::click,Right	; CapsLookで右クリック

Ctrl & Up::MouseMove 0,-10,0,R		; Ctrl+↑で上にマウス移動
Ctrl & Down::MouseMove 0,10,0,R		; Ctrl+↓で下にマウス移動
Ctrl & Left::MouseMove -10,0,0,R	; Ctrl+←で左にマウス移動
Ctrl & Right::MouseMove 10,0,0,R	; Ctrl+→で右にマウス移動

Shift & Up::MouseMove 0,-50,0,R		; Ctrl+↑で多めに上にマウス移動
Shift & Down::MouseMove 0,50,0,R	; Ctrl+↓で多めに下にマウス移動
Shift & Left::MouseMove -50,0,0,R	; Ctrl+←で多めに左にマウス移動
Shift & Right::MouseMove 50,0,0,R	; Ctrl+→で多めに右にマウス移動
	
F13 & Space::#s  ; Control-SpaceでWindowsの検索ボックスを開く
F13 & g::.	;CapsLokk+Gで.や。を入力
F13 & t::,	;CapsLokk+Tで、や,を入力
F13 & i::-  ;CapsLokk+Iで-を入力
F13 & y::_  ;CapsLokk+Yで_を入力