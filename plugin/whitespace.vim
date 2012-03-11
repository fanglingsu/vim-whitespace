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
fun! DeleteTrailingWS()
    let b:l = line(".")
    let b:c = col(".")
    %s/\s\+$//ge
    call cursor(b:l, b:c)
endfun

let s:whitespace_highlight = 1
fun ToggleDisplayWhitespace()
    if s:whitespace_highlight
        highlight ExtraWhitespace ctermbg=darkgreen guibg=green
        match ExtraWhitespace /\s\+$/
    else
        match
    endif
    let s:whitespace_highlight = !s:whitespace_highlight
endfun

command! -nargs=0 DeleteTrailingWS :call DeleteTrailingWS()
command! -nargs=0 ToggleDisplayWhitespace :call ToggleDisplayWhitespace()

" vim:sts=4:sw=4:et:
