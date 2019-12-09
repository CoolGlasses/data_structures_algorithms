require "byebug"

class Node 
    attr_accessor :children
    attr_reader :position, :parent

    def initialize(position, parent=nil)
        @position = position
        @parent = parent
        @children = []
    end
end

class Knight
    attr_reader :start

    def initialize(start)
        @start = Node.new(start)
    end

    def create_children(node)
        change = [[2,1],[2,-1],[1,2],[1,-2],[-2,1],[-2,-1],[-1,2],[-1,-2]]
        this_position = node.position
        x = this_position[0]
        y = this_position[1]
        
        change.each do |move|
            x_shift = x + move[0]
            y_shift = y + move[1]
            if valid_move(x_shift, y_shift)
                node.children << Node.new([x_shift, y_shift], node)
            end
        end

        return node
    end

    def valid_move(x, y)
        if x < 0 || y < 0 || x > 8 || y > 8
            return false
        end
        true
    end

    def find_path(final_node)
        this_node = final_node
        path = []
        found = false
        while !found
            if this_node.parent == nil
                found = true
                path << this_node.position
                return path
            else
                path << this_node.position
                this_node = this_node.parent
            end
        end
    end

    def knight_moves(start, finish)
        queue = []
        finished = false
        this_node = start

        while !finished
            if this_node.position == finish
                path = find_path(this_node)
                move_count = path.length - 1
                puts "You can move there in #{move_count} moves.  Here is the path you took to get there:"
                path.reverse!
                path.each do |parent|
                    puts
                    print parent
                    puts
                end
                finished = true
            else
                this_node = create_children(this_node)
                this_node.children.each do |child|
                    queue << child
                end
                
                this_node = queue.shift
            end
        end     
    end
end

square1 = [7, 0]
square2 = [0, 7]
bart = Knight.new(square1)
bart.knight_moves(bart.start, square2)