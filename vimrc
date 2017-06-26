filetype off " 必須的

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" BundleInstall! => 安裝或更新 Bundle command
" 讓Vundle 管理Vundle
Bundle 'gmarik/vundle'

" 代碼源在github 上的
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'Shougo/neocomplcache'
" Bundle 'Rip-Rip/clang_complete'
" Bundle 'Shougo/neocomplcache-clang_complete'
Bundle 'majutsushi/tagbar'
" Bundle 'Lokaltog/vim-easymotion'
Bundle 'godlygeek/tabular'
Bundle 'hsitz/VimOrganizer'
" Bundle 'scrooloose/syntastic'
" Bundle 'Shougo/vimproc'
" Bundle 'Shougo/vimshell'
Bundle 'plasticboy/vim-markdown'
Bundle 'vim-scripts/Conque-Shell'
Bundle 'peterhoeg/vim-qml'
Bundle 'editorconfig/editorconfig-vim'

" 代碼存放在vim script 上
" Bundle 'FuzzyFinder'

" 代碼存放在其他地方
" Bundle 'git://git.wincent.com/command-t.git'
" ...

" 設定 vim 編輯預設備份目錄, 必須先 mkdir ~/vi_backup/
"set backupdir=~/vi_backup/
"set backup

"去掉討厭的有關vi一致性模式
set nocompatible

" 游標移動後, 一樣可以用 backsapce, del 等刪除動作
set bs=2

":highlight 可以看到所有的顏色
" save .vimrc, auto exec, .vimrc 如果存檔, 就會立刻實現
"autocmd! bufwritepost .vimrc source %

syntax on


" /usr/share/vim/vim63/colors/desert.vim
highlight Search term=reverse ctermbg=4 ctermfg=7
"highlight Normal ctermbg=black ctermfg=white
highlight Folded ctermbg=black ctermfg=darkcyan
"hi Comment ctermbg=black ctermfg=darkcyan

" 下面出現一列 bar.
set ls=2
set statusline=%<%f\ %m%=\ %h%r\ %-19([%p%%]\ %3l,%02c%03V%)%y
highlight StatusLine ctermfg=blue ctermbg=white
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

" 搜尋到的字加 hilight
set hlsearch

filetype on
set number
set cindent
set autoindent
set smartindent

" tab \t 會以 4個空格代替
set noexpandtab
set shiftwidth=8
set softtabstop=8
set tabstop=8

" Be smart when using tabs ;)
set smarttab

" :sp 開檔時, 上面會列出所有檔案
set wildmenu

" Ignore compiled files
 set wildignore=*.o,*~,*.pyc
 
" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" 可以用 {{{ }}} 縮排 Folded
set foldmethod=marker

set tags=tags "設置tags選項為當前目錄下的tags文件 
" {{{ UTF-8 Big5 Setting
" 以下四個設下去. vim 編出來都是 utf-8 編碼的.
"set fileencodings=big5,utf-8
set fileencodings=utf-8
" 檔案存檔會存成utf-8編碼
set termencoding=utf-8
set enc=utf-8
set tenc=utf8
" }}}

" Use Unix as the standard file type
set ffs=unix,dos,mac
" set ffs=unix,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" =============================
" keymap <F1> ~ < F9>
" =============================
" 行號的顯示與隱藏
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
" vimgrep搜尋現在游標下面的字所有出現的地方, 所有.h .c .cpp .cxx 包含子目錄, 並顯示在quickfix
nnoremap <F3> viwy:vimgrep /\<<C-R>"\>/g **/*.[ch] **/*.cxx **/*.cc **/*.S **/*[ch]pp<CR> :cw <CR>
" close all windows
nnoremap <silent> <F5> :NERDTreeToggle<CR>
nnoremap <silent> <F6> :TagbarToggle<CR>
nnoremap <silent> <F7> :call g:ClangUpdateQuickFix()<CR>
nnoremap <F9> :set paste!<CR>
nnoremap <F8> :ConqueTermVSplit zsh<CR>

" Open markdown files with Chrome.
autocmd BufEnter *.md exe 'noremap <F4> :!chromium-browser %:p<CR>'

" 存檔時自動去除後面的空白 
autocmd FileType c,cpp,java,php,perl,python,ruby,sh,patch autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" =============================
" keymap 
" =============================
nnoremap qq :q<CR>
nnoremap zz :qa<CR>
"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" 插入模式下使用Alt 鍵+自定義快捷鍵來移動光標
noremap! <Mj> <Down>
noremap! <Mk> <Up>
noremap! <Mh> <left>
noremap! <Ml> <Right>

" Ctrl-]轉至最佳匹配的相應Tag，Ctrl-T返回上一個匹配。如果有多個匹配，g Ctrl-]可顯示所有備選的tags。如有需要，可互換Ctrl-]和g Ctrl-] 
" 在普通和可视模式中，将<c-]>与g<c-]>互换
" nnoremap <c-]> g<c-]>
" vnoremap <c-]> g<c-]>
" nnoremap g<c-]> <c-]>
" vnoremap g<c-]> <c-]>


