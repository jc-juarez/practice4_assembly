	.data
	.balign 4
format: .asciz " %d"
@format2: .asciz " %c"
num1: .int 0
num2: .int 0
result: .int 0
op: .byte 'a'
input1: .asciz "Enter the first operand:\n"
inputO: .asciz "Enter the operation to be performed (+ is 1, - is 2, * is 3, / is 4):\n"
input2: .asciz "Enter the second operand:\n"
outputAdd: .asciz "\nThe result of %d + %d is: %d\n"
outputSub: .asciz "\nThe result of %d - %d is: %d\n"
outputMult: .asciz "\nThe result of %d * %d is: %d\n"
outputDiv: .asciz "\nThe result of %d / %d is: %d\n"
@outTest: .asciz "The operator is %c\n"

output1: .asciz "\nThe result of sum is: %d\n"

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

	ldr r0, =format
	ldr r1, =op
	bl scanf

	ldr r0, =input2
	bl printf

	ldr r0, =format
	ldr r1, =num2
	bl scanf

	ldr r3, =op
	ldr r3, [r3]

	cmp r3, #1
	beq addition

	cmp r3, #2
	beq substraction

	cmp r3, #3
	beq multiplication

	cmp r3, #4
	beq division

	b endResult

addition:
	ldr r1, =num1
	ldr r1, [r1]
	ldr r2, =num2
	ldr r2, [r2]
	add r0, r1, r2

	ldr r1, =result
	str r0, [r1]

	ldr r0, =outputAdd
	ldr r1, =num1
	ldr r1, [r1]
	ldr r2, =num2
	ldr r2, [r2]
	ldr r3, =result
	ldr r3, [r3]
	bl printf

	b endResult

substraction:
	ldr r1, =num1
	ldr r1, [r1]
	ldr r2, =num2
	ldr r2, [r2]
	sub r0, r1, r2

	ldr r1, =result
	str r0, [r1]

	ldr r0, =outputSub
	ldr r1, =num1
	ldr r1, [r1]
	ldr r2, =num2
	ldr r2, [r2]
	ldr r3, =result
	ldr r3, [r3]
	bl printf

	b endResult

multiplication:
	ldr r1, =num1
	ldr r1, [r1]
	ldr r2, =num2
	ldr r2, [r2]
	mul r0, r1, r2

	ldr r1, =result
	str r0, [r1]

	ldr r0, =outputMult
	ldr r1, =num1
	ldr r1, [r1]
	ldr r2, =num2
	ldr r2, [r2]
	ldr r3, =result
	ldr r3, [r3]
	bl printf

	b endResult

division:
	ldr r1, =num1
	ldr r1, [r1]
	ldr r2, =num2
	ldr r2, [r2]
	sdiveq r0, r1, r2

	ldr r1, =result
	str r0, [r1]

	ldr r0, =outputDiv
	ldr r1, =num1
	ldr r1, [r1]
	ldr r2, =num2
	ldr r2, [r2]
	ldr r3, =result
	ldr r3, [r3]
	bl printf

	b endResult

endResult:
	

	pop {ip, pc}
