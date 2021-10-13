%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp
    
    ; 반복문(while for)
    ; 특정 조건까지 반복.
    
    ; ex) Hello World 10번 출력?
    
    mov ecx, 10
        
LABEL_LOOP:
    PRINT_STRING msg
    NEWLINE
    dec ecx ; sub ecx, 1
    cmp ecx, 0
    jne LABEL_LOOP
    
    ; 연습 문제) 1에서 100까지의 합을 구하시오.
    mov eax, 100 ; 최종 목적지.
    xor ebx, ebx ; mov ebx, 0  ebx : 결과물.
    xor ecx, ecx
        
LABEL_SUM:
    inc ecx ; add ecx, 1
    add ebx, ecx ; ebx = ebx + ecx
    cmp ecx, eax
    jne LABEL_SUM ; 100이랑 같지 않다면.
    
    PRINT_DEC 4, ebx
    NEWLINE
    
    ; loop [label]
    ; - ecx에 반복 횟수.
    ; - loop할때마다 ecx 1 감소, 0이면 빠져나감. 아니면 라벨로 이동.
    
    mov ecx, 100
    xor ebx, ebx
LABEL_LOOP_SUM:
    add ebx, ecx
    loop LABEL_LOOP_SUM
    
    PRINT_DEC 4, ebx
    
    
    xor rax, rax
    ret
    
section .data
    msg db 'Hello World', 0x00
    
section .bss