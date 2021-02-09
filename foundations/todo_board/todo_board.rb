require_relative 'list.rb'

class TodoBoard
    def initialize(label)
        @lists = {}
    end

    def get_command
        p "Enter a command: "
        inp, *args = gets.chomp.split
        case inp
        when "mklist"
            key = args[0]
            @lists[key] = List.new(key)
        when "ls"
            @lists.keys.each {|label| puts label}
        when "showall"
            @lists.values.each {|list| list.print}
        when "mktodo"
            list = @lists[args[0]]
            list.add_item(*args[1..-1])
        when "up"
            list = @lists[args[0]]
            args.map!(&:to_i)
            list.up(*args[1..-1])
        when "down"
            list = @lists[args[0]]
            args.map!(&:to_i)
            list.down(*args[1..-1])
        when "swap"
            list = @lists[args[0]]
            args.map!(&:to_i)
            list.swap(*args[1..-1])
        when "toggle"
            list = @lists[args[0]]
            list.toggle_item(args[1].to_i)
        when "rm"
            list = @lists[args[0]]
            list.remove_item(args[1].to_i)
        when "sort"
            list = @lists[args[0]]
            list.sort_by_date!
        when "priority"
            list = @lists[args[0]]
            list.print_priority
        when "purge"
            list = @lists[args[0]]
            list.purge
        when "print"
            list = @lists[args[0]]
            args[1] ? list.print_full_item(args[1].to_i) : list.print
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

TodoBoard.new("test").run