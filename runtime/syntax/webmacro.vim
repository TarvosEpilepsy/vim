" WebMacro syntax file
" Language:     WebMacro
" Maintainer:   Claudio Fleiner <claudio@fleiner.com>
" URL:		http://www.fleiner.com/vim/syntax/webmacro.vim
" Last Change:  2003 May 11

" webmacro is a nice little language that you should
" check out if you use java servlets.
" webmacro: http://www.webmacro.org

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  " quit when a syntax file was already loaded
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'webmacro'
endif


runtime! syntax/html.vim
unlet b:current_syntax

syn cluster htmlPreProc add=webmacroIf,webmacroUse,webmacroBraces,webmacroParse,webmacroInclude,webmacroSet,webmacroForeach,webmacroComment

syn match webmacroVariable "\$[a-zA-Z0-9.()]*;\="
syn match webmacroNumber "[-+]\=\d\+[lL]\=" contained
syn keyword webmacroBoolean true false contained
syn match webmacroSpecial "\\." contained
syn region  webmacroString   contained start=+"+ end=+"+ contains=webmacroSpecial,webmacroVariable
syn region  webmacroString   contained start=+'+ end=+'+ contains=webmacroSpecial,webmacroVariable
syn region webmacroList contained matchgroup=Structure start="\[" matchgroup=Structure end="\]" contains=webmacroString,webmacroVariable,webmacroNumber,webmacroBoolean,webmacroList

syn region webmacroIf start="#if" start="#else" end="{"me=e-1 contains=webmacroVariable,webmacroNumber,webmacroString,webmacroBoolean,webmacroList nextgroup=webmacroBraces
syn region webmacroForeach start="#foreach" end="{"me=e-1 contains=webmacroVariable,webmacroNumber,webmacroString,webmacroBoolean,webmacroList nextgroup=webmacroBraces
syn match webmacroSet "#set .*$" contains=webmacroVariable,webmacroNumber,webmacroNumber,webmacroBoolean,webmacroString,webmacroList
syn match webmacroInclude "#include .*$" contains=webmacroVariable,webmacroNumber,webmacroNumber,webmacroBoolean,webmacroString,webmacroList
syn match webmacroParse "#parse .*$" contains=webmacroVariable,webmacroNumber,webmacroNumber,webmacroBoolean,webmacroString,webmacroList
syn region webmacroUse matchgroup=PreProc start="#use .*" matchgroup=PreProc end="^-.*" contains=webmacroHash,@HtmlTop
syn region webmacroBraces matchgroup=Structure start="{" matchgroup=Structure end="}" contained transparent
syn match webmacroBracesError "[{}]"
syn match webmacroComment "##.*$"
syn match webmacroHash "[#{}\$]" contained

" Define the default highlighting.
" Only when an item doesn't have highlighting yet
command -nargs=+ HiLink hi def link <args>

HiLink webmacroComment CommentTitle
HiLink webmacroVariable PreProc
HiLink webmacroIf webmacroStatement
HiLink webmacroForeach webmacroStatement
HiLink webmacroSet webmacroStatement
HiLink webmacroInclude webmacroStatement
HiLink webmacroParse webmacroStatement
HiLink webmacroStatement Function
HiLink webmacroNumber Number
HiLink webmacroBoolean Boolean
HiLink webmacroSpecial Special
HiLink webmacroString String
HiLink webmacroBracesError Error
delcommand HiLink

let b:current_syntax = "webmacro"

if main_syntax == 'webmacro'
  unlet main_syntax
endif
