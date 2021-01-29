def strange_sums(nums)
    count = 0
    (0...nums.length - 1).each do |i|
        (i+1...nums.length).each do |j|
            count += 1 if nums[i] + nums[j] == 0
        end
    end
    count
end

p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0

puts '-----------'



def pair_product(nums, product)
    (0...nums.length - 1).each do |i|
        (i+1...nums.length).each do |j|
            return true if nums[i] * nums[j] == product
        end
    end
    false
end

p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false

puts '-----------'



def rampant_repeats(str, hash)
    repeated = ""
    str.each_char {|ch| repeated += hash.has_key?(ch) ? ch * hash[ch] : ch}
    repeated
end

p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

puts '-----------'




def perfect_square?(num)
    (1..num).any? {|i| i * i == num}
end

p perfect_square?(1)     # true
p perfect_square?(4)     # true
p perfect_square?(64)    # true
p perfect_square?(100)   # true
p perfect_square?(169)   # true
p perfect_square?(2)     # false
p perfect_square?(40)    # false
p perfect_square?(32)    # false
p perfect_square?(50)    # false

puts '-----------'




def anti_prime?(num)
    max = 0
    (1...num).each {|n| max = [max, divisors(n)].max}
    divisors(num) > max
end

def divisors(num)
    (1..num).count {|n| num % n == 0}
end

p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false

puts '-----------'




def matrix_addition(m1, m2)
    sum = []
    m1.each_with_index do |spot, i|
        sub = []
        spot.each_with_index do |el, j|
            sub << el + m2[i][j]
        end
        sum << sub
    end
    sum
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

puts '-----------'




def mutual_factors(*nums)
    factors = get_facts(nums.first)
    (1...nums.length).each do |i|
        factors.select! {|fact| nums[i] % fact == 0}
    end
    factors
end

def get_facts(num)
    (1..num).select {|n| num % n == 0} 
end

p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]

puts '-----------'




def tribonacci_number(n)
    return 1 if n == 1 || n == 2
    return 2 if n == 3
    tribonacci_number(n-1) + tribonacci_number(n-2) + tribonacci_number(n-3)
end

p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274

puts '-----------'




def matrix_addition_reloaded(*matrices)
    dimensions = get_dimensions(matrices.first)
    return nil if matrices.any? {|matrix| get_dimensions(matrix) != dimensions}
    finish = []
    (0...matrices[0].length).each do |i|
        sub = []
        (0...matrices[0][0].length).each do |j|
            sum = 0
            matrices.each do |matrix|
                sum += matrix[i][j]
            end
            sub << sum
        end
        finish << sub
    end
    finish
end

def get_dimensions(matrix)
    [matrix[0].length, matrix.length]
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

puts '-----------'




def squarocol?(matrix)
    check_rows(matrix) || check_cols(matrix)
end

def check_rows(matrix)
    matrix.any? do |row|
        row.all? {|el| el == row[0]}
    end
end

def check_cols(matrix)
    # two solutions

    # first one with worse memory
    # (0...matrix.first.length).each do |i|
    #     elements = []
    #     (0...matrix.length).each do |j|
    #         elements << matrix[j][i]
    #     end
    #     return true if elements.all? {|el| el == elements[0]}
    # end
    # false

    # second with better memory
    (0...matrix.first.length).each do |i|
        el = nil
        same = true
        (0...matrix.length).each do |j|
            el ||= matrix[j][i]
            same = false if el != matrix[j][i]
        end
        return true if same
    end
    false
end

p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false

puts '-----------'




def squaragonal?(matrix)
    left_diagonal(matrix) || right_diagonal(matrix)
end

def left_diagonal(matrix)
    val = matrix[0][0]
    (0...matrix.length).each {|i| return false if matrix[i][i] != val}
    true
end

def right_diagonal(matrix)
    i = matrix.length - 1
    val = matrix[i][0]
    (0...matrix[0].length).each do |j|
        return false if matrix[i][j] != val
        i -= 1
    end
    true
end



p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false

puts '-----------'




def pascals_triangle(n)
    triangle = [[1]]
    while triangle.length < n
        triangle << get_next_row(triangle.last)
    end
    triangle
end

def get_next_row(row)
    new_row = [1]
    (1..row.length).each do |i|
        neighbor = row[i-1] || 0
        curr = row[i] || 0
        new_row << neighbor + curr
    end
    new_row
end

p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]

puts '-----------'




def mersenne_prime(n)
    2.pow(n+1) - 1
end


p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071

puts '-----------'




def triangular_word?(word)
    coding = get_code(word)
    i = 1
    tnum = 1
    while tnum < coding
        i += 1
        tnum = (i * (i+1)) / 2
    end
    coding == tnum
end

def get_code(word)
    alpha = ('a'..'z').to_a
    code = 0
    word.each_char {|ch| code += alpha.index(ch) + 1}
    code
end

p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false

puts '-----------'




def consecutive_collapse(nums)
    i = 0
    while i < nums.length - 1
        difference = (nums[i] - nums[i+1]).abs
        if difference == 1
            nums = nums[0...i] + nums[i+2..-1]
            i -= 1
        else
            i += 1
        end
    end
    nums
end

p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []

puts '-----------'




def pretentious_primes(arr, n)
    direction = n > 0
    arr.map{|el| get_nth_prime(el, direction, n.abs)}
end

def get_nth_prime(num, direction, n)
    incrementer = direction ? 1 : -1
    count = 0
    while count < n
        num += incrementer
        return nil if num < 2
        count += 1 if prime?(num)
    end
    num
end

def prime?(num)
    (2..(num/2)).none? {|n| num % n == 0}
end

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]

puts '-----------'