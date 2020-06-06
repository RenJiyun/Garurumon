#! /bin/bash

BASE_PATH=$(cd `dirname $0`; pwd)
docker build -t elephant $BASE_PATH
docker tag giraffe eggip/giraffe:latest

# 若未登录，请先登录
docker push eggip/giraffe:latest
