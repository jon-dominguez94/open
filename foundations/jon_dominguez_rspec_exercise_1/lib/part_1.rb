def average(num1, num2)
   ( num1 + num2 ) / 2.0
end

def average_array(nums)
    nums.sum / (nums.length * 1.0)
end

def repeat(str, num)
    final = ""
    num.times {final += str}
    final
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(sent)
    final = []
    sent.split(" ").each_with_index do |word, i|
        final << (i.even? ? word.upcase : word.downcase)
    end
    final.join(" ")
end