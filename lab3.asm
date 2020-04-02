%include "io.inc"
extern	printf


; !!!!!! ---- C EQU не работает ------
SECTION .data

text1: db "Char %c ", 10, 0
text2: db "String %s , his length: %d", 10, 0
text3: db "Number %d ", 10, 0
text4: db "Number %d and char %c", 10, 0
char1:	db 'b'	 
stri:	db "my_stri",0  
;len: equ $-stri	
len: dd 0x67D

SECTION .bss
flttmp:	resq 1	
	
SECTION .text                 
global	CMAIN		  
CMAIN:	

fstp qword [flttmp]  
push  dword [char1] 
push dword text1
call printf
pop dword [text1]
pop dword [char1]

push  dword stri 
;push  dword len 
push dword text2
call printf
pop dword [text2]
;pop dword [len]
pop dword [stri]

push  dword len 
push dword text3
call printf
pop dword [text3]
pop dword [len]

push  dword len 
push  dword [char1] 
push dword text4
call printf
pop dword [text4]
pop dword [char1]
pop dword [len]
ret	