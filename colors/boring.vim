" Inspired by and based on Berk D. Demir's `noclown`:
" https://github.com/bdd/.vim/blob/09b4dbef06612c52c9c160773645bea82c0f490d/colors/noclown.vim

hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "boring"

" Terminals that don't support italics resort to rendering them as standout.
" For comments and other things we italicize, this can become annoying very
" quickly.  We are going to ignore 'italic' attribute if the terminal doesn't
" know about it.
let g:boring_has_italics = 0
if (has('gui_running') || has('unix') && system('tput sitm') == "\e[3m")
  let g:boring_has_italics = 1
endif

let s:palette = {
      \ 'bg'   : ["black", '#000000'],
      \ 'fg'   : ["white", '#ffffff'],
      \ 'dull' : [    251, '#c6c6c6'],
      \ 'dark' : [    246, '#949494'],
      \ 'deep' : [    239, '#4e4e4e'],
      \ }

function! s:Clear(group)
  execute 'highlight! clear ' . a:group
  execute 'highlight ' . a:group . ' NONE'
endfunction

function! s:Define(group, fg, bg, style)
  call s:Clear(a:group)

  let [l:ctermfg, l:guifg] = s:palette[a:fg]
  let [l:ctermbg, l:guibg] = s:palette[a:bg]

  let l:style = g:boring_has_italics || a:style != 'italic' ? a:style : 'NONE'

  let l:hi_expr = 'highlight ' . a:group
  let l:hi_expr .= ' cterm=' . l:style
  let l:hi_expr .= ' ctermfg=' . l:ctermfg
  let l:hi_expr .= ' ctermbg=' . l:ctermbg
  let l:hi_expr .= ' gui=' . l:style
  let l:hi_expr .= ' guifg=' . l:guifg
  let l:hi_expr .= ' guibg=' . l:guibg

  execute l:hi_expr
endfunction

function! s:Link(from, to)
  call s:Clear(a:from)
  execute 'highlight link ' . a:from . ' ' . a:to
endfunction

call s:Define('Normal',		'fg',	'bg',	'NONE')
call s:Define('PreProc',	'dull',	'bg',	'NONE')
call s:Define('Constant',	'dull',	'bg',	'NONE')
call s:Define('String',		'dull',	'bg',	'italic')
call s:Define('Comment',	'dark',	'bg',	'NONE')
call s:Define('SpecialKey',	'deep',	'bg',	'NONE')
call s:Define('TODO',		'dark',	'bg',	'bold')
call s:Define('IncSearch',	'dull',	'bg',	'inverse')
call s:Define('Search',		'fg',	'bg',	'inverse')
call s:Define('Folded',		'dark',	'bg',	'inverse')
call s:Define('Title',		'fg',	'bg',	'bold')
call s:Define('Underlined',	'fg',	'bg',	'underline')
call s:Define('Pmenu	',	'fg',	'bg',	'inverse')
call s:Define('PmenuSel',	'fg',	'bg',	'bold')
call s:Define('MatchParen',	'fg',	'bg',	'bold')

call s:Clear('Identifier')
call s:Clear('Special')
call s:Clear('Statement')
call s:Clear('Type')
call s:Clear('WarningMsg')
call s:Clear('Wildmenu')
call s:Clear('Directory')
call s:Clear('LineNr')
call s:Clear('SignColumn')

call s:Link('NonText', 'SpecialKey')
call s:Link('Error', 'Search')
call s:Link('ErrorMsg', 'Search')
call s:Link('FoldColumn', 'Folded')
