#!/bin/bash

list_recursive()
{
    local filepath=$1
    local ident=$2

    # 들여쓰기를 적용하고 파일 이름만 추출하여 출력
    echo "${ident}${filepath##*/}"

    if [ -d "$filepath" ]; then
        local fname
        for fname in $(ls "$filepath")
        do
            # 디렉터리 내 파일 출력
            # echo "${filepath}/${fname}"

            # 디렉터리라면 list_recursive를 재귀 호출
            # list_recursive "${filepath}/${fname}"

            # 들여쓰기를 위한 공백을 추가하여 재귀 호출
            list_recursive "${filepath}/${fname}" " $indent"
        done
    fi
}

list_recursive "$1" ""