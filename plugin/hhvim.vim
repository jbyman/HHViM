"Set up mappings
nnoremap <Leader>d :call StartDebugger()<CR>
nnoremap <Leader>g :call AddBreakpoint()<CR>
nnoremap <Leader>r :call RunDebugger()<CR>
let g:DEBUGGER_ACTIVE = 0

"Start debugger function
function StartDebugger()
	if g:DEBUGGER_ACTIVE == 0
		:term hhvm -m debug
		let g:DEBUGGER_ACTIVE = 1
	endif
endfunction

"Add breakpoint
function AddBreakpoint()
	if g:DEBUGGER_ACTIVE == 1
		:call matchadd('ColorColumn', '\%'.line('.').'l')
		let current_line_number = line(".")
		let file_name = expand('%:t:r')
		let command = "break " . file_name . ".php:" . current_line_number . "\<CR>"
		:call term_sendkeys(2, command)
	endif
endfunction

"Run Debugger
function RunDebugger()
	if g:DEBUGGER_ACTIVE == 1
		:call term_sendkeys(2, "run\<CR>")
	endif
endfunction

"Get remote branch
function GetRemoteBranch()
	let command = "slack checkpoint | awk 'FNR == 3 {print}' | awk '{ print $4 }'"
	let result = system(command)
	return result
endfunction
