%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp ; for correct debugging
    
    ; 쉬프트 연산, 논리 연산.
    
    mov eax, 0x12345678
    PRINT_HEX 4, eax
    NEWLINE
    shl eax, 8 ; 쉬프트 레프트 연산.
    PRINT_HEX 4, eax
    NEWLINE
    shr eax, 8 ; shift right
    PRINT_HEX 4, eax
    NEWLINE
    ; shift 활용
    ; 곱셉 / 나눗셈
    ; 게임서버에서 ObjectID 만들어 줄 때. 64bit
    
    ; not and or xor
    
    ; 조건A: 잘생겼다.
    ; 조건B: 키가 크다.
    
    ; not A : A가 아니다. -> A가 거짓0이면 1, 1이면 0.
    ; A and B : A 이고 B이다. -> 둘다 1이면1, 아니면 0
    ; A or B : 둘장 하나라도 1이면 1, 아니면 0
    ; A xor B : 둘다 1이거나 둘다 0이면 0, 서로 다르면 1
    
    mov al, 0b10010101
    mov bl, 0b01111100
    
    ; 0b0001 0100 = 0x14
    and al, bl ; al = al and bl
    PRINT_HEX 1, al
    NEWLINE
    
    ; 0b1110 1011 = 0xeb
    not al
    PRINT_HEX 1, al
    NEWLINE
    
    ; 응용 사례 : bitflag(bit에 의미 부여해서 비교 연산), 버프시스템?
    
    mov al, 0b10010101
    mov bl, 0b01111100
    
    NEWLINE
    PRINT_HEX 1, al
    NEWLINE 
    xor al, bl
    PRINT_HEX 1, al
    NEWLINE 
    xor al, bl
    PRINT_HEX 1, al
    NEWLINE 
    ; 동일한 값으로 xor 두번하면 자기 자신으로 돌아옴.
    ; 암호학에서 유용 (value xor key) 대칭키.
    
    ; mov al, 0 과 같음.
    xor al, al
    PRINT_HEX 1, al  
    
    xor rax, rax
    ret
    
section .bss
    num resb 1