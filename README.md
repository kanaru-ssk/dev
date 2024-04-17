# dev

ローカル開発環境コンテナ

ホスト PC には Visual Studio Code と Docker Desktop のみのインストールで開発環境を構築する

## 構築手順

### Docker Desktop インストール

以下にアクセスし、Docker Desktop をインストール

[https://www.docker.com/products/docker-desktop/](https://www.docker.com/products/docker-desktop/)

### Visual Studio Code インストール

以下にアクセスし、Visual Studio Code をインストール

[https://code.visualstudio.com/](https://code.visualstudio.com/)

### Dev Containers インストール

以下にアクセスし、Visual Studio Code に Dev Containers をインストール

[https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

### リポジトリをクローン

```sh
git clone https://github.com/kanaru-ssk/dev.git
```

### コンテナ起動

クローンしたディレクトリを Visual Studio Code で開く

```sh
code dev
```

`command + shift + P`でコマンドパレットを起動

`Dev Container: Open Folder in Container`を選択

コンテナのファイルシステムで Visual Studio Code ウィンドウが起動したら完了

## 運用方法

### プロジェクト追加

`projects`ディレクトリ配下に`git clone`又は新規プロジェクトディレクトリを追加する。

### パッケージ追加

新しいパッケージを追加する時は、`Dockerfile`にインストールコマンドを記述する。

### Visual Studio Code 拡張機能追加

新しい拡張機能を追加するときは、`.devcontainer/devcontainer.json`の`extensions`に追加する。
