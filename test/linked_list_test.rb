require 'minitest/autorun'
require 'minitest/pride'
require "./lib/linked_list"
require 'pry'

class LinkedListTest < MiniTest::Test
  def test_it_exist
    list = LinkedList.new
    assert_instance_of LinkedList, list
  end

  def test_it_starts_with_nil_head
    list = LinkedList.new
    assert_nil list.head
  end

  def test_it_can_append_one_node
    list = LinkedList.new
    new_node = list.append("West")
    assert_equal "West", new_node.surname

    assert_equal "West", list.head.surname
    assert_nil list.head.next_node
  end

  def test_it_can_count_an_empty_list
    list = LinkedList.new

    assert_equal 0, list.count
  end

  def test_it_can_count_one_node
    list = LinkedList.new
    new_node = list.append("West")

    assert_equal 1, list.count
  end

  def test_it_can_return_a_string_of_itself
    list = LinkedList.new
    new_node = list.append("West")
    assert_equal "The West Family", list.to_string
  end

  def test_it_can_append_multiple_nodes
    list = LinkedList.new
    list.append("West")
    list.append("Rhodes")
    list.append("North")

    assert_equal "North", list.head.next_node.next_node.surname
  end

  def test_it_can_count_multiple_nodes
    list = LinkedList.new
    list.append("West")
    list.append("Rhodes")
    list.append("North")

    assert_equal 3, list.count
  end

  def test_it_can_to_string_multiple_nodes
    list = LinkedList.new
    list.append("West")
    list.append("Rhodes")
    list.append("North")

    expected = "The West Family, followed by the Rhodes Family, followed by the North Family"
    assert_equal expected, list.to_string
  end

  def test_it_can_insert_into_middle
    list = LinkedList.new
    list.append("West")
    list.append("Rhodes")
    list.append("North")
    list.insert(1, "Brooks")

    assert_equal 'Brooks', list.head.next_node.surname
    assert_equal 4, list.count
  end

  def test_it_can_insert_into_beginning
    list = LinkedList.new
    list.append("West")
    list.insert(0, "Brooks")

    assert_equal "Brooks", list.head.surname
    assert_equal 2, list.count
  end

  def test_it_can_insert_into_end
    list = LinkedList.new
    list.append("West")
    list.insert(2, "Brooks")

    assert_equal "Brooks", list.head.next_node.surname
    assert_equal 2, list.count
  end

  def test_it_can_prepend
    list = LinkedList.new
    list.append("West")
    list.append("Rhodes")
    list.prepend("North")

    assert_equal "North", list.head.surname
    assert_equal 3, list.count
  end

  def test_it_can_prepend_to_empty_list
    list = LinkedList.new
    list.prepend("North")

    assert_equal "North", list.head.surname
  end


end
