#!/bin/bash

containsOnlyNumbersAndLetters()
{
    afterreplace="$(echo $1 | sed -e 's/[^[:alnum:]]//g')"
    if [ "$afterreplace" = "$1" ] ; then
        return 0
    else 
        return 1
    fi
}

containsOnlyNumbersAndLetters $1

case $? in
    0 ) echo "$1 contains only digits and alphabet letters" ;;
    1 ) echo "$1 contains special characters" ;;
esac
