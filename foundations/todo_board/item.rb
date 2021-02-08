class Item
    attr_accessor :title, :deadline, :description
    attr_reader :done

    def self.valid_date?(date_str)
        pieces = date_str.split('-')
        return false if pieces.length != 3 || 
                        pieces[0].length != 4 ||
                        pieces[1].length != 2 ||
                        pieces[2].length != 2 ||
                        pieces.any? {|piece| !all_nums(piece)} ||
                        pieces[1..2].any? {|p| p.to_i < 0} ||
                        pieces[1].to_i > 12 ||
                        pieces[2].to_i > 31
        true
    end

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
        @done = false
        raise "Invalid date!" if !self.class.valid_date?(@deadline)
    end

    def deadline=(date)
        raise "Invalid date!" if !self.class.valid_date?(date)
        @deadline = date
    end

    def toggle
        @done = !@done
    end
end

def all_nums(str)
    numbers = ('0'..'9').to_a
    str.split("").all? {|ch| numbers.include?(ch)}
end