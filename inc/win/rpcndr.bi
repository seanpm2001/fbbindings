#pragma once

#include once "basetsd.bi"
#include once "rpcnsip.bi"
#include once "rpcsal.bi"

'' The following symbols have been renamed:
''     typedef boolean => boolean_

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

type _MIDL_STUB_MESSAGE as _MIDL_STUB_MESSAGE_
type _MIDL_STUB_DESC as _MIDL_STUB_DESC_
type _FULL_PTR_XLAT_TABLES as _FULL_PTR_XLAT_TABLES_
type NDR_ALLOC_ALL_NODES_CONTEXT as NDR_ALLOC_ALL_NODES_CONTEXT_
type NDR_POINTER_QUEUE_STATE as NDR_POINTER_QUEUE_STATE_
type _NDR_PROC_CONTEXT as _NDR_PROC_CONTEXT_
type <error-recovery> as <error-recovery>_

#define __RPCNDR_H_VERSION__ 475
#define __RPCNDR_H__
#define NDR_CHAR_REP_MASK __MSABI_LONG(&h0000000F)
#define NDR_INT_REP_MASK __MSABI_LONG(&h000000F0)
#define NDR_FLOAT_REP_MASK __MSABI_LONG(&h0000FF00)
#define NDR_LITTLE_ENDIAN __MSABI_LONG(&h00000010)
#define NDR_BIG_ENDIAN __MSABI_LONG(&h00000000)
#define NDR_IEEE_FLOAT __MSABI_LONG(&h00000000)
#define NDR_VAX_FLOAT __MSABI_LONG(&h00000100)
#define NDR_IBM_FLOAT __MSABI_LONG(&h00000300)
#define NDR_ASCII_CHAR __MSABI_LONG(&h00000000)
#define NDR_EBCDIC_CHAR __MSABI_LONG(&h00000001)
#define NDR_LOCAL_DATA_REPRESENTATION __MSABI_LONG(&h00000010)
#define NDR_LOCAL_ENDIAN NDR_LITTLE_ENDIAN
#define TARGET_IS_NT61_OR_LATER 0
#define TARGET_IS_NT60_OR_LATER 0
#define TARGET_IS_NT51_OR_LATER 1
#define TARGET_IS_NT50_OR_LATER 1
#define TARGET_IS_NT40_OR_LATER 1
#define TARGET_IS_NT351_OR_WIN95_OR_LATER 1

type cs_byte as ubyte
type boolean_ as ubyte

#define _HYPER_DEFINED
#define hyper longint
#define MIDL_uhyper '' TODO: unsigned __int64
#define __MIDL_user_allocate_free_DEFINED__

declare function MIDL_user_allocate(byval as SIZE_T_) as any ptr
declare sub MIDL_user_free(byval as any ptr)

type NDR_CCONTEXT as any ptr

type _NDR_SCONTEXT field = 8
	pad(0 to 1) as any ptr
	userContext as any ptr
end type

type NDR_SCONTEXT as _NDR_SCONTEXT ptr

#define NDRSContextValue(hContext) (@(hContext)->userContext)
#define cbNDRContext 20

type NDR_RUNDOWN as sub(byval context as any ptr)
type NDR_NOTIFY_ROUTINE as sub()
type NDR_NOTIFY2_ROUTINE as sub(byval flag as boolean_)

type _SCONTEXT_QUEUE field = 8
	NumberOfObjects as ulong
	ArrayOfObjects as NDR_SCONTEXT ptr
end type

type SCONTEXT_QUEUE as _SCONTEXT_QUEUE
type PSCONTEXT_QUEUE as _SCONTEXT_QUEUE ptr

declare function NDRCContextBinding(byval CContext as NDR_CCONTEXT) as RPC_BINDING_HANDLE
declare sub NDRCContextMarshall(byval CContext as NDR_CCONTEXT, byval pBuff as any ptr)
declare sub NDRCContextUnmarshall(byval pCContext as NDR_CCONTEXT ptr, byval hBinding as RPC_BINDING_HANDLE, byval pBuff as any ptr, byval DataRepresentation as ulong)
declare sub NDRSContextMarshall(byval CContext as NDR_SCONTEXT, byval pBuff as any ptr, byval userRunDownIn as NDR_RUNDOWN)
declare function NDRSContextUnmarshall(byval pBuff as any ptr, byval DataRepresentation as ulong) as NDR_SCONTEXT
declare sub NDRSContextMarshallEx(byval BindingHandle as RPC_BINDING_HANDLE, byval CContext as NDR_SCONTEXT, byval pBuff as any ptr, byval userRunDownIn as NDR_RUNDOWN)
declare sub NDRSContextMarshall2(byval BindingHandle as RPC_BINDING_HANDLE, byval CContext as NDR_SCONTEXT, byval pBuff as any ptr, byval userRunDownIn as NDR_RUNDOWN, byval CtxGuard as any ptr, byval Flags as ulong)
declare function NDRSContextUnmarshallEx(byval BindingHandle as RPC_BINDING_HANDLE, byval pBuff as any ptr, byval DataRepresentation as ulong) as NDR_SCONTEXT
declare function NDRSContextUnmarshall2(byval BindingHandle as RPC_BINDING_HANDLE, byval pBuff as any ptr, byval DataRepresentation as ulong, byval CtxGuard as any ptr, byval Flags as ulong) as NDR_SCONTEXT
declare sub RpcSsDestroyClientContext(byval ContextHandle as any ptr ptr)

#macro byte_from_ndr(source, target)
	scope
		*(target)
		'' TODO: *(target) = *(*(char **)&(source)->Buffer)++;
	end scope
#endmacro
#macro byte_array_from_ndr(Source, LowerIndex, UpperIndex, Target)
	scope
		NDRcopy(cptr(zstring ptr, (Target)) + (LowerIndex), (Source)->Buffer, culng((UpperIndex) - (LowerIndex)))
		'' TODO: *(unsigned __LONG32 *)&(Source)->Buffer += ((UpperIndex)-(LowerIndex));
	end scope
#endmacro
#macro boolean_from_ndr(source, target)
	scope
		*(target)
		'' TODO: *(target) = *(*(char **)&(source)->Buffer)++;
	end scope
#endmacro
#macro boolean_array_from_ndr(Source, LowerIndex, UpperIndex, Target)
	scope
		NDRcopy(cptr(zstring ptr, (Target)) + (LowerIndex), (Source)->Buffer, culng((UpperIndex) - (LowerIndex)))
		'' TODO: *(unsigned __LONG32 *)&(Source)->Buffer += ((UpperIndex)-(LowerIndex));
	end scope
