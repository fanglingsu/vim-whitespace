" whitespace.vim:   shows traling whitespace and removes it before save
" Last Modified:    2011-10-09 00:44:10
" Author:           Daniel Carl
" Version:          0.1

" DESCRIPTION:
"   Removes all trailing whitespaces from buffer before the buffer is saved.
"   The cleanup can be limitated to listed filetypes.
"
"   let g:ws_ft_highlight = ['php']
"   let g:ws_ft_autoremove = ['txt', 'php']

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

command! -nargs=0 DeleteTrailingWS :call DeleteTrailingWS()

" process highlighting of traing whitespace
if (exists('g:ws_ft_highlight') && len(g:ws_ft_highlight) > 0)
    " highlight trailing whitespace
    highlight ExtraWhitespace ctermbg=darkgreen guibg=green

    " redefine highlight group also if other commands hav removed it
    au ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=green

    exec 'au Syntax * if (index(g:ws_ft_highlight, &filetype) >= 0) | match ExtraWhitespace /\s\+$/ | else | match | endif'
endif"

" process autoremoving of traing whitespace
if (exists('g:ws_ft_autoremove') && len(g:ws_ft_autoremove) > 0)
    exec 'au BufWritePre <buffer> if (index(g:ws_ft_autoremove, &filetype) >= 0) | :call DeleteTrailingWS() | endif'
endif"

" vim:sts=4:sw=4:et:
