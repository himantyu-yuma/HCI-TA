# 情報理工学実験

![d1f0889a0e64c976b1a47b790c703427](https://user-images.githubusercontent.com/36870844/209463404-a52774cb-e0dd-436e-bf5c-7be4c46eaad0.svg)

## Overview
情報理工学実験のHCI研究室の担当するruby演習のTA向け環境

## Important
dockerで環境を構築した関係上、**一部の記述を書き換えたり、応用課題で完全に環境が再現できていないので**、close済みも含めてissueを一度確認してください。

## Requirement
- Docker Desktop https://www.docker.com/products/docker-desktop/

## Usage
1. クローンしたらリポジトリのルートディレクトリに移動する
2. `docker-compose build`でイメージを構築する（Dockerfileやdocker-compose.ymlを変更しない限りは1度やればいいです）
3. コンテナを起動する 
   1. 何かコマンドを実行したい場合は実行したいコマンドの先頭に `docker-compose run --rm web`を付けると一度だけ実行する（例：`ruby test.rb`としたい場合は`docker-compose run --rm web ruby test.rb`）とするとホストのターミナルから実行できる。
   2. `docker-compose up -d`を実行するとコンテナが常時起動するので`docker exec -it [サービス名] bash`でコンテナの中に入ることが出来る。サービス名はコンテナ起動中に`docker ps`で調べることが出来る。コンテナから脱出してホストに戻りたい時は`exit`と入力すればいい。起動したコンテナは`docker-compose down`で終了出来る。間違って作業中のターミナルウインドウを見失った場合はDocker DesktopからGUIで終了することも出来る。
  ```bash
  > docker-compose up -d //コンテナ起動
[+] Running 2/2
 - Network science-and-engineering-experiments_default  Created                                                                                                                                                                    0.0s
 - Container science-and-engineering-experiments-web-1  Started                                                                                                                                                                    0.5s
> docker ps //起動コンテナ一覧
CONTAINER ID   IMAGE                                     COMMAND   CREATED         STATUS         PORTS                                            NAMES
61e101120266   science-and-engineering-experiments-web   "irb"     5 seconds ago   Up 4 seconds   0.0.0.0:2000->2000/tcp, 0.0.0.0:4567->4567/tcp   science-and-engineering-experiments-web-1
> docker exec -it science-and-engineering-experiments-web-1 bash //コンテナの中に入る
root@61e101120266:/app# echo Hello, Container! //この中はlinuxのように使える
Hello, Container!
root@61e101120266:/app# exit //コンテナを出る
exit
> docker-compose down //コンテナを削除
[+] Running 2/2
 - Container science-and-engineering-experiments-web-1  Removed                                                                                                                                                                    0.3s
 - Network science-and-engineering-experiments_default  Removed 
  ```
  
  ![image](https://user-images.githubusercontent.com/36870844/209464253-7c6bd4df-79eb-40f8-a4fe-8a8d7b57e4c5.png)
  
  *GUIから管理することも出来る*

## Features
ブランチとして
- main
- 1-2-day
- 3-4-day
- 5-6 day

を切ってあるので、ファイルが多すぎて煩わしい場合はブランチに移動して実行してください。
`answer_***.rb`となっているファイルは2022年度の課題について作者が独断と偏見に基づき、解答例を作成したものです。採点基準については担当教員と相談してください。

上記のブランチはプロテクトしてあるので、課題の変更や不具合の修正などがある場合はプルリクしてください。

## Author
何かある場合は、研究室のScrapboxのOBからNaokiの連絡先を探して連絡をください。
