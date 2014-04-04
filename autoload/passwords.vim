function! passwords#Hide(bang)
    setlocal cole=2 cocu=nc
    if !len(a:bang)
        echo "passwords hidden"
    endif
endfunction

function! passwords#Show(bang)
    setlocal cole=0 cocu&
    if !len(a:bang)
        echo "ALL PASSWORDS VISIBLE"
    endif
endfunction

function! passwords#ShowLine(bang)
    setlocal cole=2 cocu&
    if !len(a:bang)
        echo "password on this line visible"
    endif
endfunction

function! passwords#CopyUsername(bang)
    normal! ^f<W"+yiW
    if !len(a:bang)
        echo "username copied to clipboard"
    endif
endfunction

function! passwords#CopyPassword(bang)
    normal! ^f<3W"+yiW
    if !len(a:bang)
        echo "password copied to clipboard"
    endif
endfunction

function! passwords#PasteUsername(bang)
    normal! ^f<WviW"+p
    if !len(a:bang)
        echo "username replaced from clipboard"
    endif
endfunction

function! passwords#PastePassword(bang)
    normal! ^f<3WviW"+p
    if !len(a:bang)
        echo "password replaced from clipboard"
    endif
endfunction

function! passwords#ChangeUsername()
    normal! ^f<WciW
endfunction

function! passwords#ChangePassword()
    normal! ^f<3WciW
endfunction

function! passwords#SelectUsername()
    normal! ^f<WviW
endfunction

function! passwords#SelectPassword()
    normal! ^f<3WviW
endfunction
