if exists("g:loaded_brace_expand")
    finish
endif

let g:loaded_brace_expand = 1

function! s:BraceExpand()
    let l:curline = getline('.')
    let l:bracelist = matchstrpos(l:curline, '{[^{},]*\(,[^{}]*\)\+}')
    if l:bracelist !=# ["", -1, -1]
	let l:bline = substitute(l:curline[0:l:bracelist[1]], '{', '', '')
	let l:eline = substitute(l:curline[l:bracelist[2]-1:-1], '}', '', '')

	let l:sublist = split(l:bracelist[0][1:-2], ',')
	echo l:sublist
	let l:ln = line('.')
	for expan in l:sublist
	    call setline(l:ln, l:bline . expan . l:eline)
	    call append(l:ln, "")
	    let l:ln += 1
	endfor
    endif
endfunction

nnoremap <silent> <Plug>BraceExpand :<C-U>call <SID>BraceExpand()<CR>

