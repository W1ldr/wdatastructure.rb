require_relative "linked_node"

module DataTypes
  class LinkedList
    include Enumerable

    def initialize
      @head = nil
      @tail = nil
    end

    # Append to the end of the list
    def append(value)
      new_node = SinglyLinkedNode.new(value)

      if @head.nil?
        @head = new_node
        @tail = new_node
      else
        @tail.next = new_node
        @tail = new_node
      end
    end

    # Insert a new element at the beginning
    def prepend(value)
      new_node = SinglyLinkedNode.new(value)
      if @head.nil?
        @head = new_node
        @tail = new_node
      else
        new_node.next = @head
        @head = new_node
      end
    end

    # Find an element by value
    def find(value)
      current = @head
      while current
        return current if current.value == value
        current = current.next
      end
      nil
    end

    # Implement the `each` method to make LinkedList Enumerable
    def each
      current = @head
      while current
        yield current.value
        current = current.next
      end
    end

    # Convert linked list to an array
    def to_a
      map { |value| value }
    end

    # Check if the list is empty
    def empty?
      @head.nil?
    end

    # Get size of the linked list
    def size
      count
    end

    # Print the list elements
    def display
      each { |value| puts value }
    end
  end
end
