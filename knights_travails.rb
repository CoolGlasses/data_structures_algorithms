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
    def initialize
    end
end

class MoveSet
    def initialize
    end
end

def knight_moves(square1, square2)
end