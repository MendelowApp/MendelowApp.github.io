#! /bin/bash 
###########################################
# Repull and recreate dev containers for superbrain
# Wiki, https://wiki.chatopera.com/display/chatbot/Chatopera+Docker+Registry
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
DOCKER_SAVED=$baseDir/../tmp/docker
INTERNAL_HOST=http://192.168.2.19:30080/docker

# functions

function prepareDockerImage(){
    PKG_FILENAME=$1

    if [ ! -d $DOCKER_SAVED ]; then
        mkdir -p $DOCKER_SAVED
    fi

    cd $DOCKER_SAVED
    echo "Working in" `pwd`
    
    if [ ! -d images ]; then
        mkdir images
    fi

    if [ ! -f images/$PKG_FILENAME ]; then
        cd images
        wget $INTERNAL_HOST/$PKG_FILENAME
    fi

    cd $DOCKER_SAVED
    docker load < images/$PKG_FILENAME
}


# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
cd $baseDir/..

if [ $# -lt 1 ]; then
    echo "Usage: $0 PKG_FILENAME"
    echo "  Get PKG_FILENAME in http://192.168.2.19:30080/docker/"
    exit 1
fi

PKG_FILENAME=$1
prepareDockerImage $PKG_FILENAME

if [ ! -f $DOCKER_SAVED/images/$PKG_FILENAME ]; then
    echo "[error] Not Found, $DOCKER_SAVED/images/$PKG_FILENAME"
    exit 1
fi

echo "[succ] image loaded."