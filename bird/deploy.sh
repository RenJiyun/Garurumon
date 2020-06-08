#! /bin/bash

BASE_PATH=$(cd `dirname $0`; pwd)
docker build -t bird $BASE_PATH
docker tag bird eggip/bird:latest

# 若未登录，请先登录
docker push eggip/bird:latest
