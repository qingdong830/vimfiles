"pathogen�������
execute pathogen#infect()
"�޸�vimrc֮��������Ч
autocmd BufWritePost vimrc so %
"mapleader
let mapleader=","
"�ر�swapfile"
set noswapfile
set cpt=.,w,b,u,t,i
set completeopt=menu,longest
"acp�Զ���ȫ
""let g:acp_enableAtStartup = 0
""let g:acp_behaviorKeywordCommand = "\<C-n>"
""let g:acp_behaviorKeywordLength=3
"�ַ�����
set nocompatible
set fileencodings=ucs-bom,utf-8,cp936,gbk
"�жϲ���ϵͳ����
if (has("win32")||has("win64"))
  let $VIMFILES = $HOME.'/vimfiles'
  let $MYVIMRC = $VIMFILES.'/vimrc'
  let g:iswindows=1
  set fileencoding=gbk
  set guifont=Consolas:h11
  "���consle�������   
  language messages zh_CN.utf-8
  set encoding=utf-8
  set termencoding=gbk
else  
  let $VIMFILES = $HOME.'/.vim'
  let $MYVIMRC = $VIMFILES.'/vimrc'
  let g:iswindows=0
  set encoding=utf-8
  set fileencoding=utf-8   
  set guifont=Consolas:h11
  language messages zh_CN.utf-8
endif   
"����˵�����   
""source $VIMRUNTIME/delmenu.vim   
""source $VIMRUNTIME/menu.vim   
"ALT���������ƶ����
imap <A-h> <LEFT>
imap <A-j> <DOWN>
imap <A-k> <UP>
imap <A-l> <RIGHT>
"�ָ�ڶ�λ
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"�趨windows�� gvim ����ʱ���
autocmd GUIEnter * simalt ~x
"��������
set wildmenu
"�����������������
set mousehide  
" ���ص��˵��͹�������
set guioptions-=M
set guioptions-=F
map <silent> <F1> :if &guioptions =~# 'T' <Bar>
         \set guioptions-=T <Bar>
          \set guioptions-=m <bar>
     \else <Bar>
     \set guioptions+=T <Bar>
     \set guioptions+=m <Bar>
     \endif<CR>
