%include "linux64.inc"

section .data
	digit       db    0,10

section .text
	global _start

_start:
	mc1 2,5,8
	exit

_printRAXDigit:
	add rax, 48
	mov [digit], al
	mov rax, digit
	call _print
        syscall
        ret


_print:
	push rax
	mov rbx, 0

_printLoop:
	inc rax
	inc rbx
	mov cl,[rax]
	cmp cl,0
	jne _printLoop

	mov rax, 1
	mov rdi, 1
	pop rsi
	mov  rdx,rbx
	syscall
	ret
