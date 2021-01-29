def partition(arr, num)
    less = arr.select {|el| el < num}
    greater = arr.select {|el| el >= num}
    [less, greater]
end

def merge(h1, h2)
    lap = {}
    h1.each {|k,v| lap[k] = v}
    h2.each {|k,v| lap[k] = v}
    lap 
end

def censor(sent, words)
    vowels = "aeiou"
    censored = []
    sent.split(" ").each do |word|
        if words.include?(word.downcase)
            fixed = ""
            word.each_char {|ch| fixed += (vowels.include?(ch.downcase) ? "*" : ch)}
            censored << fixed
        else
            censored << word
        end
    end
    censored.join(" ")
end

def power_of_two?(num)
    power = 1
    while power < num
        power *= 2
    end
    power == num
end

