#!/usr/bin/env bash

for file in *"$1"; do
    mv "$file" "$(basename "$file" $1)$2"
done
