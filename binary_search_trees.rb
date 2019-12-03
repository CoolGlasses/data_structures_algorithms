class Node
    attr_accessor :left_child, :right_child, :data

    def initilaize(left, right, data)
        @left_child = left
        @right_child = right
        @data = data
    end
end

class Tree
    def initialize(array)
        @root = build_tree(array)
    end
end

#think russian nested dolls but with two inner compartments

def build_tree(array)
    first_node = Node.new(nil, nil, array[0])
    this_node = first_node
    i = 1

    finished = false
    while !finished
        if array[i] == nil
            finished = true
        elsif array[i] < this_node.data
            if this_node.left_child == nil
                this_node.left_child = Node.new(nil, nil, array[i])
                this_node = first_node
                i += 1
            else
                this_node = this_node.left_child
            end
        elsif array[i] > this_node.data
            if this_node.right_child == nil
                this_node.right_child = Node.new(nil, nil, array[i])
                this_node = first_node
                i += 1
            else
                this_node = this_node.right_child
            end    
        elsif array[i] == this_node.data
            i += 1
        end
    end
    return first_node
end            


