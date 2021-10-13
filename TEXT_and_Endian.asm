%include "io64.inc"

section .text
global CMAIN
CMAIN:   
    mov rbp, rsp; for correct debugging
    
    PRINT_STRING msg;
    
    xor rax, rax
    ret
    
    
    ; 초기화 된 데이터
    ; [변수이름] [크기] [초기값]
    ; [크기] db(1)-byte dw(2)-word dd(4) dq(8)
section .data

;   msg db 'Hello World', 0x00
    msg db 0x48,0x65,0x6c,0x6c,0x6f,0x20,0x57,0x6f,0x72,0x6c,0x64,0x0 ; ASCII CODE
    
    a db 0x11, 0x11, 0x11, 0x11 ; [0x11]
    
    b dd 0x12345678 ; 빅 엔디안 --> 0x12 0x34 0x56 0x78
                    ; 리틀 엔디안 --> 0x78 0x56 0x34 0x12 로 데이터 저장됨.
                    ; 장단점이 교차한다.
                    ; - 리틀 엔디안 : 캐스팅에 유리함. (캐스팅이란. 12345678 중 78남기고 날리기)
                    ; - 빅 엔디안 : 숫자 비교에 유리함. ex) 0x12345678 < 0x45123411
    

    ; 초기화 되지 않은 데이터
    ; 변수이름 크기 개수
    ; 크기 resb(1) resw(2) resd(4) resq(8)
section .bss
    e resb 10
    
    
    
    
    
    
    
    