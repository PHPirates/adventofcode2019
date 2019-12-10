#=
Day1Part1:
- Julia version: 1.3.0
- Author: thomas
- Date: 2019-12-07
=#

input = readlines("src/day1/day1.input")
fuel = @. parse(Int, input) ÷ 3 - 2
println(sum(fuel))