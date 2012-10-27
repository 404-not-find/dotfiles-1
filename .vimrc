"        File: .vimrc [Vim resource script]
" Description: Settings, commands and mappings for Vim
"  Maintainer: Pete Johns <paj-vim@johnsy.com>
"         URL: http://github.com/johnsyweb/dotfiles/blob/master/.vimrc

"""" I'm having some terminal problems under Solaris.
"""" These mappings help:
map <Esc>[1~   <Home>
map <Esc>[2~   <Insert>
map <Esc>[3~   <Delete>
map <Esc>[4~   <End>
map <Esc>[5~   <PageUp>
map <Esc>[6~   <PageDown>
map <Esc>[A    <Up>
map <Esc>[B    <Down>
map <Esc>[C    <Right>
map <Esc>[D    <Left>
map <Esc>[11~  <F1>
map <Esc>[12~  <F2>
map <Esc>[13~  <F3>
map <Esc>[14~  <F4>
map <Esc>[15~  <F5>
map <Esc>[17~  <F6>
map <Esc>[18~  <F7>
map <Esc>[19~  <F8>
map <Esc>[20~  <F9>
map <Esc>[21~  <F10>
"" F11 and F12 are the same as S-F1 and S-F2, respectively
map <Esc>[23~  <S-F1>
map <Esc>[24~  <S-F2>
map <Esc>[25~  <S-F3>
map <Esc>[26~  <S-F4>
map <Esc>[28~  <S-F5>
map <Esc>[29~  <S-F6>
map <Esc>[31~  <S-F7>
map <Esc>[32~  <S-F8>
map <Esc>[33~  <S-F9>
map <Esc>[34~  <S-F10>
"""" And sometimes on my Mac, too...
if has('multi_byte')
    imap       <BS>
    cmap       <BS>
endif

"""" Handy keys on the command-line from, ahem, some other system...
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

"""" GLOBAL OPTIONS {{{
set   autoindent
set   autowrite
set   background=dark
set   backspace=indent,eol,start
set   browsedir=buffer
set nocindent
set   cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=s,ps,t0,+s,(s,)20,*30,g0,is,Ws,U4
set   cinwords=
set   clipboard=exclude:.*
set   cmdheight=2
set nocp
set   dictionary=/usr/share/dict/words
set   diffopt+=iwhite
set   display=uhex
set noerrorbells
set   equalalways
set   expandtab
set   grepprg=ack
set   helpheight=15
set   history=10000
set   hls
set   ignorecase
set   incsearch
set noinfercase
set noinsertmode
set nojoinspaces
set   laststatus=2
set   makeprg=make
set   matchpairs=(:),{:},[:],<:>
set   matchtime=2
set   mousefocus
set   mousehide
set   mousemodel=popup_setpos
if has('multi_byte')
    set showbreak=↪
endif
set   showcmd
set   smd
set nostartofline
set nottyfast
set   nrformats-=octal  " Don't bother with octal, I never use it
set   report=0
set   scrolloff=4
set   shiftround
set   shiftwidth=4
set   shortmess=filmnxtToO
set   showfulltag
set   showmatch
set   showmode
set   smartindent
set   smarttab
set   statusline=[%n]\ %<%f%h%m\ %{fugitive#statusline()}
set   statusline+=\ %#warningmsg#
set   statusline+=%{SyntasticStatuslineFlag()}
set   statusline+=%*
set   statusline+=\ %r%=%b\ 0x%B\ \ %l,%c%V\ %P
set   tabstop=8
set   tags+=$WKSPACE/tags,$WKSPACE/src/tags
set   textwidth=0
set   titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
set   vb t_vb=
set   viminfo='8,f1,"8,n${HOME}/.viminfo
set   virtualedit=block
set   visualbell
set   wildmenu
set   wildmode=longest,list
set nowrap
""" }}}

"""" Turn on file type stuff to let Vim work its magic {{{
filetype plugin indent on
"""" }}}

"""" ToHTML options... {{{
let html_use_css=1
let html_no_pre=1
let use_xhtml=1
"""" }}}

"""" *xml-folding* {{{
let g:xml_syntax_folding = 1
"""" }}}

"""" PHP Syntax {{{
"XXX Move to .vim/ftplugin/php.vim
let php_sql_query=1
let php_baselib=1
let php_htmlInStrings=1
let php_folding=0
""""}}}

"""" If we're in a colour terminal (or this is the GUI version), turn on syntax. {{{
if (&t_Co > 1 ) || has("gui_running")
    syntax on
    if (&t_Co >= 256)
        let g:solarized_termcolors=256
    endif
endif
""""}}}

"""" You could put this in .gvimrc, but I like having just the one file to move {{{
"""" from server to server.
if has("gui_running")
    set guicursor=a:blinkon0
    set guioptions=bgmprT

    if exists(":winpos") == 2
        winpos 0 0
    endif
    set lines=50 columns=80
endif
""""}}}

"""" 20060318 using PSCP on Windows. N.B: Works best with Pageant. {{{
if ($OS =~"Windows")
    let g:netrw_scp_cmd="\"c:\\Program Files\\PuTTY\\pscp.exe\" -q"
endif
""""}}}

"""" GUI OPTIONS -- MENUS {{{
amenu &PAJ.Edit\ _&vimrc              :edit $MYVIMRC<CR>
amenu &PAJ.Convert\ &TABs\ to\ spaces :%s/<TAB>/    /g<CR>
amenu &PAJ.Set\ DOS\ text\ format     :set fileformat=dos<CR>
amenu &PAJ.Set\ UNIX\ text\ format    :set fileformat=unix<CR>
amenu &PAJ.Strip\ \quotes\            :%s/> *//g<CR>
amenu &PAJ.Strip\ trailing\ spaces    :%s/[ <TAB>]\+$//g<CR>
amenu &PAJ.Strip\ leading\ spaces     :%s/^\ \+//g<CR>
amenu &PAJ.Shrink\ white\ space       :%s/\ \+/ /g<CR>
""""}}}


"""" AUTOCMDS -- TESTING {{{
set   verbose=0
""""}}}

"""" AUTOCMDS -- GLOBAL {{{
""autocmd VimEnter * set vb t_vb=
""""}}}

"""" AUTOCMDS -- Web {{{
autocmd BufEnter,BufRead *w3m*  set filetype=html
autocmd FileType html set textwidth=80
autocmd FileType html set formatoptions=tcrq
" This is the magic for making a backup of what I enter into a <textarea>...
autocmd BufWrite,BufLeave *w3m*  execute "write! ".expand("<afile>").".backup"
""""}}}


"""" AUTOCMDS -- SOURCE CODE -- JAVA {{{
autocmd BufEnter,BufRead *.java  set errorformat=\"%f\"\\\,\ line\ %l.%c:%m\,\ %f:%l:%m
""""}}}

"""" AUTOCMDS -- CONFIGURATION FILES {{{
autocmd BufEnter,BufRead *.cf,*.rules,*.tmpl  set tabstop=8
""""}}}

autocmd BufEnter,BufRead *sqsh-edit* set filetype=sql

"""" KEY MAPPINGS -- GENERAL {{{
nnoremap <Leader>rls :%s/^\s\+//e<CR>
nnoremap <Leader>rts :%s/\s\+$//e<CR>
nnoremap <Leader>date a<CR>=strftime("%Y%m%d")<CR><Esc>
nnoremap <Leader>time a<CR>=strftime("%H:%M")<CR><Esc>
nnoremap <Leader>stamp a<CR>=strftime("%Y%m%d%H%M%S")<CR><Esc>
nnoremap <Leader>vimrc :e $MYVIMRC<CR>
""""}}}

"""" KEY MAPPINGS -- COMMAND MODE {{{
" ',c' -- Comment out the current line, appending a '/* paj */' tag
nnoremap <Leader>c :s}^\([    ]*\)\(.*\)$}\1/* \2 */ /* ${LOGNAME} */}<CR>
" ',C' -- Uncomment the current line, removing a '/* paj */' tag
nnoremap <Leader>C :s}/* \(.*\) */ /* ${LOGNAME} */}\1/<CR>
""""}}}

"""" KEY MAPPINGS -- COMMAND LINE {{{
cabb W w
""""}}}

if filereadable(expand("hints"))
    au BufNewFile,BufReadPost *.c,*.C,*.cpp,*.c++,*.CPP,*.cxx
    so hints
endif


" '[c' -- searches back to the previous case statement and echoes it to the status line
nnoremap [c   :?^\s*case? mark k\|echo getline("'k")<CR>


"""" Abbreviations {{{
if has('multi_byte')
    abbreviate (snowman) ☃
    abbreviate -->      →
    abbreviate :-(      ☹
    abbreviate :-)      ☺
    abbreviate <--      ←
    abbreviate <==      ⇐
    abbreviate ==>      ⇒
endif
abbreviate JOhns    Johns
abbreviate adn      and
abbreviate flase    false
abbreviate teh      the
""""}}}

call pathogen#infect()

"""" Colours {{{
try
    colorscheme solarized
catch
    colorscheme desert
endtry

syntax match Italic /\<paj\>/
syntax match Smiley /[8:;][-*o][(){}\[\]\/\\|p]/
match ErrorMsg /\s\+$/

"""" Function Key Mappings {{{
"   [F1]    :help. Built-in.

"   [F2]    shows and hides whitespace.
nnoremap    <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>

"   [F3]    toggles between (header, ) source and test files.
nnoremap    <F3> :<C-U>TUT<CR>

"   [F4]    Go to next quick-fix
"[Shift-F4] Go to previous quick-fix
"
noremap    <F4>   :<C-U>cnext <CR>
noremap    <S-F4> :<C-U>cprevious <CR>

"   [F5]    make
"[Shift-F5] make (but wait for arguments)
"
nnoremap    <F5>   :<C-U>make<CR>
nnoremap    <S-F5> :<C-U>make<space>

"   [F6]    Break a line and right-align it
"
nnoremap    <F6> <Esc>i<CR><Esc>:ri <CR>

"   [F7]    Toggle Vim v7.0 Spell-Checking {{{
if v:version >= 700
    set spelllang=en_au nospell
    nnoremap <F7> :<C-U>set spell! spell?<CR>
endif
"""" }}}

"   [F8]    Diff with version control plug-in
nnoremap    <F8> :<C-U>VCSVimDiff <CR>
"""" }}}

" Comments are lies (exception that proves the rule).
nnoremap <Leader>ic :<C-U>highlight! link Comment Ignore<CR>
nnoremap <Leader>sc :<C-U>highlight! Comment ctermfg=14 guifg=#80a0ff<CR>

"    \1      git: show first commit where term under cursor was added:
nnoremap <Leader>1 :!git log --reverse -p -S<cword> %<CR>

let c_no_curly_error=1

if executable('clang++')
    let g:syntastic_check_on_open = 1
    let g:syntastic_cpp_compiler = 'clang++'
    let g:syntastic_cpp_compiler_options = ' -std=c++11 --analyze '
    if has('multi_byte')
        let g:syntastic_error_symbol='✗'
        let g:syntastic_warning_symbol='⚠'
    else
        let g:syntastic_error_symbol='X'
        let g:syntastic_warning_symbol='>'
    endif
endif

let g:snips_author = 'Pete Johns'

