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

    def insert(value)
        this_node = @root

        inserted = false
        while !inserted

            if value < this_node.data
                if this_node.left_child == nil
                    this_node.left_child = Node.new(nil, nil, array[i])
                    inserted = true
                else
                    this_node = this_node.left_child
                end
            elsif value > this_node.data
                if this_node.right_child == nil
                    this_node.right_child = Node.new(nil, nil, array[i])
                    inserted = true
                else
                    this_node = this_node.right_child
                end    
            elsif value == this_node.data
                puts "Value is a duplicate, no insertion occured"
            end
        end
    end

    def min_value(node)
        this_node = node
        this_right = this_node.right_child
        this_left = this_node.left_child

        if this_left == nil
            return this_node
        else
            min_Value(this_node)
        end
    end

    def delete(value)
        this_node = @root

        deleted = false
        while !deleted
            this_right = this_node.right_child
            this_left = this_node.left_child
            previous_left = previous_node.left_child
            previous_right = previous_node.right_child
            

            if value == this_node.data
                if this_left == nil && this_right == nil #if node is a leaf
                    if previous_left == this_node ## make previous connector to this node nil -- can we make this a helper method?
                        previous_left = nil
                    else
                        previous_right = nil
                    end
                    deleted = true ## this node is a leaf so nothing else needs to be done

                elsif previous_left == this_node ## make previous connector to this node nil -- can we make this a helper method?
                        previous_left = this_left

                elsif previous_right = this_node 
                    previous_right = this_right
                    




                deleted = true


            elsif value < this_node.data
                    previous_node = this_node
                    this_node = this_node.left_child
            elsif value > this_node.data
                    previous_node = this_node
                    this_node = this_node.right_child
            end
        end
    end

    def find(value)
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




