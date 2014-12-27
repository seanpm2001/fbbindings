#pragma once

#include once "_mingw_unicode.bi"
#include once "reason.bi"

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

#define _WINREG_
#define RRF_RT_REG_NONE &h00000001
#define RRF_RT_REG_SZ &h00000002
#define RRF_RT_REG_EXPAND_SZ &h00000004
#define RRF_RT_REG_BINARY &h00000008
#define RRF_RT_REG_DWORD &h00000010
#define RRF_RT_REG_MULTI_SZ &h00000020
#define RRF_RT_REG_QWORD &h00000040
#define RRF_RT_DWORD (RRF_RT_REG_BINARY or RRF_RT_REG_DWORD)
#define RRF_RT_QWORD (RRF_RT_REG_BINARY or RRF_RT_REG_QWORD)
#define RRF_RT_ANY &h0000ffff
#define RRF_NOEXPAND &h10000000
#define RRF_ZEROONFAILURE &h20000000

type REGSAM as ACCESS_MASK
type LSTATUS as LONG

#define HKEY_CLASSES_ROOT cast(HKEY, cast(ULONG_PTR, cast(LONG, &h80000000)))
#define HKEY_CURRENT_USER cast(HKEY, cast(ULONG_PTR, cast(LONG, &h80000001)))
#define HKEY_LOCAL_MACHINE cast(HKEY, cast(ULONG_PTR, cast(LONG, &h80000002)))
#define HKEY_USERS cast(HKEY, cast(ULONG_PTR, cast(LONG, &h80000003)))
#define HKEY_PERFORMANCE_DATA cast(HKEY, cast(ULONG_PTR, cast(LONG, &h80000004)))
#define HKEY_PERFORMANCE_TEXT cast(HKEY, cast(ULONG_PTR, cast(LONG, &h80000050)))
#define HKEY_PERFORMANCE_NLSTEXT cast(HKEY, cast(ULONG_PTR, cast(LONG, &h80000060)))
#define HKEY_CURRENT_CONFIG cast(HKEY, cast(ULONG_PTR, cast(LONG, &h80000005)))
#define HKEY_DYN_DATA cast(HKEY, cast(ULONG_PTR, cast(LONG, &h80000006)))
#define REG_SECURE_CONNECTION 1
#define _PROVIDER_STRUCTS_DEFINED
#define PROVIDER_KEEPS_VALUE_LENGTH &h1

type val_context
	valuelen as long
	value_context as LPVOID
	val_buff_ptr as LPVOID
end type

type PVALCONTEXT as val_context ptr

type pvalueA
	pv_valuename as LPSTR
	pv_valuelen as long
	pv_value_context as LPVOID
	pv_type as DWORD
end type

type PPVALUEA as pvalueA ptr

type pvalueW
	pv_valuename as LPWSTR
	pv_valuelen as long
	pv_value_context as LPVOID
	pv_type as DWORD
end type

type PPVALUEW as pvalueW ptr

#ifdef UNICODE
	type PVALUE as pvalueW
	type PPVALUE as PPVALUEW
#else
	type PVALUE as pvalueA
	type PPVALUE as PPVALUEA
#endif

type PQUERYHANDLER as function cdecl(byval keycontext as LPVOID, byval val_list as PVALCONTEXT, byval num_vals as DWORD, byval outputbuffer as LPVOID, byval total_outlen as DWORD ptr, byval input_blen as DWORD) as DWORD

type provider_info
	pi_R0_1val as PQUERYHANDLER
	pi_R0_allvals as PQUERYHANDLER
	pi_R3_1val as PQUERYHANDLER
	pi_R3_allvals as PQUERYHANDLER
	pi_flags as DWORD
	pi_key_context as LPVOID
end type

type REG_PROVIDER as provider_info
type PPROVIDER as provider_info ptr

type value_entA
	ve_valuename as LPSTR
	ve_valuelen as DWORD
	ve_valueptr as DWORD_PTR
	ve_type as DWORD
end type

type VALENTA as value_entA
type PVALENTA as value_entA ptr

