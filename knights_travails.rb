require "byebug"

class Node
    attr_reader :position
    attr_accessor :parent, :children, :piece_present

    def intialize(position, parent=nil)
        @position = position
        @parent = parent
        @children = []
        @piece_present = false
    end
end

class Board 
    def intialize(size)
        @size = size
        @board = create_board(@size)
    end

    def create_board(size)
        finally = []

        (0...size).each do |x|
            (0...size).each do |y|
                finally << [x, y]
            end
        end

        return finally
    end
end

class Knight
    attr_accessor :position
    attr_reader :MOVES

    @@MOVES = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]

    def intialize(initial_pos)
        @initial_pos = initial_pos
        @position = @initial_pos
    end
end
