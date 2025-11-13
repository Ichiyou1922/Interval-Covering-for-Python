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
[ "${out}" = 2 ] || ng "$LINENO"
[ "${res}" = 0 ] && echo OK

out=${cat testdata1 | ./incov} 
[ "${out}" = 5 ] || ng "$LINENO"
[ "${res}" = 0 ] && echo OK


out=${cat testdata2 | ./incov}
[ "${out}" = 5 ] || ng "$LINENO"
[ "${res}" = 0 ] && echo OK

out=${cat testdata3 | ./incov}
[ "${out}" = 3 ] || ng "$LINENO"
[ "${res}" = 0 ] && echo OK

out=${echo a | ./incov}
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "None" ] || ng "$LINENO"

out=$(echo  | ./incov)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "None" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK

exit ${res}
