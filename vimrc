set nocompatible
filetype off

call pathogen#infect()


set number

au VimEnter *  NERDTree
function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction

autocmd WinEnter * call NERDTreeQuit()

autocmd VimEnter * wincmd p
" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" At lease show in which mode we are working
set showmode
set cursorline

" Set tab/spaces config
set expandtab shiftwidth=4 softtabstop=4 smarttab smartindent

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif

" Autoload changes in .vimrc
autocmd BufWritePost .vimrc source $MYVIMRC

" Color theme
" [adaryn.vim, adrian.vim, aiseered.vim, anotherdark.vim, aqua.vim, asmanian2.vim, asmdev2.vim, asmdev.vim, astronaut.vim, asu1dark.vim,
" autumn2.vim, autumnleaf.vim, autumn.vim, baycomb.vim, bclear.vim, biogoo.vim, blacksea.vim, bluegreen.vim, borland.vim, breeze.vim,
" brookstream.vim, buttercream.vim, calmar256-dark.vim, calmar256-light.vim, camo.vim, candycode.vim, candy.vim, chela_light.vim, chocolateliquor.vim,
" clarity.vim, cleanphp.vim, colorer.vim, dante.vim, darkblue2.vim, darkbone.vim, darkslategray.vim, darkspectrum.vim, darkZ.vim, dawn.vim,
" denim.vim, desert256.vim, desertEx.vim, dusk.vim, dw_blue.vim, dw_cyan.vim, dw_green.vim, dw_orange.vim, dw_purple.vim, dw_red.vim, dw_yellow.vim,
" earendel.vim, eclipse.vim, ekvoli.vim, fine_blue2.vim, fine_blue.vim, fnaqevan.vim, fog.vim, freya.vim, fruit.vim, fruity.vim, golden.vim,
" guardian.vim, habilight.vim, herald.vim, impact.vim, inkpot.vim, ir_black.vim, ironman.vim, jammy.vim, jellybeans.vim, kellys.vim, leo.vim,
" lettuce.vim, lucius.vim, manxome.vim, marklar.vim, maroloccio.vim, martin_krischik.vim, matrix.vim, molokai.vim, moria.vim, moss.vim,
" motus.vim, mustang.vim, navajo-night.vim, navajo.vim, neon.vim, neverness.vim, nightshimmer.vim, night.vim, no_quarter.vim, northland.vim,
" nuvola.vim, oceanblack.vim, oceandeep.vim, oceanlight.vim, olive.vim, papayawhip.vim, peaksea.vim, print_bw.vim, pyte.vim, railscasts2.vim,
" railscasts.vim, rdark.vim, relaxedgreen.vim, robinhood.vim, rootwater.vim, satori.vim, sea.vim, settlemyer.vim, sienna.vim, silent.vim,
" simpleandfriendly.vim, softblue.vim, soso.vim, spring.vim, summerfruit256.vim, synic.vim, tabula.vim, tango2.vim, tango.vim, taqua.vim,
" tcsoft.vim, tir_black.vim, tolerable.vim, torte.vim, twilight.vim, two2tango.vim, vc.vim, vibrantink.vim, vividchalk.vim, vylight.vim,
" winter.vim, wombat256mod.vim, wombat256.vim, wombat.vim, wood.vim, wuye.vim, xemacs.vim, xoria256.vim, zenburn.vim, zmrok.vim]

" colorscheme night

sy on
set t_Co=256
if has('gui_running')
    colorscheme wombat
else
    colorscheme wombat256mod
endif

" Show number lines the title of the window and the ruler
set number 
set title 
set ruler

" ctags
let g:ctags_path = "~/.vim/bundle/ctags.vim"
let g:ctags_statusline=1

