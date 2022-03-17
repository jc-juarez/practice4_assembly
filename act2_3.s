	.data
	.balign 4
format: .asciz "%d"
num1: .int 0
num2: .int 0
num3: .int 0
input1: .asciz "\nEnter the first operand:\n"
input2: .asciz "\nEnter the second operand:\n"
output: .asciz "\nThe result of %d + %d is: %d\n"

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

	ldr r0, =input2
	bl printf

	ldr r0, =format
	ldr r1, =num2
	bl scanf

	ldr r1, =num1
	ldr r1, [r1]
	ldr r2, =num2
	ldr r2, [r2]
	add r0, r1, r2
	ldr r1, =num3
	str r0, [r1]

	ldr r1, =num1
	ldr r1, [r1]
	ldr r2, =num2
	ldr r2, [r2]
	ldr r3, =num3
	ldr r3, [r3]
	ldr r0, =output
	bl printf

	pop {ip, pc}