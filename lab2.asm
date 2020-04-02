%include "io.inc"
extern	printf
SECTION .data		
	a: dd 7
        b: dd 0x23
    fmt: db "a=%d, eax=%d", 10, 0 
    fmt2: db "ebx=%d", 10 
        SECTION .text        
        global CMAIN		
CMAIN:				
        push ebp		
        mov ebp,esp

	mov eax, [a]
	add eax, 2		
	push eax		
        push dword [a]	
        
        push dword fmt	
        call printf
        	
        push dword [b]
        mov ebx,34
        push dword fmt2	
        call printf	
        add esp, 12		

        mov esp, ebp	
        pop ebp		

	mov eax,0		
	ret			
	