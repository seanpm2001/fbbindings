'' FreeBASIC binding for mingw-w64-v4.0.1
''
'' based on the C header files:
''   Copyright (C) 2004 Robert Reif
''
''   This library is free software; you can redistribute it and/or
''   modify it under the terms of the GNU Lesser General Public
''   License as published by the Free Software Foundation; either
''   version 2.1 of the License, or (at your option) any later version.
''
''   This library is distributed in the hope that it will be useful,
''   but WITHOUT ANY WARRANTY; without even the implied warranty of
''   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
''   Lesser General Public License for more details.
''
''   You should have received a copy of the GNU Lesser General Public
''   License along with this library; if not, write to the Free Software
''   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#inclib "dxerr8"

#include once "_mingw_unicode.bi"

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

#define __WINE_DXERR8_H
declare function DXGetErrorString8A(byval hr as HRESULT) as const zstring ptr
declare function DXGetErrorString8W(byval hr as HRESULT) as const wstring ptr

#ifdef UNICODE
	#define DXGetErrorString8 DXGetErrorString8W
#else
	#define DXGetErrorString8 DXGetErrorString8A
#endif

declare function DXGetErrorDescription8A(byval hr as HRESULT) as const zstring ptr
declare function DXGetErrorDescription8W(byval hr as HRESULT) as const wstring ptr

#ifdef UNICODE
	#define DXGetErrorDescription8 DXGetErrorDescription8W
#else
	#define DXGetErrorDescription8 DXGetErrorDescription8A
#endif

declare function DXTraceA(byval strFile as const zstring ptr, byval dwLine as DWORD, byval hr as HRESULT, byval strMsg as const zstring ptr, byval bPopMsgBox as WINBOOL) as HRESULT
declare function DXTraceW(byval strFile as const zstring ptr, byval dwLine as DWORD, byval hr as HRESULT, byval strMsg as const wstring ptr, byval bPopMsgBox as WINBOOL) as HRESULT

end extern
