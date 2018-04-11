" Vim syntax file
" Language: Zig
" Maintainer: Andrew Kelley
" Latest Revision: 03 August 2016

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "zig"

syn keyword zigStorage const var extern packed export pub noalias inline comptime nakedcc stdcallcc volatile align section
syn keyword zigStructure struct enum union
syn keyword zigStatement break return continue asm defer errdefer unreachable try catch async await suspend resume cancel
syn keyword zigConditional if else switch and or
syn keyword zigRepeat while for

syn keyword zigConstant null undefined this
syn keyword zigKeyword fn use test
syn keyword zigType bool f32 f64 f128 void noreturn type error promise
syn keyword zigType i2 u2 i3 u3 i4 u4 i5 u5 i6 u6 i7 u7 i8  u8  i16  u16  u29 i29 i32  u32  i64  u64  i128 u128 isize  usize
syn keyword zigType c_short c_ushort c_int c_uint c_long c_ulong c_longlong c_ulonglong c_longdouble c_void

syn keyword zigBoolean true false

syn match zigOperator display "\%(+%\?\|-%\?\|/\|*%\?\|=\|\^\|&\|?\||\|!\|>\|<\|%\|<<%\?\|>>\)=\?"
syn match zigArrowCharacter display "->"

syn match zigBuiltinFn "\v\@(addWithOverflow|ArgType|bitCast|breakpoint)>"
syn match zigBuiltinFn "\v\@(alignCast|alignOf|cDefine|cImport|cInclude)>"
syn match zigBuiltinFn "\v\@(cUndef|canImplicitCast|clz|cmpxchg|compileError)>"
syn match zigBuiltinFn "\v\@(compileLog|ctz|divExact|divFloor|divTrunc)>"
syn match zigBuiltinFn "\v\@(embedFile|export|tagName|TagType|errorName)>"
syn match zigBuiltinFn "\v\@(errorReturnTrace|fence|fieldParentPtr)>"
syn match zigBuiltinFn "\v\@(frameAddress|import|inlineCall|intToPtr|IntType)>"
syn match zigBuiltinFn "\v\@(maxValue|memberCount|memberName|memberType)>"
syn match zigBuiltinFn "\v\@(memcpy|memset|minValue|mod|mulWithOverflow)>"
syn match zigBuiltinFn "\v\@(noInlineCall|offsetOf|OpaqueType|panic|ptrCast)>"
syn match zigBuiltinFn "\v\@(ptrToInt|rem|returnAddress|setCold)>"
syn match zigBuiltinFn "\v\@(setRuntimeSafety|setEvalBranchQuota|setFloatMode)>"
syn match zigBuiltinFn "\v\@(setGlobalLinkage|setGlobalSection|shlExact)>"
syn match zigBuiltinFn "\v\@(shlWithOverflow|shrExact|sizeOf|subWithOverflow)>"
syn match zigBuiltinFn "\v\@(truncate|typeId|typeName|typeOf|atomicRmw)>"

syn match zigDecNumber display "\<[0-9]\+\%(.[0-9]\+\)\=\%([eE][+-]\?[0-9]\+\)\="
syn match zigHexNumber display "\<0x[a-fA-F0-9]\+\%([a-fA-F0-9]\+\%([pP][+-]\?[0-9]\+\)\?\)\="
syn match zigOctNumber display "\<0o[0-7]\+"
syn match zigBinNumber display "\<0b[01]\+\%(.[01]\+\%([eE][+-]\?[0-9]\+\)\?\)\="


syn match zigCharacterInvalid display contained /b\?'\zs[\n\r\t']\ze'/
syn match zigCharacterInvalidUnicode display contained /b'\zs[^[:cntrl:][:graph:][:alnum:][:space:]]\ze'/
syn match zigCharacter /b'\([^\\]\|\\\(.\|x\x\{2}\)\)'/ contains=zigEscape,zigEscapeError,zigCharacterInvalid,zigCharacterInvalidUnicode
syn match zigCharacter /'\([^\\]\|\\\(.\|x\x\{2}\|u\x\{4}\|U\x\{6}\)\)'/ contains=zigEscape,zigEscapeUnicode,zigEscapeError,zigCharacterInvalid

syn region zigCommentLine start="//" end="$" contains=zigTodo,@Spell
syn region zigCommentLineDoc start="////\@!" end="$" contains=zigTodo,@Spell

" TODO match only the first '\\' within the zigMultilineString as zigMultilineStringPrefix
syn match zigMultilineStringPrefix display contained /c\?\\\\/
syn region zigMultilineString start="c\?\\\\" end="$" contains=zigMultilineStringPrefix

syn keyword zigTodo contained TODO XXX

syn match     zigEscapeError   display contained /\\./
syn match     zigEscape        display contained /\\\([nrt\\'"]\|x\x\{2}\)/
syn match     zigEscapeUnicode display contained /\\\(u\x\{4}\|U\x\{6}\)/
syn region    zigString      start=+c\?"+ skip=+\\\\\|\\"+ end=+"+ oneline contains=zigEscape,zigEscapeUnicode,zigEscapeError,@Spell

hi def link zigDecNumber zigNumber
hi def link zigHexNumber zigNumber
hi def link zigOctNumber zigNumber
hi def link zigBinNumber zigNumber

hi def link zigBuiltinFn Function
hi def link zigKeyword Keyword
hi def link zigType Type
hi def link zigCommentLine Comment
hi def link zigCommentLineDoc SpecialComment
hi def link zigTodo Todo
hi def link zigString String
hi def link zigMultilineString String
hi def link zigMultilineStringPrefix Comment
hi def link zigCharacterInvalid Error
hi def link zigCharacterInvalidUnicode zigCharacterInvalid
hi def link zigCharacter Character
hi def link zigEscape Special
hi def link zigEscapeUnicode zigEscape
hi def link zigEscapeError Error
hi def link zigBoolean Boolean
hi def link zigConstant Constant
hi def link zigNumber Number
hi def link zigArrowCharacter zigOperator
hi def link zigOperator Operator
hi def link zigStorage StorageClass
hi def link zigStructure Structure
hi def link zigStatement Statement
hi def link zigConditional Conditional
hi def link zigRepeat Repeat
