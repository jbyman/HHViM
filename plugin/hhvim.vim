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
	let current_line_number = line(".")
	let file_name = expand('%:t:r')
	:wincmd w
	r "var_dump('hi');"
endfunction

"(echo "var_dump('hi');"; cat <&0) | hhvm -m debug
