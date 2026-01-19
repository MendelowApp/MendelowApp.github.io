#! /bin/bash 
###########################################
# 
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
cwdDir=$PWD
export PYTHONNOUSERSITE=1
export PYTHONUNBUFFERED=1
#export PATH=/opt/miniconda3/envs/venv-py3/bin:$PATH
export TS=$(date +%Y%m%d%H%M%S)
export DATE=`date "+%Y%m%d"`
export DATE_WITH_TIME=`date "+%Y%m%d-%H%M%S"` #add %3N as we want millisecond too

# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return

cd $baseDir

# 读取 token
if [ ! -e localrc ]; then
    echo "File not found, localrc"
    exit 1
fi

source localrc

######################################################
# 编辑 baidu_urls.txt
# 只保留要增加的 10 个 URL 网址
######################################################
pwd
set -x
curl -H 'Content-Type:text/plain' --data-binary @baidu_urls.txt "http://data.zz.baidu.com/urls?site=https://mendelow.chatopera.com&token=${BAIDU_TOKEN}"