" Taglist
" let Tlist_Ctags_Cmd = "~/.vim/bundle/taglist.vim"
noremap <silent><F3> :TlistToggle<CR>
let Tlist_Auto_Update = 1
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
let tlist_clojure_settings = 'lisp;f:function'
let Tlist_Exit_OnlyWindow=1
let Tlist_Auto_Open=0
let Tlist_Sort_Type = "name"
let Tlist_File_Fold_Auto_Close=1
let Tlist_GainFocus_On_ToggleOpen=0 
autocmd VimEnter *.java Tlist
" autocmd VimEnter *.xml Tlist
autocmd VimEnter *.php Tlist
autocmd VimEnter *.py Tlist
autocmd VimEnter *.c Tlist
autocmd VimEnter *.h Tlist
autocmd VimEnter *.cpp Tlist
autocmd VimEnter *.rb Tlist
autocmd VimEnter *.clj Tlist
" NERDTree 
nnoremap <silent><F2> :NERDTreeToggle<CR>
let NERDTreeAutoCenter = 1
let NERDTreeCaseSensitiveSort = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeMouseMode = 2
let NERDTreeShowBookmarks = 1
autocmd VimEnter *.java NERDTree
autocmd VimEnter *.xml NERDTree
autocmd VimEnter *.php NERDTree
autocmd VimEnter *.py NERDTree
autocmd VimEnter *.c NERDTree
autocmd VimEnter *.h NERDTree
autocmd VimEnter *.cpp NERDTree
autocmd VimEnter *.clj NERDTree
autocmd VimEnter *.rb NERDTree
autocmd VimEnter *. wincmd p
autocmd VimEnter * wincmd l

au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
map   <silent> <F7> mmgg=G'm
imap  <silent> <F7> <Esc> mmgg=G'm

au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2 
au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2 

" Move around the windows
noremap <silent> ,j :wincmd j<CR>
noremap <silent> ,h :wincmd h<CR>
noremap <silent> ,k :wincmd k<CR>
noremap <silent> ,l :wincmd l<CR>

"Maped keys
noremap <silent> qq :qa<CR>

let g:pydiction_location = '~/.vim/after/ftplugin/pydict/complete-dict'
:vnoremap > >gv
:vnoremap <lt> <lt>gv

" GRB: use fancy buffer closing that doesn't close the split
cnoremap <expr> bd (getcmdtype() == ':' ? 'Bclose' : 'bd')
:nnoremap <silent> <S-Left> :bprevious<CR>
:nnoremap <silent> <S-Right> :bnext<CR>
:noremap <silent> <C-Left> b
:noremap <silent> <C-Right> w

" Here's the vimclojure stuff. You'll need to adjust the NailgunClient
" setting if you're on windows or have other problems.
"let vimclojure#FuzzyIndent=1
"let vimclojure#HighlightBuiltins=1
"let vimclojure#HighlightContrib=1
"let vimclojure#DynamicHighlighting=1
"let vimclojure#ParenRainbow=1
"let vimclojure#WantNailgun = 1 
"let vimclojure#NailgunClient = $HOME . "/.vim/lib/ng"
"let g:vimclojure#SplitPos="right"
"let vimclojure#SplitSize = 42

" Paredit
let g:paredit_mode = 0
":noremap <silent> <F4> :ClojureRepl<CR>

:let maplocalleader = ','
"au BufRead,BufNewFile *.clj nmap <CR> <Plug>ClojureEvalToplevel
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set viminfo+=!
let g:rbpt_colorpairs = [
            \ ['darkyellow',  'orangered3'],
            \ ['darkgreen',   'orange2'],
            \ ['blue',        'yellow3'],
            \ ['darkmagenta', 'olivedrab4'],
            \ ['red',         'green4'],
            \ ['darkyellow',  'paleturquoise3'],
            \ ['darkgreen',   'deepskyblue4'],
            \ ['blue',        'darkslateblue'],
            \ ['darkmagenta', 'darkviolet'],
            \ ]

:noremap <silent> cqa :%Eval<CR>
:noremap <silent> cs :lopen<CR>
