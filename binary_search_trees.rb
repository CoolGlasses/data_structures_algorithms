require "byebug"

class Node
    attr_accessor :left_child, :right_child, :data

    def initialize(left, right, data)
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
                    this_node.left_child = Node.new(nil, nil, value)
                    inserted = true
                else
                    this_node = this_node.left_child
                end
            elsif value > this_node.data
                if this_node.right_child == nil
                    this_node.right_child = Node.new(nil, nil, value)
                    inserted = true
                else
                    this_node = this_node.right_child
                end    
            elsif value == this_node.data
                puts "Value is a duplicate, no insertion occured"
            end
        end
    end



    def delete(value)
        this_node = @root

        deleted = false
        while !deleted
            this_right = this_node.right_child
            this_left = this_node.left_child

            if this_node != @root
                previous_left = previous_node.left_child
                previous_right = previous_node.right_child
            end

            if value == @root
                if this_right == nil && this_left == nil
                    deleted = true
                    return @root = nil
                elsif this_left == nil
                    deleted = true
                    @root = this_right
                elsif this_right == nil
                    deleted = true
                    @root = this_left
                else
                    successor = min_value(this_right)
                    this_right.left_child = successor.right_child
                    successor.right_child = this_right
                    successor.left_child = this_left
                    deleted = true
                end

            elsif value == this_node.data
                if this_left == nil && this_right == nil #if node is a leaf
                    if previous_left == this_node
                        previous_left = nil
                    else
                        previous_right = nil
                    end
                    deleted = true

                elsif previous_left == this_node && this_right != nil
                    successor = min_value(this_right)
                    successor.right_child = this_right
                    successor.left_child = this_left
                    previous_left = successor
                    deleted = true 
                else previous_right == this_node
                    previous_left = this_left
                    deleted = true 
                end
            elsif value < this_node.data
                    previous_node = this_node
                    this_node = this_left
            elsif value > this_node.data
                    previous_node = this_node
                    this_node = this_right
            end
        end
    end

    def find(value)
        this_node = @root

        found = false
        while !found

            if value < this_node.data
                this_node = this_node.left_child
            elsif value > this_node.data
                this_node = this_node.right_child
            else
                found = true
                return this_node
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
            min_value(this_left)
        end
    end

    def max_value(node)
        this_node = node
        this_right = this_node.right_child
        this_left = this_node.left_child

        if this_right == nil
            return this_node
        else
            max_value(this_right)
        end
    end

    def inorder(node=@root)
        this_node = node
        this_right = this_node.right_child
        this_left = this_node.left_child

        if this_left != nil
            inorder(this_left)
        elsif this_left == nil #is this right?  Traverse Left, Root, Traverse Right... is this the root?
            return this_node
        else
            inorder(this_right)
        end
    end

    def preorder(node=@root)
        this_node = node
        this_right = this_node.right_child
        this_left = this_node.left_child

        if this_node == node
            return this_node
        elsif this_left != nil
            inorder(this_left)
        else
            inorder(this_right)
        end
    end

    def postorder(node=@root)
        this_node = node
        this_right = this_node.right_child
        this_left = this_node.left_child

        if this_left != nil
            inorder(this_left)
        elsif this_right != nil
            inorder(this_right)
        else
            return this_node
        end
    end
        
    def depth(node)
        level_count = 0
        this_node = @root
        

        found = false
        while !found
            this_right = this_node.right_child
            this_left = this_node.left_child

            if node.data < this_node.data
                this_node = this_left
                level_count += 1
            elsif node.data > this_node.data
                this_node = this_right
                level_count += 1
            else
                found = true
                return level_count
            end
        end
    end

    def balanced?(node=@root)
        left_level_count = depth(min_value(node))
        right_level_count = depth(max_value(node))


        if right_level_count == left_level_count || right_level_count + 1 == left_level_count || right_level_count == left_level_count + 1
            return true
        else
            return false
        end
    end

    def level_order
        this_node = @root
        array_of_nodes = [this_node]

        array_of_nodes.each do |node|
            if node.right_child != nil
                array_of_nodes << node.right_child
            end
            if node.left_child != nil
                array_of_nodes << node.left_child
            end
            if block_given?
                yield at(node)
            end
        end

        return array_of_nodes if !block_given?
    end

    def rebalance!
        array_of_nodes = level_order()
        data_of_nodes = []

        array_of_nodes.each do |node|
            data_of_nodes << node.data
        end

        @root = build_tree(data_of_nodes)
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




