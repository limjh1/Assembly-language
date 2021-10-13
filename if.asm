%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp
    
    ; 분기문 (if)
    ; 특정 조건에 따라서 코드 흐름을 제어하는 것
    ; ex) 스킬 버튼을 눌렀는가 ? YES -> 스킬 사용.
    ; ex) 제한 시간 내에 던전 입장 수락 버튼을 눌렀는가 ? YES -> 입장, NO -> 던전 취소
    
    ; 조건 -> 흐름
    
    ; CMP dst, src (dst가 기준)
    ; 비교를 한 결과물은 Flag Register 저장.
    
    ; JMP [label] 시리즈.
    ; JMP : 무조건 JUMP
    ; JE : JumpEquals 같으면 JUMP
    ; JNE : JumpNotEquals 다르면 JUMP
    ; JG : JumpGreater 크면 JUMP
    ; JGE : JumpGreaterEquals 크거나 같으면 JUMP
    
    ; 두 숫자가 같으면 1, 아니면 0 출력하는 프로그램.
    
    mov rax, 10
    mov rbx, 10
    
    cmp rax, rbx
    
    je LABEL_EQUAL
    
    ; je에 의해 점프를 안했다면, 같지 않다는 의미.
    mov rcx, 0       
    jmp LABEL_EQUAL_END
        
LABEL_EQUAL:
    mov rcx, 1
LABEL_EQUAL_END:
    PRINT_HEX 1, rcx
    NEWLINE    
    
    ; 연습 문제 : 어떤 숫자(1~100)가 짝수면 1, 홀수면 0을 출력하는 프로그램.
    ; 힌트 mov ax, 100
    ; 나누기 연산. div b1 -> ax / bl (al몫 ah나머지)
    mov ax, 100    
    mov bl, 2
    
    div bl
    
    cmp ah, 0
    je L1
    
    mov rcx, 0
    jmp L2
L1:
    mov rcx, 1
L2: 
    PRINT_HEX 1, rcx
    NEWLINE
    
    
    xor rax, rax
    ret
    
section .bss
    num resb 1