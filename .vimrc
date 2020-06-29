
" .vimrc
"
" MAINTAINER: Max Prehl
" UPDATED: Jul. 28, 2020
"
" I've taken from several sources, and did my own stuff.  
" Some inspiration:
" 
" http://vim.wikia.com/wiki/Example_vimrc
" 
" Bram Moolenaar <Bram@vim.org>
" 
" Kurt Schmidt <kschmidt>
"
" Derek Taylor (DistroTube) 
" <https://gitlab.com/dwt1/dotfiles/-/blob/master/.vimrc>
"
" Max Cantor (thoughtbot, Vim without plugins)
" <https://www.youtube.com/watch?v=XA2WjJbmmoM>
" <https://github.com/changemewtf/no_plugins>
"
" ThePrimeagen
" <https://www.youtube.com/watch?v=n9k9scbTuvQ>
" <https://github.com/erkrnt/awesome-streamerrc/tree/master/ThePrimeagen>


""""""""""" From Bram 
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

""""""""""" From Bram 
" Bail out if something that ran earlier, e.g. a system wide vimrc, does not
" want Vim to use these default values.
if exists('skip_defaults_vim')
  finish
endif


""""""""""" vim.wikia 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Features {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

""""""""""" vim.wikia 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc

""""""""""" Bram
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
  set nocompatible
endif

""""""""""" Bram 
" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
  set nocompatible
silent! endwhile

""""""""""" vim.wikia, Bram
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
"
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
" Revert with ":filetype off".
filetype indent plugin on

""""""""""" vim.wikia 
" Enable syntax highlighting
"syntax on

""""""""""" Bram 
" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif


""""""""""" vim.wikia 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Must have options {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FINDING FILES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""" Derek, Cantor
" Searches current directory recursively.
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

""""""""""" vim.wiki, Bram, Cantor
" Better command-line completion
" display completion matches in a status line
" Display all matching files when we tab complete
set wildmenu 

""""""""""" Cantor
" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TAG JUMPING:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Create the `tags` file (may need to install ctags first)
command!  MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack
" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCOMPLETE:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OTHER:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""" vim.wiki, Bram 
" Show partial commands in the last line of the screen
" display incomplete commands
set showcmd
 
""""""""""" vim.wiki 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
"set hlsearch

""""""""""" Bram
if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display / Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""" vim.wiki 
" Display line numbers on the left
set number

""""""""""" vim.wiki 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
""""""""""" vim.wiki 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
" set t_vb=

""""""""""" vim.wiki, Bram 
" Display the cursor position on the last line of the screen or in the status
" line of a window
" show the cursor position all the time
set ruler
 
""""""""""" vim.wiki 
" Always display the status line, even if only one window is displayed
set laststatus=2

""""""""""" vim.wiki 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

""""""""""" ThePrimeagen 
" Visual differentiation for the 80 (and 120) character mark
set colorcolumn=80,120
highlight ColorColumn ctermbg=0 guibg=lightgrey

""""""""""" vim.wiki 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Usability options {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
""""""""""" vim.wiki 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
""""""""""" vim.wiki, Bram
" Allow backspacing over autoindent, line breaks and start of insert action
" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start
 
""""""""""" vim.wiki 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
""""""""""" vim.wiki 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
""""""""""" vim.wiki 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
""""""""""" vim.wiki 
" Enable use of the mouse for all modes
"set mouse=a

""""""""""" Derek
" Mouse Scrolling
set mouse=nicr
 
""""""""""" vim.wiki, Bram 
" Quickly time out on keycodes, but never time out on mappings
" ttimeout		" time out for key codes
" ttimeoutlen=100	" wait up to 100ms after Esc for special key
set notimeout ttimeout ttimeoutlen=200
 
""""""""""" vim.wiki 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


 

""""""""""" vim.wiki 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation options {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation settings according to personal preference.
 
""""""""""" vim.wiki 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

""""""""""" Derek 
" Be smart when using tabs ;)
set smarttab
 
""""""""""" vim.wiki 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4
 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The Rest of Bram's Defaults {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=200		" keep 200 lines of command line history

" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5


""""""""""" Bram, Derek 
" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set backupdir=~/.vim/.backup//
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
    set undodir=~/.vim/.undo//
  endif
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
