%include 'io.inc'
size equ 32
section .data
 s1 db 'some text'
 times size-$+s1 db 0
 s2 db 'some text'
 times size-$+s2 db 0
section .text
global CMAIN

print_answer:
 push ebp
 mov ebp, esp
 cmp eax, 0
 je .L1
 jne .L2
 .L1:
 PRINT_STRING "Strings are equal"
 jmp .L3
 .L2:
 PRINT_STRING "Strings are not equal"
 .L3:
 mov esp, ebp
 pop ebp
 ret 

string_comparator:
 push ebp
 mov ebp, esp
 push esi
 push edi
 xor eax, eax
 mov ecx, dword [ebp + 16]
 mov esi, dword [ebp + 8]
 mov edi, dword [ebp + 12]
 cld
 jecxz .end
 .loop:
 cmpsb
 jne .ne
 loop .loop
 jmp .end
 .ne:
 mov eax, dword [ebp + 16]
 sub eax, ecx
 inc eax
 .end:
 pop edi
 pop esi
 mov esp, ebp
 pop ebp
 ret 

CMAIN:
 push ebp
 mov ebp, esp
 sub esp, 12
 mov dword [esp], s1
 mov dword [esp + 4], s2
 mov dword [esp + 8], size-1
 call string_comparator 
 call print_answer
 xor eax, eax
 mov esp, ebp
 pop ebp
 ret
 
 
 