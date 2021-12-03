LINES = File.foreach("3.input").map { |line| line.chomp }.to_a
BITS = LINES.first.length

def d(i, n, tie = nil)
    z = n.count { |x| x[i] == '0' }
    o = n.count - z
    if z == o
        tie
    else
        if yield z, o
            '0'
        else
            '1'
        end
    end
end

g = (0...BITS).map {|i| d(i, LINES, '1') {|a,b| a > b}}.inject(&:+).to_i 2
e = (0...BITS).map {|i| d(i, LINES, '0') {|a,b| a < b}}.inject(&:+).to_i 2

puts "Part 1: #{g * e}"

def r(tie, &c)
    xs = LINES
    (0...BITS).each do |i|
        break if xs.count == 1
        b = d(i, xs, tie, &c)
        xs = xs.filter {|x| x[i] == b}
    end
    xs.first
end

o = r('1') { |a, b| a > b }.to_i 2
c = r('0') { |a, b| a < b }.to_i 2

puts "Part 2: #{o * c}"
