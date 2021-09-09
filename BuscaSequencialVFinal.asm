.data
	array1: .space 40	
	primeiro: .asciiz "Informe o valor do primeiro numero: "	
	segundo: .asciiz "Informe o valor do segundo numero: "		
	terceiro: .asciiz "Informe o valor do terceiro numero: "	
	quarto: .asciiz "Informe o valor do quarto numero: "		
	quinto: .asciiz "Informe o valor do quinto numero: "		
	sexto: .asciiz "Informe o valor do sexto numero: "		
	setimo: .asciiz "Informe o valor do setimo numero: "		
	oitavo: .asciiz "Informe o valor do oitavo numero: "		
	nono: .asciiz "Informe o valor do nono numero: "		
	decimo: .asciiz "Informe o valor do decimo numero: "		
	
	pesquisa: .asciiz "\nInforme o numero que voce deseja procurar: "  
	
	encontrado: .asciiz "\nO numero digitado esta no vetor !\n"		
	naoEncontrado: .asciiz "\nO numero digitado nao esta no vetor !\n"  
	posEncontrado: .asciiz "A posicao do numero digitado e: "

.text 
	la $t0, array1        
	
	li $v0, 4                             
	la $a0, primeiro                     
	syscall                               
	li $v0, 5          	
	syscall            	
	move $t1, $v0      	
	sw $t1, ($t0)    	
	
	li $v0, 4          
	la $a0, segundo    
	syscall            
	li $v0, 5         
	syscall            
	move $t1, $v0      
	sw $t1, 4($t0)    
	
	li $v0, 4          
	la $a0, terceiro   
	syscall            
	li $v0, 5          
	syscall            
	move $t1, $v0      
	sw $t1, 8($t0)    
	
	li $v0, 4          
	la $a0, quarto     
	syscall            
	li $v0, 5          
	syscall            
	move $t1, $v0      
	sw $t1, 12($t0)     
	
	li $v0, 4          
	la $a0, quinto     
	syscall            
	li $v0, 5          
	syscall           
	move $t1, $v0      
	sw $t1, 16($t0)     
	
	li $v0, 4          
	la $a0, sexto  	   
	syscall           
	li $v0, 5          
	syscall            
	move $t1, $v0      
	sw $t1, 20($t0)    
	
	li $v0, 4          
	la $a0, setimo     
	syscall            
	li $v0, 5          
	syscall            
	move $t1, $v0     
	sw $t1, 24($t0)     
	
	li $v0, 4          
	la $a0, oitavo     
	syscall           
	li $v0, 5         
	syscall            
	move $t1, $v0      
	sw $t1, 28($t0)      
	
	li $v0, 4          
	la $a0, nono   	   
	syscall           
	li $v0, 5          
	syscall            
	move $t1, $v0      
	sw $t1, 32($t0)     
	
	li $v0, 4         
	la $a0, decimo     
	syscall            
	li $v0, 5          
	syscall           
	move $t1, $v0     
	sw $t1, 36($t0)     
	
	li $v0, 4          
	la $a0, pesquisa   
	syscall            
	li $v0, 5          
	syscall            
	move $t9, $v0      
	
	li $t1, 0		

	Loop:
	beq $t1, 36, Exit1		
	lw $t4, array1($t1)		
	beq $t9, $t4, Exit2		
	addi $t1, $t1, 4		
	j Loop				
	Exit1:
	lw $t4, array1($t1)		 
	beq $t9, $t4, Exit2		
	li $t8, 0			
	j Exit3
	Exit2:
	li $t8, 1			
	j Exit3
	
	Exit3:
	bne $t8, $zero, Else		
	li $v0, 4          		
	la $a0, naoEncontrado   	
	syscall            		
	j Fim
	Else:
	li $v0, 4          		
	la $a0, encontrado   		
	syscall            		
	li $v0, 4               	
	la $a0, posEncontrado  		
	syscall                		
	li $v0, 1               	
	move $a0, $t1          	 	
	addi $t3, $t3, 4        	
	div $a0, $t3            	
	mflo $a0                	
	addi $a0, $a0, 1
	syscall                 	
	Fim:
