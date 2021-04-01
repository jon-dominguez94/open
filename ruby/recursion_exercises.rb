def range(start, stop)
    return [] if start > stop
    return [start] if start == stop
    [start] + range(start + 1, stop)
end

puts "-------RANGE-------"
p range(5, 1) # []
p range(1, 5) # [1, 2, 3, 4, 5]
p range(-1, 1) # [-1, 0, 1]
p range(2, 2) # [2]



def iter_sum(arr)
    sum = 0
    arr.each {|num| sum += num}
    sum
end

puts "-------ITERATIVE SUM-------"
puts iter_sum([1,2,3,4,5]) # 15
puts iter_sum([-1,2,1]) # 2
puts iter_sum([]) # 0



def rec_sum(arr)
    return 0 if arr.empty?
    arr.first + rec_sum(arr[1..-1])
end

puts "-------RECURSIVE SUM-------"
puts rec_sum([1,2,3,4,5]) # 15
puts rec_sum([-1,2,1]) # 2
puts rec_sum([]) # 0



def exponentiation_1(base, power)
    return 1 if power == 0
    return base if power == 1
    base * exponentiation_1(base, power - 1)
end

puts "-------EXPONENTIATION ONE-------"
puts exponentiation_1(5,3) # 125
puts exponentiation_1(100, 0) # 1
puts exponentiation_1(2, 6) # 64



def exponentiation_2(base, power)
    return 1 if power == 0
    return base if power == 1
    if power.even?
        val = exponentiation_2(base, power/2)
        val * val 
    else
        val = exponentiation_2(base, (power-1) / 2)
        base * (val * val)
    end
end

puts "-------EXPONENTIATION TWO-------"
puts exponentiation_2(5,3) # 125
puts exponentiation_2(100, 0) # 1
puts exponentiation_2(2, 6) # 64



def deep_dup(arr)
    duped = []
    arr.each do |el|
        if el.is_a?(Array)
            duped << deep_dup(el)
        else
            duped << el
        end
    end
    duped
end

puts "-------DEEP DUP-------"
p deep_dup([]) # []
arr = [1,2,3]
p deep_dup(arr) # [1,2,3]
arr = [1,[2,3], 4]
p deep_dup(arr) # [1,[2,3], 4]
arr = [1,[2,3], [4,[5,[6]], 7]]
p deep_dup(arr) # [1,[2,3], [4,[5,[6]], 7]]
