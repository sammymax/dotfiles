#!/bin/bash

free | awk '/Mem/ { printf "%.2fGB\n", $3/1024/1024 }'
