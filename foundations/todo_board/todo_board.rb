require_relative 'list.rb'

class TodoBoard
    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        puts "Enter a command: "
        inp, *args = gets.chomp.split
        case inp
        when "mktodo"
            @list.add_item(*args)
        when "up"
            args.map!(&:to_i)
            @list.up(*args)
        when "down"
            args.map!(&:to_i)
            @list.down(*args)
        when "swap"
            args.map!(&:to_i)
            @list.swap(*args)
        when "sort"
            @list.sort_by_date!
        when "priority"
            @list.print_priority
        when "print"
            args[0] ? @list.print_full_item(args[0].to_i) : @list.print
        when "quit"
            return false
        else
            puts "Invalid command"
        end
        true
    end

    def run
        running = true
        while running
            running = self.get_command
        end
    end
end