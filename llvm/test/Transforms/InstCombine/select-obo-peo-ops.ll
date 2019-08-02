; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -instcombine < %s | FileCheck %s

define i64 @test_shl_nuw_nsw__all_are_safe(i32 %x, i64 %y) {
; CHECK-LABEL: @test_shl_nuw_nsw__all_are_safe(
; CHECK-NEXT:    [[TMP1:%.*]] = shl i32 [[X:%.*]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], 60
; CHECK-NEXT:    [[TMP3:%.*]] = zext i32 [[TMP2]] to i64
; CHECK-NEXT:    [[TMP4:%.*]] = ashr i64 [[Y:%.*]], [[TMP3]]
; CHECK-NEXT:    ret i64 [[TMP4]]
;
  %1 = and i32 %x, 15
  %2 = shl nuw nsw i32 %1, 2
  %3 = zext i32 %2 to i64
  %4 = icmp eq i32 %1, 0
  %5 = ashr i64 %y, %3
  %6 = select i1 %4, i64 %y, i64 %5
  ret i64 %6
}

define i64 @test_shl_nuw__all_are_safe(i32 %x, i64 %y) {
; CHECK-LABEL: @test_shl_nuw__all_are_safe(
; CHECK-NEXT:    [[TMP1:%.*]] = shl i32 [[X:%.*]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], 60
; CHECK-NEXT:    [[TMP3:%.*]] = zext i32 [[TMP2]] to i64
; CHECK-NEXT:    [[TMP4:%.*]] = ashr i64 [[Y:%.*]], [[TMP3]]
; CHECK-NEXT:    ret i64 [[TMP4]]
;
  %1 = and i32 %x, 15
  %2 = shl nuw i32 %1, 2
  %3 = zext i32 %2 to i64
  %4 = icmp eq i32 %1, 0
  %5 = ashr i64 %y, %3
  %6 = select i1 %4, i64 %y, i64 %5
  ret i64 %6
}

define i64 @test_shl_nsw__all_are_safe(i32 %x, i64 %y) {
; CHECK-LABEL: @test_shl_nsw__all_are_safe(
; CHECK-NEXT:    [[TMP1:%.*]] = shl i32 [[X:%.*]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], 60
; CHECK-NEXT:    [[TMP3:%.*]] = zext i32 [[TMP2]] to i64
; CHECK-NEXT:    [[TMP4:%.*]] = ashr i64 [[Y:%.*]], [[TMP3]]
; CHECK-NEXT:    ret i64 [[TMP4]]
;
  %1 = and i32 %x, 15
  %2 = shl nsw i32 %1, 2
  %3 = zext i32 %2 to i64
  %4 = icmp eq i32 %1, 0
  %5 = ashr i64 %y, %3
  %6 = select i1 %4, i64 %y, i64 %5
  ret i64 %6
}

define i64 @test_shl__all_are_safe(i32 %x, i64 %y) {
; CHECK-LABEL: @test_shl__all_are_safe(
; CHECK-NEXT:    [[TMP1:%.*]] = shl i32 [[X:%.*]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], 60
; CHECK-NEXT:    [[TMP3:%.*]] = zext i32 [[TMP2]] to i64
; CHECK-NEXT:    [[TMP4:%.*]] = ashr i64 [[Y:%.*]], [[TMP3]]
; CHECK-NEXT:    ret i64 [[TMP4]]
;
  %1 = and i32 %x, 15
  %2 = shl i32 %1, 2
  %3 = zext i32 %2 to i64
  %4 = icmp eq i32 %1, 0
  %5 = ashr i64 %y, %3
  %6 = select i1 %4, i64 %y, i64 %5
  ret i64 %6
}

define i64 @test_shl_nuw_nsw__nuw_is_safe(i32 %x, i64 %y) {
; CHECK-LABEL: @test_shl_nuw_nsw__nuw_is_safe(
; CHECK-NEXT:    [[TMP1:%.*]] = shl i32 [[X:%.*]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], -8
; CHECK-NEXT:    [[TMP3:%.*]] = zext i32 [[TMP2]] to i64
; CHECK-NEXT:    [[TMP4:%.*]] = ashr i64 [[Y:%.*]], [[TMP3]]
; CHECK-NEXT:    ret i64 [[TMP4]]
;
  %1 = and i32 %x, 1073741822
  %2 = shl nuw nsw i32 %1, 2
  %3 = zext i32 %2 to i64
  %4 = icmp eq i32 %1, 0
  %5 = ashr i64 %y, %3
  %6 = select i1 %4, i64 %y, i64 %5
  ret i64 %6
}

define i64 @test_shl_nuw__nuw_is_safe(i32 %x, i64 %y) {
; CHECK-LABEL: @test_shl_nuw__nuw_is_safe(
; CHECK-NEXT:    [[TMP1:%.*]] = shl i32 [[X:%.*]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], -8
; CHECK-NEXT:    [[TMP3:%.*]] = zext i32 [[TMP2]] to i64
; CHECK-NEXT:    [[TMP4:%.*]] = ashr i64 [[Y:%.*]], [[TMP3]]
; CHECK-NEXT:    ret i64 [[TMP4]]
;
  %1 = and i32 %x, 1073741822
  %2 = shl nuw i32 %1, 2
  %3 = zext i32 %2 to i64
  %4 = icmp eq i32 %1, 0
  %5 = ashr i64 %y, %3
  %6 = select i1 %4, i64 %y, i64 %5
  ret i64 %6
}

define i64 @test_shl_nsw__nuw_is_safe(i32 %x, i64 %y) {
; CHECK-LABEL: @test_shl_nsw__nuw_is_safe(
; CHECK-NEXT:    [[TMP1:%.*]] = shl i32 [[X:%.*]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], -8
; CHECK-NEXT:    [[TMP3:%.*]] = zext i32 [[TMP2]] to i64
; CHECK-NEXT:    [[TMP4:%.*]] = ashr i64 [[Y:%.*]], [[TMP3]]
; CHECK-NEXT:    ret i64 [[TMP4]]
;
  %1 = and i32 %x, 1073741822
  %2 = shl nsw i32 %1, 2
  %3 = zext i32 %2 to i64
  %4 = icmp eq i32 %1, 0
  %5 = ashr i64 %y, %3
  %6 = select i1 %4, i64 %y, i64 %5
  ret i64 %6
}

define i64 @test_shl__nuw_is_safe(i32 %x, i64 %y) {
; CHECK-LABEL: @test_shl__nuw_is_safe(
; CHECK-NEXT:    [[TMP1:%.*]] = shl i32 [[X:%.*]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], -8
; CHECK-NEXT:    [[TMP3:%.*]] = zext i32 [[TMP2]] to i64
; CHECK-NEXT:    [[TMP4:%.*]] = ashr i64 [[Y:%.*]], [[TMP3]]
; CHECK-NEXT:    ret i64 [[TMP4]]
;
  %1 = and i32 %x, 1073741822
  %2 = shl i32 %1, 2
  %3 = zext i32 %2 to i64
  %4 = icmp eq i32 %1, 0
  %5 = ashr i64 %y, %3
  %6 = select i1 %4, i64 %y, i64 %5
  ret i64 %6
}

define i32 @test_shl_nuw_nsw__nsw_is_safe(i32 %x) {
; CHECK-LABEL: @test_shl_nuw_nsw__nsw_is_safe(
; CHECK-NEXT:    [[TMP1:%.*]] = or i32 [[X:%.*]], -83886080
; CHECK-NEXT:    [[TMP2:%.*]] = shl nsw i32 [[TMP1]], 2
; CHECK-NEXT:    [[TMP3:%.*]] = mul i32 [[TMP2]], [[TMP1]]
; CHECK-NEXT:    [[TMP4:%.*]] = mul i32 [[TMP3]], [[TMP2]]
; CHECK-NEXT:    ret i32 [[TMP4]]
;
  %1 = or i32 %x, -83886080
  %2 = icmp eq i32 %1, -83886079
  %3 = shl nuw nsw i32 %1, 2
  %4 = select i1 %2, i32 -335544316, i32 %3
  %5 = mul i32 %4, %1
  %6 = mul i32 %5, %3
  ret i32 %6
}

define i32 @test_shl_nuw__nsw_is_safe(i32 %x) {
; CHECK-LABEL: @test_shl_nuw__nsw_is_safe(
; CHECK-NEXT:    [[TMP1:%.*]] = or i32 [[X:%.*]], -83886080
; CHECK-NEXT:    [[TMP2:%.*]] = shl nsw i32 [[TMP1]], 2
; CHECK-NEXT:    [[TMP3:%.*]] = mul i32 [[TMP2]], [[TMP1]]
; CHECK-NEXT:    [[TMP4:%.*]] = mul i32 [[TMP3]], [[TMP2]]
; CHECK-NEXT:    ret i32 [[TMP4]]
;
  %1 = or i32 %x, -83886080
  %2 = icmp eq i32 %1, -83886079
  %3 = shl nuw i32 %1, 2
  %4 = select i1 %2, i32 -335544316, i32 %3
  %5 = mul i32 %4, %1
  %6 = mul i32 %5, %3
  ret i32 %6
}

define i32 @test_shl_nsw__nsw_is_safe(i32 %x) {
; CHECK-LABEL: @test_shl_nsw__nsw_is_safe(
; CHECK-NEXT:    [[TMP1:%.*]] = or i32 [[X:%.*]], -83886080
; CHECK-NEXT:    [[TMP2:%.*]] = shl nsw i32 [[TMP1]], 2
; CHECK-NEXT:    [[TMP3:%.*]] = mul i32 [[TMP2]], [[TMP1]]
; CHECK-NEXT:    [[TMP4:%.*]] = mul i32 [[TMP3]], [[TMP2]]
; CHECK-NEXT:    ret i32 [[TMP4]]
;
  %1 = or i32 %x, -83886080
  %2 = icmp eq i32 %1, -83886079
  %3 = shl nsw i32 %1, 2
  %4 = select i1 %2, i32 -335544316, i32 %3
  %5 = mul i32 %4, %1
  %6 = mul i32 %5, %3
  ret i32 %6
}

define i32 @test_shl__nsw_is_safe(i32 %x) {
; CHECK-LABEL: @test_shl__nsw_is_safe(
; CHECK-NEXT:    [[TMP1:%.*]] = or i32 [[X:%.*]], -83886080
; CHECK-NEXT:    [[TMP2:%.*]] = shl nsw i32 [[TMP1]], 2
; CHECK-NEXT:    [[TMP3:%.*]] = mul i32 [[TMP2]], [[TMP1]]
; CHECK-NEXT:    [[TMP4:%.*]] = mul i32 [[TMP3]], [[TMP2]]
; CHECK-NEXT:    ret i32 [[TMP4]]
;
  %1 = or i32 %x, -83886080
  %2 = icmp eq i32 %1, -83886079
  %3 = shl i32 %1, 2
  %4 = select i1 %2, i32 -335544316, i32 %3
  %5 = mul i32 %4, %1
  %6 = mul i32 %5, %3
  ret i32 %6
}


define i64 @test_shl_nuw_nsw__none_are_safe(i32 %x, i64 %y) {
; CHECK-LABEL: @test_shl_nuw_nsw__none_are_safe(
; CHECK-NEXT:    [[TMP1:%.*]] = shl i32 [[X:%.*]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], -8
; CHECK-NEXT:    [[TMP3:%.*]] = zext i32 [[TMP2]] to i64
; CHECK-NEXT:    [[TMP4:%.*]] = ashr i64 [[Y:%.*]], [[TMP3]]
; CHECK-NEXT:    ret i64 [[TMP4]]
;
  %1 = and i32 %x, 4294967294
  %2 = shl nuw nsw i32 %1, 2
  %3 = zext i32 %2 to i64
  %4 = icmp eq i32 %1, 0
  %5 = ashr i64 %y, %3
  %6 = select i1 %4, i64 %y, i64 %5
  ret i64 %6
}

define i64 @test_shl_nuw__none_are_safe(i32 %x, i64 %y) {
; CHECK-LABEL: @test_shl_nuw__none_are_safe(
; CHECK-NEXT:    [[TMP1:%.*]] = shl i32 [[X:%.*]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], -8
; CHECK-NEXT:    [[TMP3:%.*]] = zext i32 [[TMP2]] to i64
; CHECK-NEXT:    [[TMP4:%.*]] = ashr i64 [[Y:%.*]], [[TMP3]]
; CHECK-NEXT:    ret i64 [[TMP4]]
;
  %1 = and i32 %x, 4294967294
  %2 = shl nuw i32 %1, 2
  %3 = zext i32 %2 to i64
  %4 = icmp eq i32 %1, 0
  %5 = ashr i64 %y, %3
  %6 = select i1 %4, i64 %y, i64 %5
  ret i64 %6
}

define i64 @test_shl_nsw__none_are_safe(i32 %x, i64 %y) {
; CHECK-LABEL: @test_shl_nsw__none_are_safe(
; CHECK-NEXT:    [[TMP1:%.*]] = shl i32 [[X:%.*]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], -8
; CHECK-NEXT:    [[TMP3:%.*]] = zext i32 [[TMP2]] to i64
; CHECK-NEXT:    [[TMP4:%.*]] = ashr i64 [[Y:%.*]], [[TMP3]]
; CHECK-NEXT:    ret i64 [[TMP4]]
;
  %1 = and i32 %x, 4294967294
  %2 = shl nsw i32 %1, 2
  %3 = zext i32 %2 to i64
  %4 = icmp eq i32 %1, 0
  %5 = ashr i64 %y, %3
  %6 = select i1 %4, i64 %y, i64 %5
  ret i64 %6
}

define i64 @test_shl__none_are_safe(i32 %x, i64 %y) {
; CHECK-LABEL: @test_shl__none_are_safe(
; CHECK-NEXT:    [[TMP1:%.*]] = shl i32 [[X:%.*]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], -8
; CHECK-NEXT:    [[TMP3:%.*]] = zext i32 [[TMP2]] to i64
; CHECK-NEXT:    [[TMP4:%.*]] = ashr i64 [[Y:%.*]], [[TMP3]]
; CHECK-NEXT:    ret i64 [[TMP4]]
;
  %1 = and i32 %x, 4294967294
  %2 = shl i32 %1, 2
  %3 = zext i32 %2 to i64
  %4 = icmp eq i32 %1, 0
  %5 = ashr i64 %y, %3
  %6 = select i1 %4, i64 %y, i64 %5
  ret i64 %6
}

define i64 @test_lshr_exact__exact_is_safe(i32 %x, i64 %y) {
; CHECK-LABEL: @test_lshr_exact__exact_is_safe(
; CHECK-NEXT:    [[TMP1:%.*]] = lshr i32 [[X:%.*]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], 15
; CHECK-NEXT:    [[TMP3:%.*]] = zext i32 [[TMP2]] to i64
; CHECK-NEXT:    [[TMP4:%.*]] = ashr i64 [[Y:%.*]], [[TMP3]]
; CHECK-NEXT:    ret i64 [[TMP4]]
;
  %1 = and i32 %x, 60
  %2 = lshr exact i32 %1, 2
  %3 = zext i32 %2 to i64
  %4 = icmp eq i32 %1, 0
  %5 = ashr i64 %y, %3
  %6 = select i1 %4, i64 %y, i64 %5
  ret i64 %6
}

define i64 @test_lshr__exact_is_safe(i32 %x, i64 %y) {
; CHECK-LABEL: @test_lshr__exact_is_safe(
; CHECK-NEXT:    [[TMP1:%.*]] = lshr i32 [[X:%.*]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], 15
; CHECK-NEXT:    [[TMP3:%.*]] = zext i32 [[TMP2]] to i64
; CHECK-NEXT:    [[TMP4:%.*]] = ashr i64 [[Y:%.*]], [[TMP3]]
; CHECK-NEXT:    ret i64 [[TMP4]]
;
  %1 = and i32 %x, 60
  %2 = lshr i32 %1, 2
  %3 = zext i32 %2 to i64
  %4 = icmp eq i32 %1, 0
  %5 = ashr i64 %y, %3
  %6 = select i1 %4, i64 %y, i64 %5
  ret i64 %6
}

define i64 @test_lshr_exact__exact_is_unsafe(i32 %x, i64 %y) {
; CHECK-LABEL: @test_lshr_exact__exact_is_unsafe(
; CHECK-NEXT:    [[TMP1:%.*]] = lshr i32 [[X:%.*]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], 15
; CHECK-NEXT:    [[TMP3:%.*]] = zext i32 [[TMP2]] to i64
; CHECK-NEXT:    [[TMP4:%.*]] = ashr i64 [[Y:%.*]], [[TMP3]]
; CHECK-NEXT:    ret i64 [[TMP4]]
;
  %1 = and i32 %x, 63
  %2 = lshr exact i32 %1, 2
  %3 = zext i32 %2 to i64
  %4 = icmp eq i32 %1, 0
  %5 = ashr i64 %y, %3
  %6 = select i1 %4, i64 %y, i64 %5
  ret i64 %6
}

define i64 @test_lshr__exact_is_unsafe(i32 %x, i64 %y) {
; CHECK-LABEL: @test_lshr__exact_is_unsafe(
; CHECK-NEXT:    [[TMP1:%.*]] = lshr i32 [[X:%.*]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], 15
; CHECK-NEXT:    [[TMP3:%.*]] = zext i32 [[TMP2]] to i64
; CHECK-NEXT:    [[TMP4:%.*]] = ashr i64 [[Y:%.*]], [[TMP3]]
; CHECK-NEXT:    ret i64 [[TMP4]]
;
  %1 = and i32 %x, 63
  %2 = lshr i32 %1, 2
  %3 = zext i32 %2 to i64
  %4 = icmp eq i32 %1, 0
  %5 = ashr i64 %y, %3
  %6 = select i1 %4, i64 %y, i64 %5
  ret i64 %6
}

define i64 @test_ashr_exact__exact_is_safe(i32 %x, i64 %y) {
; CHECK-LABEL: @test_ashr_exact__exact_is_safe(
; CHECK-NEXT:    [[TMP1:%.*]] = ashr i32 [[X:%.*]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], -536870897
; CHECK-NEXT:    [[TMP3:%.*]] = zext i32 [[TMP2]] to i64
; CHECK-NEXT:    [[TMP4:%.*]] = ashr i64 [[Y:%.*]], [[TMP3]]
; CHECK-NEXT:    ret i64 [[TMP4]]
;
  %1 = and i32 %x, -2147483588
  %2 = ashr exact i32 %1, 2
  %3 = zext i32 %2 to i64
  %4 = icmp eq i32 %1, 0
  %5 = ashr i64 %y, %3
  %6 = select i1 %4, i64 %y, i64 %5
  ret i64 %6
}

define i64 @test_ashr__exact_is_safe(i32 %x, i64 %y) {
; CHECK-LABEL: @test_ashr__exact_is_safe(
; CHECK-NEXT:    [[TMP1:%.*]] = ashr i32 [[X:%.*]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], -536870897
; CHECK-NEXT:    [[TMP3:%.*]] = zext i32 [[TMP2]] to i64
; CHECK-NEXT:    [[TMP4:%.*]] = ashr i64 [[Y:%.*]], [[TMP3]]
; CHECK-NEXT:    ret i64 [[TMP4]]
;
  %1 = and i32 %x, -2147483588
  %2 = ashr i32 %1, 2
  %3 = zext i32 %2 to i64
  %4 = icmp eq i32 %1, 0
  %5 = ashr i64 %y, %3
  %6 = select i1 %4, i64 %y, i64 %5
  ret i64 %6
}

define i64 @test_ashr_exact__exact_is_unsafe(i32 %x, i64 %y) {
; CHECK-LABEL: @test_ashr_exact__exact_is_unsafe(
; CHECK-NEXT:    [[TMP1:%.*]] = ashr i32 [[X:%.*]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], -536870897
; CHECK-NEXT:    [[TMP3:%.*]] = zext i32 [[TMP2]] to i64
; CHECK-NEXT:    [[TMP4:%.*]] = ashr i64 [[Y:%.*]], [[TMP3]]
; CHECK-NEXT:    ret i64 [[TMP4]]
;
  %1 = and i32 %x, -2147483585
  %2 = ashr exact i32 %1, 2
  %3 = zext i32 %2 to i64
  %4 = icmp eq i32 %1, 0
  %5 = ashr i64 %y, %3
  %6 = select i1 %4, i64 %y, i64 %5
  ret i64 %6
}

define i64 @test_ashr__exact_is_unsafe(i32 %x, i64 %y) {
; CHECK-LABEL: @test_ashr__exact_is_unsafe(
; CHECK-NEXT:    [[TMP1:%.*]] = ashr i32 [[X:%.*]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], -536870897
; CHECK-NEXT:    [[TMP3:%.*]] = zext i32 [[TMP2]] to i64
; CHECK-NEXT:    [[TMP4:%.*]] = ashr i64 [[Y:%.*]], [[TMP3]]
; CHECK-NEXT:    ret i64 [[TMP4]]
;
  %1 = and i32 %x, -2147483585
  %2 = ashr i32 %1, 2
  %3 = zext i32 %2 to i64
  %4 = icmp eq i32 %1, 0
  %5 = ashr i64 %y, %3
  %6 = select i1 %4, i64 %y, i64 %5
  ret i64 %6
}

define i32 @test_add_nuw_nsw__all_are_safe(i32 %x) {
; CHECK-LABEL: @test_add_nuw_nsw__all_are_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 1073741823
; CHECK-NEXT:    [[ADD:%.*]] = add nuw nsw i32 [[AND]], 1
; CHECK-NEXT:    ret i32 [[ADD]]
;
  %and = and i32 %x, 1073741823
  %cmp = icmp eq i32 %and, 3
  %add = add nuw nsw i32 %and, 1
  %sel = select i1 %cmp, i32 4, i32 %add
  ret i32 %sel
}

define i32 @test_add_nuw__all_are_safe(i32 %x) {
; CHECK-LABEL: @test_add_nuw__all_are_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 1073741823
; CHECK-NEXT:    [[ADD:%.*]] = add nuw nsw i32 [[AND]], 1
; CHECK-NEXT:    ret i32 [[ADD]]
;
  %and = and i32 %x, 1073741823
  %cmp = icmp eq i32 %and, 3
  %add = add nuw i32 %and, 1
  %sel = select i1 %cmp, i32 4, i32 %add
  ret i32 %sel
}

define i32 @test_add_nsw__all_are_safe(i32 %x) {
; CHECK-LABEL: @test_add_nsw__all_are_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 1073741823
; CHECK-NEXT:    [[ADD:%.*]] = add nuw nsw i32 [[AND]], 1
; CHECK-NEXT:    ret i32 [[ADD]]
;
  %and = and i32 %x, 1073741823
  %cmp = icmp eq i32 %and, 3
  %add = add nsw i32 %and, 1
  %sel = select i1 %cmp, i32 4, i32 %add
  ret i32 %sel
}

define i32 @test_add__all_are_safe(i32 %x) {
; CHECK-LABEL: @test_add__all_are_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 1073741823
; CHECK-NEXT:    [[ADD:%.*]] = add nuw nsw i32 [[AND]], 1
; CHECK-NEXT:    ret i32 [[ADD]]
;
  %and = and i32 %x, 1073741823
  %cmp = icmp eq i32 %and, 3
  %add = add i32 %and, 1
  %sel = select i1 %cmp, i32 4, i32 %add
  ret i32 %sel
}

define i32 @test_add_nuw_nsw__nuw_is_safe(i32 %x) {
; CHECK-LABEL: @test_add_nuw_nsw__nuw_is_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 2147483647
; CHECK-NEXT:    [[ADD:%.*]] = add nuw i32 [[AND]], 1
; CHECK-NEXT:    ret i32 [[ADD]]
;
  %and = and i32 %x, 2147483647
  %cmp = icmp eq i32 %and, 2147483647
  %add = add nuw nsw i32 %and, 1
  %sel = select i1 %cmp, i32 -2147483648, i32 %add
  ret i32 %sel
}

define i32 @test_add_nuw__nuw_is_safe(i32 %x) {
; CHECK-LABEL: @test_add_nuw__nuw_is_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 2147483647
; CHECK-NEXT:    [[ADD:%.*]] = add nuw i32 [[AND]], 1
; CHECK-NEXT:    ret i32 [[ADD]]
;
  %and = and i32 %x, 2147483647
  %cmp = icmp eq i32 %and, 2147483647
  %add = add nuw i32 %and, 1
  %sel = select i1 %cmp, i32 -2147483648, i32 %add
  ret i32 %sel
}

define i32 @test_add_nsw__nuw_is_safe(i32 %x) {
; CHECK-LABEL: @test_add_nsw__nuw_is_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 2147483647
; CHECK-NEXT:    [[ADD:%.*]] = add nuw i32 [[AND]], 1
; CHECK-NEXT:    ret i32 [[ADD]]
;
  %and = and i32 %x, 2147483647
  %cmp = icmp eq i32 %and, 2147483647
  %add = add nsw i32 %and, 1
  %sel = select i1 %cmp, i32 -2147483648, i32 %add
  ret i32 %sel
}

define i32 @test_add__nuw_is_safe(i32 %x) {
; CHECK-LABEL: @test_add__nuw_is_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 2147483647
; CHECK-NEXT:    [[ADD:%.*]] = add nuw i32 [[AND]], 1
; CHECK-NEXT:    ret i32 [[ADD]]
;
  %and = and i32 %x, 2147483647
  %cmp = icmp eq i32 %and, 2147483647
  %add = add i32 %and, 1
  %sel = select i1 %cmp, i32 -2147483648, i32 %add
  ret i32 %sel
}

define i32 @test_add_nuw_nsw__nsw_is_safe(i32 %x) {
; CHECK-LABEL: @test_add_nuw_nsw__nsw_is_safe(
; CHECK-NEXT:    [[OR:%.*]] = or i32 [[X:%.*]], -2147483648
; CHECK-NEXT:    [[ADD:%.*]] = add nsw i32 [[OR]], 1
; CHECK-NEXT:    ret i32 [[ADD]]
;
  %or = or i32 %x, -2147483648
  %cmp = icmp eq i32 %or, -1
  %add = add nuw nsw i32 %or, 1
  %sel = select i1 %cmp, i32 0, i32 %add
  ret i32 %sel
}

define i32 @test_add_nuw__nsw_is_safe(i32 %x) {
; CHECK-LABEL: @test_add_nuw__nsw_is_safe(
; CHECK-NEXT:    [[OR:%.*]] = or i32 [[X:%.*]], -2147483648
; CHECK-NEXT:    [[ADD:%.*]] = add nsw i32 [[OR]], 1
; CHECK-NEXT:    ret i32 [[ADD]]
;
  %or = or i32 %x, -2147483648
  %cmp = icmp eq i32 %or, -1
  %add = add nuw i32 %or, 1
  %sel = select i1 %cmp, i32 0, i32 %add
  ret i32 %sel
}

define i32 @test_add_nsw__nsw_is_safe(i32 %x) {
; CHECK-LABEL: @test_add_nsw__nsw_is_safe(
; CHECK-NEXT:    [[OR:%.*]] = or i32 [[X:%.*]], -2147483648
; CHECK-NEXT:    [[ADD:%.*]] = add nsw i32 [[OR]], 1
; CHECK-NEXT:    ret i32 [[ADD]]
;
  %or = or i32 %x, -2147483648
  %cmp = icmp eq i32 %or, -1
  %add = add nsw i32 %or, 1
  %sel = select i1 %cmp, i32 0, i32 %add
  ret i32 %sel
}

define i32 @test_add__nsw_is_safe(i32 %x) {
; CHECK-LABEL: @test_add__nsw_is_safe(
; CHECK-NEXT:    [[OR:%.*]] = or i32 [[X:%.*]], -2147483648
; CHECK-NEXT:    [[ADD:%.*]] = add nsw i32 [[OR]], 1
; CHECK-NEXT:    ret i32 [[ADD]]
;
  %or = or i32 %x, -2147483648
  %cmp = icmp eq i32 %or, -1
  %add = add i32 %or, 1
  %sel = select i1 %cmp, i32 0, i32 %add
  ret i32 %sel
}

define i32 @test_add_nuw_nsw__none_are_safe(i32 %x) {
; CHECK-LABEL: @test_add_nuw_nsw__none_are_safe(
; CHECK-NEXT:    [[ADD:%.*]] = add i32 [[X:%.*]], 1
; CHECK-NEXT:    ret i32 [[ADD]]
;
  %cmp = icmp eq i32 %x, 3
  %add = add nuw nsw i32 %x, 1
  %sel = select i1 %cmp, i32 4, i32 %add
  ret i32 %sel
}

define i32 @test_add_nuw__none_are_safe(i32 %x) {
; CHECK-LABEL: @test_add_nuw__none_are_safe(
; CHECK-NEXT:    [[ADD:%.*]] = add i32 [[X:%.*]], 1
; CHECK-NEXT:    ret i32 [[ADD]]
;
  %cmp = icmp eq i32 %x, 3
  %add = add nuw i32 %x, 1
  %sel = select i1 %cmp, i32 4, i32 %add
  ret i32 %sel
}

define i32 @test_add_nsw__none_are_safe(i32 %x) {
; CHECK-LABEL: @test_add_nsw__none_are_safe(
; CHECK-NEXT:    [[ADD:%.*]] = add i32 [[X:%.*]], 1
; CHECK-NEXT:    ret i32 [[ADD]]
;
  %cmp = icmp eq i32 %x, 3
  %add = add nsw i32 %x, 1
  %sel = select i1 %cmp, i32 4, i32 %add
  ret i32 %sel
}

define i32 @test_add__none_are_safe(i32 %x) {
; CHECK-LABEL: @test_add__none_are_safe(
; CHECK-NEXT:    [[ADD:%.*]] = add i32 [[X:%.*]], 1
; CHECK-NEXT:    ret i32 [[ADD]]
;
  %cmp = icmp eq i32 %x, 3
  %add = add i32 %x, 1
  %sel = select i1 %cmp, i32 4, i32 %add
  ret i32 %sel
}

define i32 @test_sub_nuw_nsw__all_are_safe(i32 %x) {
; CHECK-LABEL: @test_sub_nuw_nsw__all_are_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 255
; CHECK-NEXT:    [[SUB:%.*]] = sub nuw nsw i32 -254, [[AND]]
; CHECK-NEXT:    ret i32 [[SUB]]
;
  %and = and i32 %x, 255
  %cmp = icmp eq i32 %and, 6
  %sub = sub nuw nsw i32 -254, %and
  %sel = select i1 %cmp, i32 -260, i32 %sub
  ret i32 %sel
}

define i32 @test_sub_nuw__all_are_safe(i32 %x) {
; CHECK-LABEL: @test_sub_nuw__all_are_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 255
; CHECK-NEXT:    [[SUB:%.*]] = sub nuw nsw i32 -254, [[AND]]
; CHECK-NEXT:    ret i32 [[SUB]]
;
  %and = and i32 %x, 255
  %cmp = icmp eq i32 %and, 6
  %sub = sub nuw i32 -254, %and
  %sel = select i1 %cmp, i32 -260, i32 %sub
  ret i32 %sel
}

define i32 @test_sub_nsw__all_are_safe(i32 %x) {
; CHECK-LABEL: @test_sub_nsw__all_are_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 255
; CHECK-NEXT:    [[SUB:%.*]] = sub nuw nsw i32 -254, [[AND]]
; CHECK-NEXT:    ret i32 [[SUB]]
;
  %and = and i32 %x, 255
  %cmp = icmp eq i32 %and, 6
  %sub = sub nsw i32 -254, %and
  %sel = select i1 %cmp, i32 -260, i32 %sub
  ret i32 %sel
}

define i32 @test_sub__all_are_safe(i32 %x) {
; CHECK-LABEL: @test_sub__all_are_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 255
; CHECK-NEXT:    [[SUB:%.*]] = sub nuw nsw i32 -254, [[AND]]
; CHECK-NEXT:    ret i32 [[SUB]]
;
  %and = and i32 %x, 255
  %cmp = icmp eq i32 %and, 6
  %sub = sub i32 -254, %and
  %sel = select i1 %cmp, i32 -260, i32 %sub
  ret i32 %sel
}

define i32 @test_sub_nuw_nsw__nuw_is_safe(i32 %x) {
; CHECK-LABEL: @test_sub_nuw_nsw__nuw_is_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 2147483647
; CHECK-NEXT:    [[SUB:%.*]] = sub nuw i32 -2147483648, [[AND]]
; CHECK-NEXT:    ret i32 [[SUB]]
;
  %and = and i32 %x, 2147483647
  %cmp = icmp eq i32 %and, 1073741824
  %sub = sub nuw nsw i32 -2147483648, %and
  %sel = select i1 %cmp, i32 1073741824, i32 %sub
  ret i32 %sel
}

define i32 @test_sub_nuw__nuw_is_safe(i32 %x) {
; CHECK-LABEL: @test_sub_nuw__nuw_is_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 2147483647
; CHECK-NEXT:    [[SUB:%.*]] = sub nuw i32 -2147483648, [[AND]]
; CHECK-NEXT:    ret i32 [[SUB]]
;
  %and = and i32 %x, 2147483647
  %cmp = icmp eq i32 %and, 1073741824
  %sub = sub nuw i32 -2147483648, %and
  %sel = select i1 %cmp, i32 1073741824, i32 %sub
  ret i32 %sel
}

define i32 @test_sub_nsw__nuw_is_safe(i32 %x) {
; CHECK-LABEL: @test_sub_nsw__nuw_is_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 2147483647
; CHECK-NEXT:    [[SUB:%.*]] = sub nuw i32 -2147483648, [[AND]]
; CHECK-NEXT:    ret i32 [[SUB]]
;
  %and = and i32 %x, 2147483647
  %cmp = icmp eq i32 %and, 1073741824
  %sub = sub nsw i32 -2147483648, %and
  %sel = select i1 %cmp, i32 1073741824, i32 %sub
  ret i32 %sel
}

define i32 @test_sub__nuw_is_safe(i32 %x) {
; CHECK-LABEL: @test_sub__nuw_is_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 2147483647
; CHECK-NEXT:    [[SUB:%.*]] = sub nuw i32 -2147483648, [[AND]]
; CHECK-NEXT:    ret i32 [[SUB]]
;
  %and = and i32 %x, 2147483647
  %cmp = icmp eq i32 %and, 1073741824
  %sub = sub i32 -2147483648, %and
  %sel = select i1 %cmp, i32 1073741824, i32 %sub
  ret i32 %sel
}

define i32 @test_sub_nuw_nsw__nsw_is_safe(i32 %x) {
; CHECK-LABEL: @test_sub_nuw_nsw__nsw_is_safe(
; CHECK-NEXT:    [[OR:%.*]] = or i32 [[X:%.*]], -2147483648
; CHECK-NEXT:    [[SUB:%.*]] = sub nsw i32 -2147483648, [[OR]]
; CHECK-NEXT:    ret i32 [[SUB]]
;
  %or = or i32 %x, -2147483648
  %cmp = icmp eq i32 %or, -2147483647
  %sub = sub nuw nsw i32 -2147483648, %or
  %sel = select i1 %cmp, i32 -1, i32 %sub
  ret i32 %sel
}

define i32 @test_sub_nuw__nsw_is_safe(i32 %x) {
; CHECK-LABEL: @test_sub_nuw__nsw_is_safe(
; CHECK-NEXT:    [[OR:%.*]] = or i32 [[X:%.*]], -2147483648
; CHECK-NEXT:    [[SUB:%.*]] = sub nsw i32 -2147483648, [[OR]]
; CHECK-NEXT:    ret i32 [[SUB]]
;
  %or = or i32 %x, -2147483648
  %cmp = icmp eq i32 %or, -2147483647
  %sub = sub nuw i32 -2147483648, %or
  %sel = select i1 %cmp, i32 -1, i32 %sub
  ret i32 %sel
}

define i32 @test_sub_nsw__nsw_is_safe(i32 %x) {
; CHECK-LABEL: @test_sub_nsw__nsw_is_safe(
; CHECK-NEXT:    [[OR:%.*]] = or i32 [[X:%.*]], -2147483648
; CHECK-NEXT:    [[SUB:%.*]] = sub nsw i32 -2147483648, [[OR]]
; CHECK-NEXT:    ret i32 [[SUB]]
;
  %or = or i32 %x, -2147483648
  %cmp = icmp eq i32 %or, -2147483647
  %sub = sub nsw i32 -2147483648, %or
  %sel = select i1 %cmp, i32 -1, i32 %sub
  ret i32 %sel
}

define i32 @test_sub__nsw_is_safe(i32 %x) {
; CHECK-LABEL: @test_sub__nsw_is_safe(
; CHECK-NEXT:    [[OR:%.*]] = or i32 [[X:%.*]], -2147483648
; CHECK-NEXT:    [[SUB:%.*]] = sub nsw i32 -2147483648, [[OR]]
; CHECK-NEXT:    ret i32 [[SUB]]
;
  %or = or i32 %x, -2147483648
  %cmp = icmp eq i32 %or, -2147483647
  %sub = sub i32 -2147483648, %or
  %sel = select i1 %cmp, i32 -1, i32 %sub
  ret i32 %sel
}

define i32 @test_sub_nuw_nsw__none_are_safe(i32 %x) {
; CHECK-LABEL: @test_sub_nuw_nsw__none_are_safe(
; CHECK-NEXT:    [[SUB:%.*]] = sub i32 -2147483648, [[X:%.*]]
; CHECK-NEXT:    ret i32 [[SUB]]
;
  %cmp = icmp eq i32 %x, 1
  %sub = sub nuw nsw i32 -2147483648, %x
  %sel = select i1 %cmp, i32 2147483647, i32 %sub
  ret i32 %sel
}

define i32 @test_sub_nuw__none_are_safe(i32 %x) {
; CHECK-LABEL: @test_sub_nuw__none_are_safe(
; CHECK-NEXT:    [[SUB:%.*]] = sub i32 -2147483648, [[X:%.*]]
; CHECK-NEXT:    ret i32 [[SUB]]
;
  %cmp = icmp eq i32 %x, 1
  %sub = sub nuw i32 -2147483648, %x
  %sel = select i1 %cmp, i32 2147483647, i32 %sub
  ret i32 %sel
}

define i32 @test_sub_nsw__none_are_safe(i32 %x) {
; CHECK-LABEL: @test_sub_nsw__none_are_safe(
; CHECK-NEXT:    [[SUB:%.*]] = sub i32 -2147483648, [[X:%.*]]
; CHECK-NEXT:    ret i32 [[SUB]]
;
  %cmp = icmp eq i32 %x, 1
  %sub = sub nsw i32 -2147483648, %x
  %sel = select i1 %cmp, i32 2147483647, i32 %sub
  ret i32 %sel
}

define i32 @test_sub__none_are_safe(i32 %x) {
; CHECK-LABEL: @test_sub__none_are_safe(
; CHECK-NEXT:    [[SUB:%.*]] = sub i32 -2147483648, [[X:%.*]]
; CHECK-NEXT:    ret i32 [[SUB]]
;
  %cmp = icmp eq i32 %x, 1
  %sub = sub i32 -2147483648, %x
  %sel = select i1 %cmp, i32 2147483647, i32 %sub
  ret i32 %sel
}

define i32 @test_mul_nuw_nsw__all_are_safe(i32 %x) {
; CHECK-LABEL: @test_mul_nuw_nsw__all_are_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 255
; CHECK-NEXT:    [[MUL:%.*]] = mul nuw nsw i32 [[AND]], 9
; CHECK-NEXT:    ret i32 [[MUL]]
;
  %and = and i32 %x, 255
  %cmp = icmp eq i32 %and, 17
  %mul = mul nuw nsw i32 %and, 9
  %sel = select i1 %cmp, i32 153, i32 %mul
  ret i32 %sel
}

define i32 @test_mul_nuw__all_are_safe(i32 %x) {
; CHECK-LABEL: @test_mul_nuw__all_are_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 255
; CHECK-NEXT:    [[MUL:%.*]] = mul nuw nsw i32 [[AND]], 9
; CHECK-NEXT:    ret i32 [[MUL]]
;
  %and = and i32 %x, 255
  %cmp = icmp eq i32 %and, 17
  %mul = mul nuw i32 %and, 9
  %sel = select i1 %cmp, i32 153, i32 %mul
  ret i32 %sel
}

define i32 @test_mul_nsw__all_are_safe(i32 %x) {
; CHECK-LABEL: @test_mul_nsw__all_are_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 255
; CHECK-NEXT:    [[MUL:%.*]] = mul nuw nsw i32 [[AND]], 9
; CHECK-NEXT:    ret i32 [[MUL]]
;
  %and = and i32 %x, 255
  %cmp = icmp eq i32 %and, 17
  %mul = mul nsw i32 %and, 9
  %sel = select i1 %cmp, i32 153, i32 %mul
  ret i32 %sel
}

define i32 @test_mul__all_are_safe(i32 %x) {
; CHECK-LABEL: @test_mul__all_are_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 255
; CHECK-NEXT:    [[MUL:%.*]] = mul nuw nsw i32 [[AND]], 9
; CHECK-NEXT:    ret i32 [[MUL]]
;
  %and = and i32 %x, 255
  %cmp = icmp eq i32 %and, 17
  %mul = mul i32 %and, 9
  %sel = select i1 %cmp, i32 153, i32 %mul
  ret i32 %sel
}

define i32 @test_mul_nuw_nsw__nuw_is_safe(i32 %x) {
; CHECK-LABEL: @test_mul_nuw_nsw__nuw_is_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 268435457
; CHECK-NEXT:    [[MUL:%.*]] = mul nuw i32 [[AND]], 9
; CHECK-NEXT:    ret i32 [[MUL]]
;
  %and = and i32 %x, 268435457
  %cmp = icmp eq i32 %and, 268435456
  %mul = mul nuw nsw i32 %and, 9
  %sel = select i1 %cmp, i32 -1879048192, i32 %mul
  ret i32 %sel
}

define i32 @test_mul_nuw__nuw_is_safe(i32 %x) {
; CHECK-LABEL: @test_mul_nuw__nuw_is_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 268435457
; CHECK-NEXT:    [[MUL:%.*]] = mul nuw i32 [[AND]], 9
; CHECK-NEXT:    ret i32 [[MUL]]
;
  %and = and i32 %x, 268435457
  %cmp = icmp eq i32 %and, 268435456
  %mul = mul nuw i32 %and, 9
  %sel = select i1 %cmp, i32 -1879048192, i32 %mul
  ret i32 %sel
}

define i32 @test_mul_nsw__nuw_is_safe(i32 %x) {
; CHECK-LABEL: @test_mul_nsw__nuw_is_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 268435457
; CHECK-NEXT:    [[MUL:%.*]] = mul nuw i32 [[AND]], 9
; CHECK-NEXT:    ret i32 [[MUL]]
;
  %and = and i32 %x, 268435457
  %cmp = icmp eq i32 %and, 268435456
  %mul = mul nsw i32 %and, 9
  %sel = select i1 %cmp, i32 -1879048192, i32 %mul
  ret i32 %sel
}

define i32 @test_mul__nuw_is_safe(i32 %x) {
; CHECK-LABEL: @test_mul__nuw_is_safe(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 268435457
; CHECK-NEXT:    [[MUL:%.*]] = mul nuw i32 [[AND]], 9
; CHECK-NEXT:    ret i32 [[MUL]]
;
  %and = and i32 %x, 268435457
  %cmp = icmp eq i32 %and, 268435456
  %mul = mul i32 %and, 9
  %sel = select i1 %cmp, i32 -1879048192, i32 %mul
  ret i32 %sel
}

define i32 @test_mul_nuw_nsw__nsw_is_safe(i32 %x) {
; CHECK-LABEL: @test_mul_nuw_nsw__nsw_is_safe(
; CHECK-NEXT:    [[AND:%.*]] = or i32 [[X:%.*]], -83886080
; CHECK-NEXT:    [[MUL:%.*]] = mul nsw i32 [[AND]], 9
; CHECK-NEXT:    ret i32 [[MUL]]
;
  %and = or i32 %x, -83886080
  %cmp = icmp eq i32 %and, -83886079
  %mul = mul nuw nsw i32 %and, 9
  %sel = select i1 %cmp, i32 -754974711, i32 %mul
  ret i32 %sel
}

define i32 @test_mul_nuw__nsw_is_safe(i32 %x) {
; CHECK-LABEL: @test_mul_nuw__nsw_is_safe(
; CHECK-NEXT:    [[AND:%.*]] = or i32 [[X:%.*]], -83886080
; CHECK-NEXT:    [[MUL:%.*]] = mul nsw i32 [[AND]], 9
; CHECK-NEXT:    ret i32 [[MUL]]
;
  %and = or i32 %x, -83886080
  %cmp = icmp eq i32 %and, -83886079
  %mul = mul nuw i32 %and, 9
  %sel = select i1 %cmp, i32 -754974711, i32 %mul
  ret i32 %sel
}

define i32 @test_mul_nsw__nsw_is_safe(i32 %x) {
; CHECK-LABEL: @test_mul_nsw__nsw_is_safe(
; CHECK-NEXT:    [[AND:%.*]] = or i32 [[X:%.*]], -83886080
; CHECK-NEXT:    [[MUL:%.*]] = mul nsw i32 [[AND]], 9
; CHECK-NEXT:    ret i32 [[MUL]]
;
  %and = or i32 %x, -83886080
  %cmp = icmp eq i32 %and, -83886079
  %mul = mul nsw i32 %and, 9
  %sel = select i1 %cmp, i32 -754974711, i32 %mul
  ret i32 %sel
}

define i32 @test_mul__nsw_is_safe(i32 %x) {
; CHECK-LABEL: @test_mul__nsw_is_safe(
; CHECK-NEXT:    [[AND:%.*]] = or i32 [[X:%.*]], -83886080
; CHECK-NEXT:    [[MUL:%.*]] = mul nsw i32 [[AND]], 9
; CHECK-NEXT:    ret i32 [[MUL]]
;
  %and = or i32 %x, -83886080
  %cmp = icmp eq i32 %and, -83886079
  %mul = mul i32 %and, 9
  %sel = select i1 %cmp, i32 -754974711, i32 %mul
  ret i32 %sel
}

define i32 @test_mul_nuw_nsw__none_are_safe(i32 %x) {
; CHECK-LABEL: @test_mul_nuw_nsw__none_are_safe(
; CHECK-NEXT:    [[MUL:%.*]] = mul i32 [[X:%.*]], 9
; CHECK-NEXT:    ret i32 [[MUL]]
;
  %cmp = icmp eq i32 %x, 805306368
  %mul = mul nuw nsw i32 %x, 9
  %sel = select i1 %cmp, i32 -1342177280, i32 %mul
  ret i32 %sel
}

define i32 @test_mul_nuw__none_are_safe(i32 %x) {
; CHECK-LABEL: @test_mul_nuw__none_are_safe(
; CHECK-NEXT:    [[MUL:%.*]] = mul i32 [[X:%.*]], 9
; CHECK-NEXT:    ret i32 [[MUL]]
;
  %cmp = icmp eq i32 %x, 805306368
  %mul = mul nuw i32 %x, 9
  %sel = select i1 %cmp, i32 -1342177280, i32 %mul
  ret i32 %sel
}

define i32 @test_mul_nsw__none_are_safe(i32 %x) {
; CHECK-LABEL: @test_mul_nsw__none_are_safe(
; CHECK-NEXT:    [[MUL:%.*]] = mul i32 [[X:%.*]], 9
; CHECK-NEXT:    ret i32 [[MUL]]
;
  %cmp = icmp eq i32 %x, 805306368
  %mul = mul nsw i32 %x, 9
  %sel = select i1 %cmp, i32 -1342177280, i32 %mul
  ret i32 %sel
}

define i32 @test_mul__none_are_safe(i32 %x) {
; CHECK-LABEL: @test_mul__none_are_safe(
; CHECK-NEXT:    [[MUL:%.*]] = mul i32 [[X:%.*]], 9
; CHECK-NEXT:    ret i32 [[MUL]]
;
  %cmp = icmp eq i32 %x, 805306368
  %mul = mul i32 %x, 9
  %sel = select i1 %cmp, i32 -1342177280, i32 %mul
  ret i32 %sel
}
