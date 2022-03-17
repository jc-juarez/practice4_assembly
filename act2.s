@ Team 2

.data
.balign 4
string: .asciz "\ny1 = %d\n"
string2: .asciz "\ny2 = %d\n"
string3: .asciz "\ny3 = %d\n"
stringAddress: .asciz "\n'y' address is: %d\n\n"

y: .word 0
a: .word 0xAAAAAAAA
b: .word 0xBBBBBBBB
c: .word 0xCCCCCCCC

.text
.global main
.extern printf

printValue:
	push {ip, lr}
	ldr r0, =string2
	bl printf
	ldr r2, =y
	str r1, [r2]
	pop {ip, pc}

printWithAddress:
	push {ip, lr}
	ldr r1, [r1]
	ldr r0, =string3
	bl printf
	ldr r2, =y
	str r1, [r2]
	pop {ip, pc}

main:

	push {ip, lr}

	@ Part 1 - Inside Main Method

	ldr r1, =a
	ldr r1, [r1]
	ldr r2, =y
	str r1, [r2]

	ldr r0, =string
	ldr r1, [r2]
	bl printf


	@ Part 2 - Function with Values
	
	ldr r1, =b
	ldr r1, [r1]
	
	bl printValue

	@ Part 3 - Function with Address

	ldr r1, =c

	bl printWithAddress

	@ Print 'y' address
	ldr r1, =y
	ldr r0, =stringAddress
	bl printf
	
	pop {ip, pc}
