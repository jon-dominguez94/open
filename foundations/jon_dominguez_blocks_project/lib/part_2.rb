def all_words_capitalized?(words)
    words.all?{|word| word == word.capitalize}
end

def no_valid_url?(urls)
    endings = ['.com', '.net', '.io', '.org']
    urls.none? {|url| url.end_with?(*endings) }
end

def any_passing_students?(student)
    student.any? do |hash|
        grades = hash[:grades]
        grades.sum / grades.length.to_f >= 75
    end
end