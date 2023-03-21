#!/bin/sh

echo "{\"text\": \"checking updates…\"}"
output=$(sudo checkupdates)
if [ $? -eq 1 ]; then
    echo "{\"text\": \"ERROR: Cannot fetch updates\"}"
    exit 1
fi
count=$(echo "$(echo "${output}" | wc -l) - 1" | bc )
pkgnames=$(echo "${output}" | awk '{print$1}')
versions=$(echo "${output}" | sed -z 's/\n/\\n/g; s/->/→/g')

[ "${count}" -gt 0 ] && notify-send "Pacman" "${count} package updates available"
echo "{\"text\":\""${count}"\",\"alt\":\""${pkgnames}"\",\"tooltip\":\""${versions::-2}"\"}"
