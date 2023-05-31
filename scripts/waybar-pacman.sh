#!/bin/sh

echo "{\"text\": \"checking updates…\"}"
output=$(sudo checkupdates)

if [ $? -eq 1 ]; then
    echo "{\"text\": \"ERROR: Cannot fetch updates\"}"
    exit 1
elif [ -z $output ]; then
    echo "{\"text\":0,\"alt\":\"Up to date\",\"tooltip\":\"No packages to update\"}"
    exit 0
fi

count=$(echo "${output}" | wc -l)
pkgnames=$(echo "${output}" | awk '{print$1}' | column -t)
versions=$(echo "${output}" | sed -z 's/\n/\\n/g; s/->/→/g')

[ "${count}" -gt 0 ] && notify-send -t 10000 "${count} Available Updates" "${pkgnames}"
echo "{\"text\":"${count}",\"alt\":\""${pkgnames}"\",\"tooltip\":\""${versions::-2}"\"}"
