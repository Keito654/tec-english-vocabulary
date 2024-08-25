#!/bin/bash

# ファイル名のリスト
files=("vocabulary.csv" "idioms.csv")

# 重複チェック関数
check_duplicates() {
  local file=$1
  local duplicates=$(cut -d',' -f1 "$file" | sort | uniq -d)
  if [ -n "$duplicates" ]; then
    echo "重複が見つかりました: $file"
    echo "$duplicates"
    exit 1
  else
    echo "重複はありません: $file"
  fi
}

# 各ファイルに対して重複チェックを実行
for file in "${files[@]}"; do
  check_duplicates "$file"
done