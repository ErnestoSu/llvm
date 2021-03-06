; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-- -mcpu=yonah | FileCheck %s

	%struct.S = type { <2 x i64>, <2 x i64>, <2 x i64>, <2 x i64>,
                           <2 x i64>, <2 x i64>, <2 x i64>, <2 x i64>,
                           <2 x i64> }

define i32 @main() nounwind  {
; CHECK-LABEL: main:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    pushl %ebp
; CHECK-NEXT:    movl %esp, %ebp
; CHECK-NEXT:    pushl %edi
; CHECK-NEXT:    pushl %esi
; CHECK-NEXT:    andl $-16, %esp
; CHECK-NEXT:    subl $304, %esp # imm = 0x130
; CHECK-NEXT:    movaps {{.*#+}} xmm0 = [3,2,1,0]
; CHECK-NEXT:    movaps %xmm0, {{[0-9]+}}(%esp)
; CHECK-NEXT:    leal {{[0-9]+}}(%esp), %edi
; CHECK-NEXT:    leal {{[0-9]+}}(%esp), %esi
; CHECK-NEXT:    movl $36, %ecx
; CHECK-NEXT:    rep;movsl (%esi), %es:(%edi)
; CHECK-NEXT:    movl $1, (%esp)
; CHECK-NEXT:    calll t
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    leal -8(%ebp), %esp
; CHECK-NEXT:    popl %esi
; CHECK-NEXT:    popl %edi
; CHECK-NEXT:    popl %ebp
; CHECK-NEXT:    retl
entry:
	%s = alloca %struct.S		; <%struct.S*> [#uses=2]
	%tmp15 = getelementptr %struct.S, %struct.S* %s, i32 0, i32 0		; <<2 x i64>*> [#uses=1]
	store <2 x i64> < i64 8589934595, i64 1 >, <2 x i64>* %tmp15, align 16
	call void @t( i32 1, %struct.S* byval(%struct.S) %s) nounwind
	ret i32 0
}

declare void @t(i32, %struct.S* byval(%struct.S))
