.data
a:  .word 120
b:  .word 45

.text
.global _start

_start:
    // Load values a and b into registers
    ldr x0, =a
    ldr x1, [x0]  // a = 120
    ldr x0, =b
    ldr x2, [x0]  // b = 45

gcd_loop:
    // Compare a and b
    cmp x1, x2

    // If a == b, exit the loop
    beq gcd_done

    // If a > b, subtract b from a
    b.gt a_greater
    sub x1, x1, x2
    b gcd_loop

a_greater:
    sub x2, x2, x1
    b gcd_loop

gcd_done:
    // x1 now contains the GCD
    mov x0, x1

    // Exit the program
    mov x8, 93       
    svc 0            
