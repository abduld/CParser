#!/bin/sh

LLVM_DIR=$HOME/Code/llvm/include/llvm-c

rm -fr *.json

for ii in ${LLVM_DIR}/*h; do
    echo `basename ${ii}`
    ./lcdecl -Zpass -D__has_builtin\(x\)=1 -D__has_feature\(x\)=1  -D__x86_64__=1  -D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS  -std=c11 "${ii}" -o `basename ${ii} .h`.json;
done
