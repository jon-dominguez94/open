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



def fibonacci(n)
    return [] if n <= 0
    return [1] if n == 1
    return [1,1] if n == 2
    last = fibonacci(n-1)
    last + [last[-2] + last[-1]]
end


puts "-------FIBONACCI-------"
p fibonacci(-1) # []
p fibonacci(0) # []
p fibonacci(1) # [1]
p fibonacci(6) # [1,1,2,3,5,8]



def binary_search(arr, target)
    return nil if arr.empty?
    mid = arr.length / 2
    return mid if target == arr[mid]
    left = arr[0...mid]
    right = arr[mid+1..-1]
    rval = binary_search(right, target)
    if rval
        mid + 1 + rval
    else 
        binary_search(left, target)
    end
end

puts "-------BINARY_SEARCH-------"
p binary_search([1, 2, 3], 1) # => 0
p binary_search([2, 3, 4, 5], 3) # => 1
p binary_search([2, 3, 4, 5, 6, 7, 8, 9, 10], 5) # => 3
p binary_search([2, 4, 6, 8, 10], 6) # => 2
p binary_search([1, 3, 4, 5, 9], 5) # => 3
p binary_search([1, 2, 3, 4, 5, 6], 6) # => 5
p binary_search([1, 2, 3, 4, 5, 6], 0) # => nil
p binary_search([1, 2, 3, 4, 5, 7], 6) # => nil