type value_entW
	ve_valuename as LPWSTR
	ve_valuelen as DWORD
	ve_valueptr as DWORD_PTR
	ve_type as DWORD
end type

type VALENTW as value_entW
type PVALENTW as value_entW ptr

#ifdef UNICODE
	type VALENT as VALENTW
	type PVALENT as PVALENTW
#else
	type VALENT as VALENTA
	type PVALENT as PVALENTA
#endif

#define WIN31_CLASS NULL

#ifdef UNICODE
	#define RegConnectRegistry RegConnectRegistryW
	#define RegConnectRegistryEx RegConnectRegistryExW
	#define RegCreateKey RegCreateKeyW
	#define RegCreateKeyEx RegCreateKeyExW
	#define RegDeleteKey RegDeleteKeyW
	#define RegDeleteKeyEx RegDeleteKeyExW
	#define RegDeleteValue RegDeleteValueW
	#define RegEnumKey RegEnumKeyW
	#define RegEnumKeyEx RegEnumKeyExW
	#define RegEnumValue RegEnumValueW
	#define RegLoadKey RegLoadKeyW
	#define RegOpenKey RegOpenKeyW
	#define RegOpenKeyEx RegOpenKeyExW
	#define RegQueryInfoKey RegQueryInfoKeyW
	#define RegQueryValue RegQueryValueW
	#define RegQueryMultipleValues RegQueryMultipleValuesW
	#define RegQueryValueEx RegQueryValueExW
	#define RegReplaceKey RegReplaceKeyW
	#define RegRestoreKey RegRestoreKeyW
	#define RegSaveKey RegSaveKeyW
	#define RegSetValue RegSetValueW
	#define RegSetValueEx RegSetValueExW
	#define RegUnLoadKey RegUnLoadKeyW
	#define RegGetValue RegGetValueW
	#define InitiateSystemShutdown InitiateSystemShutdownW
	#define AbortSystemShutdown AbortSystemShutdownW
#else
	#define RegConnectRegistry RegConnectRegistryA
	#define RegConnectRegistryEx RegConnectRegistryExA
	#define RegCreateKey RegCreateKeyA
	#define RegCreateKeyEx RegCreateKeyExA
	#define RegDeleteKey RegDeleteKeyA
	#define RegDeleteKeyEx RegDeleteKeyExA
	#define RegDeleteValue RegDeleteValueA
	#define RegEnumKey RegEnumKeyA
	#define RegEnumKeyEx RegEnumKeyExA
	#define RegEnumValue RegEnumValueA
	#define RegLoadKey RegLoadKeyA
	#define RegOpenKey RegOpenKeyA
	#define RegOpenKeyEx RegOpenKeyExA
	#define RegQueryInfoKey RegQueryInfoKeyA
	#define RegQueryValue RegQueryValueA
	#define RegQueryMultipleValues RegQueryMultipleValuesA
	#define RegQueryValueEx RegQueryValueExA
	#define RegReplaceKey RegReplaceKeyA
	#define RegRestoreKey RegRestoreKeyA
	#define RegSaveKey RegSaveKeyA
	#define RegSetValue RegSetValueA
	#define RegSetValueEx RegSetValueExA
	#define RegUnLoadKey RegUnLoadKeyA
	#define RegGetValue RegGetValueA
	#define InitiateSystemShutdown InitiateSystemShutdownA
	#define AbortSystemShutdown AbortSystemShutdownA
#endif

