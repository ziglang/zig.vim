" Vim syntax file
" Language: Zig
" Maintainer: Andrew Kelley
" Latest Revision: 03 August 2016

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case match
syn iskeyword @,48-57,@-@,_

syn keyword zigConditional if else switch
syn keyword zigException catch errdefer orelse try
syn keyword zigKeyword asm
syn keyword zigKeyword async await
syn keyword zigKeyword break continue return
syn keyword zigKeyword comptime
syn keyword zigKeyword defer
syn keyword zigKeyword fn
syn keyword zigKeyword pub
syn keyword zigKeyword resume suspend nosuspend
syn keyword zigKeyword test
syn keyword zigKeyword unreachable
syn keyword zigKeyword usingnamespace
syn keyword zigOperator and or
syn keyword zigRepeat for while
syn keyword zigStorageClass align
syn keyword zigStorageClass allowzero
syn keyword zigStorageClass callconv
syn keyword zigStorageClass const var volatile
syn keyword zigStorageClass export extern
syn keyword zigStorageClass linksection
syn keyword zigStorageClass noalias
syn keyword zigStorageClass packed
syn keyword zigStorageClass threadlocal
syn keyword zigStructure enum error opaque struct union

syn keyword zigBuiltin @addWithOverflow @mulWithOverflow @subWithOverflow
syn keyword zigBuiltin @alignCast @bitCast
syn keyword zigBuiltin @alignOf @offsetOf @sizeOf
syn keyword zigBuiltin @as
syn keyword zigBuiltin @asyncCall
syn keyword zigBuiltin @atomicLoad @atomicStore @atomicRmw
syn keyword zigBuiltin @bitOffsetOf @bitSizeOf
syn keyword zigBuiltin @bitReverse
syn keyword zigBuiltin @boolToInt @enumToInt @errorToInt @floatToInt @ptrToInt
syn keyword zigBuiltin @breakpoint
syn keyword zigBuiltin @byteSwap
syn keyword zigBuiltin @call
syn keyword zigBuiltin @ceil @floor @round @trunc
syn keyword zigBuiltin @clz @ctz
syn keyword zigBuiltin @cmpxchgStrong @cmpxchgWeak
syn keyword zigBuiltin @compileError @compileLog
syn keyword zigBuiltin @divExact @divFloor @divTrunc
syn keyword zigBuiltin @embedFile
syn keyword zigBuiltin @errorName @errorReturnTrace
syn keyword zigBuiltin @errSetCast @floatCast @intCast @ptrCast
syn keyword zigBuiltin @exp @exp2
syn keyword zigBuiltin @export @extern
syn keyword zigBuiltin @fabs
syn keyword zigBuiltin @fence
syn keyword zigBuiltin @field @fieldParentPtr @hasField
syn keyword zigBuiltin @Frame @frame @frameAddress @frameSize
syn keyword zigBuiltin @hasDecl
syn keyword zigBuiltin @import
syn keyword zigBuiltin @intToEnum @intToError @intToFloat @intToPtr
syn keyword zigBuiltin @log @log2 @log10
syn keyword zigBuiltin @maximum @minimum
syn keyword zigBuiltin @memcpy @memset
syn keyword zigBuiltin @mod @rem
syn keyword zigBuiltin @mulAdd
syn keyword zigBuiltin @panic
syn keyword zigBuiltin @popCount
syn keyword zigBuiltin @prefetch
syn keyword zigBuiltin @reduce @select
syn keyword zigBuiltin @returnAddress
syn keyword zigBuiltin @setAlignStack @setCold
syn keyword zigBuiltin @setEvalBranchQuota @setFloatMode @setRuntimeSafety
syn keyword zigBuiltin @shlExact @shrExact @shlWithOverflow
syn keyword zigBuiltin @shuffle
syn keyword zigBuiltin @sin @cos @tan
syn keyword zigBuiltin @sqrt
syn keyword zigBuiltin @src
syn keyword zigBuiltin @tagName
syn keyword zigBuiltin @This
syn keyword zigBuiltin @truncate
syn keyword zigBuiltin @Type @TypeOf @typeInfo @typeName
syn keyword zigBuiltin @unionInit
syn keyword zigBuiltin @Vector @splat
syn keyword zigBuiltin @wasmMemoryGrow @wasmMemorySize

" C ABI.
syn keyword zigBuiltin @cDefine @cImport @cInclude @cUndef

