%include "io.inc"

section .text
global CMAIN


CMAIN:
push ebp
mov ebp, esp
sub esp, 88
mov DWORD [ebp-20],0x0
mov DWORD [ebp-24],0xFFFFFFFF 
mov DWORD [ebp-12],0x1 
mov DWORD [ebp-16],0x1



mov eax,DWORD [ebp-12] 
mov DWORD [esp+12],eax 
mov eax,DWORD [ebp-16] 
mov DWORD [esp+8],eax 
mov eax,DWORD [ebp-20] 
mov DWORD [esp+4],eax 
mov eax,DWORD [ebp-24] 
mov DWORD [esp],eax 
call sum 
leave
ret

sum:
push ebp 
mov ebp,esp 
sub esp,0x10 
mov eax, DWORD [ebp+16] 
mov edx, DWORD [ebp+20] 
add eax, DWORD [ebp+8] 
adc edx, DWORD [ebp+12]  ; sbb на вычитание
PRINT_HEX 4, eax
PRINT_HEX 4, edx
NEWLINE
mov DWORD [ebp-4],eax 
mov eax,DWORD [ebp-4] 
mov esp, ebp 
pop ebp 
ret 


