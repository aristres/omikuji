# あそびくじ スクリーンショット素材

実際の iPhone Simulator 上のアプリ画面を使用した画像セットです。

## App Store Connect 登録用

`app-store/upload-ready/` の5枚を番号順に使用してください。

- サイズ: 1320 × 2868 px（縦）
- 形式: JPEG / RGB / アルファチャンネルなし
- 内容: 乳児向けホーム、乳児向け結果、3歳以上ホーム、3歳以上結果、お気に入り

## ストア掲載・広告用

`app-store/promotional/` に、見出し入りの5枚があります。

- サイズ: 1320 × 2868 px（縦）
- 形式: JPEG / RGB / アルファチャンネルなし

## SNS投稿用

`social/` に、Instagramなどで使いやすい縦長画像が3枚あります。

- サイズ: 1080 × 1350 px（4:5）
- 形式: JPEG / RGB / アルファチャンネルなし

## 元画像

`app-store/raw/` は iPhone 17 Simulator から直接撮影した元画像です。

見出し入り画像とSNS画像を作り直す場合は、リポジトリのルートで次を実行します。

```bash
xcrun swift marketing/render_marketing.swift
```
