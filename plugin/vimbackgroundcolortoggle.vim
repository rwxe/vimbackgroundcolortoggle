" ==============================================================================
" Name:         vimbackgroundcolortoggle
" Description:  Vim background color toggle
" Author:       github: rwxe
" Version:      0.0.0.1
" License:      Same as Vim
" Created:      Oct 12, 2019
" README:       
"               This plugin does nothing but one thing, clears the background 
"               color or restore it.
"               In the GUI terminal that supports the translucent background, 
"               setting the theme background color to `NONE` can achieve 
"               the effect of translucent background in vim.
"               Installation:
"               Put this file in the "~/.vim/plugin" directory or directly 
"               copy the code below the README COMMENT into "~/.vimrc".
"               If using a plugin manager, just follow their general plugin
"               installation steps.
"               Usage:
"               Run ":BackgroundColorToggle" command. If the background has
"               color, it will be cleared. If it is already no color, it will 
"               be restored to the previous background color
"               Configuration:
"               You can also set a shorter command or mapping in `.vimrc`.
"               To set `BC` command to toggle background color.
"                  Example: command BC :BackgroundColorToggle<CR>
"               To set `<F10>` key to toggle background color.
"                  Example: map <F10> :BackgroundColorToggle<CR>
" ==============================================================================

command! BackgroundColorToggle call BackgroundColorToggle() 
func BackgroundColorToggle()
    let l:bg_hi_group = execute('hi Normal')

    if l:bg_hi_group =~# 'guibg' || l:bg_hi_group =~# 'ctermbg'
        let l:bg_color_on=1
    else
        let l:bg_color_on=0
    endif

	if l:bg_color_on==1
        let g:bgct_bg_color_hi_group = execute('hi Normal')
		exec 'hi Normal ctermbg=None guibg=NONE'
	else
        let l:bg_hi_group_args = split(g:bgct_bg_color_hi_group, '\s\+')
        let l:exec_hi_str = join(l:bg_hi_group_args[2:], ' ')
        exec 'hi Normal ' . exec_hi_str
	endif
endfunc

