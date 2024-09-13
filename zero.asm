.data
aInt: .word 0
bInt: .word 0
result: .word 0
getA: .asciiz "Enter the first integer: "
getB: .asciiz "Enter the second integer: "
errorMsg: .asciiz "Error, cannot divide by 0."

.text
.globl main
main:
#get the a, the first integer
li $v0, 4
la $a0, getA
syscall

li $v0, 5
syscall
la $t0, aInt
sw $v0, 0($t0) #first integer is stored at address of variable a

#get b, the second integer
li $v0, 4
la $a0, getB
syscall

li $v0, 5
syscall
la $t1, bInt
sw $v0, 0($t1) #second integer is stored at address of variable b

#check if b==0
lw $t2, 0($t0) #a
lw $t3, 0($t1) #b
beq $t3, $zero, ERROR

#if b !=0 proceed with integer division, quotient stored $lo
div $t2, $t3
la $t4, result
mflo $t5
sw $t5, 0($t4)
#print result
li $v0, 1
lw $a0, result
syscall
#exit
li $v0, 10
syscall

ERROR:
#division by 0, display error and exit
li $v0, 4
la $a0, errorMsg
syscall
#exit
li $v0, 10
syscall