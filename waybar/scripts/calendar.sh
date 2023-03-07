#!/bin/sh
text=$(date +%F)
alt=$(date +"%A, %d %B %Y")
echo "{\"text\":\""${text}"\",\"alt\":\""${alt}"\"}"