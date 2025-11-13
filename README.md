# incovコマンド
![test](https://github.com/Ichiyou1922/Interval-covering-for-Python/actions/workflows/test.yml/badge.svg)

## プログラムの内容
- クラスタ: 中心値Cと半径Rを持ち，[C-R, C+R]の範囲の数値を収める．
- 入力された幾つかの数値を最小個数のクラスタで包み，その個数を出力するプログラム．

## 使い方
```bash
$ git clone git@github.com:Ichiyou1922/Interval-Covering-for-Python.git
$ cd Interval-Covering-for-Python
$ chmod +x incov
$ seq 5 | ./incov #半径R=1の場合seq 5で生成された数値はリスト化され{1, 2, 3, 4, 5}となり{1, 2, 3}, {4, 5}としてクラスタに包まれ，その個数は2である．
2
```

## 必要なソフトウェア
- Python
  - テスト済みバージョン: 3.7~3.10

## テスト環境
- Ubuntu 22.04.5 LTS
- Python 3.13.5

## 権利について
- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布及び使用が許可されます．
- © 2025 Kazuha Mogi
