#=
Day2Part1:
- Julia version: 1.3.0
- Author: thomas
- Date: 2019-12-08
=#

using DelimitedFiles

function runprogram(input, input1=12, input2=2)
    input[2] = input1
    input[3] = input2

    counter::Int = 1

    while counter ≤ length(input)
        if input[counter] == 1
            # +1 everywhere because indexing starts at 1
            input[input[counter + 3] + 1] = input[input[counter + 1] + 1] + input[input[counter + 2] + 1]
        elseif input[counter] == 2
            input[input[counter + 3] + 1] = input[input[counter + 1] + 1] * input[input[counter + 2] + 1]
        elseif input[counter] == 99
            break
        end

        counter += 4
    end

    return input[1]
end

function part2()
    input = readdlm("src/day2/day2.input", ',', Int, '\n')

    for i = 0:99, j = 0:99
        if runprogram(copy(input), i, j) == 19690720
           println(100 * i + j)
           break
        end
    end
end

# runprogram(readdlm("src/day2/day2.input", ',', Int, '\n'))
part2()