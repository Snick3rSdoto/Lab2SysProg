	.file	"lab2_workload.cpp"
	.text
#APP
	.globl _ZSt21ios_base_library_initv
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"cannot create std::vector larger than max_size()"
#NO_APP
	.text
	.p2align 4
	.globl	_Z12run_workloadmi
	.type	_Z12run_workloadmi, @function
_Z12run_workloadmi:
.LFB3297:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdi, %rax
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	shrq	$60, %rax
	jne	.L39
	movq	%rdi, %r12
	movl	%esi, %r13d
	testq	%rdi, %rdi
	je	.L40
	leaq	0(,%rdi,8), %r14
	movq	%r14, %rdi
	movq	%r14, %rbx
	call	_Znwm@PLT
	movq	$0x000000000, (%rax)
	movq	%rax, %rbp
	cmpq	$1, %r12
	je	.L6
	leaq	8(%rax), %rdi
	leaq	(%rax,%r14), %rax
	cmpq	%rax, %rdi
	je	.L7
	leaq	-8(%r14), %rdx
	xorl	%esi, %esi
	call	memset@PLT
.L7:
	vmovsd	.LC2(%rip), %xmm2
	vmovsd	.LC3(%rip), %xmm1
	vxorps	%xmm3, %xmm3, %xmm3
	xorl	%ecx, %ecx
	movabsq	$2361183241434822607, %rsi
	.p2align 4,,10
	.p2align 3
.L8:
	movq	%rcx, %rdx
	shrq	$3, %rdx
	movq	%rdx, %rax
	mulq	%rsi
	movq	%rcx, %rax
	shrq	$4, %rdx
	imulq	$1000, %rdx, %rdx
	subq	%rdx, %rax
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	vdivsd	%xmm2, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 0(%rbp,%rcx,8)
	incq	%rcx
	cmpq	%rcx, %r12
	jne	.L8
.L19:
	testl	%r13d, %r13d
	jle	.L9
.L4:
	leaq	0(%rbp,%r14), %rdx
	xorl	%ecx, %ecx
	testq	%r12, %r12
	je	.L34
	vmovsd	.LC4(%rip), %xmm2
	vmovsd	.LC5(%rip), %xmm1
	.p2align 4,,10
	.p2align 3
.L12:
	movq	%rbp, %rax
	.p2align 4,,10
	.p2align 3
.L11:
	vmovsd	%xmm2, %xmm2, %xmm0
	addq	$8, %rax
	vfmadd132sd	-8(%rax), %xmm1, %xmm0
	vmovsd	%xmm0, -8(%rax)
	cmpq	%rax, %rdx
	jne	.L11
	incl	%ecx
	cmpl	%ecx, %r13d
	jg	.L12
	testq	%r12, %r12
	je	.L21
.L9:
	leaq	0(%rbp,%r14), %rdx
	andl	$8, %r14d
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	%rbp, %rax
	je	.L16
	leaq	8(%rbp), %rax
	vaddsd	0(%rbp), %xmm0, %xmm0
	cmpq	%rdx, %rax
	je	.L15
	.p2align 4,,10
	.p2align 3
.L16:
	vaddsd	(%rax), %xmm0, %xmm0
	addq	$16, %rax
	vaddsd	-8(%rax), %xmm0, %xmm0
	cmpq	%rdx, %rax
	jne	.L16
.L15:
	testq	%rbp, %rbp
	je	.L1
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	vmovsd	%xmm0, 8(%rsp)
	call	_ZdlPvm@PLT
	vmovsd	8(%rsp), %xmm0
.L1:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L34:
	.cfi_restore_state
	incl	%ecx
	cmpl	%ecx, %r13d
	jg	.L34
.L21:
	vxorpd	%xmm0, %xmm0, %xmm0
	jmp	.L15
.L40:
	xorl	%ebx, %ebx
	xorl	%ebp, %ebp
	vxorpd	%xmm0, %xmm0, %xmm0
	xorl	%r14d, %r14d
	testl	%esi, %esi
	jg	.L4
	jmp	.L1
.L6:
	movq	.LC3(%rip), %rax
	movl	$8, %ebx
	movq	%rax, 0(%rbp)
	jmp	.L19
.L39:
	leaq	.LC1(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
	.cfi_endproc
.LFE3297:
	.size	_Z12run_workloadmi, .-_Z12run_workloadmi
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC6:
	.string	"Invalid array size: "
.LC7:
	.string	"Invalid iteration count: "
.LC8:
	.string	"Array size: "
.LC9:
	.string	"Iterations: "
.LC10:
	.string	"Checksum: "
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3298:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L51
	xorl	%edx, %edx
	movq	%rsi, %rbx
	leaq	16(%rsp), %r15
	movl	%edi, %ebp
	movq	%rdx, 16(%rsp)
	call	__errno_location@PLT
	xorl	%ecx, %ecx
	movq	8(%rbx), %rdi
	movl	$10, %edx
	movl	%ecx, (%rax)
	movq	%rax, %r13
	movq	%r15, %rsi
	call	__isoc23_strtoull@PLT
	cmpl	$0, 0(%r13)
	movq	%rax, %r12
	jne	.L43
	movq	16(%rsp), %rax
	cmpq	%rax, 8(%rbx)
	je	.L43
	cmpb	$0, (%rax)
	jne	.L43
	testq	%r12, %r12
	je	.L43
	movl	$1500, %r14d
	cmpl	$2, %ebp
	je	.L42
	movq	16(%rbx), %rdi
	xorl	%eax, %eax
	movl	$10, %edx
	movq	%r15, %rsi
	movq	%rax, 16(%rsp)
	call	__isoc23_strtol@PLT
	cmpl	$0, 0(%r13)
	jne	.L47
	movq	16(%rsp), %rdx
	cmpq	%rdx, 16(%rbx)
	je	.L47
	cmpb	$0, (%rdx)
	jne	.L47
	leaq	-1(%rax), %rdx
	movl	%eax, %r14d
	cmpq	$2147483646, %rdx
	jbe	.L42
.L47:
	leaq	.LC7(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	16(%rbx), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$10, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c@PLT
	jmp	.L46
.L43:
	leaq	.LC6(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	8(%rbx), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$10, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c@PLT
.L46:
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L41:
	movq	24(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L55
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L51:
	.cfi_restore_state
	movl	$262144, %r12d
	movl	$1500, %r14d
.L42:
	leaq	_ZSt4cout(%rip), %rbx
	leaq	.LC8(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%r12, %rsi
	movq	%rax, %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movl	$10, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c@PLT
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	%r14d, %esi
	movq	%rax, %rdi
	call	_ZNSolsEi@PLT
	movl	$10, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c@PLT
	movl	%r14d, %esi
	movq	%r12, %rdi
	call	_Z12run_workloadmi
	movq	_ZSt4cout(%rip), %rax
	leaq	.LC10(%rip), %rsi
	movq	%rbx, %rdi
	vmovsd	%xmm0, 8(%rsp)
	movq	-24(%rax), %rax
	movq	$15, 8(%rbx,%rax)
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	vmovsd	8(%rsp), %xmm0
	movq	%rax, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movl	$10, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c@PLT
	xorl	%eax, %eax
	jmp	.L41
.L55:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE3298:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1083129856
	.align 8
.LC3:
	.long	0
	.long	1071644672
	.align 8
.LC4:
	.long	450359963
	.long	1072693248
	.align 8
.LC5:
	.long	-200440970
	.long	1049895413
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
