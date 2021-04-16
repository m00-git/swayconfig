set number
syntax on
set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set colorcolumn=80
set tw=80
highlight LineNr term=bold cterm=NONE ctermfg=LightBlue ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set cursorline
set cursorlineopt=number
highlight CursorLineNr cterm=bold term=bold gui=bold ctermfg=1

vnoremap <C-c> "*y

"alphsubs ---------------------- {{{
        execute "digraphs as " . 0x2090
        execute "digraphs es " . 0x2091
        execute "digraphs hs " . 0x2095
        execute "digraphs is " . 0x1D62
        execute "digraphs js " . 0x2C7C
        execute "digraphs ks " . 0x2096
        execute "digraphs ls " . 0x2097
        execute "digraphs ms " . 0x2098
        execute "digraphs ns " . 0x2099
        execute "digraphs os " . 0x2092
        execute "digraphs ps " . 0x209A
        execute "digraphs rs " . 0x1D63
        execute "digraphs ss " . 0x209B
        execute "digraphs ts " . 0x209C
        execute "digraphs us " . 0x1D64
        execute "digraphs vs " . 0x1D65
        execute "digraphs xs " . 0x2093
        
        execute "digraphs aS " . 0x1d43
        execute "digraphs bS " . 0x1d47
        execute "digraphs cS " . 0x1d9c
        execute "digraphs dS " . 0x1d48
        execute "digraphs eS " . 0x1d49
        execute "digraphs fS " . 0x1da0
        execute "digraphs gS " . 0x1d4d
        execute "digraphs hS " . 0x02b0
        execute "digraphs iS " . 0x2071
        execute "digraphs jS " . 0x02b2
        execute "digraphs kS " . 0x1d4f
        execute "digraphs lS " . 0x02e1
        execute "digraphs mS " . 0x1d50
        execute "digraphs nS " . 0x207f
        execute "digraphs oS " . 0x1d52
        execute "digraphs pS " . 0x1d56
        execute "digraphs rS " . 0x02b3
        execute "digraphs sS " . 0x02e2
        execute "digraphs tS " . 0x1d57
        execute "digraphs uS " . 0x1d58
        execute "digraphs vS " . 0x1d5b
        execute "digraphs wS " . 0x02b7
        execute "digraphs xS " . 0x02e3
        execute "digraphs yS " . 0x02b8
        execute "digraphs zS " . 0x1dbb
        
        execute "digraphs AS " . 0x1D2C
        execute "digraphs BS " . 0x1D2E
        execute "digraphs DS " . 0x1D30
        execute "digraphs ES " . 0x1D31
        execute "digraphs GS " . 0x1D33
        execute "digraphs HS " . 0x1D34
        execute "digraphs IS " . 0x1D35
        execute "digraphs JS " . 0x1D36
        execute "digraphs KS " . 0x1D37
        execute "digraphs LS " . 0x1D38
        execute "digraphs MS " . 0x1D39
        execute "digraphs NS " . 0x1D3A
        execute "digraphs OS " . 0x1D3C
        execute "digraphs PS " . 0x1D3E
        execute "digraphs RS " . 0x1D3F
        execute "digraphs TS " . 0x1D40
        execute "digraphs US " . 0x1D41
        execute "digraphs VS " . 0x2C7D
        execute "digraphs WS " . 0x1D42
        
        execute "digraphs 0S " . 0x2070
        execute "digraphs 1S " . 0xB9
        execute "digraphs 2S " . 0xB2
        execute "digraphs 3S " . 0xB3
        execute "digraphs 4S " . 0x2074 
        execute "digraphs 5S " . 0x2075
        execute "digraphs 6S " . 0x2076
        execute "digraphs 7S " . 0x2077
        execute "digraphs 8S " . 0x2078
        execute "digraphs 9S " . 0x2079

        execute "digraphs +S " . 0x207A
        execute "digraphs -S " . 0x207B
        execute "digraphs =S " . 0x207C
        execute "digraphs (S " . 0x207D
        execute "digraphs )S " . 0x207E
        execute "digraphs nS " . 0x207F

        execute "digraphs 0s " . 0x2080
        execute "digraphs 1s " . 0x2081
        execute "digraphs 2s " . 0x2082
        execute "digraphs 3s " . 0x2083
        execute "digraphs 4s " . 0x2084
        execute "digraphs 5s " . 0x2085
        execute "digraphs 6s " . 0x2086
        execute "digraphs 7s " . 0x2087
        execute "digraphs 8s " . 0x2088
        execute "digraphs 9s " . 0x2089
"}}}

"   if more special chars are needed, consult https://vimhelp.org/digraph.txt.html
