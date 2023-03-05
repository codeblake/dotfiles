#!/bin/sh

echo "{\"text\": \"checking updates…\"}"
output=$(sudo checkupdates)
if [ $? -eq 1 ]; then
		echo "{\"text\": \"ERROR: Cannot fetch updates\"}"
		exit 1
fi
count=$(echo "${output}" | wc -l)
pkgnames=$(echo "${output}" | awk '{print$1}')
[ "${count}" -gt 0 ] && notify-send "Pacman" "${count} package updates available"
echo "{\"text\":\""${count}"\",\"alt\":\""${pkgnames}"\",\"tooltip\":\""${pkgnames}"\"}"
