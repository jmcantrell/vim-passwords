if exists('g:passwords_loaded') || &cp
    finish
endif
let g:passwords_loaded = 1

let s:save_cpo = &cpo
set cpo&vim

" try to keep sensitive stuff from leaking
setlocal noswapfile nobackup noundofile

if !exists('g:passwords_search_from_top')
    let g:passwords_search_from_top = 1
endif
if g:passwords_search_from_top
    " always start searching from the top for consistency
    nnoremap <buffer> / gg/
endif

command! ChangeUsername :call passwords#ChangeUsername()
command! ChangePassword :call passwords#ChangePassword()
command! SelectUsername :call passwords#SelectUsername()
command! SelectPassword :call passwords#SelectPassword()
command! -bang CopyUsername :call passwords#CopyUsername('<bang>')
command! -bang CopyPassword :call passwords#CopyPassword('<bang>')
command! -bang PasteUsername :call passwords#PasteUsername('<bang>')
command! -bang PastePassword :call passwords#PastePassword('<bang>')
command! -bang HidePasswords :call passwords#Hide('<bang>')
command! -bang ShowPasswords :call passwords#Show('<bang>')
command! -bang ShowLinePasswords :call passwords#ShowLine('<bang>')

if !exists('g:passwords_map_keys')
    let g:passwords_map_keys = 1
endif
if g:passwords_map_keys
    " hide passwords quickly
    nnoremap <silent> <buffer> <c-l> :HidePasswords<cr><c-l>
    " password visibility
    nmap <silent> <buffer> <leader>h :HidePasswords<cr>
    nmap <silent> <buffer> <leader>H :ShowPasswords<cr>
    nmap <silent> <buffer> <leader>L :ShowLinePasswords<cr>
    " copy username/password to clipboard
    nmap <silent> <buffer> yu :CopyUsername<cr>
    nmap <silent> <buffer> yp :CopyPassword<cr>
    " replace username/password from clipboard
    nmap <silent> <buffer> pu :PasteUsername<cr>
    nmap <silent> <buffer> pp :PastePassword<cr>
    " change username/password
    nmap <silent> <buffer> cu :ChangeUsername<cr>
    nmap <silent> <buffer> cp :ChangePassword<cr>
    " visually select username/password
    nmap <silent> <buffer> vu :SelectUsername<cr>
    nmap <silent> <buffer> vp :SelectPassword<cr>
endif

if !exists('g:passwords_hide')
    let g:passwords_hide = 1
endif
if g:passwords_hide
    " hide passowrds initially
    HidePasswords!
    " try to hide passwords when losing focus
    autocmd BufLeave,BufHidden <buffer> :HidePasswords
endif

let &cpo = s:save_cpo
