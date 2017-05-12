#!/usr/bin/env bash

MESSAGE=$(cat)

SUBJECT=$(echo "${MESSAGE}" | grep Subject | sed -e 's/Subject: //')
TARGET_URL=$(echo "${MESSAGE}" | grep Via | sed -e 's/Via: //')

echo ${SUBJECT} >> urls.txt
echo ${TARGET_URL} >> urls.txt
echo "" >> urls.txt
