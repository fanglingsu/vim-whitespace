" whitespace.vim:   shows traling whitespace and removes it before save
" Last Modified:    2012-03-11 23:35:23
" Author:           Daniel Carl
" Version:          0.2

" DESCRIPTION:
"   Provides functions to highlight and remove trailing whitespace

if (exists("g:loaded_whitespace")) || &cp
    finish
endif
let g:loaded_whitespace = 1

" delete trailing white space
fun! s:DeleteTrailingWS(startLine, endLine)
    let l:cursor = getpos('.')
    exe a:startLine . ',' . a:endLine . 's/\s\+$//ge'
    call setpos('.', l:cursor)
endfun

let s:whitespace_highlight = 1
fun! s:ToggleDisplayWhitespace()
    if s:whitespace_highlight
        highlight ExtraWhitespace ctermbg=darkgreen guibg=green
        match ExtraWhitespace /\s\+$/
    else
        match
    endif
    let s:whitespace_highlight = !s:whitespace_highlight
endfun

command! -range=% -nargs=0 DeleteTrailingWS call <SID>DeleteTrailingWS(<line1>, <line2>)
command! -nargs=0 ToggleDisplayWhitespace call <SID>ToggleDisplayWhitespace()

" vim:sts=4:sw=4:et:
