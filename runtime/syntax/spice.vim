" Vim syntax file
" Language:	Spice circuit simulator input netlist
" Maintainer:	Noam Halevy <Noam.Halevy.motorola.com>
" Last Change:	2012 Jun 01
" 		(Dominique Pelle added @Spell)
"
" This is based on sh.vim by Lennart Schultz
" but greatly simplified

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" spice syntax is case INsensitive
syn case ignore

syn keyword	spiceTodo	contained TODO

syn match spiceComment  "^ \=\*.*$" contains=@Spell
syn match spiceComment  "\$.*$" contains=@Spell

" Numbers, all with engineering suffixes and optional units
"==========================================================
"floating point number, with dot, optional exponent
syn match spiceNumber  "\<[0-9]\+\.[0-9]*\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="
"floating point number, starting with a dot, optional exponent
syn match spiceNumber  "\.[0-9]\+\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="
"integer number with optional exponent
syn match spiceNumber  "\<[0-9]\+\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="

" Misc
"=====
syn match   spiceWrapLineOperator       "\\$"
syn match   spiceWrapLineOperator       "^+"

syn match   spiceStatement      "^ \=\.\I\+"

" Matching pairs of parentheses
"==========================================
syn region  spiceParen transparent matchgroup=spiceOperator start="(" end=")" contains=ALLBUT,spiceParenError
syn region  spiceSinglequote matchgroup=spiceOperator start=+'+ end=+'+

" Errors
"=======
syn match spiceParenError ")"

" Syncs
" =====
syn sync minlines=50

" Define the default highlighting.
" Only when an item doesn't have highlighting yet
command -nargs=+ HiLink hi def link <args>

HiLink spiceTodo		Todo
HiLink spiceWrapLineOperator	spiceOperator
HiLink spiceSinglequote	spiceExpr
HiLink spiceExpr		Function
HiLink spiceParenError	Error
HiLink spiceStatement		Statement
HiLink spiceNumber		Number
HiLink spiceComment		Comment
HiLink spiceOperator		Operator

delcommand HiLink

let b:current_syntax = "spice"

" insert the following to $VIM/syntax/scripts.vim
" to autodetect HSpice netlists and text listing output:
"
" " Spice netlists and text listings
" elseif getline(1) =~ 'spice\>' || getline("$") =~ '^\.end'
"   so <sfile>:p:h/spice.vim

" vim: ts=8