#endmacro
#macro small_from_ndr(source, target)
	scope
		*(target)
		'' TODO: *(target) = *(*(char **)&(source)->Buffer)++;
	end scope
#endmacro
#macro small_from_ndr_temp(source, target, format)
	scope
		*(target)
		'' TODO: *(target) = *(*(char **)(source))++;
	end scope
#endmacro
#macro small_array_from_ndr(Source, LowerIndex, UpperIndex, Target)
	scope
		NDRcopy(cptr(zstring ptr, (Target)) + (LowerIndex), (Source)->Buffer, culng((UpperIndex) - (LowerIndex)))
		'' TODO: *(unsigned __LONG32 *)&(Source)->Buffer += ((UpperIndex)-(LowerIndex));
	end scope
#endmacro
#define MIDL_ascii_strlen(string) strlen(string)
#define MIDL_ascii_strcpy(target, source) strcpy(target, source)
#define MIDL_memset(s, c, n) memset(s, c, n)
#define _ERROR_STATUS_T_DEFINED

type error_status_t as ulong

#define _midl_ma1(p, cast) '' TODO: *(*(cast **)&p)++
#define _midl_ma2(p, cast) '' TODO: *(*(cast **)&p)++
#define _midl_ma4(p, cast) '' TODO: *(*(cast **)&p)++
#define _midl_ma8(p, cast) '' TODO: *(*(cast **)&p)++
#define _midl_unma1(p, cast) '' TODO: *((cast *)p)++
#define _midl_unma2(p, cast) '' TODO: *((cast *)p)++
#define _midl_unma3(p, cast) '' TODO: *((cast *)p)++
#define _midl_unma4(p, cast) '' TODO: *((cast *)p)++
#define _midl_fa2(p) '' TODO: (p = (RPC_BUFPTR)((ULONG_PTR)(p+1) & ~0x1))
#define _midl_fa4(p) '' TODO: (p = (RPC_BUFPTR)((ULONG_PTR)(p+3) & ~0x3))
#define _midl_fa8(p) '' TODO: (p = (RPC_BUFPTR)((ULONG_PTR)(p+7) & ~0x7))
#define _midl_addp(p, n) '' TODO: (p += n)
#define _midl_marsh_lhs(p, cast) '' TODO: *(*(cast **)&p)++
#define _midl_marsh_up(mp, p) '' TODO: *(*(unsigned __LONG32 **)&mp)++ = (unsigned __LONG32)p
#define _midl_advmp(mp) '' TODO: *(*(unsigned __LONG32 **)&mp)++
#define _midl_unmarsh_up(p) '' TODO: (*(*(unsigned __LONG32 **)&p)++)
#define NdrMarshConfStringHdr(p, s, l) '' TODO: (_midl_ma4(p,unsigned __LONG32) = s,_midl_ma4(p,unsigned __LONG32) = 0,_midl_ma4(p,unsigned __LONG32) = l)
#define NdrUnMarshConfStringHdr(p, s, l) '' TODO: (s=_midl_unma4(p,unsigned __LONG32),(_midl_addp(p,4)),(l=_midl_unma4(p,unsigned __LONG32)))
#define NdrMarshCCtxtHdl(pc, p) '' TODO: (NDRCContextMarshall((NDR_CCONTEXT)pc,p),p+20)
#define NdrUnMarshCCtxtHdl(pc, p, h, drep) '' TODO: (NDRCContextUnmarshall((NDR_CCONTEXT)pc,h,p,drep),p+20)
#define NdrUnMarshSCtxtHdl(pc, p, drep) '' TODO: (pc = NdrSContextUnMarshall(p,drep))
#define NdrMarshSCtxtHdl(pc, p, rd) NdrSContextMarshall(cast(NDR_SCONTEXT, pc), p, cast(NDR_RUNDOWN, rd))
#define NdrFieldOffset(s, f) cast(LONG_PTR, @cptr(s ptr, 0)->f)
#define NdrFieldPad(s, f, p, t) '' TODO: ((unsigned __LONG32)(NdrFieldOffset(s,f) - NdrFieldOffset(s,p)) - sizeof(t))
#define NdrFcShort(s) '' TODO: (unsigned char)(s & 0xff),(unsigned char)(s >> 8)
#define NdrFcLong(s) '' TODO: (unsigned char)(s & 0xff),(unsigned char)((s & 0x0000ff00) >> 8),(unsigned char)((s & 0x00ff0000) >> 16),(unsigned char)(s >> 24)
#define RPC_BAD_STUB_DATA_EXCEPTION_FILTER ((((RpcExceptionCode() = STATUS_ACCESS_VIOLATION) orelse (RpcExceptionCode() = STATUS_DATATYPE_MISALIGNMENT)) orelse (RpcExceptionCode() = RPC_X_BAD_STUB_DATA)) orelse (RpcExceptionCode() = RPC_S_INVALID_BOUND))

type RPC_BUFPTR as ubyte ptr
type RPC_LENGTH as ulong
type EXPR_EVAL as sub(byval as _MIDL_STUB_MESSAGE ptr)
type PFORMAT_STRING as const ubyte ptr

type ARRAY_INFO field = 8
	Dimension as long
	BufferConformanceMark as ulong ptr
	BufferVarianceMark as ulong ptr
	MaxCountArray as ulong ptr
	OffsetArray as ulong ptr
	ActualCountArray as ulong ptr
end type

type PARRAY_INFO as ARRAY_INFO ptr
type PNDR_ASYNC_MESSAGE as _NDR_ASYNC_MESSAGE ptr
type PNDR_CORRELATION_INFO as _NDR_CORRELATION_INFO ptr

type CS_STUB_INFO field = 8
	WireCodeset as ulong
	DesiredReceivingCodeset as ulong
	CSArrayInfo as any ptr
end type

type MIDL_SYNTAX_INFO as _MIDL_SYNTAX_INFO
type PMIDL_SYNTAX_INFO as _MIDL_SYNTAX_INFO ptr

