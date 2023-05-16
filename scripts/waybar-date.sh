#!/bin/sh
alt=$(date +%F)
text=$(date +"%A, %d %B %Y")
echo "{\"text\":\""${text}"\",\"alt\":\""${alt}"\"}"