syn keyword zigType anyerror anyframe anyopaque anytype
syn keyword zigType bool
syn keyword zigType comptime_float comptime_int
syn keyword zigType f16 f32 f64 f128
syn keyword zigType isize usize
syn keyword zigType noreturn
syn keyword zigType type
syn keyword zigType void

" C ABI.
syn keyword zigType c_int c_uint
syn keyword zigType c_long c_ulong
syn keyword zigType c_longdouble
syn keyword zigType c_longlong c_ulonglong
syn keyword zigType c_short c_ushort

" Integer types of arbitrary bit-width.
syn match zigType "\v<[iu]\d+>" display

syn keyword zigBoolean true false
syn keyword zigConstant null undefined

" Number literals.
syn match zigNumber "\v<\d(_?\d)*>" display
syn match zigNumber "\v<0b[01](_?[01])*>" display
syn match zigNumber "\v<0o\o(_?\o)*>" display
syn match zigNumber "\v<0x\x(_?\x)*>" display

" Floating-point number literals.
syn match zigFloat "\v<\d(_?\d)*\.\d(_?\d)*>" display
syn match zigFloat "\v<\d(_?\d)*(\.\d(_?\d)*)?[Ee][+-]?\d(_?\d)*>" display
syn match zigFloat "\v<0x\x(_?\x)*\.\x(_?\x)*>" display
syn match zigFloat "\v<0x\x(_?\x)*(\.\x(_?\x)*)?[Pp][+-]?\x(_?\x)*>" display

syntax match zigOperator display "\V\[-+/*=^&?|!><%~]"
syntax match zigArrowCharacter display "\V->"

syntax match zigCharacterInvalid display contained /b\?'\zs[\n\r\t']\ze'/
syntax match zigCharacterInvalidUnicode display contained /b'\zs[^[:cntrl:][:graph:][:alnum:][:space:]]\ze'/
syntax match zigCharacter /b'\([^\\]\|\\\(.\|x\x\{2}\)\)'/ contains=zigEscape,zigEscapeError,zigCharacterInvalid,zigCharacterInvalidUnicode
syntax match zigCharacter /'\([^\\]\|\\\(.\|x\x\{2}\|u\x\{4}\|U\x\{6}\)\)'/ contains=zigEscape,zigEscapeUnicode,zigEscapeError,zigCharacterInvalid

syntax region zigBlock start="{" end="}" transparent fold

syntax region zigCommentLine start="//" end="$" contains=zigTodo,@Spell
syntax region zigCommentLineDoc start="//[/!]/\@!" end="$" contains=zigTodo,@Spell

syntax match zigMultilineStringPrefix /c\?\\\\/ contained containedin=zigMultilineString
syntax region zigMultilineString matchgroup=zigMultilineStringDelimiter start="c\?\\\\" end="$" contains=zigMultilineStringPrefix display

syntax keyword zigTodo contained TODO

syntax region zigString matchgroup=zigStringDelimiter start=+c\?"+ skip=+\\\\\|\\"+ end=+"+ oneline contains=zigEscape,zigEscapeUnicode,zigEscapeError,@Spell
syntax match zigEscapeError   display contained /\\./
syntax match zigEscape        display contained /\\\([nrt\\'"]\|x\x\{2}\)/
syntax match zigEscapeUnicode display contained /\\\(u\x\{4}\|U\x\{6}\)/

hi def link zigBoolean Boolean
hi def link zigBuiltin Function
hi def link zigConditional Conditional
hi def link zigConstant Constant
hi def link zigException Exception
hi def link zigFloat Float
hi def link zigKeyword Keyword
hi def link zigNumber Number
hi def link zigOperator Operator
hi def link zigRepeat Repeat
hi def link zigStorageClass StorageClass
hi def link zigStructure Structure
hi def link zigType Type

highlight default link zigCommentLine Comment
highlight default link zigCommentLineDoc Comment
highlight default link zigTodo Todo
highlight default link zigString String
highlight default link zigStringDelimiter String
highlight default link zigMultilineString String
highlight default link zigMultilineStringContent String
highlight default link zigMultilineStringPrefix String
highlight default link zigMultilineStringDelimiter Delimiter
highlight default link zigCharacterInvalid Error
highlight default link zigCharacterInvalidUnicode zigCharacterInvalid
highlight default link zigCharacter Character
highlight default link zigEscape Special
highlight default link zigEscapeUnicode zigEscape
highlight default link zigEscapeError Error
highlight default link zigArrowCharacter zigOperator

let b:current_syntax = "zig"

let &cpo = s:cpo_save
unlet! s:cpo_save