type _MIDL_STUB_MESSAGE_ field = 8
	RpcMsg as PRPC_MESSAGE
	Buffer as ubyte ptr
	BufferStart as ubyte ptr
	BufferEnd as ubyte ptr
	BufferMark as ubyte ptr
	BufferLength as ulong
	MemorySize as ulong
	Memory as ubyte ptr
	IsClient as ubyte
	Pad as ubyte
	uFlags2 as ushort
	ReuseBuffer as long
	pAllocAllNodesContext as NDR_ALLOC_ALL_NODES_CONTEXT ptr
	pPointerQueueState as NDR_POINTER_QUEUE_STATE ptr
	IgnoreEmbeddedPointers as long
	PointerBufferMark as ubyte ptr
	fBufferValid as ubyte
	uFlags as ubyte
	UniquePtrCount as ushort
	MaxCount as ULONG_PTR
	Offset as ulong
	ActualCount as ulong
	pfnAllocate as function(byval as uinteger) as any ptr
	pfnFree as sub(byval as any ptr)
	StackTop as ubyte ptr
	pPresentedType as ubyte ptr
	pTransmitType as ubyte ptr
	SavedHandle as handle_t
	StubDesc as const _MIDL_STUB_DESC ptr
	FullPtrXlatTables as _FULL_PTR_XLAT_TABLES ptr
	FullPtrRefId as ulong
	PointerLength as ulong
	fInDontFree : 1 as long
	fDontCallFreeInst : 1 as long
	fInOnlyParam : 1 as long
	fHasReturn : 1 as long
	fHasExtensions : 1 as long
	fHasNewCorrDesc : 1 as long
	fIsOicfServer : 1 as long
	fHasMemoryValidateCallback : 1 as long
	fUnused : 8 as long
	fUnused2 : 16 as long
	dwDestContext as ulong
	pvDestContext as any ptr
	SavedContextHandles as NDR_SCONTEXT ptr
	ParamNumber as long
	pRpcChannelBuffer as IRpcChannelBuffer ptr
	pArrayInfo as PARRAY_INFO
	SizePtrCountArray as ulong ptr
	SizePtrOffsetArray as ulong ptr
	SizePtrLengthArray as ulong ptr
	pArgQueue as any ptr
	dwStubPhase as ulong
	LowStackMark as any ptr
	pAsyncMsg as PNDR_ASYNC_MESSAGE
	pCorrInfo as PNDR_CORRELATION_INFO
	pCorrMemory as ubyte ptr
	pMemoryList as any ptr
	pCSInfo as CS_STUB_INFO ptr
	ConformanceMark as ubyte ptr
	VarianceMark as ubyte ptr
	Unused as INT_PTR
	pContext as _NDR_PROC_CONTEXT ptr
	pUserMarshalList as any ptr
	Reserved51_2 as INT_PTR
	Reserved51_3 as INT_PTR
	Reserved51_4 as INT_PTR
	Reserved51_5 as INT_PTR
end type

type MIDL_STUB_MESSAGE as _MIDL_STUB_MESSAGE
type PMIDL_STUB_MESSAGE as _MIDL_STUB_MESSAGE ptr
type GENERIC_BINDING_ROUTINE as function(byval as any ptr) as any ptr
type GENERIC_UNBIND_ROUTINE as sub(byval as any ptr, byval as ubyte ptr)

type _GENERIC_BINDING_ROUTINE_PAIR field = 8
	pfnBind as GENERIC_BINDING_ROUTINE
	pfnUnbind as GENERIC_UNBIND_ROUTINE
end type

type GENERIC_BINDING_ROUTINE_PAIR as _GENERIC_BINDING_ROUTINE_PAIR
type PGENERIC_BINDING_ROUTINE_PAIR as _GENERIC_BINDING_ROUTINE_PAIR ptr

type __GENERIC_BINDING_INFO field = 8
	pObj as any ptr
	Size as ulong
	pfnBind as GENERIC_BINDING_ROUTINE
	pfnUnbind as GENERIC_UNBIND_ROUTINE
end type

type GENERIC_BINDING_INFO as __GENERIC_BINDING_INFO
type PGENERIC_BINDING_INFO as __GENERIC_BINDING_INFO ptr

#define NDR_SHAREABLE '' TODO: __inline

type XMIT_HELPER_ROUTINE as sub(byval as PMIDL_STUB_MESSAGE)

type _XMIT_ROUTINE_QUINTUPLE field = 8
	pfnTranslateToXmit as XMIT_HELPER_ROUTINE
	pfnTranslateFromXmit as XMIT_HELPER_ROUTINE
	pfnFreeXmit as XMIT_HELPER_ROUTINE
	pfnFreeInst as XMIT_HELPER_ROUTINE
end type

type XMIT_ROUTINE_QUINTUPLE as _XMIT_ROUTINE_QUINTUPLE
type PXMIT_ROUTINE_QUINTUPLE as _XMIT_ROUTINE_QUINTUPLE ptr
type USER_MARSHAL_SIZING_ROUTINE as function(byval as ULONG ptr, byval as ULONG, byval as any ptr) as ULONG
type USER_MARSHAL_MARSHALLING_ROUTINE as function(byval as ULONG ptr, byval as ubyte ptr, byval as any ptr) as ubyte ptr
type USER_MARSHAL_UNMARSHALLING_ROUTINE as function(byval as ULONG ptr, byval as ubyte ptr, byval as any ptr) as ubyte ptr
type USER_MARSHAL_FREEING_ROUTINE as sub(byval as ULONG ptr, byval as any ptr)

type _USER_MARSHAL_ROUTINE_QUADRUPLE field = 8
	pfnBufferSize as USER_MARSHAL_SIZING_ROUTINE
	pfnMarshall as USER_MARSHAL_MARSHALLING_ROUTINE
	pfnUnmarshall as USER_MARSHAL_UNMARSHALLING_ROUTINE
	pfnFree as USER_MARSHAL_FREEING_ROUTINE
end type

type USER_MARSHAL_ROUTINE_QUADRUPLE as _USER_MARSHAL_ROUTINE_QUADRUPLE

#define USER_MARSHAL_CB_SIGNATURE asc("USRC")

type _USER_MARSHAL_CB_TYPE as long
enum
	USER_MARSHAL_CB_BUFFER_SIZE
	USER_MARSHAL_CB_MARSHALL
	USER_MARSHAL_CB_UNMARSHALL
	USER_MARSHAL_CB_FREE
end enum

type USER_MARSHAL_CB_TYPE as _USER_MARSHAL_CB_TYPE

type _USER_MARSHAL_CB field = 8
	Flags as ulong
	pStubMsg as PMIDL_STUB_MESSAGE
	pReserve as PFORMAT_STRING
	Signature as ulong
	CBType as USER_MARSHAL_CB_TYPE
	pFormat as PFORMAT_STRING
	pTypeFormat as PFORMAT_STRING
end type

type USER_MARSHAL_CB as _USER_MARSHAL_CB

#define USER_CALL_CTXT_MASK(f) ((f) and &h00ff)
#define USER_CALL_AUX_MASK(f) ((f) and &hff00)
#define GET_USER_DATA_REP(f) ((f) shr 16)
#define USER_CALL_IS_ASYNC &h0100
#define USER_CALL_NEW_CORRELATION_DESC &h0200

