class Node
    def initilaize(left, right, data)
        @left_child = left
        @right_child = right
        @data = data
    end
end

class Tree
    def initialize(array)
        @root = build_tree()
    end
end