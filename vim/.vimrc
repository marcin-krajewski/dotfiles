" execute pathogen#infect()
" call plug#begin('~/.vim/plugged')
" Plug '/tmp/vim-clap'
" call puug#end()

" Plugins
set runtimepath+=~/.vim
set runtimepath+=~/.vim/vim-sneak
set runtimepath+=~/.vim/vim-easymotion
set runtimepath+=~/.vim/lightline.vim
set runtimepath+=~/.vim/pack/tpope/start/fugitive/plugin/fugitive.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                              SNEAK                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" runtime plugin/sneak.vim
" source ~/.vim/vim-sneak/plugin/sneak.vim


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           EASY MOTION                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime plugin/EasyMotion.vim


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                            LIGHTLINE                                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime lightline.vim/plugin/lightline.vim


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                      highlight current line                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set cursorline
hi CursorLine   cterm=NONE ctermbg=31 ctermfg=white
hi CursorLineNr   cterm=NONE ctermbg=31 ctermfg=white


" turn off going to the visual mode on mouse click
set mouse-=a

" set autoindent eg. start new line in the same place like previous one
set autoindent

" turn on coloring syntax
syntax on

" display line numbers
set number
" relative line number 
set relativenumber

" show the cursor position
set ruler

" show incomplete commands
set showcmd

" show menu when using tab completion
set wildmenu

" set top to 5 lines on top
set scrolloff=5

" set color for line numbers
" foreground
highlight LineNr ctermfg=81

" MARCOS

" delete first character and edit in the end of line 
let @w = '0"zxA'

" history memory entries
set history=10000
set hlsearch
set incsearch

" nice options:
" hlsearch - search highlight
" incserach - incremental search
" ignorecase
" smartcase
" lbr - linebraks
" ai - autoindent
" si - smart indent
" map KEY KEYSTROKES !!!! MEGA!
" :map - show all maps

" disable special "+ clipboard
set clipboard=unnamedplus

nmap <F6> :NERDTreeToggle<CR>

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

hi StatusLineNC ctermfg=247         ctermbg=234        cterm=None

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                          Abbreviations                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set scroll to the middle when iterating through search results
" https://vim.fandom.com/wiki/Make_search_results_appear_in_the_middle_of_the_screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Create simple indentations
" with * character
nnoremap <Leader>* cc  *<Esc>
nnoremap <Leader><Leader>* cc    *<Esc>

" with > character
nnoremap <Leader>> cc  ><Esc>
nnoremap <Leader><Leader>> cc    ><Esc>


" delete empty line when the tag is removed
" I'm not sure why this solution is working but in fact it is...
nnoremap dat dat
" clear search result
nnoremap <Leader>n :noh<CR>
" edit and remove last character
nnoremap <Leader><Leader>] <End>xi
" find next occurence and redraw line in top of window with scrolloff defined
nnoremap <Leader>] nz<CR>
" find previous occurence and redraw line in top of window with scrolloff defined
nnoremap <Leader>[ Nz<CR>
" select all lines
nnoremap <Leader>q ggVG
" delete last g searching
" g searching is all lines which contain string
nnoremap <Leader>g :g//d<CR>
command! G g//d
" delete last v searching
" v searching is all lines which NOT contain string
nnoremap <Leader>v :v//d<CR>
command! V v//d
" get number of all occurences
nnoremap <F5> :%s///gn<CR>
" clear last found search result
nnoremap <F8> :%s//<CR>
command! A %s//
	
" toggle wrap lines
nnoremap <Leader>w :set wrap!<CR>

" add empty line before
nnoremap <C-Up> O<Esc>j^
" add empty line after
nnoremap <C-Down> o<Esc>k^
" add semicolon in the end of line
nnoremap <Leader>; A;<Esc>;

" format json file
nnoremap <Leader><Leader>json :%! jq '.'<CR>
" format xml file
nnoremap <Leader><Leader>xml :%!xmllint --noblanks --format -<CR>:set syntax=xml<CR>
" format js file
nnoremap <Leader><Leader>js :%!js-beautify -<CR>:set syntax=javascript<CR>

" Put frame into the bash script - for the whole line
nnoremap <Leader><Leader>fs :.!~/.local/sbin/utility/frame_vim.sh sql<CR>
nnoremap <Leader><Leader>f- :.!~/.local/sbin/utility/frame_vim.sh sql<CR>
nnoremap <Leader><Leader>fv :.!~/.local/sbin/utility/frame_vim.sh vim<CR>
nnoremap <Leader><Leader>fb :.!~/.local/sbin/utility/frame_vim.sh bash<CR>
nnoremap <Leader><Leader>f= O<Esc>90i=<Esc>jo<Esc>90i=<Esc>k

" Put table for selection
nnoremap <Leader><Leader>ft :'<,'>!diagon Table
vnoremap <Leader><Leader>ft !diagon Table


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                             PLUGINS                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"lightline
set noshowmode
set laststatus=2
set ttimeoutlen=50
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" sneak
" temporary commented out
" let g:sneak#label = 1

" https://github.com/itchyny/lightline.vim/
" https://github.com/justinmk/vim-sneak
" https://github.com/wellle/targets.vim



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    EASY MOTION Configuration                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Settings for specific files                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead /home/mkrajewski/Work/Docs/directory_structure.txt set cursorline

" set vim syntax for vifmrc
autocmd BufNewFile,BufRead /home/mkrajewski/.config/vifm/vifmrc set syntax=vim
