#!/bin/sh
[[ "$(light)" < 50 ]] && light -S 50 || light -S 10
