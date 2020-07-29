#!/bin/sh

#リモートリポジトリのURL
GitUrl=https://github.com/yuta0627/HelloGit.git

#ローカルのgitディレクトリ
basedir=/home/share/clone/HelloGit/

#リモートのどのブランチにpushするか
remoteBranch=master

cd $basedir
echo "################ git pull START ###################################"
git pull
echo "################ git pull END #####################################"
if [ $? -gt 0 ]; then
    echo "git command failed!"
    exit
fi

echo "################ git status START #################################"
git status
echo "################ git status END ###################################"


対話形式で「git add をしますか」と聞いて入力を求める
read -p "git add ok? (y/N): " yn

#ｙかYで始まる文字でadd実行、それ以外でshを終了する
case "$yn" in [yY]*) ;; *) echo "abort." ; return;; esac

echo "############### git add * START ###################################"
git add *
echo "############### git add *  END ####################################"

#DATE_1はコミットメッセージになる。今回は日付（例：201812251200）を入れている。
DATE_1=`date '+%Y%m%d%H%M'`

対話形式で「git commit をしますか」と聞いて入力を求める
read -p "git commit ok? (y/N): " yn

#ｙかYで始まる文字でcommit実行、それ以外でshを終了する
case "$yn" in [yY]*) ;; *) echo "abort." ; return;; esac

echo "############### git commit -a -m $DATE_1 START ###############"
git commit -a -m "$DATE_1"
echo "############### git commit -a -m $DATE_1 END #################"

#対話形式で「git push をしますか」と聞いて入力を求める
read -p " git push ok? (y/N): " yn

#ｙかYで始まる文字でpush実行、それ以外でshを終了する
case "$yn" in [yY]*) ;; *) echo "abort." ; return;; esac

echo "############### exec git push START ##########################"
git push origin $remoteBranch
echo "############### exec git push END ############################"

echo "end"
