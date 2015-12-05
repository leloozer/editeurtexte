autocmd BufChangeFile	*.c	call Updated()

function	Header()
	call (0, "/* ************************************************************************** */")
	call (1, "/*                                                                            */")
	call (2, "/*                                                         :::      ::::::::  */")
	call Nameprog()
	call (4, "/*                                                     +:+ +:+         +:+    */")
	call Username()
	call (6, "/*                                                 +#+#+#+#+#+   +#+          */")
	call Created()
	call Updated()
	call (9, "/*                                                                            */")
	call (10, "/* ************************************************************************** */")
endfunction

function	Nameprog()
	let Decor = "/*   "
	let Name = system ($(basename "$0"))
	let Decor = Decor . Name
	let Lenght = strlen (Name)
	let Space = 51 - Lenght
	while Space > 0
		let Decor = Decor . " "
		let Space = Space - 1
	endwhile
	let Decor = Decor . ":+:    :+:    :+:    */"
	call (3, Decor)
endfunction

function	Username()
	let Decor = "/*   By: "
	let Name = system ($USER42)
	let Decor = Decor . Name
	let Lenghtuser = strlen (Name)
	let Decor = Decor . "  <"
	let Mail = system ($MAIL42)
	let Decor = Decor . Mail
	let Decor = Decor . ">"
	let Lenghtmail = strlen (Mail)
	let Len = Lenghtmail + Lenghtuser
	let Space = 40 - Len
	while Space > 0
		let Decor = Decor . " "
		let Space = Space - 1
	endwhile
	let Decor = Decor . "+#+  +:+        +#+       */"
	call (5, Decor)
endfunction

function	Created()
	let Decor = "/*   Created: "
	let Timedate = 
	call (7, Decor)
endfunction

function	Updated()
	let Decor = "/*   Updated: "
	call (8, Decor)
endfunction
	