" ������ʱ����ʾ�Ǹ�Ԯ���������ͯ����ʾ
set shortmess=atI
" ��������
" ���а�
set clipboard+=unnamed
"map <c-v> "+p
"����ȫѡ��ݼ�
map <C-a> ggVG
"����
vmap <C-c> "+y
"ճ��
inoremap <C-v> <ESC>"+pa
"���ÿ��ٲ������˳���ݼ�
map <S-q><S-q> :q!<CR>:q!<CR>:q!<CR>
"�滻
"map <C-H> :L1,L2s/src/tar/g
"imap <C-H> <Esc><C-H>
" browsedir����
set browsedir=buffer
" �����ļ����Ͳ��
filetype plugin on
" �Զ���ʽ������
filetype indent on
"SuperTab
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="context"  
let g:SuperTabContextDefaultCompletionType="<c-n>"
" �������·��ŵĵ��ʲ�Ҫ�����зָ�
set iskeyword+=_,$,@,%,#,-
" ��buffer������ʱ����
set bufhidden=hide
" C++ͷ�ļ�ʶ��
au BufEnter /usr/include/c++/* setf cpp
au BufEnter /usr/include/g++-3/* setf cpp
" GNU��׼
"au BufEnter /usr/* call GnuIndent()
" �������
"autocmd GUIEnter * simalt ~x
" ������buffer���κεط�ʹ����꣨����office���ڹ�����˫����궨λ��
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" ����backspace�͹�����Խ�б߽�
set whichwrap+=<,>,h,l
" ʹ�ظ����backspace����������indent, eol, start��
set backspace=eol,start,indent
" �Զ���ȫ���ţ�����������
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i<CR><CR><UP><TAB>
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap < <><ESC>i
:inoremap > <c-r>=ClosePair('>')<CR>
:inoremap " ""<ESC>i
" ���ļ�ʱ�����������˳�֮ǰ�Ĺ�괦
 autocmd BufReadPost *
			 \if line("'\"") > 0 && line("'\"") <= line("$") |
			 \  exe "normal! g`\"" |
			 \endif
if has("gui_running")
    set showtabline=1
    nmap tn :tabnew<CR>
" ��ǳɫ������ǰ�༭��
   autocmd InsertLeave * se nocul
   autocmd InsertEnter * se cul
endif
" ��ǩҳֻ��ʾ�ļ���
function! ShortTabLabel ()
    let bufnrlist = tabpagebuflist (v:lnum)
   let label = bufname (bufnrlist[tabpagewinnr (v:lnum) -1])
     let filename = fnamemodify (label, ':t')
    return filename
endfunction
"����= + - * ǰ���Զ��ո�
"����,�����Զ���ӿո�
au FileType c,cpp,python,java inoremap <buffer>= <c-r>=EqualSign('=')<CR>
au FileType c,cpp,python,java inoremap <buffer>+ <c-r>=EqualSign('+')<CR>
au FileType c,cpp,python,java inoremap <buffer>- <c-r>=EqualSign('-')<CR>
au FileType c,cpp,python,java inoremap <buffer>* <c-r>=EqualSign('*')<CR>
au FileType c,cpp,python,java inoremap <buffer>/ <c-r>=EqualSign('/')<CR>
au FileType c,cpp,python,java inoremap <buffer>> <c-r>=EqualSign('>')<CR>
au FileType c,cpp,python,java inoremap <buffer>< <c-r>=EqualSign('<')<CR>
au FileType c,cpp,python,java inoremap <buffer>, ,<space>

func! EqualSign(char)
if getline('.')[col('.') - 3] =~ "[\*-=+\/]"
return "\<ESC>xa".a:char."\<SPACE>"
else
return "\<SPACE>".a:char."\<SPACE>\<ESC>a"
endif
endfunc
"ʵ�����ŵ��Զ���Ժ��ֹ�ظ����룩������python
 function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
      return a:char
   endif
endf
"�������۵�ģʽ
colorscheme desert
"��ǿģʽ�е��������Զ���ɲ���
set foldmethod=manual
"�趨�۵���ʽΪ�ֶ�
set helplang=cn
"���ð���������Ϊ����
set cin   
"ʵ��C���������
set sw=4  
"���(�Զ�) ����ʹ��4���ո�
set sta   
"����<tab>ʱʹ��'shiftwidth'
set backspace=2
"ָ���ڲ���ģʽ�¿���ʹ��<BS>ɾ�����ǰ����ַ�
set number
"��ʾ�к�
filetype on
"����ļ�������
set history=1000
""��¼��ʷ������
" ��������ʱ����Դ�Сд
set ignorecase
"����ʹ�ú�ɫ
syntax on
"�﷨��������ʾ
set autoindent
set smartindent
"���������ڽ��б�д����ʱ���ڸ�ʽ�����Ϻ����ã�
"��һ�У�vimʹ���Զ����룬Ҳ���ǰѵ�ǰ�еĶ����ʽӦ�õ���һ�У�
"�ڶ��У���������Ķ����ʽ�����ܵ�ѡ�����ʽ����������C���Ա�д�Ϻ�����
" �ڱ��ָ�Ĵ��ڼ���ʾ�հף������Ķ�
set fillchars=vert:\ ,stl:\ ,stlnc:\
"��һ������tab��Ϊ4���ո񣬵ڶ������õ���֮�佻��ʱʹ��4���ո�
set expandtab
set tabstop=4
set shiftwidth=4
set showmatch
" �����ַ������䲻��100������
:highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
:match OverLength '\%101v.*'
" ������ʾ״̬��
set laststatus=2
"highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLine guifg=Black guibg=Yellow
"highlight StatusLineNC guifg=Gray guibg=White
" �ҵ�״̬����ʾ�����ݣ������ļ����ͺͽ��룩
set statusline=[%n]%<%f%y%h%m%r%=[%b\ 0x%B]\ Line\:%l\/%L\ Col\:%c%V\ %P
" ƥ�����Ÿ�����ʱ�䣨��λ��ʮ��֮һ�룩
set matchtime=3
" ���������и߶�Ϊ2��
set cmdheight=1
"�ڱ༭�����У������½���ʾ���λ�õ�״̬��
set incsearch
set hlsearch
"��ѯʱ�ǳ����㣬��Ҫ����book���ʣ������뵽/bʱ�����Զ��ҵ���һ
"��b��ͷ�ĵ��ʣ������뵽/boʱ�����Զ��ҵ���һ��bo��ͷ�ĵ��ʣ���
"�����ƣ����в���ʱ��ʹ�ô����û�����ҵ��𰸣�������Ҫƥ��ĵ���
"ʱ�������ǻس���
" ��ǿ��������
"����ǰ�Ĺ��̵�tags����
set tags=./tags,./../tags,./**/tags
set winaltkeys=no
"Alt��ϼ���ӳ�䵽�˵���
 
