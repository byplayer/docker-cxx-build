# Docker C++ Build Container

C++開発用のビルドコンテナです。GitHub ActionsのCIテスト環境として使用できます。

## ファイル構成

- **Dockerfile**: Alpine Linuxベースの軽量なC++ビルド環境を構築
  - CMake, Clang, GCC/G++などのC++開発ツールを含む
  - AMD64アーキテクチャ用に最適化
  - カスタムエントリーポイントスクリプトを設定

- **build.sh**: Dockerイメージのビルドスクリプト
  - デフォルトイメージ名: `byplayer/cxx-build`
  - linux/amd64アーキテクチャ用にビルド
  - タグ指定とプッシュ機能をサポート

- **entrypoint**: コンテナ起動時に実行されるエントリーポイントスクリプト

## 使用方法

### 1. Dockerイメージのビルド

```bash
# デフォルト設定でビルド (byplayer/cxx-build:latest)
./build.sh

# 特定のタグでビルド
./build.sh v1.0.0

# ビルドして即座にプッシュ
./build.sh v1.0.0 push
```

### 2. build.shスクリプトの使用方法

```bash
# 使用法: ./build.sh [TAG] [push]
#
# パラメータ:
#   TAG   - イメージタグ (デフォルト: latest)
#   push  - "push"を指定すると、ビルド後にレジストリにプッシュ

# 例:
./build.sh                  # byplayer/cxx-build:latest をビルド
./build.sh v2.0.0          # byplayer/cxx-build:v2.0.0 をビルド
./build.sh v2.0.0 push     # ビルドしてプッシュ
```

### 3. Docker Hubへのプッシュ

```bash
# Docker Hubにログイン (初回のみ)
docker login

# build.shを使用してビルドとプッシュを同時に実行
./build.sh v1.0.0 push

# または個別にプッシュ
docker push byplayer/cxx-build:v1.0.0
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
