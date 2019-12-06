require_relative "binary_search_trees"
require "byebug"

array = Array.new(15) { rand(1..100) }
tree = Tree.new(array)
print array
balanced = tree.balanced?

if balanced == true
    puts "Tree is balanced!"
else
    puts "Tree is NOT balanced!"
end

print tree.level_order
p tree.inorder
p tree.preorder
p tree.postorder

def unbalance(tree)
    5.times do 
        tree.insert(rand(100..200))
    end
end

balanced = tree.balanced?

while balanced
    unbalance(tree)

    if tree.balanced? == true
        balanced = true
    end
end

p tree.level_order
p tree.inorder
p tree.preorder
p tree.postorder