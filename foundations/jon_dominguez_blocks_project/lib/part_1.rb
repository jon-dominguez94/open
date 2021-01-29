def select_even_nums(nums)
    nums.select(&:even?)
end

def reject_puppies(dogs)
    dogs.reject{|hash| hash["age"] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count {|subs| subs.sum > 0}
end

def aba_translate(word)
    final = ""
    word.each_char do |ch|
        final += ch
        final += "b" + ch if "aeiou".include?(ch)
    end
    final
end

def aba_array(words)
    words.map{|word| aba_translate(word)}
end

