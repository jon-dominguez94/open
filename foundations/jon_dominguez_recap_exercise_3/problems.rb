# GENERAL PROBLEMS

def no_dupes?(arr)
    count = Hash.new(0)
    arr.each {|el| count[el] += 1}
    once = count.select {|k,v| v == 1}
    once.keys
end

p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []




def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |i|
        return false if arr[i] == arr[i+1]
    end
    true
end

puts no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
puts no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
puts no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
puts no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
puts no_consecutive_repeats?(['x'])                              # => true




def char_indices(str)
    indices = Hash.new {|h,k| h[k] = []}
    str.each_char.with_index do |ch, i|
        indices[ch] << i
    end
    indices
end

p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}




def longest_streak(str)
    streak = ""
    curr = str[0]
    (1..str.length).each do |i|
        ch = str[i]
        if ch == curr[-1]
            curr += ch
        else
            streak = curr if curr.length >= streak.length
            curr = ch
        end
    end
    streak
end

p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'




def bi_prime?(num)
    pfacts = prime_factors(num)
    pfacts.each do |n|
        return pfacts.any? {|m| n*m == num}
    end
end

def prime_factors(num)
    (2..(num/2)).select {|i| num % i == 0 && prime?(i)}
end

def prime?(num)
    (2..(num/2)).none? {|i| num % i == 0}
end

puts bi_prime?(14)   # => true
puts bi_prime?(22)   # => true
puts bi_prime?(25)   # => true
puts bi_prime?(94)   # => true
puts bi_prime?(24)   # => false
puts bi_prime?(64)   # => false




def vigenere_cipher(message, keys)
    cipher = ""
    curr = 0
    message.each_char do |ch|
        cipher += v_translate(ch, keys[curr])
        curr = (curr + 1) % keys.length
    end
    cipher
end

def v_translate(letter, num)
    alpha = ('a'..'z').to_a
    idx = (alpha.index(letter) + num) % alpha.length
    alpha[idx]
end

puts vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
puts vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
puts vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
puts vigenere_cipher("zebra", [3, 0])            # => "ceerd"
puts vigenere_cipher("yawn", [5, 1])             # => "dbbo"




def vowel_rotate(str)
    vowels = "aeiou"
    indices = []
    str.each_char.with_index {|ch, i| indices << i if vowels.include?(ch)}
    char = str[indices.last]
    indices.each do |replace|
        char, str[replace] = str[replace], char
    end
    str
end

puts vowel_rotate('computer')      # => "cempotur"
puts vowel_rotate('oranges')       # => "erongas"
puts vowel_rotate('headphones')    # => "heedphanos"
puts vowel_rotate('bootcamp')      # => "baotcomp"
puts vowel_rotate('awesome')       # => "ewasemo"






# PROC PROBLEMS

class String
    def select(&prc)
        str = ""
        return "" if !prc
        self.each_char {|ch| str += ch if prc.call(ch)}
        str
    end
end

p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""




class String
    def map!(&prc)
        self.each_char.with_index do |ch, i|
            self[i] = prc.call(ch, i)
        end
    end
    self
end

word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"







# RECURSION PROBLEMS
def multiply(a, b)
    return 0 if b == 0
    product = a + multiply(a, b.abs - 1)
    b < 0 ? product * -1 : product
end

puts multiply(3, 5)        # => 15
puts multiply(5, 3)        # => 15
puts multiply(2, 4)        # => 8
puts multiply(0, 10)       # => 0
puts multiply(-3, -6)      # => 18
puts multiply(3, -6)       # => -18
puts multiply(-3, 6)       # => -18




def lucas_sequence(n)
    case n
    when 0
        []
    when 1
        [2]
    when 2
        [2,1]
    else
        last = lucas_sequence(n-1)
        last + [last[-1] + last[-2]]
    end
end

p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]




def prime_factorization(num)
    # return [num] if prime?(num)
    # first_prime = find_prime_factor(num)
    # return [first_prime] + prime_factorization(num/first_prime)
    (2...(num/2)).each do |n|
        if num % n == 0
            multiplier = num / n
            return prime_factorization(n) + prime_factorization(multiplier)
        end
    end
    [num]
end

def prime?(num)
    (2..(num/2)).none? {|n| num % n == 0}
end

def find_prime_factor(num)
    (2..(num/2)).each {|n| return n if num % n == 0 && prime?(n)}
end

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]