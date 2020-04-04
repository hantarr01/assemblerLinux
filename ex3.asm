section	.text
   global _start   ; должно быть объявлено для линкера (ld)
	
_start:	
 		
   mov  eax,5     ; количество значений типа byte для выполнения операции сложения
   mov  ebx,0      ; EBX будет хранить сумму
   mov  ecx, x     ; ECX будет указывать на текущий элемент для выполнения операции сложения
 
top:  add  ebx, [ecx]
 
   add  ecx,1      ; перемещаем указатель на следующий элемент
   dec  eax        ; выполняем декремент счётчика
   jnz  top        ; если счётчиком не является 0, то тогда выполняем цикл ещё раз
 
done: 
 
   add   ebx, '0'
   mov  [sum], ebx ; готово, сохраняем результат в переменной sum
 
display:
 
   mov  edx,1      ; длина сообщения
   mov  ecx, sum   ; сообщение для написания
   mov  ebx, 1     ; файловый дескриптор (stdout)
   mov  eax, 4     ; номер системного вызова (sys_write)
   int  0x80       ; вызов ядра
	
   mov  eax, 1     ; номер системного вызова (sys_exit)
   int  0x80       ; вызов ядра
 
section	.data
global x
x:    
   db  2
   db  4
   db  3
   db  8
   db  2
 
sum: 
   db  0