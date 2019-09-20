"Set up mappings
nnoremap <Leader>d :call StartDebugger()<CR>
nnoremap <Leader>b :call AddBreakpoint()<CR>
set modifiable

"Start debugger function
function StartDebugger()
	:term hhvm -m debug
	<C-w>N
endfunction

"Add breakpoint
function AddBreakpoint()
	:call matchadd('ColorColumn', '\%'.line('.').'l')
	let current_line_number = line(".")
	echo current_line_number
	let file_name = expand('%:t:r')
	echo file_name
	let command = "break " . file_name . ".php:" . current_line_number . "\<CR>"
	echo command
	:call term_sendkeys(2, command)
endfunction

"(echo "var_dump('hi');"; cat <&0) | hhvm -m debug
"https://vimhelp.org/eval.txt.html#term_sendkeys%28%29

