.data
value: .word 0
getValue: .asciiz "Enter an integer: "
even: .asciiz "EVEN"
odd: .asciiz "ODD"

.text
.globl main
main:
#ask user to enter an integer
li $v0, 4
la $a0, getValue
syscall

li $v0, 5
syscall
#store int to value variable
la $t0, value
sw $v0, 0($t0) #integer is now stored at memory address of value

#Determine even or odd
lw $t1, 0($t0)
andi $t2, $t1, 1
beq $t2, $zero, isEven
#if branch does not execute then odd
li $v0, 4
la $a0, odd
syscall
#exit
li $v0, 10
syscall

isEven:
li $v0, 4
la $a0, even
syscall
#exit
li $v0, 10
syscall
