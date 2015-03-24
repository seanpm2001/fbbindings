#pragma once

#include once "SDL_stdinc.bi"
#include once "SDL_error.bi"
#include once "SDL_active.bi"
#include once "SDL_keyboard.bi"
#include once "SDL_mouse.bi"
#include once "SDL_joystick.bi"
#include once "SDL_quit.bi"
#include once "begin_code.bi"
#include once "close_code.bi"

extern "C"

#define _SDL_events_h
const SDL_RELEASED = 0
const SDL_PRESSED = 1

type SDL_EventType as long
enum
	SDL_NOEVENT = 0
	SDL_ACTIVEEVENT
	SDL_KEYDOWN
	SDL_KEYUP
	SDL_MOUSEMOTION
	SDL_MOUSEBUTTONDOWN
	SDL_MOUSEBUTTONUP
	SDL_JOYAXISMOTION
	SDL_JOYBALLMOTION
	SDL_JOYHATMOTION
	SDL_JOYBUTTONDOWN
	SDL_JOYBUTTONUP
	SDL_QUIT
	SDL_SYSWMEVENT
	SDL_EVENT_RESERVEDA
	SDL_EVENT_RESERVEDB
	SDL_VIDEORESIZE
	SDL_VIDEOEXPOSE
	SDL_EVENT_RESERVED2
	SDL_EVENT_RESERVED3
	SDL_EVENT_RESERVED4
	SDL_EVENT_RESERVED5
	SDL_EVENT_RESERVED6
	SDL_EVENT_RESERVED7
	SDL_USEREVENT = 24
	SDL_NUMEVENTS = 32
end enum

#define SDL_EVENTMASK(X) (1 shl (X))

type SDL_EventMask as long
enum
	SDL_ACTIVEEVENTMASK = 1 shl SDL_ACTIVEEVENT
	SDL_KEYDOWNMASK = 1 shl SDL_KEYDOWN
	SDL_KEYUPMASK = 1 shl SDL_KEYUP
	SDL_KEYEVENTMASK = (1 shl SDL_KEYDOWN) or (1 shl SDL_KEYUP)
	SDL_MOUSEMOTIONMASK = 1 shl SDL_MOUSEMOTION
	SDL_MOUSEBUTTONDOWNMASK = 1 shl SDL_MOUSEBUTTONDOWN
	SDL_MOUSEBUTTONUPMASK = 1 shl SDL_MOUSEBUTTONUP
	SDL_MOUSEEVENTMASK = ((1 shl SDL_MOUSEMOTION) or (1 shl SDL_MOUSEBUTTONDOWN)) or (1 shl SDL_MOUSEBUTTONUP)
	SDL_JOYAXISMOTIONMASK = 1 shl SDL_JOYAXISMOTION
	SDL_JOYBALLMOTIONMASK = 1 shl SDL_JOYBALLMOTION
	SDL_JOYHATMOTIONMASK = 1 shl SDL_JOYHATMOTION
	SDL_JOYBUTTONDOWNMASK = 1 shl SDL_JOYBUTTONDOWN
	SDL_JOYBUTTONUPMASK = 1 shl SDL_JOYBUTTONUP
	SDL_JOYEVENTMASK = ((((1 shl SDL_JOYAXISMOTION) or (1 shl SDL_JOYBALLMOTION)) or (1 shl SDL_JOYHATMOTION)) or (1 shl SDL_JOYBUTTONDOWN)) or (1 shl SDL_JOYBUTTONUP)
	SDL_VIDEORESIZEMASK = 1 shl SDL_VIDEORESIZE
	SDL_VIDEOEXPOSEMASK = 1 shl SDL_VIDEOEXPOSE
	SDL_QUITMASK = 1 shl SDL_QUIT
	SDL_SYSWMEVENTMASK = 1 shl SDL_SYSWMEVENT
end enum

const SDL_ALLEVENTS = &hFFFFFFFF

type SDL_ActiveEvent
	as Uint8 type
	gain as Uint8
	state as Uint8
end type

type SDL_KeyboardEvent
	as Uint8 type
	which as Uint8
	state as Uint8
	keysym as SDL_keysym
end type

type SDL_MouseMotionEvent
	as Uint8 type
	which as Uint8
	state as Uint8
	x as Uint16
	y as Uint16
	xrel as Sint16
	yrel as Sint16
end type

type SDL_MouseButtonEvent
	as Uint8 type
	which as Uint8
	button as Uint8
	state as Uint8
	x as Uint16
	y as Uint16
end type

type SDL_JoyAxisEvent
	as Uint8 type
	which as Uint8
	axis as Uint8
	value as Sint16
end type

type SDL_JoyBallEvent
	as Uint8 type
	which as Uint8
	ball as Uint8
	xrel as Sint16
	yrel as Sint16
end type

type SDL_JoyHatEvent
	as Uint8 type
	which as Uint8
	hat as Uint8
	value as Uint8
end type

type SDL_JoyButtonEvent
	as Uint8 type
	which as Uint8
	button as Uint8
	state as Uint8
end type

type SDL_ResizeEvent
	as Uint8 type
	w as long
	h as long
end type

type SDL_ExposeEvent
	as Uint8 type
end type

type SDL_QuitEvent
	as Uint8 type
end type

type SDL_UserEvent
	as Uint8 type
	code as long
	data1 as any ptr
	data2 as any ptr
end type

type SDL_SysWMmsg as SDL_SysWMmsg_

type SDL_SysWMEvent
	as Uint8 type
	msg as SDL_SysWMmsg ptr
end type

union SDL_Event
	as Uint8 type
	active as SDL_ActiveEvent
	key as SDL_KeyboardEvent
	motion as SDL_MouseMotionEvent
	button as SDL_MouseButtonEvent
	jaxis as SDL_JoyAxisEvent
	jball as SDL_JoyBallEvent
	jhat as SDL_JoyHatEvent
	jbutton as SDL_JoyButtonEvent
	resize as SDL_ResizeEvent
	expose as SDL_ExposeEvent
	quit as SDL_QuitEvent
	user as SDL_UserEvent
	syswm as SDL_SysWMEvent
end union

declare sub SDL_PumpEvents()

type SDL_eventaction as long
enum
	SDL_ADDEVENT
	SDL_PEEKEVENT
	SDL_GETEVENT
end enum

declare function SDL_PeepEvents(byval events as SDL_Event ptr, byval numevents as long, byval action as SDL_eventaction, byval mask as Uint32) as long
declare function SDL_PollEvent(byval event as SDL_Event ptr) as long
declare function SDL_WaitEvent(byval event as SDL_Event ptr) as long
declare function SDL_PushEvent(byval event as SDL_Event ptr) as long
type SDL_EventFilter as function(byval event as const SDL_Event ptr) as long
declare sub SDL_SetEventFilter(byval filter as SDL_EventFilter)
declare function SDL_GetEventFilter() as SDL_EventFilter

const SDL_QUERY = -1
const SDL_IGNORE = 0
const SDL_DISABLE = 0
const SDL_ENABLE = 1
declare function SDL_EventState(byval type as Uint8, byval state as long) as Uint8

end extern
