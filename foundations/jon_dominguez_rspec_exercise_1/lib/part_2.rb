def hipsterfy(word)
    vowels = "aeiou"

    #another possible solution with better performance

    # idx = nil
    # word.reverse.each_char.with_index do |ch, i|
    #     if vowels.include?(ch)
    #         idx = i
    #         break
    #     end
    # end
    # if !idx
    #     return word
    # else
    #     idx = word.length - 1 - idx
    #     return word[0...idx] + word[idx + 1..-1]
    # end

    idxs = {}
    word.each_char.with_index {|ch, i| idxs[ch] = i if vowels.include?(ch)}
    return word if idxs.values.length == 0
    idx = idxs.values.max
    word[0...idx] + word[idx + 1..-1]

end

def vowel_counts(str)
    vowels = "aeiou"
    count = Hash.new(0)

    str.downcase.each_char {|ch| count[ch] += 1 if vowels.include?(ch)}
    count
end

def caesar_cipher(message, n)
    alphabet = ('a'..'z').to_a
    cipher = ""
    message.each_char.with_index do |ch|
        if alphabet.include?(ch)
            i = (alphabet.index(ch) + n) % 26
            cipher += alphabet[i]
        else
            cipher += ch
        end
    end
    cipher
end