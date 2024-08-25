#!/bin/bash

# ファイル名のリスト
files=("vocabulary.csv" "idioms.csv")

# ソート関数
sort_csv() {
  local file=$1
  local temp_file=$(mktemp)

  # ヘッダーを保持しつつ、English列でソート
  (head -n 1 "$file" && tail -n +2 "$file" | sort -t',' -k1,1) > "$temp_file"

  # ソート結果を元のファイルに上書き
  mv "$temp_file" "$file"
  echo "ソート完了: $file"
}

# 各ファイルに対してソートを実行
for file in "${files[@]}"; do
  sort_csv "$file"
done