" whitespace.vim:   shows traling whitespace and removes it before save
" Last Modified:    2011-10-09 00:44:10
" Author:           Daniel Carl
" Version:          0.1

" DESCRIPTION:
"   Removes all trailing whitespaces from buffer before the buffer is saved.
"   The cleanup can be limitated to listed filetypes.

if (exists("g:loaded_whitespace") && g:loaded_whitespace) || &cp
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

if (exists('g:whitespace_filetypes') && len(g:whitespace_filetypes) > 0)
    " highlight trailing whitespace
    "exec 'au FileType '.g:whitespace_filetypes.' highlight ExtraWhitespace ctermbg=darkgreen guibg=green'
    :match Search /\s\+$/

    for type in split(g:whitespace_filetypes, ",")
        exec 'au BufWritePre <buffer> if (&filetype == "'.type.'") | :call DeleteTrailingWS() | endif'
    endfor
endif"

" vim:sts=4:sw=4:et:
