section .data
   	placeholder db "Hello World",10

section .text
	global _start

_start:
	call _printHello

	mov rax, 60
	mov rdi, 0
	syscall

_printHello:
	mov rax, 1
	mov rdi, 1
	mov rsi, placeholder
	mov rdx, 14
	syscall
	ret
