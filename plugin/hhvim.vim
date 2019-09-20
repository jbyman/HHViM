"Set up mappings
nnoremap <Leader>d :call StartDebugger()<CR>
nnoremap <Leader>b :call AddBreakpoint()<CR>

"Start debugger function
function StartDebugger()
	:term hhvm -m debug
endfunction

"Add breakpoint
function AddBreakpoint()
	:call matchadd('ColorColumn', '\%'.line('.').'l')
endfunction

