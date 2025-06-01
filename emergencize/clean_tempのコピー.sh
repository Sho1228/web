#!/bin/bash

# フォルダのパス
TARGET_FOLDER="/private/var/folders/0k/n0_l0css04q16yr9smzzzkvm0000gn/T/TemporaryItems"

# フォルダが存在するか確認
if [ -d "$TARGET_FOLDER" ]; then
    # フォルダ内の項目数を数える
    ITEM_COUNT=$(find "$TARGET_FOLDER" -mindepth 1 | wc -l)

    if [ "$ITEM_COUNT" -eq 0 ]; then
        echo "フォルダ $TARGET_FOLDER は既に空です。"
    else
        echo "フォルダ $TARGET_FOLDER には $ITEM_COUNT 個の項目があります。"
        echo "これらを全て完全に削除しますか？ (y/n)"
        read -r CONFIRMATION

        if [ "$CONFIRMATION" = "y" ]; then
            echo -e "\n\nTemporaryItems の中身を削除中...\n"
            find "$TARGET_FOLDER" -mindepth 1 -delete
            echo -e "内容が削除されました。親フォルダは保持されています。\n"
        else
            echo -e "削除をキャンセルしました。\n"
        fi
    fi
else
    echo "フォルダ $TARGET_FOLDER は存在しません。\n"
fi

echo "3秒後にアプリ \"Terminal\" を強制終了します。"
sleep 3
killall Terminal