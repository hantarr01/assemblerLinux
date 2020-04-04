section	.text
   global _start        ; объявляем для использования gcc
	
_start:	                ; сообщаем линкеру входную точку
   call    display
   mov	eax,1	        ; номер системного вызова (sys_exit)
   int	0x80	        ; вызов ядра
	
display:
   mov    ecx, 1024
	
next:
   push    ecx
   mov     eax, 4
   mov     ebx, 1
   mov     ecx, achar
   mov     edx, 1
   int     80h
	
   pop     ecx	
   mov	dx, [achar]
   cmp	byte [achar], 0dh
   inc	byte [achar]
   loop    next
   ret
	
section .data
achar db '0'