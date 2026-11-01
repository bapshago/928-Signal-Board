#!/bin/sh
# Compile the signal board sketch on a PC against fake Arduino/ESP32 libraries and run the checks.
# Needs g++ (C++17). Prints ALL OK when everything passes.
set -e
here=$(cd "$(dirname "$0")" && pwd)
out=$(mktemp -d)
g++ -std=c++17 -Wall -Werror -I"$here" -DSKETCH="\"$here/../signal_module_928/signal_module_928.ino\"" \
    -x c++ "$here/test_signal_module.cpp" -o "$out/test_signal_module"
"$out/test_signal_module"
