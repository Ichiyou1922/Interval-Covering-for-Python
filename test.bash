#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Mogi Kazuha <mogi2fruits.kazu@gmail.com>
# SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo ${1}行目が間違っています
	res=1
}

res=0

### Normal Input ###
out=$(seq 5 | ./incov)
[ "$out" = 2 ] || ng "$LINENO"
[ "$res" = 0 ] && echo OK

testdata1='4\n7\n9\n5\n1\n10\n13\n5\n6'
out=$(echo testdata1 |./incov) 
[ "$out" = 5 ] || ng "$LINENO"
[ "$res" = 0 ] && echo OK

testdata2='-4\n-2\n-8\n-6\n0\n1\n4\n7\n3'
out=$(echo testdata2 | ./incov)
[ "$out" = 5 ] || ng "$LINENO"
[ "$res" = 0 ] && echo OK

testdata3='3\n2\n5\n5.6\n6\n0\n1.53\n2\n5\n5.6\n6\n0\n1.5'
out=$(echo testdata3 | ./incov)
[ "$out" = 3 ] || ng "$LINENO"
[ "$res" = 0 ] && echo OK

out=$(echo あ | ./incov)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

out=$(echo  | ./incov)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK

exit $res
