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
        puts '-----------------------------------------------'
        puts '                   ' + @label.upcase + '                   '
        puts '-----------------------------------------------'
        puts 'Index | Item              | Deadline   | Done  '
        puts '-----------------------------------------------'
        @items.each_with_index do |item, i|
            count = 18 - item.title.length
            status = item.done ? '[ X ]' : '[ ]'
            puts i.to_s + 
            '     | ' + 
            item.title + 
            (" " * count) + 
            "| " + 
            item.deadline +
            ' | ' +
            status
        end
        puts '-----------------------------------------------'
    end
    
    def print_full_item(index)
        return if !self.valid_index?(index)
        puts '--------------------------------------------'
        item = @items[index]
        count = 24 - item.title.length
        puts item.title + 
             (" " * count) + 
             item.deadline + 
             '     ' + 
             (item.done ? "[ X ]" : "[   ]")
        puts item.description
        puts '--------------------------------------------'
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

    def toggle_item(index)
        self.valid_index?(index) ? @items[index].toggle : false
    end

    def remove_item(index)
        return false if !self.valid_index?(index)
        @items.delete_at(index)
        true
    end

    def purge
        @items.reject! {|item| item.done}
    end
end