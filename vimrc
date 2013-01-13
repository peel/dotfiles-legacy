" Global{
    filetype plugin on
    filetype indent on
    filetype on
    set ofu=syntaxcomplete#Complete
    set nocompatible
    set history=256 		" Number of things to remember in history.
    set autowrite  			" Writes on make/shell commands
    set autoread  
    set encoding=utf-8
    set timeoutlen=250  		" Time to wait after ESC (default causes an annoying delay)
    set clipboard+=unnamed  	" Yanks go on clipboard instead.
    set pastetoggle=<F10> 		" toggle between paste and normal: for 'safer' pasting from keyboard
    set tags=~/.vim/tags/.tags;$HOME 		" walk directory tree upto $HOME looking for tags
    map <C-`> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
    let mapleader = ","

    " Match and search{
        set hlsearch    		" highlight search
        set ignorecase  		" Do case in sensitive matching with
        set smartcase			" be sensitive when there's a capital letter
        set incsearch 
    " }
    " Backup{
        set nowritebackup
        set nobackup
        set directory=/tmp// 		" prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
    " }
    
    " Setup Vundle{
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()
        Bundle 'gmarik/vundle'
    "
" }

" Visual{
    set t_Co=256
    set number
    set ruler			" show the cursor position all the time
    set showcmd			" display incomplete commands
    set incsearch			" do incremental searching

    set showmatch  			" Show matching brackets.
    set matchtime=5  		" Bracket blinking.
    set novisualbell  		" No blinking
    set noerrorbells  		" No noise.
    set vb t_vb= 			" disable any beeps or flashes on error
    set shortmess=atI 		" Shortens messages

    set nolist 			" Display unprintable characters f12 - switches
    " set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:« " Unprintable chars mapping

    set foldenable 			" Turn on folding
    set foldcolumn=1
    set foldmethod=syntax " Fold on syntax
    set foldlevel=2 " Don't autofold anything (but I can still fold manually)

    set mouse-=a   			" Disable mouse
    set mousehide  			" Hide mouse after chars typed

    set splitbelow
    set splitright

    set ts=4 sw=4 et

    :hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
    :hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

    set cursorline! cursorcolumn!
    " :nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

    " Indentation {
        set autoindent " Preserve current indent on new lines
        set cindent " set C style indent
        set expandtab " Convert all tabs typed to spaces
        set softtabstop=4 " Indentation levels every four columns
        set shiftwidth=4 " Indent/outdent by four columns
        set shiftround " Indent/outdent to nearest tabstop
    " }

    set wildmenu

    " Colors
    Bundle 'altercation/vim-colors-solarized'
    "Bundle 'tomasr/molokai'

    syntax on
    set background=dark
    colorscheme solarized 
" }

" Formatting{
    set backspace=indent,eol,start 	" allow backspacing over everything in insert mode

    set tabstop=2    		" Set the default tabstop
    set softtabstop=2
    set shiftwidth=2 		" Set the default shift width for indents
    set expandtab   		" Make tabs into spaces (set by tabstop)
    set smarttab 			" Smarter tab levels

" }

" Plugins{


    " Utility{
        Bundle 'tpope/vim-surround'
        Bundle 'vim-scripts/java.vim'
        Bundle 'vim-scripts/javacomplete'
        Bundle 'Soares/rainbow.vim'
        Bundle 'othree/html5.vim'
    " }
    
    " NeoComplCache{
        Bundle 'Shougo/neocomplcache'
        let g:acp_enableAtStartup = 0
        let g:neocomplcache_enable_at_startup=1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_underbar_completion = 1
        inoremap <expr><CR> neocomplcache#smart_close_popup() . “\<CR>”
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplcache#close_popup()
        inoremap <expr><C-e>  neocomplcache#cancel_popup()
        imap  <silent><expr><tab>  neocomplcache#sources#snippets_complete#expandable() ? "\<plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<c-e>" : "\<tab>")
        smap  <tab>  <right><plug>(neocomplcache_snippets_jump) 
        inoremap <expr><c-e>     neocomplcache#complete_common_string()
    "}
    
    " Supertab{
        " Bundle 'ervandew/supertab'
        " let g:SuperTabDefaultCompletionType = "context"
    " }

    " ruby{
        Bundle 'kchmck/vim-coffee-script' 
        Bundle 'vim-ruby/vim-ruby' 
       
        autocmd Filetype ruby iabbr cls class<CR>end<ESC>?class<ESC>$a
        autocmd Filetype ruby iabbr mod module<CR>end<ESC>?module<ESC>$a
        autocmd Filetype ruby iabbr d= def<CR>end<ESC>?def<ESC>$a
        autocmd Filetype ruby iabbr d_ do<CR>end<ESC>O
        autocmd Filetype ruby iabbr d- do \|\|<CR>end<ESC>k$i
    "}

    " ctrlp{
        Bundle 'kien/ctrlp.vim'
        set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
        set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
        
        let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn)$'
    "}

    " vim-powerline{
        Bundle 'Lokaltog/vim-powerline'
        set laststatus=2		" always display statusline for PowerLine
        let g:Powerline_symbols='compatible'
        let g:Powerline_theme='solarized256'
        let g:Powerline_colorscheme='solarized256'
    "}

    " vimux{
        Bundle 'benmills/vimux'
       
        " Prompt for a command to run
        map rr :PromptVimTmuxCommand<CR>
        
        " Run last command executed by RunVimTmuxCommand
        map rl :RunLastVimTmuxCommand<CR>
        
        " Inspect runner pane
        map rm :InspectVimTmuxRunner<CR>
        
        " Close all other tmux panes in current window
        map rm :CloseVimTmuxPanes<CR>
        
        " Interrupt any command running in the runner pane
        map rs :InterruptVimTmuxRunner<CR>
    " }

    " Graphic Undo{
        Bundle 'sjl/gundo.vim'
        nnoremap <silent> <leader>u :GundoToggle<CR>
    " } 

    " Indent Guides{
        Bundle 'mutewinter/vim-indent-guides'
        let g:indent_guides_start_level=2
        let g:indent_guides_enable_on_vim_startup=1
        let g:indent_guides_guide_size=1
        let g:indent_guides_auto_colors = 0
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=black
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=black
    " }

    " Syntastic{
        Bundle 'scrooloose/syntastic'
        let g:syntastic_enable_signs=1
        let g:syntastic_auto_loc_list=1
        nnoremap <Leader>s :Errors<CR>
        let g:syntastic_check_on_open=1
        let g:syntastic_auto_jump=1
        let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

    " }

    " delimitMate
        Bundle 'Raimondi/delimitMate'
        let delimitMate_expand_cr=1
        let delimitMate_expand_space=1
        let delimitMate_balance_matchpairs=1
    " }

    " SnipMate{
        Bundle 'msanders/snipmate.vim'
        let g:snips_trigger_key=',,s'
        let g:snips_trigger_key_backwards=',,s'
        snoremap <CR> a<BS>
        snoremap <BS> a<BS>
        snoremap <right> <ESC>a
        snoremap <left> <ESC>bi
        snoremap ' a<BS>'
        snoremap ` a<BS>`
        snoremap % a<BS>%
        snoremap U a<BS>U
        snoremap ^ a<BS>^
        snoremap \ a<BS>\
        snoremap <C-x> a<BS><c-x>` `' '
    " }

    " NERDCommenter{
        Bundle 'scrooloose/nerdcommenter'
        let NERDCommentWholeLinesInVMode=2
        let NERDSpaceDelims=1
        let NERDRemoveExtraSpaces=1
    " }

    " NERDTree{
        Bundle 'scrooloose/nerdtree' 
        nnoremap <Leader>d :NERDTreeToggle<CR>
        let NERDTreeChDirMode=2
        let NERDTreeShowBookmarks=1
        let NERDTreeShowHidden=1
        let NERDTreeShowLineNumbers=1
        let NERDTreeDirArrows=1
    "}

    " EasyTags{
        Bundle 'xolox/vim-easytags'
        function! InitializeTagDirectory()
            let parent=$HOME
            let prefix='.vim'
            let dirname='tags'
            let directory=parent.'/'.prefix.'/'.dirname.'/'
            if !isdirectory(directory)
                if exists('*mkdir')
                    call mkdir(directory)
                    let g:easytags_by_filetype=directory
                else
                    echo "Warning: Unable to create directory: ".directory
                    echo "Try: mkdir -p ".directory
                endif
            else
                let g:easytags_by_filetype=directory
            endif
        endfunction
        call InitializeTagDirectory()
        let g:easytags_python_enabled=1
        let g:easytags_python_script=1
        let g:easytags_include_members=1
        highlight cMember gui=italic
    " }
    
    " TagHighlight
        Bundle 'abudden/TagHighlight'

    " Tagbar{
        Bundle 'majutsushi/tagbar'
        let g:tagbar_ctags_bin='/usr/local/Cellar/ctags/5.8/bin/ctags'
        let g:tagbar_autofocus=1
        let g:tagbar_expand=1
        let g:tagbar_foldlevel=2
        let g:tagbar_ironchars=['▾', '▸']
        let g:tagbar_autoshowtag=1
        nmap <silent>  <Leader> t :TagbarToggle<CR>
    "}

    " Session management like a boss{
        Bundle 'xolox/vim-session'
    " }

    " Git
        Bundle 'tpope/vim-fugitive'

    " Coding style bee-atch{
        Bundle 'vim-scripts/pmd.vim' 
    " }

    " Maven-ide related {
        Bundle 'vim-scripts/yavdb'
        Bundle 'vim-scripts/project.tar.gz'
        Bundle 'dareni/vim-maven-ide'

        " VJDE{
            Bundle 'vim-scripts/Vim-JDE'
            let g:jde_tab_cfu=1
            let g:vjde_javadoc_path='/Users/peel/Dev/docs/api/'
            let g:vjde_lib_path='/Users/peel/Dev/docs/api/'
            let g:vjde_utils_setup=0
            let g:enable_floatingwindow=1
        "}
    " }
    
" }

" Mappings {
    nmap <C-t> :tabnew<CR>
" }

" Scala {
    autocmd BufRead,BufNewFile *.scala set ft=scala syntax=scala
    Bundle 'derekwyatt/vim-scala'
    Bundle 'gre/play2vim'

    let g:tagbar_type_scala = {
        \ 'ctagstype' : 'Scala',
        \ 'kinds'     : [
            \ 'p:packages:1',
            \ 'V:values',
            \ 'v:variables',
            \ 'T:types',
            \ 't:traits',
            \ 'o:objects',
            \ 'a:aclasses',
            \ 'c:classes',
            \ 'r:cclasses',
            \ 'm:methods'
        \ ]
        \ }
" }

" Java{
    " autocmd FileType java set cfu=VjdeCompletionFun
    " let g:vjde_completion_key='<tab>'


    set si
    set shiftwidth=4

    "Java anonymous classes. Sometimes, you have to use them.
    set cinoptions+=j1

    let java_comment_strings=1
    let java_highlight_java_lang_ids=1


    let java_highlight_all=1
    let java_highlight_debug=1

    let java_ignore_javadoc=1
    let java_highlight_functions=1
    let java_mark_braces_in_parens_as_errors=1

    let java_highlight_functions="style"
    " let java_minlines = 150

" }

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Temp{
    inoremap  <Up>     <NOP>
    inoremap  <Down>   <NOP>
    inoremap  <Left>   <NOP>
    inoremap  <Right>  <NOP>
    noremap   <Up>     <NOP>
    noremap   <Down>   <NOP>
    noremap   <Left>   <NOP>
    noremap   <Right>  <NOP>
"} 
