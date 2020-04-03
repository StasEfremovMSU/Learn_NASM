%include 'io.inc'
; не X  и не Y
size equ 32
section .data
section .text
global CMAIN

global pierce_arrow
pierce_arrow:
push ebp
mov ebp, esp
mov eax, DWORD [ebp+12]  
;add eax, DWORD [ebp+8] 
or eax, DWORD [ebp+8] 
not eax 
mov esp, ebp
pop ebp
ret 



CMAIN:
push ebp
mov ebp, esp
sub esp, 12
mov dword [esp], 11111111111111111111111111111101b 
mov dword [esp + 4], 11111111111111111111111111111101b
call pierce_arrow
PRINT_DEC 4, eax
NEWLINE
 xor eax, eax
 mov esp, ebp
 pop ebp
 ret
 
 
 