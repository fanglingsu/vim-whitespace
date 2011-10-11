vim-whitespace
==============

This very small plugin was implemented to have a place to handle whitespace
issues. At the moment it's possible to highlight trailing whitespace and to
remove all trailing whitespace before the buffer is written to file. Both
things can be enabled for different filetypes.

Configuration
-------------

`let g:ws_ft_highlight = ['c','php','ditaa']` holds the list of filetypes
where trailing whitespace is highlighted green.

`let g:ws_ft_autoremove = ['c', 'php']` hold the filetypes for that the
trailing whitespace is removed before they are saved.
