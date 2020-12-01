" Vim syntax file
" Language: Zig
" Maintainer: Andrew Kelley
" Latest Revision: 03 August 2016

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

let s:zig_syntax_keywords = {
    \   'zigStorage': ["const"
    \ ,                "var"
    \ ,                "extern"
    \ ,                "packed"
    \ ,                "export"
    \ ,                "pub"
    \ ,                "noalias"
    \ ,                "inline"
    \ ,                "noinline"
    \ ,                "comptime"
    \ ,                "callconv"
    \ ,                "volatile"
    \ ,                "allowzero"
    \ ,                "align"
    \ ,                "linksection"
    \ ,                "threadlocal"
    \ ,                "anytype"]
    \ , 'zigStructure': ["struct"
    \ ,                  "enum"
    \ ,                  "union"
    \ ,                  "error"
    \ ,                  "opaque"]
    \ , 'zigStatement': ["break"
    \ ,                  "return"
    \ ,                  "continue"
    \ ,                  "asm"
    \ ,                  "defer"
    \ ,                  "errdefer"
    \ ,                  "unreachable"
    \ ,                  "try"
    \ ,                  "catch"
    \ ,                  "async"
    \ ,                  "nosuspend"
    \ ,                  "await"
    \ ,                  "suspend"
    \ ,                  "resume"]
    \ , 'zigConditional': ["if"
    \ ,                    "else"
    \ ,                    "switch"
    \ ,                    "and"
    \ ,                    "or"
    \ ,                    "orelse"]
    \ , 'zigRepeat': ["while"
    \ ,               "for"]
    \ , 'zigConstant': ["null"
    \ ,                 "undefined"]
    \ , 'zigKeyword': ["fn"
    \ ,                "usingnamespace"
    \ ,                "test"]
    \ , 'zigType': ["bool"
    \ ,             "f16"
    \ ,             "f32"
    \ ,             "f64"
    \ ,             "f128"
    \ ,             "void"
    \ ,             "noreturn"
    \ ,             "type"
    \ ,             "anyerror"
    \ ,             "anyframe"
    \ ,             "i0"
    \ ,             "u0"
    \ ,             "isize"
    \ ,             "usize"
    \ ,             "comptime_int"
    \ ,             "comptime_float"
    \ ,             "c_short"
    \ ,             "c_ushort"
    \ ,             "c_int"
    \ ,             "c_uint"
    \ ,             "c_long"
    \ ,             "c_ulong"
    \ ,             "c_longlong"
    \ ,             "c_ulonglong"
    \ ,             "c_longdouble"
    \ ,             "c_void"]
    \ , 'zigBoolean': ["true"
    \ ,                "false"]
    \ , 'zigOperator': ["-"
    \ ,                 "+"
    \ ,                 "/"
    \ ,                 "*"
    \ ,                 "="
    \ ,                 "^"
    \ ,                 "&"
    \ ,                 "?"
    \ ,                 "|"
    \ ,                 "!"
    \ ,                 ">"
    \ ,                 "<"
    \ ,                 "%"
    \ ,                 "~"]
    \ , 'zigArrowCharacter': ["->"]
    \ , 'zigBuiltinFn': ["@add"
    \ ,                  "@WithOverflow"
    \ ,                  "@as"
    \ ,                  "@atomicLoad"
    \ ,                  "@atomicStore"
    \ ,                  "@bitCast"
    \ ,                  "@breakpoint"
    \ ,                  "@alignCast"
    \ ,                  "@alignOf"
    \ ,                  "@cDefine"
    \ ,                  "@cImport"
    \ ,                  "@cInclude"
    \ ,                  "@cUndef"
    \ ,                  "@canImplicitCast"
    \ ,                  "@clz"
    \ ,                  "@cmpxchgWeak"
    \ ,                  "@cmpxchgStrong"
    \ ,                  "@compileError"
    \ ,                  "@compileLog"
    \ ,                  "@ctz"
    \ ,                  "@popCount"
    \ ,                  "@divExact"
    \ ,                  "@divFloor"
    \ ,                  "@divTrunc"
    \ ,                  "@embedFile"
    \ ,                  "@export"
    \ ,                  "@tagName"
    \ ,                  "@TagType"
    \ ,                  "@errorName"
    \ ,                  "@call"
    \ ,                  "@errorReturnTrace"
    \ ,                  "@fence"
    \ ,                  "@fieldParentPtr"
    \ ,                  "@field"
    \ ,                  "@unionInit"
    \ ,                  "@frameAddress"
    \ ,                  "@import"
    \ ,                  "@newStackCall"
    \ ,                  "@asyncCall"
    \ ,                  "@intToPtr"
    \ ,                  "@memcpy"
    \ ,                  "@memset"
    \ ,                  "@mod"
    \ ,                  "@mulWithOverflow"
    \ ,                  "@splat"
    \ ,                  "@src"
    \ ,                  "@bitOffsetOf"
    \ ,                  "@byteOffsetOf"
    \ ,                  "@OpaqueType"
    \ ,                  "@panic"
    \ ,                  "@ptrCast"
    \ ,                  "@ptrToInt"
    \ ,                  "@rem"
    \ ,                  "@returnAddress"
    \ ,                  "@setCold"
    \ ,                  "@Type"
    \ ,                  "@shuffle"
    \ ,                  "@reduce"
    \ ,                  "@setRuntimeSafety"
    \ ,                  "@setEvalBranchQuota"
    \ ,                  "@setFloatMode"
    \ ,                  "@setGlobalLinkage"
    \ ,                  "@setGlobalSection"
    \ ,                  "@shlExact"
    \ ,                  "@This"
    \ ,                  "@hasDecl"
    \ ,                  "@hasField"
    \ ,                  "@shlWithOverflow"
    \ ,                  "@shrExact"
    \ ,                  "@sizeOf"
    \ ,                  "@bitSizeOf"
    \ ,                  "@sqrt"
    \ ,                  "@byteSwap"
    \ ,                  "@subWithOverflow"
    \ ,                  "@intCast"
    \ ,                  "@floatCast"
    \ ,                  "@intToFloat"
    \ ,                  "@floatToInt"
    \ ,                  "@boolToInt"
    \ ,                  "@errSetCast"
    \ ,                  "@truncate"
    \ ,                  "@typeInfo"
    \ ,                  "@typeName"
    \ ,                  "@TypeOf"
    \ ,                  "@atomicRmw"
    \ ,                  "@bytesToSlice"
    \ ,                  "@sliceToBytes"
    \ ,                  "@intToError"
    \ ,                  "@errorToInt"
    \ ,                  "@intToEnum"
    \ ,                  "@enumToInt"
    \ ,                  "@setAlignStack"
    \ ,                  "@frame"
    \ ,                  "@Frame"
    \ ,                  "@frameSize"
    \ ,                  "@bitReverse"
    \ ,                  "@Vector"
    \ ,                  "@sin"
    \ ,                  "@cos"
    \ ,                  "@exp"
    \ ,                  "@exp2"
    \ ,                  "@log"
    \ ,                  "@log2"
    \ ,                  "@log10"
    \ ,                  "@fabs"
    \ ,                  "@floor"
    \ ,                  "@ceil"
    \ ,                  "@trunc"
    \ ,                  "@round"]
    \ , 'zigDummyVariable': ["_"]
    \ }