declare function RegCloseKey(byval hKey as HKEY) as LONG
declare function RegOverridePredefKey(byval hKey as HKEY, byval hNewHKey as HKEY) as LONG
declare function RegOpenUserClassesRoot(byval hToken as HANDLE, byval dwOptions as DWORD, byval samDesired as REGSAM, byval phkResult as PHKEY) as LONG
declare function RegOpenCurrentUser(byval samDesired as REGSAM, byval phkResult as PHKEY) as LONG
declare function RegDisablePredefinedCache() as LONG
declare function RegConnectRegistryA(byval lpMachineName as LPCSTR, byval hKey as HKEY, byval phkResult as PHKEY) as LONG
declare function RegConnectRegistryW(byval lpMachineName as LPCWSTR, byval hKey as HKEY, byval phkResult as PHKEY) as LONG
declare function RegConnectRegistryExA(byval lpMachineName as LPCSTR, byval hKey as HKEY, byval Flags as ULONG, byval phkResult as PHKEY) as LONG
declare function RegConnectRegistryExW(byval lpMachineName as LPCWSTR, byval hKey as HKEY, byval Flags as ULONG, byval phkResult as PHKEY) as LONG
declare function RegCreateKeyA(byval hKey as HKEY, byval lpSubKey as LPCSTR, byval phkResult as PHKEY) as LONG
declare function RegCreateKeyW(byval hKey as HKEY, byval lpSubKey as LPCWSTR, byval phkResult as PHKEY) as LONG
declare function RegCreateKeyExA(byval hKey as HKEY, byval lpSubKey as LPCSTR, byval Reserved as DWORD, byval lpClass as LPSTR, byval dwOptions as DWORD, byval samDesired as REGSAM, byval lpSecurityAttributes as LPSECURITY_ATTRIBUTES, byval phkResult as PHKEY, byval lpdwDisposition as LPDWORD) as LONG
declare function RegCreateKeyExW(byval hKey as HKEY, byval lpSubKey as LPCWSTR, byval Reserved as DWORD, byval lpClass as LPWSTR, byval dwOptions as DWORD, byval samDesired as REGSAM, byval lpSecurityAttributes as LPSECURITY_ATTRIBUTES, byval phkResult as PHKEY, byval lpdwDisposition as LPDWORD) as LONG
declare function RegDeleteKeyA(byval hKey as HKEY, byval lpSubKey as LPCSTR) as LONG
declare function RegDeleteKeyW(byval hKey as HKEY, byval lpSubKey as LPCWSTR) as LONG
declare function RegDeleteKeyExA(byval hKey as HKEY, byval lpSubKey as LPCSTR, byval samDesired as REGSAM, byval Reserved as DWORD) as LONG
declare function RegDeleteKeyExW(byval hKey as HKEY, byval lpSubKey as LPCWSTR, byval samDesired as REGSAM, byval Reserved as DWORD) as LONG
declare function RegDisableReflectionKey(byval hBase as HKEY) as LONG
declare function RegEnableReflectionKey(byval hBase as HKEY) as LONG
declare function RegQueryReflectionKey(byval hBase as HKEY, byval bIsReflectionDisabled as WINBOOL ptr) as LONG
declare function RegDeleteValueA(byval hKey as HKEY, byval lpValueName as LPCSTR) as LONG
declare function RegDeleteValueW(byval hKey as HKEY, byval lpValueName as LPCWSTR) as LONG
declare function RegEnumKeyA(byval hKey as HKEY, byval dwIndex as DWORD, byval lpName as LPSTR, byval cchName as DWORD) as LONG
declare function RegEnumKeyW(byval hKey as HKEY, byval dwIndex as DWORD, byval lpName as LPWSTR, byval cchName as DWORD) as LONG
declare function RegEnumKeyExA(byval hKey as HKEY, byval dwIndex as DWORD, byval lpName as LPSTR, byval lpcchName as LPDWORD, byval lpReserved as LPDWORD, byval lpClass as LPSTR, byval lpcchClass as LPDWORD, byval lpftLastWriteTime as PFILETIME) as LONG
declare function RegEnumKeyExW(byval hKey as HKEY, byval dwIndex as DWORD, byval lpName as LPWSTR, byval lpcchName as LPDWORD, byval lpReserved as LPDWORD, byval lpClass as LPWSTR, byval lpcchClass as LPDWORD, byval lpftLastWriteTime as PFILETIME) as LONG
declare function RegEnumValueA(byval hKey as HKEY, byval dwIndex as DWORD, byval lpValueName as LPSTR, byval lpcchValueName as LPDWORD, byval lpReserved as LPDWORD, byval lpType as LPDWORD, byval lpData as LPBYTE, byval lpcbData as LPDWORD) as LONG
declare function RegEnumValueW(byval hKey as HKEY, byval dwIndex as DWORD, byval lpValueName as LPWSTR, byval lpcchValueName as LPDWORD, byval lpReserved as LPDWORD, byval lpType as LPDWORD, byval lpData as LPBYTE, byval lpcbData as LPDWORD) as LONG
declare function RegFlushKey(byval hKey as HKEY) as LONG
declare function RegGetKeySecurity(byval hKey as HKEY, byval SecurityInformation as SECURITY_INFORMATION, byval pSecurityDescriptor as PSECURITY_DESCRIPTOR, byval lpcbSecurityDescriptor as LPDWORD) as LONG
declare function RegLoadKeyA(byval hKey as HKEY, byval lpSubKey as LPCSTR, byval lpFile as LPCSTR) as LONG
declare function RegLoadKeyW(byval hKey as HKEY, byval lpSubKey as LPCWSTR, byval lpFile as LPCWSTR) as LONG
declare function RegNotifyChangeKeyValue(byval hKey as HKEY, byval bWatchSubtree as WINBOOL, byval dwNotifyFilter as DWORD, byval hEvent as HANDLE, byval fAsynchronous as WINBOOL) as LONG
declare function RegOpenKeyA(byval hKey as HKEY, byval lpSubKey as LPCSTR, byval phkResult as PHKEY) as LONG
declare function RegOpenKeyW(byval hKey as HKEY, byval lpSubKey as LPCWSTR, byval phkResult as PHKEY) as LONG
declare function RegOpenKeyExA(byval hKey as HKEY, byval lpSubKey as LPCSTR, byval ulOptions as DWORD, byval samDesired as REGSAM, byval phkResult as PHKEY) as LONG
declare function RegOpenKeyExW(byval hKey as HKEY, byval lpSubKey as LPCWSTR, byval ulOptions as DWORD, byval samDesired as REGSAM, byval phkResult as PHKEY) as LONG
declare function RegQueryInfoKeyA(byval hKey as HKEY, byval lpClass as LPSTR, byval lpcchClass as LPDWORD, byval lpReserved as LPDWORD, byval lpcSubKeys as LPDWORD, byval lpcbMaxSubKeyLen as LPDWORD, byval lpcbMaxClassLen as LPDWORD, byval lpcValues as LPDWORD, byval lpcbMaxValueNameLen as LPDWORD, byval lpcbMaxValueLen as LPDWORD, byval lpcbSecurityDescriptor as LPDWORD, byval lpftLastWriteTime as PFILETIME) as LONG
declare function RegQueryInfoKeyW(byval hKey as HKEY, byval lpClass as LPWSTR, byval lpcchClass as LPDWORD, byval lpReserved as LPDWORD, byval lpcSubKeys as LPDWORD, byval lpcbMaxSubKeyLen as LPDWORD, byval lpcbMaxClassLen as LPDWORD, byval lpcValues as LPDWORD, byval lpcbMaxValueNameLen as LPDWORD, byval lpcbMaxValueLen as LPDWORD, byval lpcbSecurityDescriptor as LPDWORD, byval lpftLastWriteTime as PFILETIME) as LONG
declare function RegQueryValueA(byval hKey as HKEY, byval lpSubKey as LPCSTR, byval lpData as LPSTR, byval lpcbData as PLONG) as LONG
declare function RegQueryValueW(byval hKey as HKEY, byval lpSubKey as LPCWSTR, byval lpData as LPWSTR, byval lpcbData as PLONG) as LONG
declare function RegQueryMultipleValuesA(byval hKey as HKEY, byval val_list as PVALENTA, byval num_vals as DWORD, byval lpValueBuf as LPSTR, byval ldwTotsize as LPDWORD) as LONG
declare function RegQueryMultipleValuesW(byval hKey as HKEY, byval val_list as PVALENTW, byval num_vals as DWORD, byval lpValueBuf as LPWSTR, byval ldwTotsize as LPDWORD) as LONG
declare function RegQueryValueExA(byval hKey as HKEY, byval lpValueName as LPCSTR, byval lpReserved as LPDWORD, byval lpType as LPDWORD, byval lpData as LPBYTE, byval lpcbData as LPDWORD) as LONG
declare function RegQueryValueExW(byval hKey as HKEY, byval lpValueName as LPCWSTR, byval lpReserved as LPDWORD, byval lpType as LPDWORD, byval lpData as LPBYTE, byval lpcbData as LPDWORD) as LONG
declare function RegReplaceKeyA(byval hKey as HKEY, byval lpSubKey as LPCSTR, byval lpNewFile as LPCSTR, byval lpOldFile as LPCSTR) as LONG
declare function RegReplaceKeyW(byval hKey as HKEY, byval lpSubKey as LPCWSTR, byval lpNewFile as LPCWSTR, byval lpOldFile as LPCWSTR) as LONG
declare function RegRestoreKeyA(byval hKey as HKEY, byval lpFile as LPCSTR, byval dwFlags as DWORD) as LONG
declare function RegRestoreKeyW(byval hKey as HKEY, byval lpFile as LPCWSTR, byval dwFlags as DWORD) as LONG
declare function RegSaveKeyA(byval hKey as HKEY, byval lpFile as LPCSTR, byval lpSecurityAttributes as LPSECURITY_ATTRIBUTES) as LONG
declare function RegSaveKeyW(byval hKey as HKEY, byval lpFile as LPCWSTR, byval lpSecurityAttributes as LPSECURITY_ATTRIBUTES) as LONG
declare function RegSetKeySecurity(byval hKey as HKEY, byval SecurityInformation as SECURITY_INFORMATION, byval pSecurityDescriptor as PSECURITY_DESCRIPTOR) as LONG
declare function RegSetValueA(byval hKey as HKEY, byval lpSubKey as LPCSTR, byval dwType as DWORD, byval lpData as LPCSTR, byval cbData as DWORD) as LONG
declare function RegSetValueW(byval hKey as HKEY, byval lpSubKey as LPCWSTR, byval dwType as DWORD, byval lpData as LPCWSTR, byval cbData as DWORD) as LONG
declare function RegSetValueExA(byval hKey as HKEY, byval lpValueName as LPCSTR, byval Reserved as DWORD, byval dwType as DWORD, byval lpData as const UBYTE ptr, byval cbData as DWORD) as LONG
declare function RegSetValueExW(byval hKey as HKEY, byval lpValueName as LPCWSTR, byval Reserved as DWORD, byval dwType as DWORD, byval lpData as const UBYTE ptr, byval cbData as DWORD) as LONG
declare function RegUnLoadKeyA(byval hKey as HKEY, byval lpSubKey as LPCSTR) as LONG
declare function RegUnLoadKeyW(byval hKey as HKEY, byval lpSubKey as LPCWSTR) as LONG
declare function RegGetValueA(byval hkey as HKEY, byval lpSubKey as LPCSTR, byval lpValue as LPCSTR, byval dwFlags as DWORD, byval pdwType as LPDWORD, byval pvData as PVOID, byval pcbData as LPDWORD) as LONG
declare function RegGetValueW(byval hkey as HKEY, byval lpSubKey as LPCWSTR, byval lpValue as LPCWSTR, byval dwFlags as DWORD, byval pdwType as LPDWORD, byval pvData as PVOID, byval pcbData as LPDWORD) as LONG
declare function InitiateSystemShutdownA(byval lpMachineName as LPSTR, byval lpMessage as LPSTR, byval dwTimeout as DWORD, byval bForceAppsClosed as WINBOOL, byval bRebootAfterShutdown as WINBOOL) as WINBOOL
declare function InitiateSystemShutdownW(byval lpMachineName as LPWSTR, byval lpMessage as LPWSTR, byval dwTimeout as DWORD, byval bForceAppsClosed as WINBOOL, byval bRebootAfterShutdown as WINBOOL) as WINBOOL
declare function AbortSystemShutdownA(byval lpMachineName as LPSTR) as WINBOOL
declare function AbortSystemShutdownW(byval lpMachineName as LPWSTR) as WINBOOL

