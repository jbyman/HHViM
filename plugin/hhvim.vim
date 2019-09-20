"Set up mappings
nnoremap <Leader>d :call StartDebugger()<CR>
nnoremap <Leader>b :call AddBreakpoint()<CR>
nnoremap <Leader>r :call RunDebugger()<CR>
let g:DEBUGGER_ACTIVE = 0

"Start debugger function
function StartDebugger()
	if g:DEBUGGER_ACTIVE == 0
		:term hhvm -m debug
		let g:DEBUGGER_ACTIVE = 1
		:bprev<CR>
	endif
endfunction

"Add breakpoint
function AddBreakpoint()
	:call matchadd('ColorColumn', '\%'.line('.').'l')
	let current_line_number = line(".")
	let file_name = expand('%:t:r')
	let command = "break " . file_name . ".php:" . current_line_number . "\<CR>"
	:call term_sendkeys(2, command)
endfunction

"Run Debugger
function RunDebugger()
	:call term_sendkeys(2, "run\<CR>")
endfunction
