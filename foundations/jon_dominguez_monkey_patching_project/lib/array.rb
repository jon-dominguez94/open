# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.sum / self.length.to_f
  end

  def median
    return nil if self.empty?
    self.sort!
    mid = self.length / 2
    self.length.odd? ? self[mid] : (self[mid] + self[mid-1]) / 2.0
  end

  def counts
    count = Hash.new(0)
    self.each {|el| count[el] += 1}
    count
  end

  def my_count(ele)
    count = 0
    self.each {|el| count += 1 if el == ele}
    count
  end

  def my_index(ele)
    self.each_with_index {|el,i| return i if el == ele}
    nil
  end

  def my_uniq
    count = Hash.new(0)
    self.each{|el| count[el] += 1}
    count.keys
  end

  def my_transpose
    # arr = Array.new(self.length) { Array.new(self.length) }
    arr = Array.new(self.length) {[]}
    (0...self.length).each do |i|
      (0...self.length).each do |j|
        arr[j][i] = self[i][j]
      end
    end
    arr
  end
end
