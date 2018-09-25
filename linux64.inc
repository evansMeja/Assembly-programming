STDIN   equ 0
STDOUT 	equ 1
STDERR	equ 2

SYS_READ   equ 0 
SYS_WRITE  equ 1
SYS_OPEN   equ 2
SYS_EXIT   equ 60 


%macro printDgt 1
	mov rax, %1
 	call _printRAXDigit
%endmacro

%macro exit 0
	mov rax, 60
	mov rdi, 0
	syscall
%endmacro

%macro delay5sec 0
	mov rax, 35
	mov rdi, delay
	mov rsi, 0
	syscall
%endmacro

%macro mc1  3
        mov rax, %1
        call _printRAXDigit

	mov rax, %2
        call _printRAXDigit

	mov rax, %3
        call _printRAXDigit

%endmacro
