#!/bin/Shell

if test $# -lt 1 {
    echo "Invalid number of arguments: $#"
    echo "Usage: $0 <problem number>"
    exit 1
}

problem_number=$1
if not test -e $problem_number.json {
    {
        echo "["
        first=true
        for line in $(cat $problem_number.input) {
            $first || echo ','
            first=false
            echo '    "'$line'"'
        }
        echo "]"
    } | tee problem_number.json
}

match $(grep ^$problem_number\. solutions.list) {
    *\ * as (name runner) {
        $runner $name
    }
}

