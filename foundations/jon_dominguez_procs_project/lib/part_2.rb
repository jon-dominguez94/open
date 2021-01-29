def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(sent, &prc)
    changed = []
    sent.split(" ").each {|word| changed << prc.call(word) }
    changed.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    [prc1.call(num), prc2.call(num)].max
    
end

def and_selector(arr, prc1, prc2)
    both = []
    arr.each {|el| both << el if prc1.call(el) && prc2.call(el)}
    both
end

def alternating_mapper(arr, prc1, prc2)
    final = []
    arr.each_with_index do |el, i|
        final << (i.even? ? prc1.call(el) : prc2.call(el))
    end
    final
end