#define REASON_SWINSTALL (SHTDN_REASON_MAJOR_SOFTWARE or SHTDN_REASON_MINOR_INSTALLATION)
#define REASON_HWINSTALL (SHTDN_REASON_MAJOR_HARDWARE or SHTDN_REASON_MINOR_INSTALLATION)
#define REASON_SERVICEHANG (SHTDN_REASON_MAJOR_SOFTWARE or SHTDN_REASON_MINOR_HUNG)
#define REASON_UNSTABLE (SHTDN_REASON_MAJOR_SYSTEM or SHTDN_REASON_MINOR_UNSTABLE)
#define REASON_SWHWRECONF (SHTDN_REASON_MAJOR_SOFTWARE or SHTDN_REASON_MINOR_RECONFIG)
#define REASON_OTHER (SHTDN_REASON_MAJOR_OTHER or SHTDN_REASON_MINOR_OTHER)
#define REASON_UNKNOWN SHTDN_REASON_UNKNOWN
#define REASON_LEGACY_API SHTDN_REASON_LEGACY_API
#define REASON_PLANNED_FLAG SHTDN_REASON_FLAG_PLANNED
#define MAX_SHUTDOWN_TIMEOUT ((((10 * 365) * 24) * 60) * 60)

#ifdef UNICODE
	#define InitiateSystemShutdownEx InitiateSystemShutdownExW
	#define RegSaveKeyEx RegSaveKeyExW