type _MALLOC_FREE_STRUCT field = 8
	pfnAllocate as function(byval as uinteger) as any ptr
	pfnFree as sub(byval as any ptr)
end type

type MALLOC_FREE_STRUCT as _MALLOC_FREE_STRUCT

type _COMM_FAULT_OFFSETS field = 8
	CommOffset as short
	FaultOffset as short
end type

type COMM_FAULT_OFFSETS as _COMM_FAULT_OFFSETS

type _IDL_CS_CONVERT as long
enum
	IDL_CS_NO_CONVERT
	IDL_CS_IN_PLACE_CONVERT
	IDL_CS_NEW_BUFFER_CONVERT
end enum

type IDL_CS_CONVERT as _IDL_CS_CONVERT
type CS_TYPE_NET_SIZE_ROUTINE as sub(byval hBinding as RPC_BINDING_HANDLE, byval ulNetworkCodeSet as ulong, byval ulLocalBufferSize as ulong, byval conversionType as IDL_CS_CONVERT ptr, byval pulNetworkBufferSize as ulong ptr, byval pStatus as error_status_t ptr)
type CS_TYPE_LOCAL_SIZE_ROUTINE as sub(byval hBinding as RPC_BINDING_HANDLE, byval ulNetworkCodeSet as ulong, byval ulNetworkBufferSize as ulong, byval conversionType as IDL_CS_CONVERT ptr, byval pulLocalBufferSize as ulong ptr, byval pStatus as error_status_t ptr)
type CS_TYPE_TO_NETCS_ROUTINE as sub(byval hBinding as RPC_BINDING_HANDLE, byval ulNetworkCodeSet as ulong, byval pLocalData as any ptr, byval ulLocalDataLength as ulong, byval pNetworkData as ubyte ptr, byval pulNetworkDataLength as ulong ptr, byval pStatus as error_status_t ptr)
type CS_TYPE_FROM_NETCS_ROUTINE as sub(byval hBinding as RPC_BINDING_HANDLE, byval ulNetworkCodeSet as ulong, byval pNetworkData as ubyte ptr, byval ulNetworkDataLength as ulong, byval ulLocalBufferSize as ulong, byval pLocalData as any ptr, byval pulLocalDataLength as ulong ptr, byval pStatus as error_status_t ptr)
type CS_TAG_GETTING_ROUTINE as sub(byval hBinding as RPC_BINDING_HANDLE, byval fServerSide as long, byval pulSendingTag as ulong ptr, byval pulDesiredReceivingTag as ulong ptr, byval pulReceivingTag as ulong ptr, byval pStatus as error_status_t ptr)

declare sub RpcCsGetTags(byval hBinding as RPC_BINDING_HANDLE, byval fServerSide as long, byval pulSendingTag as ulong ptr, byval pulDesiredReceivingTag as ulong ptr, byval pulReceivingTag as ulong ptr, byval pStatus as error_status_t ptr)

type _NDR_CS_SIZE_CONVERT_ROUTINES field = 8
	pfnNetSize as CS_TYPE_NET_SIZE_ROUTINE
	pfnToNetCs as CS_TYPE_TO_NETCS_ROUTINE
	pfnLocalSize as CS_TYPE_LOCAL_SIZE_ROUTINE
	pfnFromNetCs as CS_TYPE_FROM_NETCS_ROUTINE
end type

type NDR_CS_SIZE_CONVERT_ROUTINES as _NDR_CS_SIZE_CONVERT_ROUTINES

type _NDR_CS_ROUTINES field = 8
	pSizeConvertRoutines as NDR_CS_SIZE_CONVERT_ROUTINES ptr
	pTagGettingRoutines as CS_TAG_GETTING_ROUTINE ptr
end type

type NDR_CS_ROUTINES as _NDR_CS_ROUTINES

union ___MIDL_STUB_DESC_IMPLICIT_HANDLE_INFO field = 8
	pAutoHandle as handle_t ptr
	pPrimitiveHandle as handle_t ptr
	pGenericBindingInfo as PGENERIC_BINDING_INFO
end union

type _MIDL_STUB_DESC_ field = 8
	RpcInterfaceInformation as any ptr
	pfnAllocate as function(byval as uinteger) as any ptr
	pfnFree as sub(byval as any ptr)
	IMPLICIT_HANDLE_INFO as ___MIDL_STUB_DESC_IMPLICIT_HANDLE_INFO
	apfnNdrRundownRoutines as const NDR_RUNDOWN ptr
	aGenericBindingRoutinePairs as const GENERIC_BINDING_ROUTINE_PAIR ptr
	apfnExprEval as const EXPR_EVAL ptr
	aXmitQuintuple as const XMIT_ROUTINE_QUINTUPLE ptr
	pFormatTypes as const ubyte ptr
	fCheckBounds as long
	Version as ulong
	pMallocFreeStruct as MALLOC_FREE_STRUCT ptr
	MIDLVersion as long
	CommFaultOffsets as const COMM_FAULT_OFFSETS ptr
	aUserMarshalQuadruple as const USER_MARSHAL_ROUTINE_QUADRUPLE ptr
	NotifyRoutineTable as const NDR_NOTIFY_ROUTINE ptr
	mFlags as ULONG_PTR
	CsRoutineTables as const NDR_CS_ROUTINES ptr
	Reserved4 as any ptr
	Reserved5 as ULONG_PTR
end type

type MIDL_STUB_DESC as _MIDL_STUB_DESC
type PMIDL_STUB_DESC as const MIDL_STUB_DESC ptr
type PMIDL_XMIT_TYPE as any ptr

type _MIDL_FORMAT_STRING field = 8
	Pad as short
	Format(0 to ...) as ubyte
end type

type MIDL_FORMAT_STRING as _MIDL_FORMAT_STRING
type STUB_THUNK as sub(byval as PMIDL_STUB_MESSAGE)
type SERVER_ROUTINE as function() as long

type _MIDL_SERVER_INFO_ field = 8
	pStubDesc as PMIDL_STUB_DESC
	DispatchTable as const SERVER_ROUTINE ptr
	ProcString as PFORMAT_STRING
	FmtStringOffset as const ushort ptr
	ThunkTable as const STUB_THUNK ptr
	pTransferSyntax as PRPC_SYNTAX_IDENTIFIER
	nCount as ULONG_PTR
	pSyntaxInfo as PMIDL_SYNTAX_INFO
end type

