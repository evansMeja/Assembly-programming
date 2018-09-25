section .data
message:	db	'Hello, world!',0x0A    ; message and newline
file:		db	'./herpderp'		; File to write
length:		equ	$-message        ; NASM definition pseudo-instruction
exitmsg		db	"Everything was set. Thank you"



section .text
	global _start

_start:
	;; sys_open(file, permissions)
	mov	rax, 2		; sys_open
	mov	rdi, file	; file
	mov	rsi, 2		; Read/Write permissions
	syscall

	;; File exists?
	mov	rdx,0
	cmp	rdx,rax
	jle	WR

	;; Create file
	mov	rax,85		; sys_creat
	syscall

	;; File created sucessfully?
	mov	rdx,0
	cmp	rax,rdx
	jle	EX

WR:
	;; File descriptor copy
	mov	rbx,rax
	
	;; sys_write(stream, message, length)
	mov	rax, 1        	; sys_write
	mov	rdi, rbx        ; ./nope
	mov	rsi, message    ; message address
	mov	rdx, length    	; message string length
	syscall

	mov	rax, 3
	syscall

EX:	
	;; sys_exit(return_code)
      	call _exitMessage
	mov	rax, 60        	; sys_exit
	mov	rdi, 0        	; return 0 (success)
	syscall


_exitMessage:
	
	mov rax, exitmsg
	call _print

_print:
	push rax
	mov rbx, 0
	syscall
	ret

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