#else
	#define InitiateSystemShutdownEx InitiateSystemShutdownExA
	#define RegSaveKeyEx RegSaveKeyExA
#endif

declare function InitiateSystemShutdownExA(byval lpMachineName as LPSTR, byval lpMessage as LPSTR, byval dwTimeout as DWORD, byval bForceAppsClosed as WINBOOL, byval bRebootAfterShutdown as WINBOOL, byval dwReason as DWORD) as WINBOOL
declare function InitiateSystemShutdownExW(byval lpMachineName as LPWSTR, byval lpMessage as LPWSTR, byval dwTimeout as DWORD, byval bForceAppsClosed as WINBOOL, byval bRebootAfterShutdown as WINBOOL, byval dwReason as DWORD) as WINBOOL
declare function RegSaveKeyExA(byval hKey as HKEY, byval lpFile as LPCSTR, byval lpSecurityAttributes as LPSECURITY_ATTRIBUTES, byval Flags as DWORD) as LONG
declare function RegSaveKeyExW(byval hKey as HKEY, byval lpFile as LPCWSTR, byval lpSecurityAttributes as LPSECURITY_ATTRIBUTES, byval Flags as DWORD) as LONG
declare function Wow64Win32ApiEntry(byval dwFuncNumber as DWORD, byval dwFlag as DWORD, byval dwRes as DWORD) as LONG