set helplang=cn
"��ֹ�Զ��ı䵱ǰVim���ڵĴ�С
let Tlist_Inc_Winwidth=0
"�ѷ����б������Ļ���Ҳ�
let Tlist_Use_Right_Window=1
"�õ�ǰ�����༭���ļ��ķ����б��Զ��۵������� �������Խ�ԼһЩ��Ļ�ռ�
let Tlist_File_Fold_Auto_Close=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"ӳ��F4Ϊ���ܼ�����tages�����
"ӳ��F3Ϊ���ܼ�����winmanager���ļ������
let g:winManagerWindowLayout='FileExplorer|TagList' "��Ҫ��ϲ�����ֲ��ֿ���ע�͵���һ��
map <F4> :TlistToggle<cr>
map <F3> :WMToggle<cr>
map <F10> :call Do_CsTag()<CR>" ��F10����tags����
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
function! Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        silent! execute "!ctags -R --c-types=+p --fields=+S ."
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        else
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction
"����Դ�����ʽ��
map <F11> :call FormartSrc()<CR><CR>
"����FormartSrc()
function! FormartSrc()
exec "w"
"C����,Perl����,Python����
if &filetype == 'c'
exec "!astyle --style=gnu --suffix=none %"
exec "e! %"
elseif &filetype == 'cpp'
exec "!astyle --style=gnu --suffix=none %"
exec "e! %"
elseif &filetype == 'perl'
exec "!astyle --style=gnu --suffix=none %"
exec "e! %"
elseif &filetype == 'py'
exec "!astyle --style=gnu --suffix=none %"
exec "e! %"
"Java����
elseif &filetype == 'java'
exec "!astyle --style=java --suffix=none %"
exec "e! %"
elseif &filetype == 'jsp'
exec "!astyle --style=gnu --suffix=none %"
exec "e! %"
elseif &filetype == 'xml'
exec "!astyle --style=gnu --suffix=none %"
exec "e! %"
elseif &filetype == 'html'
exec "!astyle --style=gnu --suffix=none %"
exec "e! %"
elseif &filetype == 'htm'
exec "!astyle --style=gnu --suffix=none %"
exec "e! %"
endif
endfunction
"��������FormartSrc
 
"����tab�Ŀ�ݼ�
"Shift+tΪ�½�һ����ǩ��������Shirt+tΪ��ת��ǩ
map <S-t> :tabnew .<CR>
map <S-t><S-t> <ESC>:tabnext<CR>
 
"���ý������е��ǲ�����
"map <S-o> o<ESC><CR>
"���ÿ���ע�ͼ�
"��ϸע��
"F12���ڸ��к�����ע�ͣ�Shift+F12Ϊע�͵����У�����Shift+F12��ȥ�����е�ע��,Ȼ�󽫹��������һ��
nnoremap <silent> <S-F9> :A<CR>
map <S-F12> <ESC>I//<ESC><CR>
map! <S-F12> <ESC>I//<ESC><CR>
map <S-F12><S-F12> 02x<ESC><CR>
map! <S-F12><S-F12> <ESC>02x<ESC><CR>
map <F12> <ESC>$a//
map! <F12> <ESC>$a//

