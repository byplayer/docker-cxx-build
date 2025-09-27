# Docker C++ Build Container

C++開発用のビルドコンテナです。GitHub ActionsのCIテスト環境として使用できます。

## ファイル構成

- **Dockerfile**: Alpine Linuxベースの軽量なC++ビルド環境を構築
  - CMake, Clang, GCC/G++などのC++開発ツールを含む
  - AMD64アーキテクチャ用に最適化
  - カスタムエントリーポイントスクリプトを設定

- **build.sh**: Dockerイメージのビルドスクリプト
  - イメージ名: `byplayer/cxx-build`

- **entrypoint**: コンテナ起動時に実行されるエントリーポイントスクリプト

## 使用方法

### 1. Dockerイメージのビルド

```bash
# ビルドスクリプトを使用
./build.sh

# または直接dockerコマンドで実行
docker build ./ -t byplayer/cxx-build
```

### 2. タグの設定

```bash
# バージョンタグを設定
docker tag byplayer/cxx-build byplayer/cxx-build:v1.0.0

# latestタグを設定
docker tag byplayer/cxx-build byplayer/cxx-build:latest

# 特定の日付タグを設定
docker tag byplayer/cxx-build byplayer/cxx-build:$(date +%Y%m%d)
```

### 3. Docker Hubへのプッシュ

```bash
# Docker Hubにログイン
docker login

# イメージをプッシュ（全タグ）
docker push byplayer/cxx-build:latest
docker push byplayer/cxx-build:v1.0.0

# または全タグを一括でプッシュ
docker push byplayer/cxx-build --all-tags
```

## 含まれるツール

- bash
- cmake
- clang / clang-dev
- make
- git
- gcc / g++
- libc-dev
- linux-headers

## ベースイメージ

Alpine Linux 3.22.1 (AMD64)