#if defined(UNICODE) and (_WIN32_WINNT = &h0602)
	#define RegCopyTree RegCopyTreeW
#elseif (not defined(UNICODE)) and (_WIN32_WINNT = &h0602)
	#define RegCopyTree RegCopyTreeA
#endif

#if _WIN32_WINNT = &h0602
	declare function RegCopyTreeA(byval hKeySrc as HKEY, byval lpSubKey as LPCSTR, byval hKeyDest as HKEY) as LONG
	declare function RegCopyTreeW(byval hKeySrc as HKEY, byval lpSubKey as LPCWSTR, byval hKeyDest as HKEY) as LONG
#endif

#if defined(UNICODE) and (_WIN32_WINNT = &h0602)
	#define RegCreateKeyTransacted RegCreateKeyTransactedW
#elseif (not defined(UNICODE)) and (_WIN32_WINNT = &h0602)
	#define RegCreateKeyTransacted RegCreateKeyTransactedA
#endif

#if _WIN32_WINNT = &h0602
	declare function RegCreateKeyTransactedA(byval hKey as HKEY, byval lpSubKey as LPCSTR, byval Reserved as DWORD, byval lpClass as LPSTR, byval dwOptions as DWORD, byval samDesired as REGSAM, byval lpSecurityAttributes as const LPSECURITY_ATTRIBUTES, byval phkResult as PHKEY, byval lpdwDisposition as LPDWORD, byval hTransaction as HANDLE, byval pExtendedParemeter as PVOID) as LONG
	declare function RegCreateKeyTransactedW(byval hKey as HKEY, byval lpSubKey as LPCWSTR, byval Reserved as DWORD, byval lpClass as LPWSTR, byval dwOptions as DWORD, byval samDesired as REGSAM, byval lpSecurityAttributes as const LPSECURITY_ATTRIBUTES, byval phkResult as PHKEY, byval lpdwDisposition as LPDWORD, byval hTransaction as HANDLE, byval pExtendedParemeter as PVOID) as LONG
