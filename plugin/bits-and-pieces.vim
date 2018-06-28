"bits and pieces of vim
"vim script that doesn't have a home anywhere else

function! SetFont()
    let res=system('xrandr | egrep "\*" | cut -f 4 -d " "')
    if res =~ "2560x1440"
        set guifont=inconsolata\ 14
    else
        set guifont=inconsolata\ 12
    endif
endfunction

"define a script variable that indexes into the colorscheme array
"these contain my favourite colorschemes
let s:colorschemes = ['ayu', 'deus', 'jellybeans', 'no-quarter', 'solarized', 'wombat', 'synic', 'ir_black', 'ps_color',
      \ 'brookstream', 'darkspectrum', 'inkpot', 'freya', 'anokha']
let s:colorscheme_idx = 0

"function that rotates through the colorscheme array.
function! RotateColorscheme()
    let s:colorscheme_idx += 1
    if s:colorscheme_idx >= len(s:colorschemes)
        let s:colorscheme_idx = 0
    endif
    let l:name = s:colorschemes[s:colorscheme_idx]
    execute 'colorscheme '.l:name
endfunction
