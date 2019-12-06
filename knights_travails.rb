require "byebug"

class Board
    def initialize(size=8)
        @size = size
        @board = create_board(@size)
    end

    def board #a 2d array of potential positions
        @board
    end

    def create_board(size)
        finally = []

        (0...size).times do |num1|
            (0...size).times do |num2|
                finally << [num1, num2]
            end
        end

        return finally
    end
end

class Knight
    attr_accessor :name, :current_location

    def initialize(name="Heath", current_location=[0,0])
        @name = name
        @current_location = current_location
        @possible_moves = []
    end

    def possible_moves
    end

end

class MoveSet
    def initialize(board)
        @board = board
    end

    def create_connections(@board, piece)
        connections = []
        size = sqrt(@board.length)
        
        if piece == "knight"
            @board.each do |coordinate_pair|
                x = coordinate_pair[0]
                y = coordinate_pair[1]
                case coordinate_pair
                    when (x + 2 >= 0 && x + 2 <= size ) && (y + 1 >= 0 && y + 1 <= size)
                        connections << [x + 2, y + 1]
                    when (x + 2 >= 0 && x + 2 <= size ) && (y - 1 >= 0 && y - 1 <= size)
                        connections << [x + 2, y - 1]
                    when (x - 2 >= 0 && x - 2 <= size ) && (y + 1 >= 0 && y + 1 <= size)
                        connections << [x - 2, y + 1]
                    when (x - 2 >= 0 && x - 2 <= size ) && (y - 1 >= 0 && y - 1 <= size)
                        connections << [x - 2, y - 1]
                    when (x + 1 >= 0 && x + 1 <= size ) && (y + 2 >= 0 && y + 2 <= size)
                        connections << [x + 1, y + 2]
                    when (x + 1 >= 0 && x + 1 <= size ) && (y - 2 >= 0 && y - 2 <= size)
                        connections << [x + 1, y - 2]
                    when (x - 1 >= 0 && x - 1 <= size ) && (y + 2 >= 0 && y + 2 <= size)
                        connections << [x - 1, y + 2]
                    when (x - 1 >= 0 && x - 1 <= size ) && (y - 2 >= 0 && y - 2 <= size)
                        connections << [x - 1, y - 2]
                end
            end
        else
            p "unknown piece"
        end
        return connections
    end
end

class Node
    attr_reader :piece, :location, :connections
    
    def intitialize(piece, location, connections)
        @piece = piece
        @location = location
        @connections = connections
    end
end



def knight_moves(square1, square2)
end