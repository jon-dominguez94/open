class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self 
    end

    def my_select(&prc)
      new_arr = []
      self.my_each { |el| new_arr << el if prc.call(el) }
      new_arr
    end

    def my_reject(&prc)
      new_arr = []
      self.my_each { |el| new_arr << el if !prc.call(el) }
      new_arr
    end

    def my_any?(&prc)
      self.my_each {|el| return true if prc.call(el)}
      false
    end
    
    def my_all?(&prc)
      self.my_each {|el| return false if !prc.call(el)}
      true
    end

    def my_flatten
      return (self[0].is_a?(Array) ? self[0].my_flatten : self) if self.length <= 1
      return [self[0]].my_flatten + self[1..-1].my_flatten
    end

    def my_zip(*arrs)
      new_arr = Array.new(self.length) {Array.new}
      new_arr.each_with_index do |row, i|
        row << self[i]
        arrs.each {|arr| row << arr[i]}
      end
      new_arr
    end
    
    def my_rotate(num=1)
      arr = self.dup
      num %= self.length
      num.times do
        arr.push(arr.shift)
      end
      arr
    end

    def my_join(str="")
      joined = ""
      self[0..-2].each {|el| joined += el + str}
      joined + self[-1]
    end
end

a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"
