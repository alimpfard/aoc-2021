var data = loadJSON("1.json").map(x => parseInt(x));
var part = 2;

function part_1() {
    return data.reduce(
        (acc, x) => ({
            counter: acc.counter + (acc.prev !== null && acc.prev < x),
            prev: x
        }),
        {prev:null, counter:0}
    ).counter;
}

function sum(x) { return x.reduce((acc, x) => acc + x, 0); }

function part_2() {
    let r = data.reduce(
            (acc, x) => ({
                windows: acc.temp.length == 3 ? [...acc.windows, acc.temp] : acc.windows,
                temp: [...acc.temp.slice(acc.temp.length == 3), x]
            }),
            { windows: [], temp: [] }
        );
    if (r.temp.length == 3)
        r.windows.push(r.temp);
    return r.windows.reduce(
            (acc, x) => {
                const s = sum(x);
                console.log(acc.prev, s, x[0], x[1], x[2]);
                return {
                    counter: acc.counter + (acc.prev !== null && acc.prev < s),
                    prev: s
                }
            },
            {prev:null, counter:0}
        ).counter;
}

if (part == 1) console.log(part_1());
else console.log(part_2());
