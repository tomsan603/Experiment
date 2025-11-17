#!/bin/bash

# $1 というのが「1番目の引数（softやmedium）」に置き換わります
MODE=$1

# 引数が空っぽだったらエラーを出す（親切設計）
if [ -z "$MODE" ]; then
    echo "エラー: モードを指定してください (例: ./grip.bash soft)"
    exit 1
fi

echo "モード: $MODE で実験を開始します..."

# 変数を使ってサービスを呼び出す
ros2 service call /robotiq/auto_close/${MODE} std_srvs/srv/Trigger "{}"

echo "10秒間把持します..."
sleep 10

ros2 service call /robotiq/auto_open/${MODE} std_srvs/srv/Trigger "{}"

echo "完了しました。"