"���ñ����ݼ�
"F5Ϊmake������F5Ϊmake clean
"F6Ϊquickfix���鿴��ϸ��Ϣ, ����F6�ر���ϸ��Ϣ
"F7Ϊ��һ�����������F7Ϊ��һ�����
"F8Ϊ��������е�����������F8Ϊ����
""map <F5> :Do_make<CR>
""map <F5><F5> :make clean<CR>
map <F6> :cw<CR>
map <F6><F6> :ccl<CR>
map <F7> :cn<CR>
map <F7><F7> :cp<CR>
map <F8> :call Compile()<CR>:call Run()<CR>
map <F8><F8> :call Run()<CR>
map <leader>cd :cd %:p:h<cr>
""autocmd FileType cpp map <F8> <Esc>:w!<CR>:!compile_cpp.bat %<CR>//����ط���ֵ��ע��� Ҫ�����Լ��Ļ����������
"����Compile�����������Բ�����ӿ��С������б��������,�Լ����Ը����ļ�����չ��ʵ������޸Ĳ���
set autochdir
"����
function! Compile()
exec "w"
"C����   
if &filetype == "c"
exec "!gcc -Wl,-enable-auto-import % -g -o %<.exe"
"c++����
if &filetype == "cpp"
exec "!g++ -Wl,-enable-auto-import % -g -o %<.exe"
"java����
elseif &filetype == 'java'
exec "!javac %"
"python����
elseif &filetype =='python'
exec "!python %"
endif
endfunction

"����Run����
function! Run()
exec "w"
"C����
if &filetype == 'c'
exec "!%<.exe"
endif
if &filetype == 'cpp'
exec "!%<.exe"
endif
if &filetype == 'java'
exec "!java %<"
endif
if &filetype =='python'
exec "!python %"
endif
endfunction
"��������Run

"����Debug��������������С����
function! Debug()
exec "w"
"C����
if &filetype == 'c'
exec "!rm %<"
exec "!gcc % -g -o %<"
exec "!gdb %<"
elseif &filetype == 'cpp'
exec "!rm %<"
exec "!g++ % -g -o %<"
exec "!gdb %<"
"Java����
exec "!rm %<.class"
elseif &filetype == 'java'
exec "!javac %"
exec "!jdb %<"
endif
endfunction
"����dubug����
 
"autocmd BufNewFile *.cc,*.sh,*.java exec ":call SetTitle()"
"�½�.cc,.java,.sh,
"�Զ���shell�ű�����Ϊ��ִ��Ȩ��
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile> | endif | endif
if has("autocmd")
autocmd BufRead *.txt set tw=78
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal g'\"" |
\ endif
endif

" fugitive
nmap <Leader>gc :Gcommit<cr>
nmap <Leader>gs :Gstatus<cr>
" ʹ�����������ڴ��ڴ�С
nmap <silent> <UP> <C-W>+:let t:flwwinlayout = winrestcmd()<CR>
nmap <silent> <DOWN> <C-W>-:let t:flwwinlayout = winrestcmd()<CR>
" ����ģʽ�·����ƶ����
if (!has ("gui_win32"))
  cmap <C-A> <Home>
  cmap <C-E> <End>
endif
" ��һ����ʱ�Ļ��������Ƕ���
nmap <Leader>S :Scratch<cr>
"javacomplete
""autocmd Filetype java setlocal omnifunc=javacomplete#Complete
""autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo 
""inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
""inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>
"autocmd Filetype java,javascript,jsp,cpp,c inoremap <buffer>  .  .<C-X><C-O><C-P>
"vim-markdown
let g:vim_markdown_folding_disabled=1
