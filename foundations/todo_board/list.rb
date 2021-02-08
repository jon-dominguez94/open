require_relative './item.rb'

class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        begin
            item = Item.new(title, deadline, description)
            @items << item
        rescue
            return false
        end
        true
    end

    def size
        @items.length
    end

    def valid_index?(idx)
        idx.between?(0, self.size - 1)
    end

    def swap(idx1, idx2)
        return false if [idx1, idx2].any? {|idx| !self.valid_index?(idx)}
        @items[idx1], @items[idx2] = @items[idx2], @items[idx1]
        true
    end

    def [](index)
        self.valid_index?(index) ? @items[index] : nil
    end

    def priority
        self[0]
    end

    def print
        puts '---------------------------------------'
        puts '               ' + @label.upcase + '               '
        puts '---------------------------------------'
        puts 'Index | Item              | Deadline   '
        puts '---------------------------------------'
        @items.each_with_index do |item, i|
            count = 18 - item.title.length
            puts i.to_s + '     | ' + item.title + (" " * count) + "| " + item.deadline
            # puts output
        end
        puts '---------------------------------------'
    end
    
    def print_full_item(index)
        return if !self.valid_index?(index)
        puts '---------------------------------------'
        item = @items[index]
        count = 29 - item.title.length
        puts item.title + (" " * count) + item.deadline
        puts item.description
        puts '---------------------------------------'
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(index, amount=1)
        return false if !self.valid_index?(index)
        while index > 0 && amount > 0
            @items[index], @items[index - 1] = @items[index-1], @items[index]
            index -= 1
            amount -= 1
        end
        true 
    end

    def down(index, amount=1)
        return false if !self.valid_index?(index)
        while index < self.size - 1 && amount > 0
            @items[index], @items[index + 1] = @items[index + 1], @items[index]
            index += 1
            amount -= 1
        end
        true 
    end

    def sort_by_date!
        @items.sort_by!{|item| item.deadline}
    end
end