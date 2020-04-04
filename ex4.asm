section	.text
   global _start        ; объявляем для использования gcc
	
_start:	                ; сообщаем линкеру входную точку
   mov	ecx,'1'
   sub     ecx, '0'
	
   mov 	edx, '1'
   sub     edx, '0'
	
   call    sum          ; вызываем процедуру sum
   mov 	[res], eax
   mov	ecx, msg	
   mov	edx, len
   mov	ebx,1	        ; файловый дескриптор (stdout)
   mov	eax,4	        ; номер системного вызова (sys_write)
   int	0x80	        ; вызов ядра
	
   mov	ecx, res
   mov	edx, 1
   mov	ebx, 1	        ; файловый дескриптор (stdout)
   mov	eax, 4	        ; номер системного вызова (sys_write)
   int	0x80	        ; вызов ядра
	
   mov	eax,1	        ; номер системного вызова (sys_exit)
   int	0x80	        ; вызов ядра
sum:
   mov     eax, ecx
   add     eax, edx
   add     eax, '0'
   ret
	
section .data
msg db "The sum is:", 0xA,0xD 
len equ $- msg   
 
segment .bss
res resb 1