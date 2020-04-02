%include "io.inc"
extern	printf
	SECTION .data		
msg:	db "Hello World",10	
len:	equ $-msg		
			
	SECTION .text		
        global CMAIN		
CMAIN:				
	
	mov edx,len		
	mov ecx,msg		
	mov ebx,1		
	mov eax,4	
        add eax, 4
        PRINT_DEC 4, eax
ret