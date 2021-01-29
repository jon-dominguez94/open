def element_count(arr)
    count = Hash.new(0)
    arr.each {|el| count[el] += 1}
    count
end

def char_replace!(str, hash)
    str.each_char.with_index {|ch,i| str[i] = hash[ch] || ch}
end

def product_inject(num)
    num.inject {|acc, el| acc*el}
end