type MIDL_SERVER_INFO as _MIDL_SERVER_INFO_
type PMIDL_SERVER_INFO as _MIDL_SERVER_INFO_ ptr

type _MIDL_STUBLESS_PROXY_INFO field = 8
	pStubDesc as PMIDL_STUB_DESC
	ProcFormatString as PFORMAT_STRING
	FormatStringOffset as const ushort ptr
	pTransferSyntax as PRPC_SYNTAX_IDENTIFIER
	nCount as ULONG_PTR
	pSyntaxInfo as PMIDL_SYNTAX_INFO
end type

type MIDL_STUBLESS_PROXY_INFO as _MIDL_STUBLESS_PROXY_INFO
type PMIDL_STUBLESS_PROXY_INFO as MIDL_STUBLESS_PROXY_INFO ptr

type _MIDL_SYNTAX_INFO field = 8
	TransferSyntax as RPC_SYNTAX_IDENTIFIER
	DispatchTable as RPC_DISPATCH_TABLE ptr
	ProcString as PFORMAT_STRING
	FmtStringOffset as const ushort ptr
	TypeString as PFORMAT_STRING
	aUserMarshalQuadruple as const any ptr
	pReserved1 as ULONG_PTR
	pReserved2 as ULONG_PTR
end type

type PARAM_OFFSETTABLE as ushort ptr
type PPARAM_OFFSETTABLE as ushort ptr

union _CLIENT_CALL_RETURN field = 8
	Pointer as any ptr
	Simple as LONG_PTR
end union

type CLIENT_CALL_RETURN as _CLIENT_CALL_RETURN

type XLAT_SIDE as long
enum
	XLAT_SERVER = 1
	XLAT_CLIENT
end enum

type _FULL_PTR_TO_REFID_ELEMENT field = 8
	Next as _FULL_PTR_TO_REFID_ELEMENT ptr
	Pointer as any ptr
	RefId as ulong
	State as ubyte
end type

type FULL_PTR_TO_REFID_ELEMENT as _FULL_PTR_TO_REFID_ELEMENT
type PFULL_PTR_TO_REFID_ELEMENT as _FULL_PTR_TO_REFID_ELEMENT ptr

type ___FULL_PTR_XLAT_TABLES_RefIdToPointer field = 8
	XlatTable as any ptr ptr
	StateTable as ubyte ptr
	NumberOfEntries as ulong
end type

type ___FULL_PTR_XLAT_TABLES_PointerToRefId field = 8
	XlatTable as PFULL_PTR_TO_REFID_ELEMENT ptr
	NumberOfBuckets as ulong
	HashMask as ulong
end type

type _FULL_PTR_XLAT_TABLES_ field = 8
	RefIdToPointer as ___FULL_PTR_XLAT_TABLES_RefIdToPointer
	PointerToRefId as ___FULL_PTR_XLAT_TABLES_PointerToRefId
	NextRefId as ulong
	XlatSide as XLAT_SIDE
end type

type FULL_PTR_XLAT_TABLES as _FULL_PTR_XLAT_TABLES
type PFULL_PTR_XLAT_TABLES as _FULL_PTR_XLAT_TABLES ptr

