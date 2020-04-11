   %macro write_string 2 
      mov   eax, 4
      mov   ebx, 1
      mov   ecx, %1
      mov   edx, %2
      int   80h
   %endmacro
 
section	.text
   global _start            ; объявляем для использования gcc
	
_start:                     ; сообщаем линкеру входную точку
   write_string msg1, len1               
   write_string msg2, len2    
   write_string msg3, len3  
	
   mov eax,1                ; номер системного вызова (sys_exit)
   int 0x80                 ; вызов ядра
 
section	.data
msg1 db	'message 1 here',0xA,0xD 	
len1 equ $ - msg1			
 
msg2 db 'message 2 here', 0xA,0xD 
len2 equ $- msg2 
 
msg3 db 'message 3 here', 0xA,0xD 
len3 equ $- msg3