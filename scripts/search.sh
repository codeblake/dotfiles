#!/bin/sh
query=$(wofi -dep "Search online" -L 0)
[ ! -z "${query}" ] && librewolf -new-window "https://search.ononoki.org/search?q=${query}"
