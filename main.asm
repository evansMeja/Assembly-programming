section .data
	name db "evans",10

section .text
	global _start

_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, name
	mov rdx,6
	syscall

	mov rax, 60
	mov rdi, 0
	syscall
