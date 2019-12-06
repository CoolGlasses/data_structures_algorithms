require "byebug"

class Board
    def initialize(size=8)
        @size = size
        @board = create_board(@size)
    end

    def board
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
    attr_accessor :knight
    
    def initialize(board)
        @board = board
    end

    def knight(board=@board)
    end
end

class SquareSpace
    def initialize(piece, location)
        @piece = piece
        @location = location
        @connections = nil
    end

    def connections
        @connections
    end

    def location
        @location
    end
end

def knight_moves(square1, square2)
end