#!/bin/sh
a=$(light)
[ ${a::-3} -lt 50 ] && light -S 50 || light -S 10
