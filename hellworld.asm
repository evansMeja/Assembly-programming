section .data
	hellmsg db "hello there, I am a simple hello message",10

section .text
	global _start

_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, hellmsg
	mov rdx,41
	syscall

	mov rax,60
	mov rdi,0
	syscall