#endif

#if defined(UNICODE) and (_WIN32_WINNT = &h0602)
	#define RegDeleteKeyTransacted RegDeleteKeyTransactedW
#elseif (not defined(UNICODE)) and (_WIN32_WINNT = &h0602)
	#define RegDeleteKeyTransacted RegDeleteKeyTransactedA
#endif

#if _WIN32_WINNT = &h0602
	declare function RegDeleteKeyTransactedA(byval hKey as HKEY, byval lpSubKey as LPCSTR, byval samDesired as REGSAM, byval Reserved as DWORD, byval hTransaction as HANDLE, byval pExtendedParameter as PVOID) as LONG
	declare function RegDeleteKeyTransactedW(byval hKey as HKEY, byval lpSubKey as LPCWSTR, byval samDesired as REGSAM, byval Reserved as DWORD, byval hTransaction as HANDLE, byval pExtendedParameter as PVOID) as LONG
#endif

#if defined(UNICODE) and (_WIN32_WINNT = &h0602)
	#define RegDeleteKeyValue RegDeleteKeyValueW
#elseif (not defined(UNICODE)) and (_WIN32_WINNT = &h0602)
	#define RegDeleteKeyValue RegDeleteKeyValueA
#endif

#if _WIN32_WINNT = &h0602
	declare function RegDeleteKeyValueA(byval hKey as HKEY, byval lpSubKey as LPCSTR, byval lpValueName as LPCSTR) as LONG
	declare function RegDeleteKeyValueW(byval hKey as HKEY, byval lpSubKey as LPCWSTR, byval lpValueName as LPCWSTR) as LONG
#endif

#if defined(UNICODE) and (_WIN32_WINNT = &h0602)
	#define RegDeleteTree RegDeleteTreeW
#elseif (not defined(UNICODE)) and (_WIN32_WINNT = &h0602)
	#define RegDeleteTree RegDeleteTreeA
#endif

#if _WIN32_WINNT = &h0602
	declare function RegDeleteTreeA(byval hKey as HKEY, byval lpSubKey as LPCSTR) as LONG
	declare function RegDeleteTreeW(byval hKey as HKEY, byval lpSubKey as LPCWSTR) as LONG
	declare function RegDisablePredefinedCacheEx() as LONG
	declare function RegLoadAppKeyA(byval lpFile as LPCSTR, byval phkResult as PHKEY, byval samDesired as REGSAM, byval dwOptions as DWORD, byval Reserved as DWORD) as LONG
	declare function RegLoadAppKeyW(byval lpFile as LPCWSTR, byval phkResult as PHKEY, byval samDesired as REGSAM, byval dwOptions as DWORD, byval Reserved as DWORD) as LONG
#endif

#if defined(UNICODE) and (_WIN32_WINNT = &h0602)
	#define RegLoadAppKey RegLoadAppKeyW
#elseif (not defined(UNICODE)) and (_WIN32_WINNT = &h0602)
	#define RegLoadAppKey RegLoadAppKeyA
#endif

