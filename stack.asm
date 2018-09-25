 section .data
	digit db 0,10
	greeting db "Hello programmers this is a classic code",10
        lines db "_________________________________",0
	thanks db "Thanks for watching",10

section .text
	global _start

_start:

	mov rax, lines
	call _print

	mov rax, greeting
	call _print

	push 5
	push 7
	push 5

	pop rax
        call _printRAXDigit
	pop rax
	call _printRAXDigit
        pop rax
	call _printRAXDigit
        pop rax

	mov rax, 60
	mov rdi, 0
	syscall

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
