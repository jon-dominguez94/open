def duos(str)
    count = 0
    str.each_char.with_index do |ch, i|
        count += 1 if ch == str[i+1]
    end
    count
end

p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0

puts '-------------'





def sentence_swap(sent, hash)
    sent.split
        .map {|word| hash[word] || word}
        .join(" ")
end

p sentence_swap('anything you can do I can do',
    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
    'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'

puts '-------------'





def hash_mapped(hash, prc1, &prc2)
    procced = {}
    hash.each do |k,v|
        key = prc2.call(k)
        val = prc1.call(v)
        procced[key] = val
    end
    procced
end

double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}


puts '-------------'





def counted_characters(str)
    count = Hash.new(0)
    str.each_char {|ch| count[ch] += 1}
    count.select {|k,v| v > 2}
         .keys
end

p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []

puts '-------------'





def triplet_true?(str)
    count = 1
    (1...str.length).each do |i|
        return true if count == 3
        str[i] == str[i - 1] ? count += 1 : count = 1
    end
    count == 3
end

p triplet_true?('caaabb')        # true
p triplet_true?('terrrrrible')   # true
p triplet_true?('runninggg')     # true
p triplet_true?('bootcamp')      # false
p triplet_true?('e')             # false

puts '-------------'





def energetic_encoding(str, hash)
    coded = ""
    str.each_char do |ch|
        coded += (ch == ' ' ? " " : hash[ch] || '?')
    end
    coded
end

p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'

puts '-------------'





def uncompress(str)
    new_string = ""
    i = 0
    while i < str.length
        num = str[i+1].to_i
        new_string += str[i] * num
        i += 2
    end
    new_string
end

p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

puts '-------------'





def conjunct_select(arr, *prcs)
    arr.select {|el| prcs.all? {|prc| prc.call(el)}}
end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]


puts '-------------'





def convert_pig_latin(sent)
    sent.split
        .map {|word| word.length < 3 ? word : piggy(word)}
        .join(" ")
end

def piggy(word)
    upped = word == word.capitalize
    word.downcase!
    vowels = "aeiou"
    if vowels.include?(word[0])
        word = word + "yay"
    else
        word.each_char.with_index do |ch,i|
            if vowels.include?(ch)
                word = word[i..-1] + word[0...i] + "ay"
                break
            end
        end
    end
    upped ? word.capitalize : word
end

p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

puts '-------------'





def reverberate(sent)
    sent.split
        .map {|word| word.length < 3 ? word : reverb(word)}
        .join(" ")
end

def reverb(word)
    upped = word == word.capitalize
    word.downcase!
    vowels = "aeiou"
    if vowels.include?(word[-1])
        word = word * 2
    else
        (0...word.length).reverse_each do |i|
            if vowels.include?(word[i])
                word = word + word[i..-1]
                break
            end
        end
    end
    upped ? word.capitalize : word
end

p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

puts '-------------'





def disjunct_select(arr, *prcs)
    arr.select {|el| prcs.any? {|prc| prc.call(el)}}
end

longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
) # ["apple", "teeming"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o
) # ["dog", "apple", "teeming", "boot"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o,
    starts_a
) # ["ace", "dog", "apple", "teeming", "boot"]

puts '-------------'





def alternating_vowel(sent)
    even = false
    sent.split
        .map do |word|
            even = !even
            alter(word, even)
        end
        .join(" ")
end

def alter(word, even)
    vowels = "aeiou"
    if even
        (0...word.length).each do |i|
            ch = word[i]
            return word[0...i] + word[i+1..-1] if vowels.include?(ch)
        end
    else
        (0...word.length).reverse_each do |i|
            ch = word[i]
            return word[0...i] + word[i+1..-1] if vowels.include?(ch)
        end
    end
    word
end

p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

puts '-------------'





def silly_talk(sent)
    sent.split
        .map {|word| silly(word)}
        .join(" ")
end

def silly(word)
    vowels = "aeiou"
    return word + word[-1] if vowels.include?(word[-1])
    new_word = ""
    word.each_char {|ch| new_word += (vowels.include?(ch) ? ch + 'b' + ch : ch)}
    new_word
end

p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

puts '-------------'





def compress(str)
    first = last = 0
    compressed = ""
    str.each_char.with_index do |ch, i|
        if ch == str[i+1]
            last += 1
        else
            difference = last - first + 1
            compressed += ch
            compressed += difference.to_s if difference > 1
            first = last = i
        end
    end
    compressed
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"

puts '-------------'



