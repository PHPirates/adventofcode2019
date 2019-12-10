#=
day1:
- Julia version: 1.3.0
- Author: thomas
- Date: 2019-12-07
=#

function getfuel(weight::Int)
    total = 0
    additionalfuel::Int = weight

    while additionalfuel > 0
        additionalfuel = additionalfuel ÷ 3 - 2
        total += max(additionalfuel, 0)
    end

    total
end

function gettotalfuel()
    input = readlines("src/day1/day1.input")
    total = @. getfuel(parse(Int, input))
    sum(total)
end

println(gettotalfuel())