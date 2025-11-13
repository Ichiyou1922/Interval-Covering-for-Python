# incovコマンド
![test](https://github.com/Ichiyou1922/Interval-covering-for-Python/actions/workflows/test.yml/badge.svg)

## プログラムの内容
入力された数値データを半径Rのクラスタで包み，クラスタの最小個数を出力するプログラム．

## 使い方
```bash
$ git clone git@github.com:Ichiyou1922/Interval-Covering-for-Python.git
$ cd Interval-Covering-for-Python
$ seq 5 | ./incov
2 #半径R=1の場合{1, 2, 3, 4, 5}は{1, 2, 3}, {4, 5}としてクラスタに包まれ，その個数は2である．
```

## 必要なソフトウェア
- Python
  - テスト済みバージョン: 3.7~3.10

## テスト環境
- Ubuntu 22.04.5 LTS

## 権利について
- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布及び使用が許可されます．
- © 2025 Kazuha Mogi
