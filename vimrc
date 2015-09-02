" =======================================
" speed-cola
" 
" ultra fast vim configuration 
" powered by vim-plug, infused with XDG and a little speed-cola
"
" Maintained By:
" William Myers @mkwmms [http://github.com/mkwmms/speed-cola]
"
" Initially based on:
" Luan Santos' vimfiles [https://github.com/luan/vimfiles]
" Steve Francia's legendary vim distribution [https://github.com/spf13/spf13-vim]
" =======================================

if !has('nvim')
  set nocompatible
endif

let g:mapleader = ","

" ----------------------------------------
" Environment
" ----------------------------------------
if empty("$XDG_CONFIG_HOME")
  echo "$XDG_CONFIG_HOME is unset; using ~/.config"
  let $XDG_CONFIG_HOME = "$HOME/.config"
endif

if empty("$XDG_DATA_HOME")
  echo "$XDG_DATA_HOME is unset; using ~/.local/share"
  let $XDG_DATA_HOME = "$HOME/.local/share"
endif

if empty("$XDG_CACHE_HOME")
  echo "$XDG_CACHE_HOME is unset; using ~/.cache"
  let $XDG_CACHE_HOME = "$HOME/.cache"
endif

" ----------------------------------------
" Runtime configuration
" ----------------------------------------
set directory=$XDG_CACHE_HOME/vim/swap,~/,/tmp
set backupdir=$XDG_CACHE_HOME/vim/backup,~/,/tmp
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
set undodir=$XDG_CACHE_HOME/vim/undo,~/,/tmp
set runtimepath=$XDG_CONFIG_HOME/vim,$XDG_DATA_HOME/vim/plugged,$XDG_CONFIG_HOME/vim/after,$VIM,$VIMRUNTIME
" let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc

" ----------------------------------------
" Configuration
" ----------------------------------------
runtime! config/local/vimrc.before

runtime! Plug.vim

runtime! config/*.vim

" ----------------------------------------
" Plugin configuration
" ----------------------------------------
runtime! config/plugin/*.vim
if has('nvim')
  runtime! config/plugin/nvim/*.vim
else
  runtime! config/plugin/vim/*.vim
endif

" ----------------------------------------
" Lib load path
" ----------------------------------------
runtime! lib/*.vim

" ----------------------------------------
" Local configuration
" ----------------------------------------
call plug#begin($XDG_DATA_HOME . '/vim/plugged')
runtime! config/local/Plug.vim
call plug#end()
runtime! config/local/vimrc.after
