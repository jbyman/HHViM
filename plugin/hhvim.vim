"Set up mappings
nnoremap <Leader>d :call StartDebugger()<CR><CR>

"Start debugger function
function StartDebugger()
	:term hhvm -m debug
endfunction

