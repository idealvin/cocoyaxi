TB_CONTEXT_SJLJ_BYTES EQU 0

    AREA |.text|, CODE, READONLY

    EXPORT tb_context_make
tb_context_make PROC
    add x0, x0, x1
    and x0, x0, #~15
    sub x0, x0, #112
    str x2, [x0, #96]
    adr x1, __end
    str x1, [x0, #88]
    ret

__end
    mov x0, #0
    ; Instead of calling ExitProcess, we'll just return
    ret

    ENDP

    EXPORT tb_context_jump
tb_context_jump PROC
    sub sp, sp, #112
    stp x19, x20, [sp, #0]
    stp x21, x22, [sp, #16]
    stp x23, x24, [sp, #32]
    stp x25, x26, [sp, #48]
    stp x27, x28, [sp, #64]
    stp x29, x30, [sp, #80]
    str x30, [sp, #96]
    mov x9, sp
    mov sp, x0
    ldp x19, x20, [sp, #0]
    ldp x21, x22, [sp, #16]
    ldp x23, x24, [sp, #32]
    ldp x25, x26, [sp, #48]
    ldp x27, x28, [sp, #64]
    ldp x29, x30, [sp, #80]
    ldr x4, [sp, #96]
    add sp, sp, #112
    mov x0, x9
    br x4

    ENDP

    END