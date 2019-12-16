#=
Day4:
- Julia version: 1.3.0
- Author: thomas
- Date: 2019-12-16
=#

function isvalid(password)
    success = false
   for i = 2:6
    if password[i] == password[i - 1]
        return true
        end
        end
        return false
end

function main(startRange, endRange)
    counter = 0
    next = startRange
    while next ≤ endRange

        println(next)

        if isvalid(next)
            counter += 1
            println(next)
        end
        next[6] += 1
        for i = 6:-1:2
            if next[i] == 10
                if i > 2
                    if next[i-1] >= next[i-2]
                        next[i-1] += 1
                    else
                        next[i - 1] = next[i - 2]
                    end
                else
                    next[i - 1] += 1
                end
                next[i] = next[i-1] % 10
            end
            if next[1] == 10
                error("out of digits")
            end
        end

    end
    println(counter)
end

main([1, 6, 8, 8, 8, 8], [7, 1, 8, 0, 9, 8])