if exists("b:current_syntax")
    finish
endif

if !exists("main_syntax")
  let main_syntax = 'markdown'
endif

runtime! syntax/markdown.vim
unlet! b:current_syntax

syn match passwordsAuth /<!--\s\+\S\+\s\+\/\s\+\S\+\s\+\(#.*\)\?-->/ conceal cchar=*
hi link passwordsAuth Comment

let b:current_syntax = "passwords"
