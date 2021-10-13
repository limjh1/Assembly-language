%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp ; for correct debugging
    
    GET_DEC 1, al
    GET_DEC 1, num
    
    ;PRINT_DEC 1, al
    ;NEWLINE
    ;PRINT_DEC 1, num   
    
    ; 더하기 연산
    ; add a, b (a = a + b)
    ; a는 레지스터 or 메모리
    ; b는 레지스터 or 메모리 or 상수
    ; 단, a, b 모두 메모리는 안돼
    
    ; 빼기 연산
    ; sub a, b로 완전히 똑같음.
    
    ADD al, 1 ; 레지스터 + 상수
    PRINT_DEC 1, al ; 1 + 1 = 2
    NEWLINE
    
    ;mov rax, num ; num의 주소값이 더해진 
    
    ADD al, [num] ; 주소의 값을 추출.
    PRINT_DEC 1, al
    NEWLINE
    
    mov bl, 3 ; 레지스터 + 레지스터
    add al, bl
    PRINT_DEC 1, al
    NEWLINE
    
    add [num], byte 1 ; 메모리 + 상수
    PRINT_DEC 1, [num]
    NEWLINE
    
    add [num], al ; 메모리 + 레지스터.
    PRINT_DEC 1, [num]
    NEWLINE  

    ; 곱하기 연산.
    ; mul reg
    ; - mul bl => al * bl
    ; -- 연산 결과를 ax에 저장.
    ; - mul bx => ax * bx
    ; -- 연산 결과를 dx에 저장.(상위 16비트), ax(하위 16비트)에 저장.
    ; - mul ebx => eax * ebx
    
    ; ex) 5 * 8 ?
    mov ax, 0
    mov al, 5
    mov bl, 8
    mul bl
    PRINT_DEC 2, ax
    NEWLINE
    
    ; 나누기 연산
    ; div reg
    ; - div bl => ax / bl
    ; -- 연산 결과를 al(몫) ah(나머지)
    
    ; ex) 100 / 3 ?
    mov ax, 100
    mov bl, 3
    div bl
    PRINT_DEC 1, al
    NEWLINE
    mov al, ah
    PRINT_DEC 1, al
    NEWLINE
    

    xor rax, rax
    ret
    
section .bss
    num resb 1