.data
x:  .word 6
y:  .word 5
ans:  .word 0

.text
.global _start

_start:
    // Load values 6 and 5 into registers
    ldr x0, =x
    ldr x1, [x0]  // x = 6
    ldr x0, =y
    ldr x2, [x0]  // y = 5

    // Initialize answer register to 0
    mov x3, 0  // ans = 0

multiply_loop:
    // Compare y and 0
    cmp x2, 0

    // If y == 0, exit the loop
    beq multiply_done

    // Add x to ans
    add x3, x3, x1

    // Decrement y
    sub x2, x2, 1

    // Continue the loop
    b multiply_loop

multiply_done:
    // x3 now contains the product of 6 and 5 (ans)
    // Exit the program
    mov x8, 93       
    svc 0           
