require 'minitest/autorun'
require 'minitest/pride'
require "./lib/node"

class NodeTest < MiniTest::Test
  def test_it_exists
    node = Node.new("Burke")
    assert_instance_of Node, node
  end

  def test_it_has_a_surname
    node = Node.new("Burke")
    assert_equal "Burke", node.surname
  end

  def test_it_starts_with_nil_next_node
    node = Node.new("Burke")
    assert_nil node.next_node
  end

  def test_it_can_assign_a_next_node
    node = Node.new("Burke")
    next_node = Node.new("Rhodes")
    node.next_node = next_node
    assert_equal 'Rhodes', node.next_node.surname
  end
end
