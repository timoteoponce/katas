require "test/unit"

class Node

  attr_accessor :next_node

  def initialize(value = nil,next_node = nil)
    @value = value
    @next_node = next_node
  end

  def value()
    return @value
  end

end

class List

  def initialize()
    @root_node = Node.new
    @last_node = @root_node
  end

  def find(value)
    iterate {
      |node|
      if value == node.value
        return node
      end
    }
  end

  def iterate
    node = @root_node
    while node != nil
      yield node
      node = node.next_node
    end
  end

  def add(value)
    new_node = Node.new(value)
    @last_node.next_node = new_node
    @last_node = new_node
    if @root_node.value.nil?
      @root_node = @last_node
    end
  end

  def values
    values = []
    iterate {
      |node|
      values << node.value
    }
    return values
  end
end

class TestList < Test::Unit::TestCase
  def test_list
    list = List.new
    assert_nil(list.find("fred"))
    list.add("fred")
    assert_equal("fred", list.find("fred").value())
    assert_nil(list.find("wilma"))
    list.add("wilma")
    assert_equal("fred",  list.find("fred").value())
    assert_equal("wilma", list.find("wilma").value())
    assert_equal(["fred", "wilma"], list.values())

=begin 
    list = List.new
    list.add("fred")
    list.add("wilma")
    list.add("betty")
    list.add("barney")
    assert_equal(["fred", "wilma", "betty", "barney"], list.values())
    list.delete(list.find("wilma"))
    assert_equal(["fred", "betty", "barney"], list.values())
    list.delete(list.find("barney"))
    assert_equal(["fred", "betty"], list.values())
    list.delete(list.find("fred"))
    assert_equal(["betty"], list.values())
    list.delete(list.find("betty"))
    assert_equal([], list.values())
=end
  end
end

