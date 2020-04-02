%include "io.inc"

section .bss 
cntr resd 1 

section .text
global CMAIN

foo:
 push ebp
 mov ebp, esp
 sub esp, 88
 mov DWORD [ebp-8], 94
 mov DWORD [ebp-4], 100 
 mov eax, DWORD [ebp-8] 
 sub eax, DWORD [ebp-4] 
 jge L1 
 mov DWORD [ebp-76], 0
 mov DWORD [ebp-12], 1 
L2:
 cmp DWORD [ebp-12], 15 
 jg L1 
 mov ecx, DWORD [ebp-12]
 mov edx, DWORD [ebp-4]
 mov eax, edx 
 sar edx, 31 ; вправо
 idiv ecx
 mov DWORD [ebp-76+ecx*4], eax
 PRINT_DEC 4,eax
 NEWLINE
 add DWORD [ebp-12], 1 
 jmp L2
L1:
 leave
 ret 


boo:
 push ebp
 mov ebp, esp
 mov dword [ebp-16], 2 
 mov dword [ebp-12], 1 
 mov dword [ebp-8], 3  
 movsx eax, byte [ebp-16] 
 movzx edx, word [ebp-12] 
 add eax, edx
 mov edx, dword [ebp-8]
 sub eax, edx
 add dword [cntr], 1
 pop ebp
 ret 

CMAIN:
    mov ebp, esp; for correct debugging
    call foo
     PRINT_DEC 4, eax
    ret