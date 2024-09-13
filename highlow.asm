.data
aInt: .word 0
bInt: .word 0
result: .word 0
getA: .asciiz "Enter the first integer: "
getB: .asciiz "Enter the second integer: "


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

lw $t0, aInt
lw $t1, bInt

sub $t2, $t0, $t1
bltz $t2, bIsLarger
bgez $t2, aIsLarger

bIsLarger:
li $v0, 1
lw $a0, bInt
syscall
j done

aIsLarger:
li $v0, 1
lw $a0, aInt
syscall
j done

done: 
li $v0, 10
syscall
