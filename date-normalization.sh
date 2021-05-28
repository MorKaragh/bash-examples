#!/bin/bash

normMonth()
{
    case $1 in
        1 ) return "Январь" ;;   2 ) return "Февраль" ;;
        3 ) return "Март" ;;     4 ) return "Апрель" ;;
        5 ) return "Май" ;;      6 ) return "Июнь" ;;
        7 ) return "Июль" ;;     8 ) return "Август" ;;
        9 ) return "Сентябрь" ;; 10 ) return "Октябрь" ;;
        11 ) return "Ноябрь" ;;  12 ) return "Декабрь" ;;
    esac
}

function isNum()
{
    if [ -z $(echo $1|sed 's/[[:digit:]]//g') ] ; then
        true
    else 
        false
    fi
}

yearIsValid() 
{
    
    if ! isNum $1 || [[ $1 -le 999 ]] || [[ $1 -ge 10000 ]]  ; then
        false
    else
        true
    fi
}

if [ $# -ne 3 ] ; then
    echo "должно быть 3 аргумента!"
    exit 0
fi
  
if yearIsValid $3 ; then 
    echo "OK"
else 
    echo "FAIL"
fi
