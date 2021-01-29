def palindrome?(str)
    reversed = ""
    str.each_char {|ch| reversed = ch + reversed}
    str == reversed
end

def substrings(str)
    subs = []
    str.each_char.with_index do |ch, i|
        (i...str.length).each do |j|
            subs << str[i..j]
        end
    end
    subs
end

def palindrome_substrings(str)
    subs = substrings(str)
    subs.select {|word| word.length > 1 && palindrome?(word)}
end