#if _WIN32_WINNT = &h0602
	declare function RegLoadMUIStringA(byval hKey as HKEY, byval pszValue as LPCSTR, byval pszOutBuf as LPSTR, byval cbOutBuf as DWORD, byval pcbData as LPDWORD, byval Flags as DWORD, byval pszDirectory as LPCSTR) as LONG
	declare function RegLoadMUIStringW(byval hKey as HKEY, byval pszValue as LPCWSTR, byval pszOutBuf as LPWSTR, byval cbOutBuf as DWORD, byval pcbData as LPDWORD, byval Flags as DWORD, byval pszDirectory as LPCWSTR) as LONG
#endif

#if defined(UNICODE) and (_WIN32_WINNT = &h0602)
	#define RegLoadMUIString RegLoadMUIStringW
#elseif (not defined(UNICODE)) and (_WIN32_WINNT = &h0602)
	#define RegLoadMUIString RegLoadMUIStringA
#endif

#if _WIN32_WINNT = &h0602
	declare function RegOpenKeyTransactedA(byval hKey as HKEY, byval lpSubKey as LPCSTR, byval ulOptions as DWORD, byval samDesired as REGSAM, byval phkResult as PHKEY, byval hTransaction as HANDLE, byval pExtendedParameter as PVOID) as LONG
	declare function RegOpenKeyTransactedW(byval hKey as HKEY, byval lpSubKey as LPCWSTR, byval ulOptions as DWORD, byval samDesired as REGSAM, byval phkResult as PHKEY, byval hTransaction as HANDLE, byval pExtendedParameter as PVOID) as LONG
#endif

#if defined(UNICODE) and (_WIN32_WINNT = &h0602)
	#define RegOpenKeyTransacted RegOpenKeyTransactedW
#elseif (not defined(UNICODE)) and (_WIN32_WINNT = &h0602)
	#define RegOpenKeyTransacted RegOpenKeyTransactedA
#endif

#if _WIN32_WINNT = &h0602
	declare function RegSetKeyValueA(byval hKey as HKEY, byval lpSubKey as LPCSTR, byval lpValueName as LPCSTR, byval dwType as DWORD, byval lpData as LPCVOID, byval cbData as DWORD) as LONG
	declare function RegSetKeyValueW(byval hKey as HKEY, byval lpSubKey as LPCSTR, byval lpValueName as LPCSTR, byval dwType as DWORD, byval lpData as LPCVOID, byval cbData as DWORD) as LONG
#endif

#if defined(UNICODE) and (_WIN32_WINNT = &h0602)
	#define RegSetKeyValue RegSetKeyValueW
#elseif (not defined(UNICODE)) and (_WIN32_WINNT = &h0602)
	#define RegSetKeyValue RegSetKeyValueA
#endif

#if _WIN32_WINNT = &h0602
	#define SHUTDOWN_FORCE_OTHERS &h00000001
	#define SHUTDOWN_FORCE_SELF &h00000002
	#define SHUTDOWN_RESTART &h00000004
	#define SHUTDOWN_POWEROFF &h00000008
	#define SHUTDOWN_NOREBOOT &h00000010
	#define SHUTDOWN_GRACE_OVERRIDE &h00000020
	#define SHUTDOWN_INSTALL_UPDATES &h00000040
	#define SHUTDOWN_RESTARTAPPS &h00000080
	#define SHUTDOWN_HYBRID &h00000200

	declare function InitiateShutdownA(byval lpMachineName as LPSTR, byval lpMessage as LPSTR, byval dwGracePeriod as DWORD, byval dwShutdownFlags as DWORD, byval dwReason as DWORD) as DWORD
	declare function InitiateShutdownW(byval lpMachineName as LPWSTR, byval lpMessage as LPWSTR, byval dwGracePeriod as DWORD, byval dwShutdownFlags as DWORD, byval dwReason as DWORD) as DWORD
#endif

#if defined(UNICODE) and (_WIN32_WINNT = &h0602)
	#define InitiateShutdown InitiateShutdownW
#elseif (not defined(UNICODE)) and (_WIN32_WINNT = &h0602)
	#define InitiateShutdown InitiateShutdownA
#endif

end extern
