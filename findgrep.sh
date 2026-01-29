#!/bin/bash

usage()
{
    # 셸 스크립트의 파일 이름을 취득
    local script_name=$(basename "$0")

    # 도움말 표시
    cat << END
Usage: $script_name PATTERN [PATH] [NAME_PATTERN]
Find file in current directory recursively, and print lines which match PATTERN.

        PATH          find file in PATH directory, instead of current directory
        NAME_PATTERN  specify name pattern to find file

    Examples:
        $script_name return
        $script_name return ~ '*.txt'
END
}


#커맨드 라인의 인자 개수가 0인 경우
if [ "$#" -eq 0 ]; then
    usage
    exit 1  # 종료 상태 1로 종료
fi

pattern=$1
directory=$2
name=$3

# 두 번째 인자가 빈 문자열이면 기본값으로 현재 디렉터리를 설정
if [ -z "$directory" ]; then
    directory='.'
fi

# 세 번째 인자가 빈 문자열이면 기본값으로 '*' tjfwjd
if [ -z "$name" ]; then
    name='*'
fi

# 검색 디렉터리가 존재하지 않으면 에러 메시지를 출력하고 종료
if [ ! -d "$directory" ]; then
    echo "$0: ${directory}: No such directory" 1>&2
    exit 2
fi


finnd "$directory" -type f -name "$name" | xargs grep -nH "$pattern"