" 會自動到最後離開的位置
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif

" :mak[e]會跳轉到第一個錯誤，:make!則否
" :cw[indow]（如有錯誤打開quickfix窗口）、:cn（跳到下一個錯誤）、:cp（跳到前一個錯誤）等，:help quickfix。
" 如果想在有錯時自動打開quickfix窗口
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" 代碼全能補全
filetype plugin indent on

 nnoremap <S-Right> :bp<CR>
 nnoremap <S-Left> :bn<CR>

 " ctrl+左右键来移动split windows
 "
 nmap <silent> <C-left> <C-w><left>
 nmap <silent> <C-right> <C-w><right>
 nmap <silent> <C-h> <C-w><left>
 nmap <silent> <C-l> <C-w><right>
 "
 " shift+左右键来移动tab
 "
 "nn <silent> <S-left> :tabp<CR>
 "nn <silent> <S-right> :tabn<CR>

 "新分頁
 nmap <C-t> :tabnew<cr>
 imap <C-t> <ESC>:tabnew<cr>

 "關分頁
 " nmap <C-w> :tabclose<CR>

 "Normal mode時可用tab及shift-tab
 nmap <tab>   v>
 nmap <s-tab> v<
 vmap <tab>   >gv
 vmap <s-tab> <gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> i 
map <c-space> ?

 "設定vim -p
 "檔案上限，不然有限制的開啟前部分的檔案，後面就沒看到了。
 set tabpagemax=1000
 
 " ctrl+上下鍵切quickfix
 "
 nn <silent> <C-up> :cp<CR>
 nn <silent> <C-down> :cn<CR>

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Remap VIM 0 to first non-blank character
map 0 ^

" =============================
" debug VIM script"
" =============================
fun! EvalVimScriptRegion(s,e)
  let lines = getline(a:s,a:e)
  let file = tempname()
  cal writefile(lines,file)
  redir @e
  silent exec ':source '.file
  cal delete(file)
  redraw
  redir END
  echo "Region evaluated."
 
  if strlen(getreg('e')) > 0
    10new
    redraw
    silent file "EvalResult"
    setlocal noswapfile  buftype=nofile bufhidden=wipe
    setlocal nobuflisted nowrap cursorline nonumber fdc=0
    " syntax init
    set filetype="eval"
    syn match ErrorLine +^E\d\+:.*$+
    hi link ErrorLine Error
    silent $put =@e
  endif
endf
augroup VimEval
  au!
  au filetype vim :command! -range Eval  :cal EvalVimScriptRegion(<line1>,<line2>)
  au filetype vim :vnoremap <silent> e   :Eval<CR>
augroup END

" =============================
" plugin Markdown Preview
" =============================
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=1

"
" =============================
" plugin MiniBufExplorer
" =============================

" 頂部的MiniBufExplorer
 let g:miniBufExplMapWindowNavVim = 1
 let g:miniBufExplMapWindowNavArrows = 1
 let g:miniBufExplMapCTabSwitchBufs = 1
 let g:miniBufExplMapCTabSwitchWindows = 1
 let g:miniBufExplForceSyntaxEnable = 1

" MiniBufExpl Colors
 hi MBEVisibleActive guifg=#A6DB29 guibg=fg
 hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
 hi MBEVisibleChanged guifg=#F1266F guibg=fg
 hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
 hi MBEChanged guifg=#CD5907 guibg=fg
 hi MBENormal guifg=#808080 guibg=fg

"
" =============================
" inside plugin OmniComplete 
" =============================
     " OmniComplete {
         if has("autocmd") && exists("+omnifunc")
             autocmd Filetype *
                 \if &omnifunc == "" |
                 \setlocal omnifunc=syntaxcomplete#Complete |
                 \endif
         endif
 
         highlight Pmenu ctermbg=8 guibg=#606060
         highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
         highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

         " some convenient mappings
         inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
         inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
         inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
         inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
         inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
 
         " automatically open and close the popup menu / preview window
         au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
         set completeopt=menu,preview,longest
     " }

" =============================
" plugin PowerLine
" =============================
let g:Powerline_symbols = 'fancy'
set guifont=Monaco\ for\ Powerline

" =============================
" plugin tagbar
" =============================
" set focus to TagBar when opening it
let g:tagbar_autofocus = 1


" =============================
" plugin NERDtree
" =============================
let NERDTreeShowBookmarks=0
let NERDTreeChDirMode=2
let NERDTreeMouseMode=2
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_open_on_gui_startup=0
" open directory of current opened file
map <leader>r :NERDTreeFind<cr>

" make nerdtree look nice
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let g:NERDTreeWinSize=30

" =============================
" plugin ctrlp
" =============================
nnoremap <C-W><C-U> :CtrlPMRU<CR>
nnoremap <C-W>u :CtrlPMRU<CR>
" let g:ctrlp_map = '<C-b>'
" let g:ctrlp_cmd = 'CtrlP'

