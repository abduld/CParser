#!/bin/sh 
LLVM_DIR=$HOME/Code/llvm/include/llvm-c
TRGT=$PWD/output
mkdir -p ${TRGT}
rm -fr ${TRGT}/*.json


CMD="${PWD}/lcdecl -Zpass -D__has_builtin\(x\)=1 -D__has_feature\(x\)=1  -D__x86_64__=1  -D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS  -std=c11"

for ii in ${LLVM_DIR}/*h; do
    echo `basename ${ii}`
    ${CMD} "${ii}" -o ${TRGT}/`basename ${ii} .h`.json;
done

for ii in ${LLVM_DIR}/Transforms/*h; do
    echo `basename ${ii}`
    ${CMD} "${ii}" -o ${TRGT}/`basename ${ii} .h`.json;
done
