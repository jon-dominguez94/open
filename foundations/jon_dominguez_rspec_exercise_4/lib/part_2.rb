def proper_factors(num)
    facts = []
    (1..(num/2)).each {|n| facts << n if num % n == 0}
    facts
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(n)
    nums = []
    i = 1
    while nums.length < n
        nums << i if perfect_number?(i)
        i += 1
    end
    nums
end