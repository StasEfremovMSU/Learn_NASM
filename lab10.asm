%include "io.inc"

section .text
global CMAIN


f:
 push ebp ; 
 mov ebp, esp 
 sub esp, 24 
 mov eax, 1 
 mov ecx, 3 
 mov edx, 2 
 mov dword [esp+4], eax 
 mov dword [esp+12], ecx 
 mov dword [esp+8], edx

 mov eax, dword [ebp+8] 
 ;PRINT_DEC 4, eax
 ;NEWLINE
 mov dword [esp], eax 
 call f2 
 sub esp, 4 
 pop ebp
 ret 
 
f2:
 push ebp 
 mov ebp, esp 
 mov eax, dword [ebp+8] 
 mov edx, dword [ebp+20] 
 mov dword [eax+8], edx 
 mov edx, dword [ebp+16] 
 mov dword [eax+4], edx 
 mov edx, dword [ebp+12] 
 mov dword [eax], edx 
 pop ebp 
 ; !!!! Здесь не получается корректно завершить вызов
 ; add ebp, 4
 add ebp, 4
 ret 

CMAIN:
    mov ebp, esp; for correct debugging
    PRINT_STRING 'result: '
    call f
    PRINT_DEC 4, eax
    ret