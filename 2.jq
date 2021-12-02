$input
    | split("\n")[:-1]
    | map(split(" "))
    | reduce .[] as $item (
        [0, 0];
        . as $dot
        | $item
        | [.[0], (.[1]|tonumber)]
        |  (select(.[0] == "forward") | [$dot[0] + .[1], $dot[1]])
        // (select(.[0] == "down") | [$dot[0], $dot[1] + .[1]])
        // (select(.[0] == "up") | [$dot[0], $dot[1] - .[1]]))
    | .[0] * .[1]

|

$input
    | split("\n")[:-1]
    | map(split(" "))
    | reduce .[] as $item (
        [0, 0, 0];
        . as $dot
        | $item
        | [.[0], (.[1]|tonumber)]
        |  (select(.[0] == "forward") | [$dot[0] + .[1], $dot[1] + $dot[2] * .[1], $dot[2]])
        // (select(.[0] == "down") | [$dot[0], $dot[1], $dot[2] + .[1]])
        // (select(.[0] == "up") | [$dot[0], $dot[1], $dot[2] - .[1]]))
    | .[0] * .[1]
