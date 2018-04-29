#!/bin/bash

. gitbucket_version.sh

GITBUCKET_URL=https://github.com/gitbucket/gitbucket/releases/download/${GITBUCKET_VERSION}/gitbucket.war

if [ ! -e $HOME/Downloads/gitbucket.war ]; then
    wget -q -O $HOME/Downloads/gitbucket.war $GITBUCKET_URL
fi

nohup java -jar $HOME/Downloads/gitbucket.war >$HOME/gitbucket.log 2>&1 < /dev/null &

sleep 1

cat $HOME/gitbucket.log | grep --max-count=1 --line-buffered "Started ServerConnector"
