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

    def find(value)
      current = @head
      while current
        return current if current.value == value
        current = current.next
      end
      nil
    end

  end
end
