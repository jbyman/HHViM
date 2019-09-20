"Set up mappings
nnoremap <Leader>d :call StartDebugger()<CR><CR>
nnoremap <Leader>b :call AddBreakpoint()<CR><CR>

"Start debugger function
function StartDebugger()
	:term hhvm -m debug
endfunction

"Add breakpoint
function AddBreakpoint()
	:call matchadd('ColorColumn', '\%'.line('.').'l')<CR>
endfunction

