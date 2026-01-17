#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
cwdDir=$PWD
export PYTHONUNBUFFERED=1
export PATH=/opt/miniconda3/envs/venv-py3/bin:$PATH
export TS=$(date +%Y%m%d%H%M%S)
export DATE=`date "+%Y%m%d"`
export DATE_WITH_TIME=`date "+%Y%m%d-%H%M%S"` #add %3N as we want millisecond too

# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return

# check node
node --version
if [ ! $? -eq 0 ]; then
    echo "Ndoe not found"
fi

which node
echo "WARN node v22 is required."


cd $baseDir/..

if [ -d _build ]; then
    rm -rf _build
fi

mkdir _build

cp -rf data _build/_data
cp -rf posts _build/_posts
cp -rf categories _build/categories
cp -rf media _build/media
cp -rf tags _build/tags


# fix attachement paths
cd $baseDir/..
cd _build/_posts

for x in `ls`; do
    echo "[fix-media-path] Processing" $x
    sed -i "s/\](..\/media/](media/g" $x
done

# build
cd $baseDir/..
rm -rf _public
npm install

# fix hexo word counter download error for index.node
if [ ! -e node_modules/hexo-word-counter/index.node ]; then
    cd $baseDir/../deployment/fixtures/hexo-word-counter
    tar czfp - .|(cd $baseDir/../node_modules/hexo-word-counter;tar xzfp -)
fi

node node_modules/hexo-cli/bin/hexo generate

if [ ! $? -eq 0 ]; then
    echo "Build error"
    exit 2
fi

if [ ! -f $baseDir/../_public/index.html ]; then
    echo "index.html not found"
    exit 1
fi

# copy assets
cd $baseDir/..



echo "Build done."