function! s:syntax_keyword(dict)
  for key in keys(a:dict)
    execute 'syntax keyword' key join(a:dict[key], ' ')
  endfor
endfunction

call s:syntax_keyword(s:zig_syntax_keywords)

syntax match zigType "\v<[iu][1-9]\d*>"

"                                     12_34  (. but not ..)? (12_34)?     (exponent  12_34)?
syntax match zigDecNumber display   "\v<\d%(_?\d)*%(\.\.@!)?%(\d%(_?\d)*)?%([eE][+-]?\d%(_?\d)*)?"
syntax match zigHexNumber display "\v<0x\x%(_?\x)*%(\.\.@!)?%(\x%(_?\x)*)?%([pP][+-]?\d%(_?\d)*)?"
syntax match zigOctNumber display "\v<0o\o%(_?\o)*"
syntax match zigBinNumber display "\v<0b[01]%(_?[01])*"

syntax match zigCharacterInvalid display contained /b\?'\zs[\n\r\t']\ze'/
syntax match zigCharacterInvalidUnicode display contained /b'\zs[^[:cntrl:][:graph:][:alnum:][:space:]]\ze'/
syntax match zigCharacter /b'\([^\\]\|\\\(.\|x\x\{2}\)\)'/ contains=zigEscape,zigEscapeError,zigCharacterInvalid,zigCharacterInvalidUnicode
syntax match zigCharacter /'\([^\\]\|\\\(.\|x\x\{2}\|u\x\{4}\|U\x\{6}\)\)'/ contains=zigEscape,zigEscapeUnicode,zigEscapeError,zigCharacterInvalid

syntax region zigBlock start="{" end="}" transparent fold

syntax region zigCommentLine start="//" end="$" contains=zigTodo,@Spell
syntax region zigCommentLineDoc start="//[/!]/\@!" end="$" contains=zigTodo,@Spell

" TODO: match only the first '\\' within the zigMultilineString as zigMultilineStringPrefix
syntax match zigMultilineStringPrefix display contained /c\?\\\\/
syntax region zigMultilineString start="c\?\\\\" end="$" contains=zigMultilineStringPrefix

syntax keyword zigTodo contained TODO

syntax region zigString matchgroup=zigStringDelimiter start=+c\?"+ skip=+\\\\\|\\"+ end=+"+ oneline contains=zigEscape,zigEscapeUnicode,zigEscapeError,@Spell
syntax match zigEscapeError   display contained /\\./
syntax match zigEscape        display contained /\\\([nrt\\'"]\|x\x\{2}\)/
syntax match zigEscapeUnicode display contained /\\\(u\x\{4}\|U\x\{6}\)/

highlight default link zigDecNumber zigNumber
highlight default link zigHexNumber zigNumber
highlight default link zigOctNumber zigNumber
highlight default link zigBinNumber zigNumber

highlight default link zigBuiltinFn Function
highlight default link zigKeyword Keyword
highlight default link zigType Type
highlight default link zigCommentLine Comment
highlight default link zigCommentLineDoc SpecialComment
highlight default link zigTodo Todo
highlight default link zigString String
highlight default link zigStringDelimiter StorageClass
highlight default link zigMultilineString String
highlight default link zigMultilineStringContent String
highlight default link zigMultilineStringPrefix Comment
highlight default link zigCharacterInvalid Error
highlight default link zigCharacterInvalidUnicode zigCharacterInvalid
highlight default link zigCharacter Character
highlight default link zigEscape Special
highlight default link zigEscapeUnicode zigEscape
highlight default link zigEscapeError Error
highlight default link zigBoolean Boolean
highlight default link zigConstant Constant
highlight default link zigNumber Number
highlight default link zigArrowCharacter zigOperator
highlight default link zigOperator Operator
highlight default link zigStorage StorageClass
highlight default link zigStructure Structure
highlight default link zigStatement Statement
highlight default link zigConditional Conditional
highlight default link zigRepeat Repeat

delfunction s:syntax_keyword

let b:current_syntax = "zig"

let &cpo = s:cpo_save
unlet! s:cpo_save
