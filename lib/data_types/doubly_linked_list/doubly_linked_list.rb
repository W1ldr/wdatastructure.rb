require_relative "doubly_linked_node"

module DataTypes
  class DoublyLinkedList
    include Enumerable

    def initialize
      @head = nil
      @tail = nil 
    end

    def append(value)
      new_node = DoublyLinkedNode.new(value)

      if @head.nil?
        @head = new_node
        @tail = new_node
      else
        new_node.previous = @tail
        @tail.next = new_node
        @tail = new_node
      end
    end

    def prepend(value)
      new_node = DoublyLinkedNode.new(value)
      if @head.nil?
        @head = new_node
        @tail = new_node
      else
        new_node.next = @head
        @head.previous = new_node
        @head = new_node
      end
      new_node
    end

    def find(value)
      current = @head
      while current
        return current if current.value == value
        current = current.next
      end
      nil
    end

    def to_a
      arr = []
      current = @head
      while current
        arr << current.value
        current = current.next
      end
      arr
    end

    def empty?
      @head.nil?
    end

    def size
      count
    end

    def each
      current = @head
      while current
      yield current.value
      current = current.next
      end
    end

    # Print the list elements
    def display
      each { |value| puts value }
    end
  end
end
