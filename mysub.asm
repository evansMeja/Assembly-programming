section .data
	digit db 0,10
	msg db "hello there. How are you?",10

section .text
	global _start


_start:
	mov rax, msg
	call _printer


_printer:
	add rax, 48
	push rax
	mov [digit], al
	mov rbx, 0

_printerLoop:
	inc rax
	inc rbx
	cmp cl,0
 	jne _printerLoop

	mov rax,1
	mov rdi,1
	pop rsi
	mov rdx,rbx
	syscall
	ret
	
