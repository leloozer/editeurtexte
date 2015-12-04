autocmd changebuf	*.c	call Update()

function	header()
	call append( 0, "/* ************************************************************************** */")
	call append( 1, "/*                                                                            */")
	call append( 2, "/*                                                         :::      ::::::::  */")
	call
	call append( 4, "/*                                                     +:+ +:+         +:+    */")
	call
	call append( 6, "/*                                                 +#+#+#+#+#+   +#+          */")
	call
	call
	call append( 9, "/*                                                                            */")
	call append( 10, "/* ************************************************************************** */")
endfunction


function	Update()
	
endfunction
	
