# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    (1..num).reverse_each do |i|
        return i if num % i == 0 && prime?(i)
    end
end

def prime?(num)
    (2..(num/2)).each {|i| return false if num % i == 0}
    true
end

def unique_chars?(str)
    count = Hash.new(0)
    str.each_char do |ch|
        return false if count.has_key?(ch)
        count[ch] += 1
    end
    true
end

def dupe_indices(arr)
    indices = {}
    arr.each_with_index do |el, i|
        indices.has_key?(el) ? indices[el] << i : indices[el] = [i]
    end
    indices.select {|k,v| v.length > 1}
end

def ana_array(arr1, arr2)
    char_count(arr1) == char_count(arr2)
end

def char_count(arr)
    count = Hash.new(0)
    arr.each do |ch|
        count[ch] += 1
    end
    count
end