declare function NdrClientGetSupportedSyntaxes(byval pInf as RPC_CLIENT_INTERFACE ptr, byval pCount as ulong ptr, byval pArr as MIDL_SYNTAX_INFO ptr ptr) as RPC_STATUS
declare function NdrServerGetSupportedSyntaxes(byval pInf as RPC_SERVER_INTERFACE ptr, byval pCount as ulong ptr, byval pArr as MIDL_SYNTAX_INFO ptr ptr, byval pPreferSyntaxIndex as ulong ptr) as RPC_STATUS
declare sub NdrSimpleTypeMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval FormatChar as ubyte)
declare function NdrPointerMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING) as ubyte ptr
declare function NdrCsArrayMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING) as ubyte ptr
declare function NdrCsTagMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING) as ubyte ptr
declare function NdrSimpleStructMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING) as ubyte ptr
declare function NdrConformantStructMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING) as ubyte ptr
declare function NdrConformantVaryingStructMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING) as ubyte ptr
declare function NdrComplexStructMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING) as ubyte ptr
declare function NdrFixedArrayMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING) as ubyte ptr
declare function NdrConformantArrayMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING) as ubyte ptr
declare function NdrConformantVaryingArrayMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING) as ubyte ptr
declare function NdrVaryingArrayMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING) as ubyte ptr
declare function NdrComplexArrayMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING) as ubyte ptr
declare function NdrNonConformantStringMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING) as ubyte ptr
declare function NdrConformantStringMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING) as ubyte ptr
declare function NdrEncapsulatedUnionMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING) as ubyte ptr
declare function NdrNonEncapsulatedUnionMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING) as ubyte ptr
declare function NdrByteCountPointerMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING) as ubyte ptr
declare function NdrXmitOrRepAsMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING) as ubyte ptr
declare function NdrUserMarshalMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING) as ubyte ptr
declare function NdrInterfacePointerMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING) as ubyte ptr
declare sub NdrClientContextMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ContextHandle as NDR_CCONTEXT, byval fCheck as long)
declare sub NdrServerContextMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ContextHandle as NDR_SCONTEXT, byval RundownRoutine as NDR_RUNDOWN)
declare sub NdrServerContextNewMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ContextHandle as NDR_SCONTEXT, byval RundownRoutine as NDR_RUNDOWN, byval pFormat as PFORMAT_STRING)
declare sub NdrSimpleTypeUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval FormatChar as ubyte)
declare function NdrCsArrayUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare function NdrCsTagUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare function NdrRangeUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare sub NdrCorrelationInitialize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as any ptr, byval CacheSize as ulong, byval flags as ulong)
declare sub NdrCorrelationPass(byval pStubMsg as PMIDL_STUB_MESSAGE)
declare sub NdrCorrelationFree(byval pStubMsg as PMIDL_STUB_MESSAGE)
declare function NdrPointerUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare function NdrSimpleStructUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare function NdrConformantStructUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare function NdrConformantVaryingStructUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare function NdrComplexStructUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare function NdrFixedArrayUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare function NdrConformantArrayUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare function NdrConformantVaryingArrayUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare function NdrVaryingArrayUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare function NdrComplexArrayUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare function NdrNonConformantStringUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare function NdrConformantStringUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare function NdrEncapsulatedUnionUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare function NdrNonEncapsulatedUnionUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare function NdrByteCountPointerUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare function NdrXmitOrRepAsUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare function NdrUserMarshalUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare function NdrInterfacePointerUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as ubyte ptr ptr, byval pFormat as PFORMAT_STRING, byval fMustAlloc as ubyte) as ubyte ptr
declare sub NdrClientContextUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pContextHandle as NDR_CCONTEXT ptr, byval BindHandle as RPC_BINDING_HANDLE)
declare function NdrServerContextUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE) as NDR_SCONTEXT
declare function NdrContextHandleInitialize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as NDR_SCONTEXT
declare function NdrServerContextNewUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as NDR_SCONTEXT
declare sub NdrPointerBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrCsArrayBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrCsTagBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrSimpleStructBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrConformantStructBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrConformantVaryingStructBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrComplexStructBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrFixedArrayBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrConformantArrayBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrConformantVaryingArrayBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrVaryingArrayBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrComplexArrayBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrConformantStringBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrNonConformantStringBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrEncapsulatedUnionBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrNonEncapsulatedUnionBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrByteCountPointerBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrXmitOrRepAsBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrUserMarshalBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrInterfacePointerBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrContextHandleSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare function NdrPointerMemorySize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as ulong
declare function NdrCsArrayMemorySize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as ulong
declare function NdrCsTagMemorySize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as ulong
declare function NdrSimpleStructMemorySize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as ulong
declare function NdrConformantStructMemorySize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as ulong
declare function NdrConformantVaryingStructMemorySize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as ulong
declare function NdrComplexStructMemorySize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as ulong
declare function NdrFixedArrayMemorySize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as ulong
declare function NdrConformantArrayMemorySize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as ulong
declare function NdrConformantVaryingArrayMemorySize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as ulong
declare function NdrVaryingArrayMemorySize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as ulong
declare function NdrComplexArrayMemorySize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as ulong
declare function NdrConformantStringMemorySize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as ulong
declare function NdrNonConformantStringMemorySize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as ulong
declare function NdrEncapsulatedUnionMemorySize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as ulong
declare function NdrNonEncapsulatedUnionMemorySize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as ulong
declare function NdrXmitOrRepAsMemorySize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as ulong
declare function NdrUserMarshalMemorySize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as ulong
declare function NdrInterfacePointerMemorySize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING) as ulong
declare sub NdrPointerFree(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrCsArrayFree(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrSimpleStructFree(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrConformantStructFree(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrConformantVaryingStructFree(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrComplexStructFree(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrFixedArrayFree(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrConformantArrayFree(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrConformantVaryingArrayFree(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrVaryingArrayFree(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrComplexArrayFree(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrEncapsulatedUnionFree(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrNonEncapsulatedUnionFree(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrByteCountPointerFree(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrXmitOrRepAsFree(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrUserMarshalFree(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrInterfacePointerFree(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval pFormat as PFORMAT_STRING)
declare sub NdrConvert2(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING, byval NumberParams as long)
declare sub NdrConvert(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING)

#define USER_MARSHAL_FC_BYTE 1
#define USER_MARSHAL_FC_CHAR 2
#define USER_MARSHAL_FC_SMALL 3
#define USER_MARSHAL_FC_USMALL 4
#define USER_MARSHAL_FC_WCHAR 5
#define USER_MARSHAL_FC_SHORT 6
#define USER_MARSHAL_FC_USHORT 7
#define USER_MARSHAL_FC_LONG 8
#define USER_MARSHAL_FC_ULONG 9
#define USER_MARSHAL_FC_FLOAT 10
#define USER_MARSHAL_FC_HYPER 11
#define USER_MARSHAL_FC_DOUBLE 12

declare function NdrUserMarshalSimpleTypeConvert(byval pFlags as ulong ptr, byval pBuffer as ubyte ptr, byval FormatChar as ubyte) as ubyte ptr
declare sub NdrClientInitializeNew(byval pRpcMsg as PRPC_MESSAGE, byval pStubMsg as PMIDL_STUB_MESSAGE, byval pStubDescriptor as PMIDL_STUB_DESC, byval ProcNum as ulong)
declare function NdrServerInitializeNew(byval pRpcMsg as PRPC_MESSAGE, byval pStubMsg as PMIDL_STUB_MESSAGE, byval pStubDescriptor as PMIDL_STUB_DESC) as ubyte ptr
declare sub NdrServerInitializePartial(byval pRpcMsg as PRPC_MESSAGE, byval pStubMsg as PMIDL_STUB_MESSAGE, byval pStubDescriptor as PMIDL_STUB_DESC, byval RequestedBufferSize as ulong)
declare sub NdrClientInitialize(byval pRpcMsg as PRPC_MESSAGE, byval pStubMsg as PMIDL_STUB_MESSAGE, byval pStubDescriptor as PMIDL_STUB_DESC, byval ProcNum as ulong)
declare function NdrServerInitialize(byval pRpcMsg as PRPC_MESSAGE, byval pStubMsg as PMIDL_STUB_MESSAGE, byval pStubDescriptor as PMIDL_STUB_DESC) as ubyte ptr
declare function NdrServerInitializeUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pStubDescriptor as PMIDL_STUB_DESC, byval pRpcMsg as PRPC_MESSAGE) as ubyte ptr
declare sub NdrServerInitializeMarshall(byval pRpcMsg as PRPC_MESSAGE, byval pStubMsg as PMIDL_STUB_MESSAGE)
declare function NdrGetBuffer(byval pStubMsg as PMIDL_STUB_MESSAGE, byval BufferLength as ulong, byval Handle as RPC_BINDING_HANDLE) as ubyte ptr
declare function NdrNsGetBuffer(byval pStubMsg as PMIDL_STUB_MESSAGE, byval BufferLength as ulong, byval Handle as RPC_BINDING_HANDLE) as ubyte ptr
declare function NdrSendReceive(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pBufferEnd as ubyte ptr) as ubyte ptr
declare function NdrNsSendReceive(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pBufferEnd as ubyte ptr, byval pAutoHandle as RPC_BINDING_HANDLE ptr) as ubyte ptr
declare sub NdrFreeBuffer(byval pStubMsg as PMIDL_STUB_MESSAGE)
declare function NdrGetDcomProtocolVersion(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pVersion as RPC_VERSION ptr) as RPC_STATUS
declare function NdrClientCall2 cdecl(byval pStubDescriptor as PMIDL_STUB_DESC, byval pFormat as PFORMAT_STRING, ...) as CLIENT_CALL_RETURN
declare function NdrClientCall cdecl(byval pStubDescriptor as PMIDL_STUB_DESC, byval pFormat as PFORMAT_STRING, ...) as CLIENT_CALL_RETURN
declare function NdrAsyncClientCall cdecl(byval pStubDescriptor as PMIDL_STUB_DESC, byval pFormat as PFORMAT_STRING, ...) as CLIENT_CALL_RETURN
declare function NdrDcomAsyncClientCall cdecl(byval pStubDescriptor as PMIDL_STUB_DESC, byval pFormat as PFORMAT_STRING, ...) as CLIENT_CALL_RETURN

type STUB_PHASE as long
enum
	STUB_UNMARSHAL
	STUB_CALL_SERVER
	STUB_MARSHAL
	STUB_CALL_SERVER_NO_HRESULT
end enum

type PROXY_PHASE as long
enum
	PROXY_CALCSIZE
	PROXY_GETBUFFER
	PROXY_MARSHAL
	PROXY_SENDRECEIVE
	PROXY_UNMARSHAL
end enum

declare sub NdrAsyncServerCall(byval pRpcMsg as PRPC_MESSAGE)
declare function NdrAsyncStubCall(byval pThis as IRpcStubBuffer ptr, byval pChannel as IRpcChannelBuffer ptr, byval pRpcMsg as PRPC_MESSAGE, byval pdwStubPhase as ulong ptr) as long
declare function NdrDcomAsyncStubCall(byval pThis as IRpcStubBuffer ptr, byval pChannel as IRpcChannelBuffer ptr, byval pRpcMsg as PRPC_MESSAGE, byval pdwStubPhase as ulong ptr) as long
declare function NdrStubCall2(byval pThis as IRpcStubBuffer ptr, byval pChannel as IRpcChannelBuffer ptr, byval pRpcMsg as PRPC_MESSAGE, byval pdwStubPhase as ulong ptr) as long
declare sub NdrServerCall2(byval pRpcMsg as PRPC_MESSAGE)
declare function NdrStubCall(byval pThis as IRpcStubBuffer ptr, byval pChannel as IRpcChannelBuffer ptr, byval pRpcMsg as PRPC_MESSAGE, byval pdwStubPhase as ulong ptr) as long
declare sub NdrServerCall(byval pRpcMsg as PRPC_MESSAGE)
declare function NdrServerUnmarshall(byval pChannel as IRpcChannelBuffer ptr, byval pRpcMsg as PRPC_MESSAGE, byval pStubMsg as PMIDL_STUB_MESSAGE, byval pStubDescriptor as PMIDL_STUB_DESC, byval pFormat as PFORMAT_STRING, byval pParamList as any ptr) as long
declare sub NdrServerMarshall(byval pThis as IRpcStubBuffer ptr, byval pChannel as IRpcChannelBuffer ptr, byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING)
declare function NdrMapCommAndFaultStatus(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pCommStatus as ulong ptr, byval pFaultStatus as ulong ptr, byval Status as RPC_STATUS) as RPC_STATUS
declare function NdrSH_UPDecision(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pPtrInMem as ubyte ptr ptr, byval pBuffer as RPC_BUFPTR) as long
declare function NdrSH_TLUPDecision(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pPtrInMem as ubyte ptr ptr) as long
declare function NdrSH_TLUPDecisionBuffer(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pPtrInMem as ubyte ptr ptr) as long
declare function NdrSH_IfAlloc(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pPtrInMem as ubyte ptr ptr, byval Count as ulong) as long
declare function NdrSH_IfAllocRef(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pPtrInMem as ubyte ptr ptr, byval Count as ulong) as long
declare function NdrSH_IfAllocSet(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pPtrInMem as ubyte ptr ptr, byval Count as ulong) as long
declare function NdrSH_IfCopy(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pPtrInMem as ubyte ptr ptr, byval Count as ulong) as RPC_BUFPTR
declare function NdrSH_IfAllocCopy(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pPtrInMem as ubyte ptr ptr, byval Count as ulong) as RPC_BUFPTR
declare function NdrSH_Copy(byval pStubMsg as ubyte ptr, byval pPtrInMem as ubyte ptr, byval Count as ulong) as ulong
declare sub NdrSH_IfFree(byval pMessage as PMIDL_STUB_MESSAGE, byval pPtr as ubyte ptr)
declare function NdrSH_StringMarshall(byval pMessage as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr, byval Count as ulong, byval Size as long) as RPC_BUFPTR
declare function NdrSH_StringUnMarshall(byval pMessage as PMIDL_STUB_MESSAGE, byval pMemory as ubyte ptr ptr, byval Size as long) as RPC_BUFPTR

type RPC_SS_THREAD_HANDLE as any ptr

declare function RpcSsAllocate(byval Size as uinteger) as any ptr
declare sub RpcSsDisableAllocate()
declare sub RpcSsEnableAllocate()
declare sub RpcSsFree(byval NodeToFree as any ptr)
declare function RpcSsGetThreadHandle() as RPC_SS_THREAD_HANDLE
declare sub RpcSsSetClientAllocFree(byval ClientAlloc as function(byval Size as uinteger) as any ptr, byval ClientFree as sub(byval Ptr_ as any ptr))
declare sub RpcSsSetThreadHandle(byval Id as RPC_SS_THREAD_HANDLE)
declare sub RpcSsSwapClientAllocFree(byval ClientAlloc as function(byval Size as uinteger) as any ptr, byval ClientFree as sub(byval Ptr_ as any ptr), byval OldClientAlloc as typeof(function(byval Size as uinteger) as any ptr) ptr, byval OldClientFree as typeof(sub(byval Ptr_ as any ptr)) ptr)
declare function RpcSmAllocate(byval Size as uinteger, byval pStatus as RPC_STATUS ptr) as any ptr
declare function RpcSmClientFree(byval pNodeToFree as any ptr) as RPC_STATUS
declare function RpcSmDestroyClientContext(byval ContextHandle as any ptr ptr) as RPC_STATUS
declare function RpcSmDisableAllocate() as RPC_STATUS
declare function RpcSmEnableAllocate() as RPC_STATUS
declare function RpcSmFree(byval NodeToFree as any ptr) as RPC_STATUS
declare function RpcSmGetThreadHandle(byval pStatus as RPC_STATUS ptr) as RPC_SS_THREAD_HANDLE
declare function RpcSmSetClientAllocFree(byval ClientAlloc as function(byval Size as uinteger) as any ptr, byval ClientFree as sub(byval Ptr_ as any ptr)) as RPC_STATUS
declare function RpcSmSetThreadHandle(byval Id as RPC_SS_THREAD_HANDLE) as RPC_STATUS
declare function RpcSmSwapClientAllocFree(byval ClientAlloc as function(byval Size as uinteger) as any ptr, byval ClientFree as sub(byval Ptr_ as any ptr), byval OldClientAlloc as typeof(function(byval Size as uinteger) as any ptr) ptr, byval OldClientFree as typeof(sub(byval Ptr_ as any ptr)) ptr) as RPC_STATUS
declare sub NdrRpcSsEnableAllocate(byval pMessage as PMIDL_STUB_MESSAGE)
declare sub NdrRpcSsDisableAllocate(byval pMessage as PMIDL_STUB_MESSAGE)
declare sub NdrRpcSmSetClientToOsf(byval pMessage as PMIDL_STUB_MESSAGE)
declare function NdrRpcSmClientAllocate(byval Size as uinteger) as any ptr
declare sub NdrRpcSmClientFree(byval NodeToFree as any ptr)
declare function NdrRpcSsDefaultAllocate(byval Size as uinteger) as any ptr
declare sub NdrRpcSsDefaultFree(byval NodeToFree as any ptr)
declare function NdrFullPointerXlatInit(byval NumberOfPointers as ulong, byval XlatSide as XLAT_SIDE) as PFULL_PTR_XLAT_TABLES
declare sub NdrFullPointerXlatFree(byval pXlatTables as PFULL_PTR_XLAT_TABLES)
declare function NdrFullPointerQueryPointer(byval pXlatTables as PFULL_PTR_XLAT_TABLES, byval pPointer as any ptr, byval QueryType as ubyte, byval pRefId as ulong ptr) as long
declare function NdrFullPointerQueryRefId(byval pXlatTables as PFULL_PTR_XLAT_TABLES, byval RefId as ulong, byval QueryType as ubyte, byval ppPointer as any ptr ptr) as long
declare sub NdrFullPointerInsertRefId(byval pXlatTables as PFULL_PTR_XLAT_TABLES, byval RefId as ulong, byval pPointer as any ptr)
declare function NdrFullPointerFree(byval pXlatTables as PFULL_PTR_XLAT_TABLES, byval Pointer_ as any ptr) as long
declare function NdrAllocate(byval pStubMsg as PMIDL_STUB_MESSAGE, byval Len_ as uinteger) as any ptr
declare sub NdrClearOutParameters(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pFormat as PFORMAT_STRING, byval ArgAddr as any ptr)
declare function NdrOleAllocate(byval Size as uinteger) as any ptr
declare sub NdrOleFree(byval NodeToFree as any ptr)

#define MIDL_INTERFACE(x) '' TODO: struct
#define EXTERN_GUID(itf, l1, s1, s2, c1, c2, c3, c4, c5, c6, c7, c8) '' TODO: const IID DECLSPEC_SELECTANY itf = {l1,s1,s2,{c1,c2,c3,c4,c5,c6,c7,c8}}

type _NDR_USER_MARSHAL_INFO_LEVEL1 field = 8
	Buffer as any ptr
	BufferSize as ulong
	pfnAllocate as function(byval as uinteger) as any ptr
	pfnFree as sub(byval as any ptr)
	pRpcChannelBuffer as IRpcChannelBuffer ptr
	Reserved(0 to 4) as ULONG_PTR
end type

type NDR_USER_MARSHAL_INFO_LEVEL1 as _NDR_USER_MARSHAL_INFO_LEVEL1

type _NDR_USER_MARSHAL_INFO field = 8
	InformationLevel as ulong

	union field = 8
		Level1 as NDR_USER_MARSHAL_INFO_LEVEL1
	end union
end type

type NDR_USER_MARSHAL_INFO as _NDR_USER_MARSHAL_INFO

declare function NdrGetUserMarshalInfo(byval pFlags as ulong ptr, byval InformationLevel as ulong, byval pMarshalInfo as NDR_USER_MARSHAL_INFO ptr) as RPC_STATUS
declare function NdrCreateServerInterfaceFromStub(byval pStub as IRpcStubBuffer ptr, byval pServerIf as RPC_SERVER_INTERFACE ptr) as RPC_STATUS
declare function NdrClientCall3 cdecl(byval pProxyInfo as MIDL_STUBLESS_PROXY_INFO ptr, byval nProcNum as ulong, byval pReturnValue as any ptr, ...) as CLIENT_CALL_RETURN
declare function Ndr64AsyncClientCall cdecl(byval pProxyInfo as MIDL_STUBLESS_PROXY_INFO ptr, byval nProcNum as ulong, byval pReturnValue as any ptr, ...) as CLIENT_CALL_RETURN
declare function Ndr64DcomAsyncClientCall cdecl(byval pProxyInfo as MIDL_STUBLESS_PROXY_INFO ptr, byval nProcNum as ulong, byval pReturnValue as any ptr, ...) as CLIENT_CALL_RETURN
declare sub Ndr64AsyncServerCall(byval pRpcMsg as PRPC_MESSAGE)
declare sub Ndr64AsyncServerCall64(byval pRpcMsg as PRPC_MESSAGE)
declare sub Ndr64AsyncServerCallAll(byval pRpcMsg as PRPC_MESSAGE)
declare function Ndr64AsyncStubCall(byval pThis as IRpcStubBuffer ptr, byval pChannel as IRpcChannelBuffer ptr, byval pRpcMsg as PRPC_MESSAGE, byval pdwStubPhase as ulong ptr) as long
declare function Ndr64DcomAsyncStubCall(byval pThis as IRpcStubBuffer ptr, byval pChannel as IRpcChannelBuffer ptr, byval pRpcMsg as PRPC_MESSAGE, byval pdwStubPhase as ulong ptr) as long
declare function NdrStubCall3(byval pThis as IRpcStubBuffer ptr, byval pChannel as IRpcChannelBuffer ptr, byval pRpcMsg as PRPC_MESSAGE, byval pdwStubPhase as ulong ptr) as long
declare sub NdrServerCallAll(byval pRpcMsg as PRPC_MESSAGE)
declare sub NdrServerCallNdr64(byval pRpcMsg as PRPC_MESSAGE)
declare sub NdrServerCall3(byval pRpcMsg as PRPC_MESSAGE)
declare sub NdrPartialIgnoreClientMarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as any ptr)
declare sub NdrPartialIgnoreServerUnmarshall(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as any ptr ptr)
declare sub NdrPartialIgnoreClientBufferSize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval pMemory as any ptr)
declare sub NdrPartialIgnoreServerInitialize(byval pStubMsg as PMIDL_STUB_MESSAGE, byval ppMemory as any ptr ptr, byval pFormat as PFORMAT_STRING)
declare sub RpcUserFree(byval AsyncHandle as handle_t, byval pBuffer as any ptr)

end extern
