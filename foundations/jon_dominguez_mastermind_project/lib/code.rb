class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all? {|ch| POSSIBLE_PEGS.keys.include?(ch.upcase)}
  end

  def self.random(num)
    pegs = []
    num.times {pegs << POSSIBLE_PEGS.keys.sample}
    Code.new(pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def initialize(pegs)
    pegs.map!(&:upcase)
    if Code.valid_pegs?(pegs)
      @pegs = pegs
    else
      raise 'invalid pegs'
    end
  end

  def [](pos)
    @pegs[pos]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    count = 0
    pegs = code.pegs
    pegs.each_with_index{|peg,i| count += 1 if peg == @pegs[i]}
    count
  end

  def num_near_matches(code)
    count = 0
    pegs = code.pegs
    pegs.each_with_index do |peg,i| 
      if @pegs.include?(peg) && @pegs[i] != peg
        count += 1 
      end
    end
    count
  end

  def ==(code)
    code.pegs == self.pegs
  end
end
