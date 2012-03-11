require "test/unit"

class Node
	attr_accessor :value, :left_node, :right_node
	
	def initialize(value=nil, left_node=nil, right_node=nil)
		@value = value
		@left_node = left_node
		@right_node = right_node
	end	
end

class RBTree
	attr_reader :root_node
	
	def initialize( value = nil)
		@root_node = Node.new(value)
	end
	
	def add( *args )
		args.each do | arg |
			add_single arg
		end
	end
	
	def add_single( value )
		if @root_node.nil?
			@root_node = Node.new(value)
		else
			add_comparing(@root_node,value)
		end
	end
	
	def add_comparing( node , value )
		return Node.new( value ) if not node
		if node.value > value 	
			node.left_node = add_comparing( node.left_node , value )
		elsif node.value < value
			node.right_node = add_comparing( node.right_node , value )
		end
		return node
	end
	
	def size
		return size_rec( @root_node, 0 ) - 1 
	end
	
	def size_rec( node , size )
		return 1 if not node
		return size_rec( node.left_node , size ) + size_rec( node.right_node , size )
	end
	
	def levels 
		return levels_rec( @root_node , 0 )
	end
	
	def levels_rec( node , levels )
		return levels if not node
		levels += 1
		left_level = levels_rec( node.left_node , levels )
		right_level = levels_rec( node.right_node , levels )
		return (left_level > right_level ? left_level : right_level)
	end 
	
end

class TestList < Test::Unit::TestCase
=begin
		10
	8		15
6		11		17
=end
	def test_add
		tree = RBTree.new(10)
		tree.add(8,6,15,17,11)
		node = tree.root_node
		assert_equal( node.value , 10)
		assert_equal( node.left_node.value , 8)
		assert_equal( node.left_node.left_node.value , 6)
		assert_equal( node.right_node.value , 15)
		assert_equal( node.right_node.right_node.value , 17)
		assert_equal( node.right_node.left_node.value , 11)
	end
	
	def test_size
		tree = RBTree.new(10)
		tree.add(8,6,15,17,11,11,85)
		assert_equal( tree.size , 7)
	end
	
	def test_levels
		tree = RBTree.new(10)
		tree.add(8,15,17,11)
		assert_equal( tree.levels , 3)
	end
end
