" PRELUDE {{{1
" Vim syntax file
" Language: Zig
" Maintainer: Andrew Kelley
" Latest Revision: 03 August 2016

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "zig"

let s:cpo_save = &cpo
set cpo&vim

" SYNTAX {{{1
syn case match
syn iskeyword @,48-57,@-@,_

" KEYWORDS {{{2
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

" BUILTINS {{{2
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

" TYPES {{{2
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

" LITERALS {{{2
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

" String and character literals.
syn match zigEscape "\\[\\'"nrt]" contained display
syn match zigEscape "\\x\x\{2}" contained display
syn match zigEscape "\v\\u\{\x{1,6}}" contained display
syn match zigFormat "\v\{(\d+|\[\h\w*])?([!?]*([!?*Xbcdeosux]|any))?(:(([^\\]|\\([\\'"nrt]|x\x{2}|u\{\x{1,6}}))[<>^]|[<>^])?\d*(\.\d*)?)?}" contained contains=zigEscape display
syn region zigCharacter start="'" end="'\|$" skip="\\'" contains=zigEscape display extend
syn region zigString start=+"+ end=+"\|$+ skip=+\\"+ contains=zigEscape,zigFormat display extend
syn region zigString start="^\s*\\\\" end="$" display

" MISCELLANEOUS {{{2
syn keyword zigTodo FIXME TODO XXX contained

" Blocks.
syn region zigBlock start="{" end="}" fold transparent

" Comments.
syn region zigComment start="//" end="$" contains=zigTodo,@Spell display
syn region zigCommentDoc start="^\s*\zs//\(//\@!\|!\)" end="$" contains=zigTodo,@Spell display

" Special operators.
syn match zigSpecial "\.\zs[*?]" display

" DEFAULT HIGHLIGHTING {{{1
hi def link zigBoolean Boolean
hi def link zigBuiltin Function
hi def link zigCharacter Character
hi def link zigComment Comment
hi def link zigCommentDoc SpecialComment
hi def link zigConditional Conditional
hi def link zigConstant Constant
hi def link zigEscape SpecialChar
hi def link zigException Exception
hi def link zigFloat Float
hi def link zigFormat SpecialChar
hi def link zigKeyword Keyword
hi def link zigNumber Number
hi def link zigOperator Operator
hi def link zigRepeat Repeat
hi def link zigSpecial Special
hi def link zigStorageClass StorageClass
hi def link zigString String
hi def link zigStructure Structure
hi def link zigTodo Todo
hi def link zigType Type

let &cpo = s:cpo_save
unlet! s:cpo_save
