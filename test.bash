#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Mogi Kazuha <mogi2fruits.kazu@gmail.com>
# SPDX-License-Identifier: BSD-3-Clause

ng () {
        echo ${1}行目が間違っています
        res=1
}

res=0

### Normal Input ###
# ソート済みの入力テスト
out=$(seq 5 | ./incov)
[ "$out" = 2 ] || ng "$LINENO"
[ "$res" = 0 ] && echo OK

# ソートされていない入力テスト
testdata1='4\n7\n9\n5\n1\n10\n13\n5\n6'
out=$(printf "%b" "$testdata1" | ./incov)
[ "$out" = 5 ] || ng "$LINENO"
[ "$res" = 0 ] && echo OK

# 負の数を含む入力テスト
testdata2='-4\n-2\n-8\n-6\n0\n1\n4\n7\n3'
out=$(printf "%b" "$testdata2" | ./incov)
[ "$out" = 5 ] || ng "$LINENO"
[ "$res" = 0 ] && echo OK

# 小数を含む入力テスト
testdata3='3\n2\n5\n5.6\n6\n0\n1.53\n2\n5\n5.6\n6\n0\n1.5'
out=$(printf "%b" "$testdata3" | ./incov)
[ "$out" = 3 ] || ng "$LINENO"
[ "$res" = 0 ] && echo OK

# 無効な入力テスト
out=$(echo あ | ./incov)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

# 空入力テスト
out=$(echo  | ./incov)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

### Boundary Value Analysis ###
# 距離がちょうど2.0 (1.0, 3.0) -> 1クラスタ
out=$(printf "1.0\n3.0" | ./incov)
[ "$out" = 1 ] || ng "$LINENO"
[ "$res" = 0 ] && echo OK

# 距離が2.0よりわずかに大きい (1.0, 3.0000001) -> 2クラスタ
out=$(printf "1.0\n3.0000001" | ./incov)
[ "$out" = 2 ] || ng "$LINENO"
[ "$res" = 0 ] && echo OK

### Single & Duplicate Input ###
# 1点のみ -> 1クラスタ
out=$(echo 100 | ./incov)
[ "$out" = 1 ] || ng "$LINENO"
[ "$res" = 0 ] && echo OK

# 重複する値 (5, 5, 5) -> 1クラスタ
out=$(printf "5\n5\n5" | ./incov)
[ "$out" = 1 ] || ng "$LINENO"
[ "$res" = 0 ] && echo OK

[ "$res" = 0 ] && echo OK
