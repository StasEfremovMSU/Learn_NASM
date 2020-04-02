%include "io.inc"
extern	printf

SECTION .data
format: db "Numbers:  %d , %X ,  %e ,  %E",10,0 ;  

myint: dd 3456
hex: dd 0x456ABFD
flt: dd 7.7e-28  
flt1: dq -123.49e30 ;Почему dq 4 8 байт, а мы чистим 28 и работает, при других нет

SECTION .bss
flttmp:	resq 1
SECTION .text                 
global	CMAIN		  

foo:
push ebp
mov ebp, esp
push ebx
mov ebx, 1
PRINT_STRING 'func boo'
pop ebx
pop ebp
ret

CMAIN:	
fld dword [flt1]	  ; сопроцессор команда префикс f
fstp qword [flttmp]  
push dword [flt1+4]	   
push dword [flt1]
push dword [flttmp+4]    
push dword [flttmp]	
push dword [hex]
push dword [myint]
push dword format
call printf	
add esp, 28
mov  eax, 0
mov ebx, 1
call foo
NEWLINE
PRINT_DEC 4, ebx
;pop dword [format]
ret	