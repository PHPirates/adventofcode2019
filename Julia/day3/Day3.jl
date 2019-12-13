#=
Day3:
- Julia version: 1.3.0
- Author: thomas
- Date: 2019-12-12
=#

using DelimitedFiles
using Debugger

struct Point
    x::Int
    y::Int
    steps::Int
end

Base.hash(a::Point, h::UInt) = hash(a.y, hash(a.x, hash(:Point, h)))
Base.isequal(a::Point, b::Point) = Base.isequal(hash(a), hash(b))

mutable struct Turtle
    x::Int
    y::Int
end

function main(input::Array{String, 2})
   points = [Set{Point}(), Set{Point}()]

   # Current point of drawing
   turtles = [Turtle(0, 0), Turtle(0, 0)]

   crossings = Set{Point}()

    for wire = 1:2
        steps = 0

        for i = 1:size(input)[2]
            instruction = input[wire, i]
            direction = instruction[1]
            length = parse(Int, instruction[2:end])

            turtle = turtles[wire]

            for j = 1:length
                steps += 1
                push!(points[wire], Point(turtle.x, turtle.y, steps))

                if direction == 'R'
                    turtle.x += 1
                elseif direction == 'L'
                    turtle.x -= 1
                elseif direction == 'U'
                    turtle.y += 1
                elseif direction == 'D'
                    turtle.y -= 1
                else
                    error("Incorrect direction found: ", direction)
                end
            end
        end
    end

    crossings = intersect(points[1], points[2])
    delete!(crossings, Point(0, 0, 0))

    closest = nothing
    for crossing in crossings
        if closest == nothing || abs(crossing.x) + abs(crossing.y) < abs(closest.x) + abs(closest.y)
            closest = crossing
        end
    end

    println(abs(closest.x) + abs(closest.y))

end

# main(["R8" "U5" "L5" "D3"; "U7" "R6" "D4" "L4"])
main(readdlm("Julia/day3/day3.input", ',', String, '\n'))
