	.data
	.balign 4
format: .asciz " %d"
format2: .asciz " %c"
num1: .int 0
num2: .int 0
result: .int 0
op: .byte 'a'
input1: .asciz "Enter the first operand:\n"
inputO: .asciz "Enter the operation to be performed (+, -, *, /):\n"
input2: .asciz "Enter the second operand:\n"
output: .asciz "\nThe result of %d %c %d is: %d\n"
outTest: .asciz "The operator is %c\n"

.text
.global main
.extern printf
.extern scanf

main:
	push {ip, lr}

	ldr r0, =input1
	bl printf

	ldr r0, =format
	ldr r1, =num1
	bl scanf

	ldr r0, =inputO
	bl printf

	ldr r0, =format2
	ldr r1, =op
	bl scanf

	ldr r0, =outTest
	ldr r1, =op
	ldr r1, [r1]
	bl printf

	ldr r0, =input2
	bl printf

	ldr r0, =format
	ldr r1, =num2
	bl scanf

	ldr r1, =num1
	ldr r1, [r1]
	ldr r2, =num2
	ldr r2, [r2]
	ldr r3, =op
	ldr r3, [r3]

	cmp r3, #0x2B
	addeq r0, r1, r2

	cmp r3, #0x2D
	subeq r0, r1, r2

	cmp r3, #0x2A
	muleq r0, r1, r2

	cmp r3, #0x2F
	sdiveq r0, r1, r2

	ldr r1, =result
	str r0, [r1]

	ldr r1, =num1
	ldr r1, [r1]
	ldr r2, =num2
	ldr r2, [r2]
	ldr r3, =op
	ldr r3, [r3]
	ldr r4, =result
	ldr r4, [r2]
	ldr r0, =output
	bl printf

	pop {ip, pc}