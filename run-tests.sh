#!/bin/bash

set -e

cd /app

for VER in 5.1 5.2 5.3 jit
do
    echo "Testing with lua v$VER"
    /usr/bin/lua$VER /app/test.lua
    echo
done
