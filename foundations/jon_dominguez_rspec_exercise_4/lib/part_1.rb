def my_reject(arr, &prc)
    chosen = []
    arr.each {|el| chosen << el if !prc.call(el)}
    chosen
end

def my_one?(arr, &prc)
    count = 0
    arr.each {|el| count += 1 if prc.call(el)}
    count == 1
end

def hash_select(hash, &prc)
    selected = {}
    hash.each {|k,v| selected[k] = v if prc.call(k,v)}
    selected
end

def xor_select(arr, prc1, prc2)
    selected = []
    arr.each do |el|
        first = prc1.call(el)
        second = prc2.call(el)
        selected << el if (first || second) && !(first && second)
    end
    selected
end

def proc_count(val, procs)
    count = 0
    procs.each {|prc| count += 1 if prc.call(val)}
    count
end