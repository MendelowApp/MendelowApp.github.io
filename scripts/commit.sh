#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd -P `dirname "$0"`;pwd)
export PYTHONUNBUFFERED=1
export PATH=/opt/miniconda3/envs/venv-py3/bin:$PATH

# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
cd $baseDir/..
git add --all
git commit -m "Update contents"
git pull origin master -ff

if [ ! $? -eq 0 ]; then
    echo "Failed, fix manullay"
    exit 1
fi

# git push origin master
git push github master
echo "Updated contents"