#!/bin/bash

in_path()
{
    cmd=$1
    parampath=$2
    result=1
    array=$(echo $parampath | tr ":" "\n")

    for dir in $array
    do
        if [ -x $dir/$cmd ] ; then
            result=0
        fi
    done
    return $result
}

findCmdInPath()
{
    cmd=$1
    if [ "$cmd" != "" ] ; then
        if [ "${cmd:0:1}" = "/" ] ; then
            if [ ! -x $cmd ] ; then
                return 1
            fi
        elif  ! in_path $cmd $PATH ; then
            return 2
        fi
    fi
}

if [ $# -ne 1 ] ; then
    echo "WTF $0" >&2
    exit 1
fi

findCmdInPath "$1"

case $? in
    0 ) echo "$1 in path" ;;
    1 ) echo "$1 not in path or not executable" ;;
    2 ) echo "$1 not in path" ;;
esac

exit 0