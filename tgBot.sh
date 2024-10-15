#!/bin/bash

read -p "Text: " some_text
read -p "Chat ID: " chat_id
read -p "Bot token: " bot_token

url="https://api.telegram.org/bot$bot_token/sendMessage?chat_id={"$chat_id"}&text={"$some_text"}"

curl -X post $url
if[$?-eq 0]; then 
echo "ok"
else 
echo "error"
fi

