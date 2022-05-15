#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; かなを押したときは、全角(IME OFF)
vk1C::
imeoff:
  Gosub, IMEGetstate
  If (vimestate=0) {
    Send, {vkf3}
  }
  return

; 無変換を押したときは、半角(IME ON)
vk1D::
imeon:
  Gosub, IMEGetstate
  If (vimestate=1) {
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
F13 & u::Left      ; backward char
F13 & a::HOME      ; move beginning of line
F13 & e::END       ; move end of line
F13 & d::Del       ; delete char
F13 & h::BS        ; delete backward char
F13 & m::Enter     ; newline

F13 & o::vk1C      ; CapsLockk+oで全角(IME ON)
F13 & w::vk1D      ; CapsLockk+wで半角(IME OFF)

F13 & k::F7     ; CapsLook-Kでカタカナに変換
F13 & j::F6     ; CapsLook-Jでひらがなに変換
F13 & l::F10	  ; CapsLook+lで半角ローマ字に変換
F13 & c::click	; CapsLokk+cでクリック
F13 & v::click,Right	; CapsLookで右クリック
F13 & i::-  ;CapsLokk+Iで-を入力
F13 & y::_  ;CapsLokk+Yで_を入力

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
F13 & t::,	;CapsLokk+Gで。、や,を入力

;us処理
*"::send, @
*&::send, {^}
*'::send, &
*(::send, *
*)::send, (
*+0::send, )
*=::send, _
*^::send, =
*~::send, {+}
*@::send, [
*`::send, {{}
*[::send, ]
*{::send, {}}
*]::send, \
*}::send, |
*+::send, :
**::send, {"}
*VkF4::send, {``} ; 半角/全角 -> `
+VKF4::Send,{~}    ; Shift + 半角/全角     -> ~ 