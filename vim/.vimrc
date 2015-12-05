syntax on

set tabstop=4
set shiftwidth=4

inoremap ( ()<left>
inoremap { {}<left>

set ruler

:highlight Extraspace ctermbg=red guibg=red

:match Extraspace /\s\s/
:2match Extraspace /\s\+$/

command Header call Header()
map <c-c-h>  :Header<CR>

autocmd BufWritePre	*.c	call Updatednow()

function Header()
	if getline (8) !~  "Created:"
		execute "normal! a/* ************************************************************************** */\n"
		execute "normal! a/*                                                                            */\n"
		execute "normal! a/*                                                        :::      ::::::::   */\n"
		call Nameprog()
		execute "normal! a/*                                                    +:+ +:+         +:+     */\n"
		call Username()
		execute "normal! a/*                                                +#+#+#+#+#+   +#+           */\n"
		call Created()
		call Updated()
		execute "normal! a/*                                                                            */\n"
		execute "normal! a/* ************************************************************************** */\n"
	endif
endfunction

function Nameprog()
	let Decor = "/*   "
	let Name = expand("%:t")
	let Decor = Decor.Name
	let Lenght = strlen (Name)
	let Space = 50 - Lenght
	while Space >= 0
		let Decor = Decor." "
		let Space = Space - 1
	endwhile
	let Decor = Decor.":+:      :+:    :+:   */"
	execute "normal! a".Decor."\n"
endfunction

function Username()
	let Decor = "/*   By: "
	let Name = $USER
	let Decor = Decor.Name
	let Lenghtuser = strlen (Name)
	let Decor = Decor." <"
	let Mail = $MAIL
	let Decor = Decor.Mail
	let Decor = Decor.">"
	let Lenghtmail = strlen (Mail)
	let Len = Lenghtmail + Lenghtuser
	let Space = 39 - Len
	while Space >= 0
		let Decor = Decor." "
		let Space = Space - 1
	endwhile
	let Decor = Decor."+#+  +:+       +#+        */"
	execute "normal! a".Decor."\n"
endfunction

function Created()
	let Decor = "/*   Created: "
	let Timedate =  strftime("%Y/%m/%d %H:%M:%S")
	let Decor = Decor.Timedate
	let Decor = Decor." by "
	let Name = $USER
	let Decor = Decor.Name
	let Lenght = strlen (Name)
	let Space = 17 - Lenght
	while Space >= 0
		let Decor = Decor." "
		let Space = Space - 1
	endwhile
	let Decor = Decor."#+#    #+#             */"
	execute "normal! a".Decor."\n"
endfunction

function Updated()
	let Decor = "/*   Updated: "
	let Timedate = strftime("%Y/%m/%d %H:%M:%S")
	let Decor = Decor.Timedate
	let Decor = Decor." by "
	let Name = $USER
	let Decor = Decor.Name
	let Lenght = strlen (Name)
	let Space = 16 - Lenght
	while Space >= 0
		let Decor = Decor." "
		let Space = Space - 1
	endwhile
	let Decor = Decor."###   ########.fr       */"
	execute "normal! a".Decor."\n"
endfunction

function Updatednow()
	if getline (9) =~  "Updated:"
		execute "normal! gg8jd$"
		call Updated()
		execute "normal! dd"
	endif
endfunction
