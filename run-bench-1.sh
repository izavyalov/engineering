#!/bin/bash
#
# This program runs benchmark of two compilation approaches:
#  1. explicit include 'stdio.h' header
#  2. use external function declaration
#
# See: ./src/app.c
#
#                                      - Vasiliy Zavyalov, 24-01-2020
#
# REQUIRED: hyperfine - benchmarking tool
#     Link: https://github.com/sharkdp/hyperfine/releases/tag/v1.9.0

mkdir -p build
pushd build
  hyperfine --warmup 10 'rm -f incl   ; gcc -O2 -DDO_INCLUDES ../src/app.c -o incl  '\
                        'rm -f noincl ; gcc -O2               ../src/app.c -o noincl'
popd