" let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" Single VCS, listing command does not list untracked files:
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


" =============================
" plugin clang_complete
" =============================
let g:clang_auto_select = 2
let g:clang_complete_auto = 0
let g:clang_complete_copen = 0
" Open QuickFix by <F7> key
let g:clang_periodic_quickfix = 0
let g:clang_snippets = 1
let g:clang_snippets_engine = 'snipmate'
let g:clang_auto_user_options="path, .clang_complete"
set completeopt=menu,longest


" =============================
" plugin Tabularize
" =============================
" Tabularize {
        nmap <Leader>a= :Tabularize /=<CR>
        vmap <Leader>a= :Tabularize /=<CR>
        nmap <Leader>a: :Tabularize /:<CR>
        vmap <Leader>a: :Tabularize /:<CR>
        nmap <Leader>a:: :Tabularize /:\zs<CR>
        vmap <Leader>a:: :Tabularize /:\zs<CR>
        nmap <Leader>a, :Tabularize /,<CR>
        vmap <Leader>a, :Tabularize /,<CR>
        nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

        " the below align() doesnt work ?!
        inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

        function! s:align()
            let p = '^\s*|\s.*\s|\s*$'
            if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
                let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
                let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
                Tabularize/|/l1
                normal! 0
                call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
            endif
        endfunction
     " }


" =============================
" org-mode
" =============================
let g:ft_ignore_pat = '\.org'
filetype plugin indent on
" and then put these lines in vimrc somewhere after the line above
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()
" let g:org_capture_file = '~/org_files/mycaptures.org'
command! OrgCapture :call org#CaptureBuffer()
command! OrgCaptureFile :call org#OpenCaptureFile()
let g:org_todo_setup='TODO STARTED | DONE'
let g:org_tags_alist='{@home(h) @work(w) @tennisclub(t)} {easy(e) hard(d)} {computer(c) phone(p)}'
let g:org_command_for_emacsclient = 'emacsclient'
" ----------------------
" Custom Agenda Searches
" ----------------------
" The assignment to g:org_custom_searches below defines searches that a
" a user can then easily access from the Org menu or the Agenda Dashboard.
" (Still need to add help on how to define them, assignment below
" is hopefully illustrative for now. . . . )
let g:org_custom_searches = [
            \  { 'name':"Next week's agenda", 'type':'agenda',
            \    'agenda_date':'+1w', 'agenda_duration':'w' }
            \, { 'name':"Next week's TODOS", 'type':'agenda',
            \    'agenda_date':'+1w', 'agenda_duration':'w',
            \    'spec':'+UNFINISHED_TODOS' }
            \, { 'name':'Home tags', 'type':'heading_list', 'spec':'+HOME' }
            \, { 'name':'Home tags', 'type':'sparse_tree', 'spec':'+HOME' }
            \  ]

" =============================
" plugin neocomplcache
" =============================

     " neocomplcache {
        let g:acp_enableAtStartup = 0
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_underbar_completion = 1
        let g:neocomplcache_enable_auto_delimiter = 1
        let g:neocomplcache_max_list = 15
        let g:neocomplcache_force_overwrite_completefunc = 1
	    let g:neocomplcache_enable_insert_char_pre = 1

        " SuperTab like snippets behavior.
        imap <silent><expr><TAB> neosnippet#expandable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
            \ "\<C-e>" : "\<TAB>")
        smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

        " Define dictionary.
        let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

        " Define keyword.
        if !exists('g:neocomplcache_keyword_patterns')
            let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns._ = '\h\w*'

        " Plugin key-mappings.
        imap <C-k> <Plug>(neosnippet_expand_or_jump)
        smap <C-k> <Plug>(neosnippet_expand_or_jump)
        inoremap <expr><C-g> neocomplcache#undo_completion()
        inoremap <expr><C-l> neocomplcache#complete_common_string()
        inoremap <expr><CR> neocomplcache#complete_common_string()

        " <TAB>: completion.
        inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

        " <CR>: close popup
        " <s-CR>: close popup and save indent.
        inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
        inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y> neocomplcache#close_popup()

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

        " Enable heavy omni completion.
        if !exists('g:neocomplcache_omni_patterns')
            let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
        let g:neocomplcache_omni_patterns.ruby = ''

        " use honza's snippets
        let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'

        " For snippet_complete marker.
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif
     " }


" =============================
" GVIM setting
" =============================
" GUI Settings {
    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        colorscheme desert
        set background=dark
        set guioptions-=T           " remove the toolbar
        set guioptions+=e           " 
        set guitablabel=%M\ %t      " 
        set lines=50                " 40 lines of text instead of 24,
        set guifont=Andale\ Mono\ Regular\ 10,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 12
        "set term=builtin_ansi       " Make arrow and other keys work
    endif

    " on Linux use + register for copy-paste
    set clipboard=unnamedplus
" }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
