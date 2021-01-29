def zip(*arrs)
    zipped = Array.new(arrs[0].length) {[]}
    (0...arrs[0].length).each do |i|
        arrs.each {|arr| zipped[i] << arr[i]}
    end
    zipped
end

def prizz_proc(arr, prc1, prc2)
    passed = []
    arr.each do |el|
        first = prc1.call(el)
        second = prc2.call(el)
        passed << el if (first || second) && !(first && second)
    end
    passed
end

def zany_zip(*arrs)
    size = arrs.map(&:length).max
    zipped = Array.new(size) {[]}
    (0...size).each do |i|
        arrs.each {|arr| zipped[i] << arr[i] || nil}
    end
    zipped
end

def maximum(arr, &prc)
    return nil if arr.empty?
    val = prc.call(arr.first)
    max = arr.first
    arr.each do |el|
        max = el if prc.call(el) >= val
    end
    max
end

def my_group_by(arr, &prc)
    group = Hash.new {|h,k| h[k] = []}
    arr.each do |el|
        key = prc.call(el)
        group[key] << el
    end
    group
end

def max_tie_breaker(arr, prc1, &prc2)
    return nil if arr.empty?
    max, best = prc2.call(arr.first), arr.first
    arr.each do |el|
        val = prc2.call(el)
        case (max <=> val)
        when 0
            val2 = prc1.call(el)
            case (max <=> val2)
            when -1
                max = val2
                el = el
            end
        when -1
            max = val
            best = el
        end
    end
    best
end

def silly_syllables(sent)
    words = sent.split.map {|word| convert_word(word)}
    words.join(" ")
end

def convert_word(word)
    vowels = "aeiou"
    first = nil
    last = nil
    word.each_char.with_index do |ch,i|
        if vowels.include?(ch)
            first ||= i
            last = i
        end
    end
    first == last ? word : word[first..last]
end