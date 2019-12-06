require_relative "binary_search_trees"
require "byebug"

array = Array.new(15) { rand(1..100) }
tree = Tree.new(array)
print array
balanced = tree.balanced?

if balanced == true
    puts
    puts "Tree is balanced!"
    puts
else
    puts
    puts "Tree is NOT balanced!"
    puts
end

p tree.level_order
puts
p tree.inorder
puts
p tree.preorder
puts
p tree.postorder
puts

def unbalance(tree)
    5.times do 
        tree.insert(rand(100..200))
    end
end

balanced = tree.balanced?

if balanced
    unbalance(tree)
end

balanced = tree.balanced?

if !balanced
    tree.rebalance!
    balanced = tree.balanced?
end

puts "Tree is now balanced again!"


p tree.level_order
puts
p tree.inorder
puts
p tree.preorder
puts
p tree.postorder
puts