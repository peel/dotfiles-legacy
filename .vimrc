" Global{
    filetype off
    set nocompatible
    set history=256 		" Number of things to remember in history.
    set autowrite  			" Writes on make/shell commands
    set autoread  
    set encoding=utf-8
    set timeoutlen=250  		" Time to wait after ESC (default causes an annoying delay)
    set clipboard+=unnamed  	" Yanks go on clipboard instead.
    set pastetoggle=<F10> 		" toggle between paste and normal: for 'safer' pasting from keyboard
    autocmd FileType java set tags=~/.vim/tags/java.tags
    set tags=~/.vim/tags/.tags;$HOME 		" walk directory tree upto $HOME looking for tags
    map <C-`> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

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
" }

" Visual{
    set t_Co=256
    set number
    set ruler			" show the cursor position all the time
    set showcmd			" display incomplete commands
    set incsearch			" do incremental searching
    set laststatus=2		" always display statusline for PowerLine
    let g:Powerline_symbols='fancy'

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
    set foldmethod=indent " Fold on syntax
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

    syntax on
    colorscheme molokai
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

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'

    " Utility{
        Bundle 'Lokaltog/vim-powerline'
        Bundle 'tpope/vim-surround'
        Bundle 'Raimondi/delimitMate'
        Bundle 'ervandew/supertab'
        Bundle 'vim-scripts/java.vim'
        Bundle 'scrooloose/nerdcommenter'
        Bundle 'Soares/rainbow.vim'
        Bundle 'gre/play2vim'
        Bundle 'othree/html5.vim'
        Bundle 'kikijump/tslime.vim'
        Bundle 'davetron5000/javax-javadoc-vim'
        Bundle 'othree/xml.vim'
    " }

    " Indent Guides{
        Bundle 'mutewinter/vim-indent-guides'
        let g:indent_guides_start_level=2
        let g:indent_guides_guide_size=1
    " }

    " Syntastic{
        Bundle 'scrooloose/syntastic'
        let g:syntastic_enable_signs=1
        let g:syntastic_auto_loc_list=1
    " }

    " SnipMate
    Bundle 'msanders/snipmate.vim'

    " TagHighlight
    Bundle 'abudden/TagHighlight'

    " NERDTree{
        Bundle 'scrooloose/nerdtree' 
        nmap <silent> <Leader><F5> :NERDTreeToggle<CR>
    "}

    " Tagbar{
        Bundle 'majutsushi/tagbar'
        let g:tagbar_ctags_bin='/usr/local/Cellar/ctags/5.8/bin/ctags'
        nmap <silent>  <F5> :TagbarToggle<CR>
    "}

    " Git
    Bundle 'tpope/vim-fugitive'

    " VJDE{
        Bundle 'cespare/vjde'
        let g:vjde_completion_key='<c-space>'
        let g:jde_tab_cfu=1
        let g:vjde_javadoc_path='/Users/peel/Dev/docs/api/'
        let g:vjde_lib_path='/Users/peel/Dev/docs/api/'
        let g:vjde_utils_setup=0
        let g:enable_floatingwindow=1
    "}

    " Colors
    Bundle 'tomasr/molokai'

" }

" Mappings {
    nmap <C-t> :tabnew<CR>
" }

" Java{
    " take care of indents for Java.
    set autoindent
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
