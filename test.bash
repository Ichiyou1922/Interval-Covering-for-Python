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

exit ${res}
