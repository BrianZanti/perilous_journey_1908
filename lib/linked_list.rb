require './lib/node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(surname, current_node = @head)
    if current_node == nil
      @head = Node.new(surname)
    elsif current_node.next_node == nil
      current_node.next_node = Node.new(surname)
    else
      append(surname, current_node.next_node)
    end
  end
  #
  # def append_recursive(current_node, new_node)
  #   if current_node.next_node == nil
  #     current_node.next_node = new_node
  #   else
  #     append_recursive(current_node.next_node, new_node)
  #   end
  # end

  def count
    return 0 if @head == nil
    count_recursive(@head, 1)
  end

  def count_recursive(current_node, count)
    if current_node.next_node == nil
      return count
    else
      return count_recursive(current_node.next_node, count + 1)
    end
  end
#^^^^^^^^^^RECURSIVE^^^^^^^^^


  # def append(surname)
  #   new_node = Node.new(surname)
  #   unless @head
  #     @head = new_node
  #     return new_node;
  #   end
  #
  #
  #
  #   current_node = @head
  #   until current_node.next_node == nil
  #     current_node = current_node.next_node
  #   end
  #
  #   current_node.next_node = new_node
  # end

  # def count
  #   return 0 if @head == nil
  #   count = 1
  #   current_node = @head
  #   until current_node.next_node == nil
  #     current_node = current_node.next_node
  #     count += 1
  #   end
  #   return count
  # end

  def to_string
    return "" if @head == nil
    following_families = ""
    current_node = @head
    until current_node.next_node == nil
      current_node = current_node.next_node
      following_families += ", followed by the #{current_node.surname} Family"
    end
    first_family = "The #{@head.surname} Family"
    first_family + following_families
  end

  def insert(position, surname)
    if position == 0
      return prepend(surname)
    end
    if position == count + 1
      return append(surname)
    end
    current_node = @head
    (position - 1).times do
      current_node = current_node.next_node
    end
    new_node = Node.new(surname)
    if current_node.next_node
      new_node.next_node = current_node.next_node
    end
    current_node.next_node = new_node
  end

  def prepend(surname)
    new_node = Node.new(surname)
    new_node.next_node = @head
    @head = new_node
  end
end
